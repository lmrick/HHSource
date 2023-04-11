package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import com.sulake.habbo.friendbar.data.class_3152;
   import com.sulake.habbo.friendbar.data.class_3394;
   import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.events.NotificationEvent;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendRequestTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.NewFriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.NewFriendRequestTab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.tabs.class_3357;
   import com.sulake.habbo.friendbar.view.tabs.class_3364;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.iid.IIDHabboFriendBarData;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboGameManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.room.utils.RoomEnterEffect;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class HabboFriendBarView extends AbstractView implements class_3203, class_1870, ILinkEventTracker
   {
      
      private static const TAB_WIDTH:int = 127;
      
      private static const const_551:int = 1;
      
      private static const USE_TOGGLE_WINDOW:Boolean = false;
      
      private static const const_868:int = 3;
      
      private static const MAIN_WINDOW_RESOURCE:String = "new_bar_xml";
      
      private static const TOGGLE_WINDOW_RESOURCE:String = "toggle_xml";
      
      private static const BORDER:String = "border";
      
      private static const LIST:String = "list";
      
      private static const HEADER:String = "header";
      
      private static const CANVAS:String = "canvas";
      
      private static const PIECES:String = "pieces";
      
      private static const TOOLS:String = "friendtools";
      
      private static const const_810:String = "collapse_left";
      
      private static const BUTTON_COLLAPSE_RIGHT:String = "collapse_right";
      
      private static const const_1053:String = "button_left";
      
      private static const const_601:String = "button_right";
      
      private static const BUTTON_LEFT_PAGE:String = "button_left_page";
      
      private static const BUTTON_RIGHT_PAGE:String = "button_right_page";
      
      private static const const_936:String = "button_left_end";
      
      private static const const_1031:String = "button_right_end";
      
      private static const const_967:String = "button_close";
      
      private static const const_1079:String = "button_open";
      
      private static const LINK_FRIEND_LIST:String = "link_friendlist";
      
      private static const ICON_FIND_FRIENDS:String = "icon_find_friends";
      
      private static const ICON_ALL_FRIENDS:String = "icon_all_friends";
      
      private static const COLLAPSED_MARGIN:int = 150;
      
      private static const NEW_BAR_BOTTOM_OFFSET:int = 1;
      
      private static const NEW_BAR_RIGHT_MARGIN:int = 16;
       
      
      private var _friendBarData:class_3152;
      
      private var _gameManager:class_1688;
      
      private var _friendList:class_1869;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_1445:class_3151;
      
      private var var_1775:class_3151;
      
      private var var_1670:class_3151;
      
      private var var_1477:Vector.<ITab>;
      
      private var var_2890:ITab;
      
      private var var_2055:int = -1;
      
      private var var_405:int = 0;
      
      private var var_3147:TextCropper;
      
      private var _friendListIcon:FriendListIcon;
      
      private var _messengerIcon:MessengerIcon;
      
      private var var_1697:class_3151;
      
      private var var_4280:class_3364;
      
      private var var_3720:Boolean = true;
      
      private var var_1876:Timer;
      
      private var var_1928:Boolean = false;
      
      private var var_3107:IRegionWindow;
      
      private var var_3095:IRegionWindow;
      
      private var var_3736:Boolean = false;
      
      private var var_3013:IStaticBitmapWrapperWindow;
      
      private var var_1635:Timer;
      
      private var _notifyMessengerOnStartup:Boolean = false;
      
      public function HabboFriendBarView(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
         var_3147 = new TextCropper();
         var_1477 = new Vector.<ITab>();
         var_1477 = new Vector.<ITab>();
      }
      
      public function setMessengerIconNotify(param1:Boolean) : void
      {
         if(_messengerIcon)
         {
            _messengerIcon.notify(param1);
         }
         if(var_1697)
         {
            notifyMessenger(param1);
         }
      }
      
      public function get friendBarWidth() : int
      {
         return var_1445 == null ? 0 : (var_1928 ? 150 : int(var_1445.width));
      }
      
      public function setFriendListIconNotify(param1:Boolean) : void
      {
         if(_friendListIcon)
         {
            _friendListIcon.notify(param1);
         }
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _friendList = param1;
         }),new ComponentDependency(new IIDHabboFriendBarData(),function(param1:class_3152):void
         {
            _friendBarData = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         }),new ComponentDependency(new IIDHabboGameManager(),function(param1:class_1688):void
         {
            _gameManager = param1;
         })]);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1635 != null)
            {
               var_1635.removeEventListener("timer",onTimerEvent);
               var_1635.stop();
               var_1635 = null;
            }
            if(var_1876)
            {
               var_1876.removeEventListener("timerComplete",onRemoveDimmer);
               var_1876 = null;
            }
            if(_messengerIcon)
            {
               _messengerIcon.dispose();
               _messengerIcon = null;
            }
            if(_friendListIcon)
            {
               _friendListIcon.dispose();
               _friendListIcon = null;
            }
            if(var_1670)
            {
               var_1670.dispose();
               var_1670 = null;
            }
            if(var_1445)
            {
               var_1445.dispose();
               var_1445 = null;
            }
            if(var_1775)
            {
               var_1775.dispose();
               var_1775 = null;
            }
            while(false)
            {
               ITab(var_1477.pop()).dispose();
            }
            while(false)
            {
               ITab(var_1477.pop()).dispose();
            }
            if(_friendBarData != null && true && false)
            {
               _friendBarData.events.removeEventListener("FBE_UPDATED",onRefreshView);
               _friendBarData.events.removeEventListener("FIND_FRIENDS_RESULT",onFindFriendsNotification);
               _friendBarData.events.removeEventListener("FBE_REQUESTS",onFriendRequestUpdate);
               _friendBarData.events.removeEventListener("FBE_MESSAGE",onNewInstantMessage);
               _friendBarData.events.removeEventListener("FBE_NOTIFICATION_EVENT",onFriendNotification);
               _friendBarData.events.removeEventListener("AMC_EVENT",onRefreshMessengerConversations);
            }
            if(_sessionDataManager)
            {
               _sessionDataManager.events.removeEventListener("APUE_UPDATED",onSessionDataPreferences);
            }
            if(_windowManager != null && true)
            {
               _windowManager.getWindowContext(1).getDesktopWindow().removeEventListener("WE_RESIZED",onDesktopResized);
            }
            var_3147.dispose();
            var_3147 = null;
            super.dispose();
         }
      }
      
      override protected function initComponent() : void
      {
         context.addLinkEventTracker(this);
         _friendBarData.events.addEventListener("FBE_UPDATED",onRefreshView);
         _friendBarData.events.addEventListener("FIND_FRIENDS_RESULT",onFindFriendsNotification);
         _friendBarData.events.addEventListener("FBE_REQUESTS",onFriendRequestUpdate);
         _friendBarData.events.addEventListener("FBE_MESSAGE",onNewInstantMessage);
         _friendBarData.events.addEventListener("FBE_NOTIFICATION_EVENT",onFriendNotification);
         _friendBarData.events.addEventListener("AMC_EVENT",onRefreshMessengerConversations);
         _sessionDataManager.events.addEventListener("APUE_UPDATED",onSessionDataPreferences);
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(var_1445)
         {
            var_1445.visible = param1;
            var_1445.activate();
         }
         if(var_1670)
         {
            var_1670.visible = !param1;
            if(var_1445)
            {
               var_1670.x = var_1445.x;
               var_1670.y = var_1445.y;
               var_1670.activate();
            }
         }
      }
      
      private function addDimmerToFriendBar() : void
      {
         var _loc1_:class_3127 = _windowManager.createWindow("bar_dimmer","",30,1,2177,new Rectangle(0,0,var_1445.width,var_1445.height),null,0);
         _loc1_.color = 0;
         _loc1_.blend = 0.3;
         var_1445.addChild(_loc1_);
         var_1445.invalidate();
         if(var_1876 == null)
         {
            var_1876 = new Timer(RoomEnterEffect.totalRunningTime,1);
            var_1876.addEventListener("timerComplete",onRemoveDimmer);
            var_1876.start();
         }
      }
      
      private function onRemoveDimmer(param1:TimerEvent) : void
      {
         var_1876.removeEventListener("timerComplete",onRemoveDimmer);
         var_1876 = null;
         var _loc2_:class_3127 = var_1445.findChildByName("bar_dimmer");
         if(_loc2_ != null)
         {
            var_1445.removeChild(_loc2_);
            _windowManager.destroy(_loc2_);
         }
      }
      
      public function get visible() : Boolean
      {
         return var_1445 && false;
      }
      
      public function populate() : void
      {
         var _loc6_:* = 0;
         var _loc15_:class_3394 = null;
         var _loc9_:Tab = null;
         var _loc7_:int = 0;
         var _loc11_:Tab = null;
         if(var_1445 == null)
         {
            return;
         }
         var _loc14_:int = var_2055;
         deSelect(false);
         var _loc10_:IItemListWindow;
         if((_loc10_ = var_1445.findChildByName("list") as IItemListWindow) == null)
         {
            return;
         }
         _loc10_.autoArrangeItems = false;
         var _loc4_:int;
         _loc6_ = _loc4_ = _loc10_.numListItems;
         while(_loc6_ > 0)
         {
            _loc10_.removeListItemAt(_loc6_ - 1);
            _loc6_--;
         }
         while(false)
         {
            var_1477.pop().recycle();
         }
         updateFriendRequestCounter(_friendBarData.numFriendRequests);
         var _loc3_:int = 0;
         var _loc1_:int = maxNumOfTabsVisible;
         var _loc12_:int = _loc3_ + (var_3720 ? 1 : 0) + 0;
         var _loc13_:int = Math.min(_loc1_,_loc12_);
         if(var_405 + _loc13_ > _loc12_)
         {
            var_405 = Math.max(0,var_405 - (var_405 + _loc13_ - _loc12_));
         }
         var _loc8_:int = var_405;
         _loc6_ = _loc8_;
         while(_loc6_ < _loc3_ + _loc8_)
         {
            if(_loc6_ >= _loc3_)
            {
               break;
            }
            if(var_1477.length >= _loc1_)
            {
               break;
            }
            if((_loc15_ = _friendBarData.getFriendAt(_loc6_)).id > 0)
            {
               _loc9_ = NewFriendEntityTab.allocate(_loc15_);
               var_1477.push(_loc9_);
               _loc10_.addListItem(_loc9_.window);
            }
            _loc6_++;
         }
         if(var_3720)
         {
            _loc7_ = getNumberOfFindFriendsTabs(_loc1_,_loc12_,_loc3_,0);
            _loc12_ = _loc3_ + _loc7_ + 0;
            while(_loc7_-- > 0)
            {
               _loc11_ = class_3357.allocate();
               _loc10_.addListItem(_loc11_.window);
               var_1477.push(_loc11_);
            }
         }
         _loc10_.autoArrangeItems = true;
         if(_loc14_ > -1)
         {
            selectFriendEntity(_loc14_);
         }
         setCollapseButtonVisibility();
         toggleArrowButtons(var_1477.length < _loc12_ && _loc12_ > 0,var_405 != 0,var_405 + var_1477.length < _loc12_);
         if(!var_3736)
         {
            var_3736 = true;
            resizeAndPopulate(false);
            resizeAndPopulate(true);
         }
      }
      
      private function getNumberOfFindFriendsTabs(param1:int, param2:int, param3:int, param4:int) : int
      {
         if(var_1477.length >= param1)
         {
            return 0;
         }
         if(var_1477.length >= param1)
         {
            return 0;
         }
         var _loc5_:int = 1;
         if(var_1477.length + _loc5_ < 3)
         {
            _loc5_ = Math.min(param1 - 0,3);
         }
         return _loc5_;
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:FriendEntityTab = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = var_1477[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return var_1445;
      }
      
      private function buildUserInterface() : void
      {
         Tab.DATA = _friendBarData;
         Tab.GAMES = _gameManager;
         Tab.FRIENDS = _friendList;
         Tab.VIEW = this;
         Tab.ASSETS = assets;
         Tab.WINDOWING = _windowManager;
         Tab.var_1690 = _localizationManager;
         Tab.CROPPER = var_3147;
         Tab.TRACKING = _tracking;
         Token.WINDOWING = _windowManager;
         Token.ASSETS = assets;
         Token.GAMES = _gameManager;
         var _loc4_:IAsset = assets.getAssetByName("new_bar_xml");
         var_1445 = _windowManager.buildFromXML(_loc4_.content as XML,1) as class_3151;
         var_1445.y = var_1445.parent.height - NaN;
         var_1445.setParamFlag(1024,true);
         var_1445.procedure = barWindowEventProc;
         if(RoomEnterEffect.isRunning())
         {
            addDimmerToFriendBar();
         }
         var _loc2_:class_3151 = var_1445.findChildByName("friendtools") as class_3151;
         var_3013 = _loc2_.getChildByName("line") as IStaticBitmapWrapperWindow;
         var_1697 = class_3151(_loc2_.findChildByName("icon_messenger"));
         if(var_1697)
         {
            var_1697.addEventListener("WME_CLICK",onOpenMessenger);
            var_1697.visible = false;
         }
         var _loc3_:class_3151 = class_3151(_loc2_.findChildByName("icon_all_friends"));
         if(_loc3_)
         {
            _loc3_.addEventListener("WME_CLICK",onOpenFriendsList);
         }
         var _loc1_:class_3151 = class_3151(_loc2_.findChildByName("icon_find_friends"));
         if(_loc1_)
         {
            _loc1_.addEventListener("WME_CLICK",onOpenSearchFriends);
         }
         var_3095 = var_1445.findChildByName("collapse_left") as IRegionWindow;
         if(var_3095)
         {
            var_3095.addEventListener("WME_CLICK",onCollapseFriendList);
         }
         var_3107 = var_1445.findChildByName("collapse_right") as IRegionWindow;
         if(var_3107)
         {
            var_3107.addEventListener("WME_CLICK",onCollapseFriendList);
         }
         _windowManager.getWindowContext(1).getDesktopWindow().addEventListener("WE_RESIZED",onDesktopResized);
         populate();
         if(_notifyMessengerOnStartup)
         {
            notifyMessenger(true);
         }
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = null;
         var _loc3_:class_3156 = null;
         if(_avatarManager)
         {
            _loc3_ = _avatarManager.createAvatarImage(param1,"h",null,this);
            if(_loc3_)
            {
               _loc2_ = _loc3_.getCroppedImage("head");
               _loc3_.dispose();
            }
         }
         return _loc2_;
      }
      
      public function getGroupIconBitmap(param1:String) : BitmapData
      {
         return _sessionDataManager.getGroupBadgeImage(param1);
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc11_:class_3394 = null;
         var _loc3_:int = 0;
         var _loc10_:BitmapData = null;
         var _loc13_:class_3151 = null;
         var _loc6_:IItemListWindow = null;
         var _loc12_:class_3151 = null;
         var _loc4_:class_3282 = null;
         var _loc8_:IItemListWindow = var_1445.findChildByName("list") as IItemListWindow;
         var _loc9_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            if((_loc11_ = _friendBarData.getFriendAt(_loc3_)).figure == param1)
            {
               _loc10_ = null;
               if(_loc11_.id > 0)
               {
                  _loc10_ = getAvatarFaceBitmap(_loc11_.figure);
               }
               else
               {
                  _loc10_ = getGroupIconBitmap(_loc11_.figure);
               }
               if(_loc10_)
               {
                  if(_loc13_ = _loc8_.getListItemByID(_loc11_.id) as class_3151)
                  {
                     if(_loc6_ = _loc13_.getChildByName("pieces") as IItemListWindow)
                     {
                        if(_loc12_ = class_3151(_loc6_.getListItemByName("header")))
                        {
                           (_loc4_ = _loc12_.findChildByName("canvas") as class_3282).bitmap = _loc10_;
                           _loc4_.width = _loc10_.width;
                           _loc4_.height = _loc10_.height;
                        }
                     }
                  }
               }
               return;
            }
            _loc3_++;
         }
         var _loc5_:Array = _friendBarData.getFriendRequestList();
         for each(var _loc2_ in _loc5_)
         {
            if(_loc2_.figure == param1)
            {
               for each(var _loc7_ in var_1477)
               {
                  if(_loc7_ is FriendRequestTab)
                  {
                     FriendRequestTab(_loc7_).avatarImageReady(_loc2_,getAvatarFaceBitmap(param1));
                     return;
                  }
                  if(_loc7_ is NewFriendRequestTab)
                  {
                     NewFriendRequestTab(_loc7_).avatarImageReady(_loc2_,getAvatarFaceBitmap(param1));
                     return;
                  }
                  if(_loc7_ is FriendRequestsTab)
                  {
                     FriendRequestsTab(_loc7_).avatarImageReady(_loc2_,getAvatarFaceBitmap(param1));
                     return;
                  }
               }
            }
         }
      }
      
      private function isFriendSelected(param1:class_3394) : Boolean
      {
         return var_2055 == param1.id;
      }
      
      public function selectTab(param1:ITab, param2:Boolean) : void
      {
         if(!param1.selected)
         {
            if(var_2890)
            {
               deSelect(true);
            }
            param1.select(param2);
            var_2890 = param1;
            if(param1 is FriendEntityTab)
            {
               var_2055 = FriendEntityTab(param1).friend.id;
            }
            if(param1 is NewFriendEntityTab)
            {
               var_2055 = NewFriendEntityTab(param1).friend.id;
            }
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(var_2055 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            selectTab(_loc2_,false);
            var_2055 = param1;
         }
      }
      
      public function deSelect(param1:Boolean) : void
      {
         if(var_2890)
         {
            var_2890.deselect(param1);
            var_2890 = null;
            var_2055 = -1;
         }
      }
      
      public function getIconLocation(param1:String) : class_3151
      {
         var _loc2_:* = null;
         return class_3151(var_1445.findChildByName(param1));
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!isUserInterfaceReady())
         {
            buildUserInterface();
         }
         else
         {
            resizeAndPopulate(true);
         }
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         _windowManager.notify(title,text,function(param1:class_3132, param2:class_3134):void
         {
            param1.dispose();
         },16);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestUpdateEvent) : void
      {
         if(_friendListIcon)
         {
            _friendListIcon.notify(false);
         }
         if(var_1445)
         {
            updateFriendRequestCounter(_friendBarData.numFriendRequests);
            resizeAndPopulate(true);
         }
         else
         {
            buildUserInterface();
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
         var_1697.visible = true;
         var _loc2_:class_3127 = var_1697.getChildByName("icon_1") as class_3127;
         var _loc3_:class_3127 = var_1697.getChildByName("icon_2") as class_3127;
         if(_loc2_ && _loc3_)
         {
            if(_loc2_.visible)
            {
               _loc2_.visible = false;
               _loc3_.visible = true;
            }
            else if(_loc3_.visible)
            {
               _loc3_.visible = false;
               _loc2_.visible = true;
            }
         }
      }
      
      private function notifyMessenger(param1:Boolean) : void
      {
         var _loc2_:class_3127 = var_1697.getChildByName("icon") as class_3127;
         var _loc3_:class_3127 = var_1697.getChildByName("icon_1") as class_3127;
         if(param1)
         {
            if(!var_1635)
            {
               _loc2_.visible = false;
               _loc3_.visible = true;
               var_1635 = new Timer(500,0);
               var_1635.addEventListener("timer",onTimerEvent);
               var_1635.start();
            }
         }
         else
         {
            if(var_1635 != null)
            {
               var_1635.removeEventListener("timer",onTimerEvent);
               var_1635.stop();
               var_1635 = null;
            }
            _loc2_.visible = true;
            _loc3_.visible = false;
            (var_1697.getChildByName("icon_2") as class_3127).visible = false;
         }
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(param1.notify)
         {
            _notifyMessengerOnStartup = true;
         }
         if(var_1697)
         {
            if(param1.notify)
            {
               notifyMessenger(true);
            }
            else
            {
               var_1697.visible = true;
               notifyMessenger(false);
            }
         }
         if(var_4280)
         {
            if(param1.notify)
            {
               var_4280.window.visible = true;
            }
         }
      }
      
      private function onFriendNotification(param1:NotificationEvent) : void
      {
         var _loc2_:FriendEntityTab = getFriendEntityTabByID(param1.friendId);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addNotificationToken(param1.notification);
      }
      
      private function onRefreshMessengerConversations(param1:ActiveConversationsCountEvent) : void
      {
         if(var_1697 != null)
         {
            var_1697.visible = param1.activeConversationsCount != 0;
         }
      }
      
      private function onSessionDataPreferences(param1:SessionDataPreferencesEvent) : void
      {
         if(!(param1.uiFlags & 1))
         {
            if(!var_1928)
            {
               toggleCollapsedState();
            }
         }
      }
      
      private function barWindowEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         if(param1.type == "WME_DOWN")
         {
            _loc4_ = var_405;
            _loc3_ = _friendBarData.numFriends + (var_3720 ? 1 : 0) + (_friendBarData.numFriendRequests > 0 ? 1 : 0);
            switch(param2.name)
            {
               case "button_left":
                  _loc4_ = Math.max(0,var_405 - 1);
                  break;
               case "button_left_page":
                  _loc4_ = Math.max(0,var_405 - maxNumOfTabsVisible);
                  break;
               case "button_left_end":
                  _loc4_ = 0;
                  break;
               case "button_right":
                  _loc4_ = Math.max(0,Math.min(_loc3_ - maxNumOfTabsVisible,var_405 + 1));
                  break;
               case "button_right_page":
                  _loc4_ = Math.max(0,Math.min(_loc3_ - maxNumOfTabsVisible,var_405 + maxNumOfTabsVisible));
                  break;
               case "button_right_end":
                  _loc4_ = Math.max(0,_loc3_ - maxNumOfTabsVisible);
                  break;
               case "button_close":
                  visible = false;
                  break;
               case "border":
                  deSelect(true);
                  break;
               case "link_friendlist":
                  _friendBarData.toggleFriendList();
            }
            if(_loc4_ != var_405)
            {
               deSelect(true);
               var_405 = _loc4_;
               resizeAndPopulate(true);
            }
         }
         if(param1.type == "WE_DEACTIVATED")
         {
            deSelect(true);
         }
      }
      
      private function setCollapseButtonVisibility() : void
      {
         if(var_3095)
         {
            var_3095.visible = var_1928;
         }
         if(var_3107)
         {
            var_3107.visible = !var_1928;
         }
      }
      
      private function onCollapseFriendList(param1:WindowMouseEvent) : void
      {
         toggleCollapsedState();
      }
      
      private function toggleCollapsedState() : void
      {
         var_1928 = !var_1928;
         _sessionDataManager.setFriendBarState(!var_1928);
         deSelect(true);
         resizeAndPopulate(true);
         setCollapseButtonVisibility();
         if(!var_1928)
         {
            resizeAndPopulate(true);
         }
         var _loc1_:FriendBarResizeEvent = new FriendBarResizeEvent();
         events.dispatchEvent(_loc1_);
      }
      
      private function onOpenMessenger(param1:WindowMouseEvent) : void
      {
         _friendBarData.toggleMessenger();
         notifyMessenger(false);
      }
      
      private function onOpenFriendsList(param1:WindowMouseEvent) : void
      {
         _friendBarData.toggleFriendList();
      }
      
      private function onOpenSearchFriends(param1:WindowMouseEvent) : void
      {
         _friendBarData.openUserTextSearch();
      }
      
      public function removeMessengerNotifications() : void
      {
         for each(var _loc1_ in var_1477)
         {
            if(_loc1_ is FriendEntityTab)
            {
               FriendEntityTab(_loc1_).removeNotificationToken(-1,true);
            }
         }
      }
      
      public function updateFriendRequestCounter(param1:int) : void
      {
         var _loc2_:IRegionWindow = null;
         if(!var_1775)
         {
            var_1775 = _windowManager.createUnseenItemCounter();
         }
         if(var_1775)
         {
            _loc2_ = var_1445.findChildByName("icon_all_friends") as IRegionWindow;
            if(_loc2_)
            {
               _loc2_.addChild(var_1775);
               var_1775.x = _loc2_.width - 0 - 5;
               var_1775.y = 0;
               if(param1 > 0)
               {
                  var_1775.visible = true;
                  var_1775.findChildByName("count").caption = param1.toString();
               }
               else
               {
                  var_1775.visible = false;
               }
            }
         }
      }
      
      private function toggleWindowEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(false)
         {
            if(param1.type == "WME_DOWN")
            {
               var _loc3_:* = param2.name;
               if("button_open" === _loc3_)
               {
                  visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:IRegionWindow = var_1445.findChildByName("button_left_page") as IRegionWindow;
         var _loc5_:IRegionWindow = var_1445.findChildByName("button_right_page") as IRegionWindow;
         if(_loc4_ != null)
         {
            _loc4_.visible = param1;
            if(param2)
            {
               _loc4_.enable();
               _loc4_.blend = 1;
            }
            else
            {
               _loc4_.disable();
               _loc4_.blend = 0.2;
            }
         }
         if(_loc5_ != null)
         {
            _loc5_.visible = param1;
            if(param3)
            {
               _loc5_.enable();
               _loc5_.blend = 1;
            }
            else
            {
               _loc5_.disable();
               _loc5_.blend = 0.2;
            }
         }
         arrangeWindows();
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            if(var_1445)
            {
               _loc2_ = _toolbar.getRect();
               var_1445.width = var_1445.parent.width - _loc2_.right;
               var_3013.visible = !var_1928;
               if(!param1)
               {
                  _loc3_ = maxNumOfTabsVisible;
                  if(_loc3_ < var_1477.length)
                  {
                     param1 = true;
                  }
                  else if(_loc3_ > var_1477.length)
                  {
                     if(true)
                     {
                        param1 = true;
                     }
                     else if(var_1477.length < _friendBarData.numFriends + (var_3720 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(numFriendEntityTabsVisible < _friendBarData.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  populate();
                  arrangeWindows();
               }
               if(var_1928)
               {
                  var_1445.x = var_1445.desktop.width - 150;
               }
               else
               {
                  var_1445.x = var_1445.desktop.width - 0;
                  var_3013.x = 1;
               }
            }
         }
      }
      
      private function arrangeWindows() : void
      {
         var _loc1_:int = 0;
         for each(var _loc2_ in var_1445.iterator)
         {
            if(_loc2_.visible)
            {
               _loc2_.x = _loc1_;
               _loc1_ += _loc2_.width;
            }
         }
         var_1445.width = _loc1_;
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_-- > 0)
         {
            if(var_1477[_loc3_] is FriendEntityTab)
            {
               _loc2_++;
            }
         }
         var _loc1_:int = 0;
         while(_loc1_-- > 0)
         {
            if(var_1477[_loc1_] is FriendEntityTab)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IItemListWindow = var_1445.findChildByName("list") as IItemListWindow;
         var _loc2_:class_3151 = var_1445.findChildByName("friendtools") as class_3151;
         return int((0 - _loc2_.width - 16) / (127 + _loc1_.spacing));
      }
      
      private function onDesktopResized(param1:class_3134) : void
      {
         resizeAndPopulate(true);
      }
      
      public function get linkPattern() : String
      {
         return "friendbar/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         switch(_loc2_[1])
         {
            case "findfriends":
               _friendBarData.findNewFriends();
               break;
            case "user":
               if(_loc2_.length > 2)
               {
                  _friendBarData.showProfileByName(_loc2_[2]);
                  break;
               }
               break;
            default:
               class_14.log("HabboFriendBarView unknown link-type received: " + _loc2_[1]);
         }
      }
   }
}
