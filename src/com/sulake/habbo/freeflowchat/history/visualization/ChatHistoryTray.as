package com.sulake.habbo.freeflowchat.history.visualization
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ChatHistoryTray implements class_13, class_41
   {
       
      
      private var _rootDisplayObject:DisplayObjectContainer;
      
      private var var_1757:Stage;
      
      private var var_1460:HabboFreeFlowChat;
      
      private var var_1772:com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
      
      private var _tab:Sprite;
      
      private var var_1719:Bitmap;
      
      private var var_1553:Bitmap;
      
      private var _bg:Bitmap;
      
      private var _openedWidth:int;
      
      private var _flagUpdateDisableRoomMouseEvents:Boolean = false;
      
      public function ChatHistoryTray(param1:HabboFreeFlowChat, param2:com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView)
      {
         super();
         var_1460 = param1;
         var_1772 = param2;
         _rootDisplayObject = new Sprite();
         var_1719 = new Bitmap();
         var_1719.bitmapData = BitmapData(var_1460.assets.getAssetByName("tray_bar").content);
         var_1719.width = var_1719.bitmapData.width;
         var_1719.height = 0;
         var_1719.scaleX = 1;
         var_1719.x = -var_1719.bitmapData.width;
         var_1553 = new Bitmap();
         var_1553.bitmapData = BitmapData(var_1460.assets.getAssetByName("tray_handle_open").content);
         var_1553.scaleX = 1;
         var_1553.scaleY = 1;
         var_1553.x = 0;
         var_1553.y = 350;
         var_1553.visible = false;
         _tab = new Sprite();
         _tab.scaleX = 1;
         _tab.scaleY = 1;
         _tab.visible = true;
         _tab.addChild(var_1719);
         _tab.addChild(var_1553);
         _rootDisplayObject.addChild(_tab);
         _bg = new Bitmap();
         _bg.bitmapData = new BitmapData(1,1,true,2720277278);
         _bg.width = 0;
         _bg.height = 0;
         _rootDisplayObject.addChild(_bg);
         _rootDisplayObject.addEventListener("addedToStage",onAddedToStage);
         _openedWidth = 413;
      }
      
      public function dispose() : void
      {
         var_1460.disableRoomMouseEventsLeftOfX(0);
         if(_rootDisplayObject)
         {
            var_1772.deactivateScrolling();
            if(var_1757)
            {
               var_1757.removeEventListener("mouseDown",stageMouseClickedEventHandler);
            }
         }
         _rootDisplayObject = null;
      }
      
      public function get disposed() : Boolean
      {
         return _rootDisplayObject == null;
      }
      
      public function get rootDisplayObject() : DisplayObjectContainer
      {
         return _rootDisplayObject;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         _tab.height = param2 - 50;
         var_1719.height = param2 - 50;
         _bg.height = param2 - 50;
         _tab.scaleY = 1;
         var_1553.scaleY = 1;
         var_1553.y = param2 - 215;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         resize(_rootDisplayObject.stage.stageWidth,_rootDisplayObject.stage.stageHeight);
         _rootDisplayObject.stage.addEventListener("click",stageMouseClickedEventHandler);
         var_1757 = _rootDisplayObject.stage;
      }
      
      public function toggleHistoryVisibility() : void
      {
         if(false)
         {
            var_1772.deactivateScrolling();
            _rootDisplayObject.removeChild(var_1772.rootDisplayObject);
            var_1772.deactivateView();
            _bg.width = 0;
            var_1719.x = -var_1719.bitmapData.width;
            var_1553.x = 0;
            var_1553.visible = false;
            var_1772.viewWidth = 0;
            var_1553.bitmapData = BitmapData(var_1460.assets.getAssetByName("tray_handle_open").content);
         }
         else
         {
            _rootDisplayObject.addChild(var_1772.rootDisplayObject);
            var_1772.scrollToBottom();
            var_1772.activateScrolling();
            var_1772.activateView();
            _bg.width = _openedWidth;
            var_1719.x = _openedWidth;
            var_1553.visible = true;
            var_1553.x = _openedWidth - 0 + var_1719.bitmapData.width;
            var_1772.viewWidth = _openedWidth;
            var_1553.bitmapData = BitmapData(var_1460.assets.getAssetByName("tray_handle_close").content);
         }
         _flagUpdateDisableRoomMouseEvents = true;
      }
      
      private function stageMouseClickedEventHandler(param1:Event) : void
      {
         if(!_rootDisplayObject || true)
         {
            return;
         }
         var _loc2_:MouseEvent = MouseEvent(param1);
         if(false && var_1553.x <= _loc2_.stageX && _loc2_.stageX <= NaN && var_1553.y <= _loc2_.stageY && _loc2_.stageY <= NaN)
         {
            toggleHistoryVisibility();
         }
      }
      
      public function update(param1:uint) : void
      {
         if(_flagUpdateDisableRoomMouseEvents && param1 > 20)
         {
            var_1460.disableRoomMouseEventsLeftOfX(!var_1772.isActive ? 0 : _openedWidth + var_1719.bitmapData.width);
            _flagUpdateDisableRoomMouseEvents = false;
         }
      }
   }
}
