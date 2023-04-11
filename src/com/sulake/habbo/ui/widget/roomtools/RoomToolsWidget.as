package com.sulake.habbo.ui.widget.roomtools
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.freeflowchat.class_1692;
   import com.sulake.habbo.ui.IRoomDesktop;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.RoomUI;
   import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.habbo.window.class_1684;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_11.class_1569;
   
   public class RoomToolsWidget extends RoomWidgetBase
   {
      
      private static const ROOM_HISTORY_MAX_LENGTH:int = 10;
      
      private static var _visitedRooms:Vector.<class_1569> = new Vector.<class_1569>();
      
      private static var var_2689:int;
       
      
      private var _currentRoomName:String = "";
      
      private var var_1527:com.sulake.habbo.ui.widget.roomtools.RoomToolsToolbarCtrl;
      
      private var var_1966:com.sulake.habbo.ui.widget.roomtools.RoomToolsInfoCtrl;
      
      private var var_2522:IRoomDesktop;
      
      private var var_2749:class_1692;
      
      private var var_2193:Timer;
      
      public function RoomToolsWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:RoomUI)
      {
         super(param1,param2,param3,param4.localization);
         handler.widget = this;
         var_2522 = param4.getDesktop("hard_coded_room_id");
         var_2749 = param4.freeFlowChat;
         var_1966 = new com.sulake.habbo.ui.widget.roomtools.RoomToolsInfoCtrl(this,param2,param3);
         var_1527 = new com.sulake.habbo.ui.widget.roomtools.RoomToolsToolbarCtrl(this,param2,param3);
         var_1527.updateRoomHistoryButtons();
         var_1527.setChatHistoryButton(!var_2749 || true);
         var _loc5_:String = param4.getProperty("camera.launch.ui.position");
         var_1527.setCameraButton(handler.container.sessionDataManager.isPerkAllowed("CAMERA") && (StringUtil.isBlank(_loc5_) || _loc5_ == "room-menu"));
         var_1527.setLikeButton(handler.canRate);
         var_1527.setCollapsed(handler.sessionDataManager.isNoob || !(handler.sessionDataManager.uiFlags & 2));
      }
      
      override public function dispose() : void
      {
         if(var_2193)
         {
            var_2193.stop();
            var_2193 = null;
         }
         if(var_1527)
         {
            var_1527.dispose();
            var_1527 = null;
         }
         if(var_1966)
         {
            var_1966.dispose();
            var_1966 = null;
         }
         var_2749 = null;
         var_2522 = null;
         super.dispose();
      }
      
      public function updateRoomData(param1:class_1569) : void
      {
         for each(var _loc2_ in _visitedRooms)
         {
            if(_loc2_.flatId == param1.flatId)
            {
               _loc2_.roomName = param1.roomName;
            }
         }
      }
      
      public function storeRoomData(param1:class_1569) : void
      {
         for each(var _loc2_ in _visitedRooms)
         {
            if(_loc2_.flatId == param1.flatId)
            {
               return;
            }
         }
         _visitedRooms.push(param1);
         if(false)
         {
            _visitedRooms.shift();
         }
         var_2689 = -1;
         if(var_1527)
         {
            var_1527.setLikeButton(handler.canRate);
         }
      }
      
      public function showRoomInfo(param1:Boolean, param2:String, param3:String, param4:Array) : void
      {
         if(!var_1966)
         {
            return;
         }
         _currentRoomName = param2;
         var_1966.showRoomInfo(param1,param2,param3,param4);
      }
      
      public function enterNewRoom(param1:int) : void
      {
         if(!var_1527 || !var_1966)
         {
            return;
         }
         var _loc3_:int = 0;
         for each(var _loc2_ in _visitedRooms)
         {
            if(_loc2_.flatId == param1)
            {
               var_2689 = _loc3_;
            }
            _loc3_++;
         }
         var_1527.disableRoomHistoryButtons();
         if(var_2193 != null)
         {
            var_2193.stop();
         }
         var_2193 = new Timer(2000,1);
         var_2193.addEventListener("timer",roomButtonTimerEventHandler);
         var_2193.start();
         var_1966.setElementVisible("tags",true);
      }
      
      private function roomButtonTimerEventHandler(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(_loc2_)
         {
            _loc2_.stop();
            _loc2_.removeEventListener("timer",roomButtonTimerEventHandler);
         }
         if(var_1527)
         {
            var_1527.updateRoomHistoryButtons();
         }
      }
      
      public function setCollapsed(param1:Boolean) : void
      {
         if(var_1527)
         {
            var_1527.setCollapsed(param1);
         }
         if(var_1966)
         {
            var_1966.setToolbarCollapsed(param1);
         }
      }
      
      public function get handler() : RoomToolsWidgetHandler
      {
         return var_1453 as RoomToolsWidgetHandler;
      }
      
      public function getIconLocation(param1:String) : class_3127
      {
         return var_1527.window.findChildByName(param1);
      }
      
      public function getWidgetAreaWidth() : int
      {
         return !!var_1527 ? var_1527.right : 0;
      }
      
      public function getChatInputY() : int
      {
         if(!var_2522)
         {
            return 0;
         }
         var _loc1_:RoomChatInputWidget = var_2522.getWidget("RWE_CHAT_INPUT_WIDGET") as RoomChatInputWidget;
         if(!_loc1_)
         {
            return 0;
         }
         return _loc1_.getChatInputY();
      }
      
      public function getRoomToolbarRight() : int
      {
         return !!var_1527 ? var_1527.right : 0;
      }
      
      public function goToNextRoom() : void
      {
         var _loc1_:* = var_2689 + 1;
         var _loc2_:int = 0;
         if(_loc1_ > _loc2_)
         {
            _loc1_ = _loc2_;
         }
         handler.goToPrivateRoom(_visitedRooms[_loc1_].flatId);
         var_1527.disableRoomHistoryButtons();
      }
      
      public function goToPreviousRoom() : void
      {
         var _loc1_:int = var_2689 - 1;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         handler.goToPrivateRoom(_visitedRooms[_loc1_].flatId);
         var_1527.disableRoomHistoryButtons();
      }
      
      public function get freeFlowChat() : class_1692
      {
         return var_2749;
      }
      
      public function get visitedRooms() : Vector.<class_1569>
      {
         return _visitedRooms;
      }
      
      public function get currentRoomIndex() : int
      {
         return var_2689;
      }
      
      public function get currentRoomName() : String
      {
         return _currentRoomName;
      }
   }
}
