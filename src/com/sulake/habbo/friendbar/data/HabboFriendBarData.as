package com.sulake.habbo.friendbar.data
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.events.NotificationEvent;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.friendlist.events.FriendRequestEvent;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.messenger.events.ActiveConversationEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboMessenger;
   import com.sulake.iid.IIDHabboTracking;
   import package_135.class_1099;
   import package_135.class_1114;
   import package_135.class_1332;
   import package_135.class_1408;
   import package_24.class_1599;
   import package_24.class_1646;
   import package_24.class_189;
   import package_24.class_230;
   import package_24.class_374;
   import package_24.class_406;
   import package_24.class_577;
   import package_24.class_578;
   import package_24.class_729;
   import package_24.class_829;
   import package_24.class_958;
   import package_33.class_396;
   import package_33.class_430;
   import package_49.class_898;
   import package_7.class_197;
   import package_7.class_313;
   import package_7.class_985;
   
   public class HabboFriendBarData extends class_20 implements class_3152
   {
      
      private static const SHOW_OFFLINE_FRIENDS:Boolean = false;
      
      private static const SORT_ALPHABETICALLY:Boolean = false;
      
      private static const TRACKING_EVENT_CATEGORY:String = "Navigation";
      
      private static const TRACKING_EVENT_TYPE:String = "Friend Bar";
      
      private static const TRACKING_EVENT_ACTION_VISIT:String = "go.friendbar";
      
      private static const TRACKING_EVENT_ACTION_CHAT:String = "chat_btn_click";
      
      private static const TRACKING_EVENT_ACTION_FIND_FRIENDS:String = "find_friends_btn_click";
      
      public static const TRACKING_EVENT_ACTION_PLAY_SNOWSTORM_TAB:String = "play_snowstorm_tab_click";
      
      public static const TRACKING_EVENT_ACTION_PLAY_SNOWSTORM_BUTTON:String = "play_snowstorm_btn_click";
      
      private static const const_1140:String = "Toolbar";
      
      private static const const_685:String = "open";
      
      private static const const_880:String = "close";
      
      private static const LEGACY_TRACKING_EVENT_TYPE_FRIENDLIST:String = "FRIENDLIST";
      
      private static const LEGACY_TRACKING_EVENT_TYPE_MESSENGER:String = "MESSENGER";
       
      
      private var _habboCommunicationManager:class_25;
      
      private var _habboFriendListComponent:class_1869;
      
      private var _habboMessengerComponent:class_1689;
      
      private var _tracking:class_1693;
      
      private var var_1538:Array;
      
      private var var_1810:class_24;
      
      private var var_1544:Array;
      
      private var var_2616:int;
      
      public function HabboFriendBarData(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_1538 = [];
         var_1810 = new class_24();
         var_1544 = [];
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(),null),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _habboCommunicationManager = param1;
         }),new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _habboFriendListComponent = param1;
         }),new ComponentDependency(new IIDHabboMessenger(),function(param1:class_1689):void
         {
            _habboMessengerComponent = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_729(onMessengerInitialized));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_189(onRoomInvite));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_374(onFriendsListFragment));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_578(onFindFriendProcessResult));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_958(onFriendNotification));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_406(onFriendListUpdate));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_230(onNewFriendRequest));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_829(onFriendRequestList));
         _habboCommunicationManager.addHabboConnectionMessageEvent(new class_577(onNewConsoleMessage));
         _habboFriendListComponent.events.addEventListener("FRE_ACCEPTED",onFriendRequestEvent);
         _habboFriendListComponent.events.addEventListener("FRE_DECLINED",onFriendRequestEvent);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(_habboFriendListComponent != null && true)
            {
               _habboFriendListComponent.events.removeEventListener("FRE_ACCEPTED",onFriendRequestEvent);
               _habboFriendListComponent.events.removeEventListener("FRE_DECLINED",onFriendRequestEvent);
            }
            var_1538 = null;
            var_1810.dispose();
            var_1810 = null;
            var_1544 = null;
            super.dispose();
         }
      }
      
      public function get numFriends() : int
      {
         return var_1538.length;
      }
      
      public function getFriendAt(param1:int) : class_3394
      {
         return var_1538[param1];
      }
      
      public function getFriendByID(param1:int) : class_3394
      {
         return var_1810.getValue(param1);
      }
      
      public function getFriendByName(param1:String) : class_3394
      {
         for each(var _loc2_ in var_1538)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function setFriendAt(param1:class_3394, param2:int) : void
      {
         var _loc3_:int = var_1538.indexOf(param1);
         if(_loc3_ > -1 && _loc3_ != param2)
         {
            var_1538.splice(_loc3_,1);
            var_1538.splice(param2,0,param1);
            events.dispatchEvent(new FriendBarUpdateEvent());
         }
      }
      
      public function get numFriendRequests() : int
      {
         return !!var_1544 ? var_1544.length : 0;
      }
      
      public function getFriendRequestAt(param1:int) : class_3384
      {
         return !!var_1544 ? var_1544[param1] : null;
      }
      
      public function getFriendRequestByID(param1:int) : class_3384
      {
         if(var_1544)
         {
            for each(var _loc2_ in var_1544)
            {
               if(_loc2_.id == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function getFriendRequestByName(param1:String) : class_3384
      {
         if(var_1544)
         {
            for each(var _loc2_ in var_1544)
            {
               if(_loc2_.name == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function getFriendRequestList() : Array
      {
         return var_1544;
      }
      
      public function acceptFriendRequest(param1:int) : void
      {
         removeFriendRequest(param1);
         if(_habboFriendListComponent)
         {
            if(true)
            {
               _habboFriendListComponent.acceptFriendRequest(param1);
            }
         }
      }
      
      public function showProfile(param1:int) : void
      {
         if(_habboCommunicationManager)
         {
            if(param1 > 0)
            {
               _habboCommunicationManager.connection.send(new class_313(param1));
            }
            else
            {
               _habboCommunicationManager.connection.send(new class_197(Math.abs(param1),true));
            }
         }
      }
      
      public function showProfileByName(param1:String) : void
      {
         if(_habboCommunicationManager)
         {
            _habboCommunicationManager.connection.send(new class_985(param1));
         }
      }
      
      public function acceptAllFriendRequests() : void
      {
         var_1544 = [];
         _habboFriendListComponent.acceptAllFriendRequests();
         events.dispatchEvent(new FriendRequestUpdateEvent());
      }
      
      public function declineFriendRequest(param1:int) : void
      {
         removeFriendRequest(param1);
         if(_habboFriendListComponent)
         {
            if(true)
            {
               _habboFriendListComponent.declineFriendRequest(param1);
            }
         }
      }
      
      public function declineAllFriendRequests() : void
      {
         var_1544 = [];
         _habboFriendListComponent.declineAllFriendRequests();
         events.dispatchEvent(new FriendRequestUpdateEvent());
      }
      
      private function removeFriendRequest(param1:int) : void
      {
         if(var_1544)
         {
            for each(var _loc2_ in var_1544)
            {
               if(_loc2_.id == param1)
               {
                  var_1544.splice(var_1544.indexOf(_loc2_),1);
                  events.dispatchEvent(new FriendRequestUpdateEvent());
                  return;
               }
            }
         }
      }
      
      public function followToRoom(param1:int) : void
      {
         if(_habboCommunicationManager)
         {
            _habboCommunicationManager.connection.send(new class_430(param1));
            _habboCommunicationManager.connection.send(new class_898("Navigation","Friend Bar","go.friendbar"));
         }
      }
      
      public function startConversation(param1:int) : void
      {
         if(_habboMessengerComponent)
         {
            _habboMessengerComponent.startConversation(param1);
            events.dispatchEvent(new NewMessageEvent(false,param1));
            if(_habboCommunicationManager)
            {
               _habboCommunicationManager.connection.send(new class_898("Navigation","Friend Bar","chat_btn_click"));
            }
         }
      }
      
      public function findNewFriends() : void
      {
         if(_habboCommunicationManager)
         {
            _habboCommunicationManager.connection.send(new class_396());
            _habboCommunicationManager.connection.send(new class_898("Navigation","Friend Bar","find_friends_btn_click"));
         }
      }
      
      public function openUserTextSearch() : void
      {
         if(_habboFriendListComponent.currentTabId() != 3)
         {
            _habboFriendListComponent.openFriendSearch();
         }
         else
         {
            _habboFriendListComponent.close();
         }
      }
      
      public function sendGameTabTracking(param1:String) : void
      {
         sendEventLogTracking("play_snowstorm_tab_click",param1);
      }
      
      public function sendGameButtonTracking(param1:String) : void
      {
         sendEventLogTracking("play_snowstorm_btn_click",param1);
      }
      
      private function sendEventLogTracking(param1:String, param2:String) : void
      {
         if(_habboCommunicationManager)
         {
            _habboCommunicationManager.connection.send(new class_898("Navigation","Friend Bar",param1,param2,numFriends));
         }
      }
      
      public function toggleFriendList() : void
      {
         var _loc1_:class_3151 = null;
         if(_habboFriendListComponent)
         {
            if(true)
            {
               if(!_habboFriendListComponent.isOpen())
               {
                  if(false)
                  {
                     _habboFriendListComponent.openFriendRequests();
                  }
                  else
                  {
                     _habboFriendListComponent.openFriendList();
                  }
               }
               else
               {
                  _loc1_ = _habboFriendListComponent.mainWindow;
                  if(_loc1_ != null && WindowToggle.isHiddenByOtherWindows(_loc1_))
                  {
                     _loc1_.activate();
                     return;
                  }
                  _habboFriendListComponent.close();
               }
               if(_habboCommunicationManager)
               {
                  _habboCommunicationManager.connection.send(new class_898("Toolbar","FRIENDLIST",_habboFriendListComponent.isOpen() ? "open" : "close"));
               }
            }
         }
      }
      
      public function toggleMessenger() : void
      {
         if(_habboMessengerComponent)
         {
            if(true)
            {
               _habboMessengerComponent.toggleMessenger();
               if(_habboCommunicationManager)
               {
                  _habboCommunicationManager.connection.send(new class_898("Toolbar","MESSENGER",_habboMessengerComponent.isOpen() ? "open" : "close"));
               }
            }
         }
      }
      
      private function onMessengerInitialized(param1:IMessageEvent) : void
      {
         if(_habboMessengerComponent)
         {
            _habboMessengerComponent.events.addEventListener("ACCE_changed",onUpdateActiveConversationCount);
         }
      }
      
      private function onFriendsListFragment(param1:IMessageEvent) : void
      {
         buildFriendList(class_374(param1).getParser().friendFragment);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:FriendEntity = null;
         var _loc6_:* = null;
         var _loc4_:class_1099;
         var _loc3_:Array = (_loc4_ = class_406(param1).getParser()).removedFriendIds;
         var _loc8_:Array = _loc4_.updatedFriends;
         var _loc5_:Array = _loc4_.addedFriends;
         for each(var _loc7_ in _loc3_)
         {
            _loc2_ = var_1810.getValue(_loc7_);
            if(_loc2_)
            {
               var_1810.remove(_loc7_);
               var_1538.splice(var_1538.indexOf(_loc2_),1);
               _habboMessengerComponent.closeConversation(_loc7_);
            }
         }
         for each(_loc6_ in _loc8_)
         {
            _loc2_ = var_1810.getValue(_loc6_.id);
            if(_loc2_)
            {
               if(_loc6_.online)
               {
                  _loc2_.name = _loc6_.name;
                  _loc2_.realName = _loc6_.realName;
                  _loc2_.motto = _loc6_.motto;
                  _loc2_.gender = _loc6_.gender;
                  _loc2_.online = _loc6_.online;
                  _loc2_.allowFollow = _loc6_.followingAllowed;
                  _loc2_.figure = _loc6_.figure;
                  _loc2_.categoryId = _loc6_.categoryId;
                  _loc2_.lastAccess = _loc6_.lastAccess;
               }
               else
               {
                  var_1810.remove(_loc6_.id);
                  var_1538.splice(var_1538.indexOf(_loc2_),1);
               }
            }
            else if(_loc6_.online)
            {
               _loc2_ = new FriendEntity(_loc6_.id,_loc6_.name,_loc6_.realName,_loc6_.motto,_loc6_.gender,_loc6_.online,_loc6_.followingAllowed,_loc6_.figure,_loc6_.categoryId,_loc6_.lastAccess);
               var_1538.splice(0,0,_loc2_);
               var_1810.add(_loc2_.id,_loc2_);
            }
         }
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_.online)
            {
               if(var_1810.getValue(_loc6_.id) == null)
               {
                  _loc2_ = new FriendEntity(_loc6_.id,_loc6_.name,_loc6_.realName,_loc6_.motto,_loc6_.gender,_loc6_.online,_loc6_.followingAllowed,_loc6_.figure,_loc6_.categoryId,_loc6_.lastAccess);
                  var_1538.push(_loc2_);
                  var_1810.add(_loc2_.id,_loc2_);
               }
            }
            removeFriendRequest(_loc6_.id);
         }
         if(_loc5_.length > 0 || _loc8_.length > 0)
         {
            var_1538 = sortByName(var_1538);
         }
         events.dispatchEvent(new FriendBarUpdateEvent());
      }
      
      private function onFindFriendProcessResult(param1:class_578) : void
      {
         events.dispatchEvent(new FindFriendsNotificationEvent(param1.success));
      }
      
      private function onNewFriendRequest(param1:class_230) : void
      {
         var _loc2_:class_1646 = null;
         if(showFriendRequests)
         {
            _loc2_ = param1.getParser().req;
            var_1544.push(new FriendRequest(_loc2_.requestId,_loc2_.requesterName,_loc2_.figureString));
            events.dispatchEvent(new FriendRequestUpdateEvent());
         }
      }
      
      private function onFriendRequestList(param1:class_829) : void
      {
         var _loc3_:Array = null;
         if(showFriendRequests)
         {
            _loc3_ = param1.getParser().reqs;
            for each(var _loc2_ in _loc3_)
            {
               var_1544.push(new FriendRequest(_loc2_.requestId,_loc2_.requesterName,_loc2_.figureString));
            }
            events.dispatchEvent(new FriendRequestUpdateEvent());
         }
      }
      
      private function onFriendRequestEvent(param1:FriendRequestEvent) : void
      {
         removeFriendRequest(param1.requestId);
      }
      
      private function onNewConsoleMessage(param1:class_577) : void
      {
         var _loc2_:class_1408 = param1.getParser();
         var_2616 = _loc2_.senderId;
         var _loc3_:Boolean = true;
         if(_habboMessengerComponent)
         {
            if(_habboMessengerComponent.isOpen())
            {
               _loc3_ = false;
            }
         }
         if(false)
         {
            events.dispatchEvent(new NewMessageEvent(_loc3_,var_2616));
         }
         if(_loc3_)
         {
            makeNotification(String(var_2616),-1,null,false,false);
         }
      }
      
      private function onUpdateActiveConversationCount(param1:ActiveConversationEvent) : void
      {
         events.dispatchEvent(new ActiveConversationsCountEvent(param1.activeConversationsCount));
      }
      
      private function onRoomInvite(param1:class_189) : void
      {
         var _loc2_:class_1114 = param1.getParser();
         var_2616 = _loc2_.senderId;
         if(_habboMessengerComponent && !_habboMessengerComponent.isOpen())
         {
            events.dispatchEvent(new NewMessageEvent(true,var_2616));
            makeNotification(String(var_2616),-1,null,true,false);
         }
      }
      
      private function onFriendNotification(param1:class_958) : void
      {
         var _loc4_:class_1332;
         var _loc2_:* = (_loc4_ = param1.getParser()).typeCode != 3;
         var _loc5_:* = _loc4_.typeCode != 4;
         var _loc3_:* = _loc4_.typeCode != 3;
         makeNotification(_loc4_.avatarId,_loc4_.typeCode,_loc4_.message,_loc2_,_loc5_,_loc3_);
      }
      
      private function makeNotification(param1:String, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean = true) : void
      {
         var _loc7_:class_3394 = null;
         var _loc8_:FriendNotification = null;
         var _loc9_:* = undefined;
         if(showFriendNotifications)
         {
            if(_loc7_ = getFriendByID(parseInt(param1)))
            {
               _loc9_ = _loc7_.notifications;
               for each(_loc8_ in _loc9_)
               {
                  if(_loc8_.typeCode == param2)
                  {
                     _loc8_.message = param3;
                     _loc8_.viewOnce = param4;
                     break;
                  }
                  _loc8_ = null;
               }
               if(!_loc8_)
               {
                  _loc8_ = new FriendNotification(param2,param3,param4);
                  _loc9_.push(_loc8_);
               }
               else if(!param6)
               {
                  return;
               }
               events.dispatchEvent(new NotificationEvent(_loc7_.id,_loc8_));
               if(param5)
               {
                  setFriendAt(_loc7_,0);
               }
               if(_loc7_.logEventId < 0)
               {
                  _loc7_.logEventId = _loc7_.getNextLogEventId();
               }
               if(_tracking)
               {
                  _tracking.trackEventLog("FriendBar",FriendNotification.typeCodeToString(param2),"notified","",_loc7_.logEventId > 0 ? _loc7_.logEventId : 0);
               }
            }
         }
      }
      
      private function buildFriendList(param1:Array) : void
      {
         var _loc2_:FriendEntity = null;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.online)
            {
               _loc2_ = new FriendEntity(_loc3_.id,_loc3_.name,_loc3_.realName,_loc3_.motto,_loc3_.gender,_loc3_.online,_loc3_.followingAllowed,_loc3_.figure,_loc3_.categoryId,_loc3_.lastAccess);
               var_1538.push(_loc2_);
               var_1810.add(_loc2_.id,_loc2_);
            }
         }
         var_1538 = sortByName(var_1538);
         events.dispatchEvent(new FriendBarUpdateEvent());
      }
      
      private function sortByName(param1:Array) : Array
      {
         return param1;
      }
      
      private function sortByNameAndOnlineStatus(param1:Array) : Array
      {
         var _loc5_:FriendEntity = null;
         var _loc2_:* = [];
         var _loc3_:* = [];
         var _loc4_:int = int(param1.length);
         while(_loc4_-- > 0)
         {
            if((_loc5_ = param1[_loc4_]).online)
            {
               _loc2_.push(_loc5_);
            }
            else
            {
               _loc3_.push(_loc5_);
            }
         }
         _loc4_ = int(_loc3_.length);
         while(_loc4_-- > 0)
         {
            _loc2_.push(_loc3_.pop());
         }
         return _loc2_;
      }
      
      public function get showFriendNotifications() : Boolean
      {
         return getBoolean("friendbar.notifications.enabled");
      }
      
      public function get showFriendRequests() : Boolean
      {
         return getBoolean("friendbar.requests.enabled");
      }
   }
}
