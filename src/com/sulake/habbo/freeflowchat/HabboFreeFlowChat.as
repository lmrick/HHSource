package com.sulake.habbo.freeflowchat
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.configuration.enum.HabboComponentFlags;
   import com.sulake.habbo.freeflowchat.data.ChatEventHandler;
   import com.sulake.habbo.freeflowchat.data.ChatItem;
   import com.sulake.habbo.freeflowchat.data.RoomSessionEventHandler;
   import com.sulake.habbo.freeflowchat.history.ChatHistoryBuffer;
   import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
   import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray;
   import com.sulake.habbo.freeflowchat.style.class_3278;
   import com.sulake.habbo.freeflowchat.viewer.ChatBubbleFactory;
   import com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer;
   import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
   import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.ui.IRoomDesktop;
   import com.sulake.habbo.ui.IRoomUI;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboGameManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomUI;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_11.class_846;
   import package_17.class_486;
   import package_19.class_151;
   import package_19.class_204;
   import package_39.class_718;
   import package_53.class_214;
   import package_68.class_782;
   import package_78.class_1622;
   
   public class HabboFreeFlowChat extends class_20 implements class_1692
   {
      
      private static const ZERO_POINT:Point = new Point(0,0);
       
      
      private var _avatarRenderManager:class_1690;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _navigator:class_1685;
      
      private var _moderation:IHabboModeration;
      
      private var _roomUI:IRoomUI;
      
      private var _gameManager:class_1688;
      
      private var _localizationManager:class_18;
      
      private var _toolbar:IHabboToolbar;
      
      private var _communication:class_25;
      
      private var _windowManager:class_1684;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var var_2645:ChatEventHandler;
      
      private var var_2747:RoomSessionEventHandler;
      
      private var var_2068:ChatHistoryBuffer;
      
      private var var_1766:ChatFlowStage;
      
      private var var_3047:ChatHistoryScrollView;
      
      private var _chatHistoryPulldown:ChatHistoryTray;
      
      private var var_1891:ChatFlowViewer;
      
      private var var_2535:com.sulake.habbo.freeflowchat.ChatViewController;
      
      private var var_2076:ChatBubbleFactory;
      
      private var var_2544:Boolean = false;
      
      private var _isInRoom:Boolean = false;
      
      private var var_2663:class_1622;
      
      private var var_3083:Boolean = false;
      
      private var var_345:int = 1;
      
      private var var_3353:Boolean = false;
      
      public function HabboFreeFlowChat(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
      }
      
      public static function getTimeStampNow() : String
      {
         var _loc1_:Date = new Date();
         var _loc2_:Number = _loc1_.getHours();
         var _loc4_:Number = _loc1_.getMinutes();
         var _loc3_:Number = _loc1_.getSeconds();
         var _loc5_:String;
         return (_loc5_ = (_loc5_ = _loc2_ < 10 ? "0" + _loc2_ : _loc2_.toString()) + ":" + (_loc4_ < 10 ? "0" + _loc4_ : _loc4_.toString())) + ":" + (_loc3_ < 10 ? "0" + _loc3_ : _loc3_.toString());
      }
      
      public static function create9SliceSprite(param1:Rectangle, param2:BitmapData) : Sprite
      {
         var _loc8_:int = 0;
         var _loc5_:Number = NaN;
         var _loc9_:int = 0;
         var _loc7_:Sprite = new Sprite();
         var _loc3_:Array = [param1.left,param1.right,param2.width];
         var _loc4_:Array = [param1.top,param1.bottom,param2.height];
         _loc7_.graphics.clear();
         var _loc6_:Number = 0;
         _loc8_ = 0;
         while(_loc8_ < 3)
         {
            _loc5_ = 0;
            _loc9_ = 0;
            while(_loc9_ < 3)
            {
               _loc7_.graphics.beginBitmapFill(param2);
               _loc7_.graphics.drawRect(_loc6_,_loc5_,_loc3_[_loc8_] - _loc6_,_loc4_[_loc9_] - _loc5_);
               _loc7_.graphics.endFill();
               _loc5_ = Number(_loc4_[_loc9_]);
               _loc9_++;
            }
            _loc6_ = Number(_loc3_[_loc8_]);
            _loc8_++;
         }
         _loc7_.scale9Grid = param1;
         return _loc7_;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         },false),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarRenderManager = param1;
         },false),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         }),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         },false),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         },false),new ComponentDependency(new IIDHabboModeration(),function(param1:IHabboModeration):void
         {
            _moderation = param1;
         },false),new ComponentDependency(new IIDHabboRoomUI(),function(param1:IRoomUI):void
         {
            _roomUI = param1;
         },false),new ComponentDependency(new IIDHabboGameManager(),function(param1:class_1688):void
         {
            _gameManager = param1;
         },false),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         },false),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         },false),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         },false)]);
      }
      
      override protected function initComponent() : void
      {
         _communication.addHabboConnectionMessageEvent(new class_718(onRoomChatSettings));
         _communication.addHabboConnectionMessageEvent(new class_486(onRoomEnter));
         _communication.addHabboConnectionMessageEvent(new class_846(onGuestRoomData));
         _communication.addHabboConnectionMessageEvent(new class_782(onPerkAllowances));
         _communication.addHabboConnectionMessageEvent(new class_214(onAccountPreferences));
      }
      
      private function onPerkAllowances(param1:class_782) : void
      {
         var _loc2_:Boolean = var_2544;
         var_2544 = true;
         if(!_loc2_ && var_2544)
         {
            var_2076 = new ChatBubbleFactory(this);
            if(!isDisabledInPreferences)
            {
               var_2645 = new ChatEventHandler(this);
               var_2747 = new RoomSessionEventHandler(this);
               var_2068 = new ChatHistoryBuffer(this);
            }
            if(_isInRoom)
            {
               roomEntered();
            }
         }
         else if(_loc2_ && !var_2544)
         {
            if(var_2076)
            {
               var_2076.dispose();
               var_2076 = null;
            }
            if(var_2645)
            {
               var_2645.dispose();
               var_2645 = null;
            }
            if(var_2747)
            {
               var_2747.dispose();
               var_2747 = null;
            }
            if(var_2068)
            {
               var_2068.dispose();
               var_2068 = null;
            }
            roomLeft();
         }
      }
      
      private function onGuestRoomData(param1:class_846) : void
      {
         if(var_2068 && !var_3353)
         {
            var_2068.insertRoomChange(param1.getParser().data);
         }
         var_3353 = true;
         var_2663 = param1.getParser().chatSettings;
         if(var_1766)
         {
            var_1766.refreshSettings();
         }
      }
      
      private function onRoomEnter(param1:class_486) : void
      {
         var_3353 = false;
         clear();
      }
      
      private function onRoomChatSettings(param1:class_718) : void
      {
         var_2663 = param1.getParser().chatSettings;
         if(_isInRoom && var_1766)
         {
            var_1766.refreshSettings();
         }
      }
      
      private function onAccountPreferences(param1:class_214) : void
      {
         var_3083 = param1.getParser().freeFlowChatDisabled;
         var_345 = param1.getParser().preferedChatStyle;
      }
      
      public function getRoomChangeBitmap() : BitmapData
      {
         return BitmapData(assets.getAssetByName("room_change").content);
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return _roomSessionManager;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
      
      public function get avatarRenderManager() : class_1690
      {
         return _avatarRenderManager;
      }
      
      public function get gameManager() : class_1688
      {
         return _gameManager;
      }
      
      public function get localizations() : class_18
      {
         return _localizationManager;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function roomEntered() : void
      {
         _isInRoom = true;
         if(var_2544 && var_2076 && var_2645 && var_2747)
         {
            var_1766 = new ChatFlowStage(this);
            var_1891 = new ChatFlowViewer(this,var_1766);
            var_3047 = new ChatHistoryScrollView(this,var_2068);
            _chatHistoryPulldown = new ChatHistoryTray(this,var_3047);
            var_2535 = new com.sulake.habbo.freeflowchat.ChatViewController(this,var_1891,_chatHistoryPulldown);
         }
      }
      
      public function roomLeft() : void
      {
         if(_chatHistoryPulldown)
         {
            _chatHistoryPulldown.dispose();
            _chatHistoryPulldown = null;
         }
         if(var_3047)
         {
            var_3047.dispose();
            _chatHistoryPulldown = null;
         }
         if(var_1891)
         {
            var_1891.dispose();
            var_1891 = null;
         }
         if(var_1766)
         {
            var_1766.dispose();
            var_1766 = null;
         }
         if(var_2535)
         {
            var_2535.dispose();
            var_2535 = null;
         }
         _isInRoom = false;
      }
      
      public function insertChat(param1:ChatItem) : void
      {
         var _loc2_:PooledChatBubble = null;
         var _loc3_:Point = null;
         if(!var_2544 || !var_2068 || !var_1766 || isDisabledInPreferences)
         {
            return;
         }
         var_2068.insertChat(param1);
         try
         {
            _loc2_ = var_2076.getNewChatBubble(param1);
         }
         catch(e:Error)
         {
            if(false)
            {
               return;
            }
            throw e;
         }
         _loc3_ = var_1766.insertBubble(_loc2_);
         var_1891.insertBubble(_loc2_,_loc3_);
      }
      
      public function getScreenPointFromRoomLocation(param1:int, param2:IVector3d) : Point
      {
         var _loc9_:Point = null;
         var _loc5_:Point = null;
         if(_roomEngine == null || var_1891 == null || var_1891.rootDisplayObject.stage == null)
         {
            return ZERO_POINT;
         }
         var _loc3_:int = HabboComponentFlags.isRoomViewerMode(flags) ? 1 : -1;
         var _loc8_:IRoomGeometry = roomEngine.getRoomCanvasGeometry(param1,_loc3_);
         var _loc7_:Number = roomEngine.getRoomCanvasScale(param1);
         var _loc6_:Number = var_1891.rootDisplayObject.stage.stageWidth * _loc7_ / 2;
         var _loc4_:Number = var_1891.rootDisplayObject.stage.stageHeight * _loc7_ / 2;
         if(_loc8_ != null && param2 != null)
         {
            if((_loc9_ = _loc8_.getScreenPoint(param2)) != null)
            {
               _loc6_ += _loc9_.x * _loc7_;
               _loc4_ += _loc9_.y * _loc7_;
               if((_loc5_ = roomEngine.getRoomCanvasScreenOffset(param1)) != null)
               {
                  _loc6_ += _loc5_.x;
                  _loc4_ += _loc5_.y;
               }
            }
         }
         return new Point(_loc6_,_loc4_);
      }
      
      public function get chatFlowViewer() : ChatFlowViewer
      {
         return var_1891;
      }
      
      public function get chatBubbleFactory() : ChatBubbleFactory
      {
         return var_2076;
      }
      
      public function get chatHistoryScrollView() : ChatHistoryScrollView
      {
         return var_3047;
      }
      
      public function get displayObject() : DisplayObject
      {
         if(var_2535)
         {
            return var_2535.rootDisplayObject;
         }
         return null;
      }
      
      public function disableRoomMouseEventsLeftOfX(param1:int) : void
      {
         _roomEngine.mouseEventsDisabledLeftToX = param1;
      }
      
      public function selectAvatarWithChatItem(param1:ChatItem) : void
      {
         selectAvatar(param1.roomId,param1.userId);
      }
      
      public function selectAvatar(param1:int, param2:int) : void
      {
         var _loc5_:class_3259 = null;
         var _loc4_:class_3259 = null;
         if(_roomUI == null)
         {
            return;
         }
         var _loc3_:IRoomDesktop = _roomUI.getDesktop("hard_coded_room_id");
         _loc3_.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO",param2,100));
         roomEngine.selectAvatar(param1,param2);
         var _loc6_:IRoomSession;
         if(_loc6_ = _roomSessionManager.getSession(param1))
         {
            if((_loc5_ = _loc6_.userDataManager.getUserDataByIndex(param2)) != null)
            {
               if((_loc4_ = _roomSessionManager.getSession(param1).userDataManager.getUserDataByIndex(param2)) && _moderation)
               {
                  _moderation.userSelected(_loc5_.webID,_loc4_.name);
               }
            }
         }
      }
      
      public function get roomChatSettings() : class_1622
      {
         return var_2663;
      }
      
      public function get roomChatBorderLimited() : Boolean
      {
         if(var_2663)
         {
            return false;
         }
         return false;
      }
      
      public function clickHasToPropagate(param1:MouseEvent) : Boolean
      {
         return !!_roomUI ? _roomUI.mouseEventPositionHasContextMenu(param1) : false;
      }
      
      public function get chatStyleLibrary() : class_3278
      {
         return !!var_2076 ? var_2076.chatStyleLibrary : null;
      }
      
      public function get isDisabledInPreferences() : Boolean
      {
         return var_3083;
      }
      
      public function set isDisabledInPreferences(param1:Boolean) : void
      {
         var_3083 = param1;
         _communication.connection.send(new class_204(var_3083));
      }
      
      public function get preferedChatStyle() : int
      {
         return var_345;
      }
      
      public function set preferedChatStyle(param1:int) : void
      {
         var_345 = param1;
         _communication.connection.send(new class_151(var_345));
      }
      
      public function clear() : void
      {
         if(var_1766)
         {
            var_1766.clear();
         }
      }
      
      public function toggleVisibility() : void
      {
         if(isDisabledInPreferences || !var_2544 || !_chatHistoryPulldown)
         {
            return;
         }
         _chatHistoryPulldown.toggleHistoryVisibility();
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
   }
}
