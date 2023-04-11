package com.sulake.habbo.messenger
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.friendlist.class_3191;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.messenger.events.ActiveConversationEvent;
   import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import package_135.class_1114;
   import package_135.class_1206;
   import package_135.class_1293;
   import package_135.class_1408;
   import package_22.class_916;
   import package_24.class_189;
   import package_24.class_299;
   import package_24.class_431;
   import package_24.class_577;
   import package_24.class_716;
   import package_24.class_729;
   import package_5.class_788;
   import package_53.class_214;
   
   public class HabboMessenger extends class_20 implements class_1689
   {
       
      
      private var _windowManager:class_1684;
      
      private var _communication:class_25;
      
      private var _localization:class_18;
      
      private var _friendList:class_1869;
      
      private var _soundManager:class_2089;
      
      private var _tracking:class_1693;
      
      private var var_2602:int = 0;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _help:IHabboHelp;
      
      private var var_1534:com.sulake.habbo.messenger.MainView;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private var var_1070:Boolean = false;
      
      private var _followingToGroupRoom:Boolean = false;
      
      public function HabboMessenger(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _friendList = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         }),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _help = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_729(onMessengerInit));
         addMessageEvent(new class_214(onAccountPreferences));
         addMessageEvent(new class_788(onHabboGroupDetails));
         if(getBoolean("client.minimail.embed.enabled"))
         {
            addMessageEvent(new class_716(onMiniMailMessage));
            addMessageEvent(new class_299(onMiniMailUnreadCount));
         }
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         _messageEvents.push(_communication.addHabboConnectionMessageEvent(param1));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_messageEvents != null && _communication != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communication.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         super.dispose();
      }
      
      private function onMiniMailMessage(param1:IMessageEvent) : void
      {
         var_2602++;
         playMessageReceivedSound();
         events.dispatchEvent(new MiniMailMessageEvent("MMME_new",var_2602));
      }
      
      private function onMiniMailUnreadCount(param1:IMessageEvent) : void
      {
         var_2602 = (param1.parser as class_1206).unreadMessageCount;
         events.dispatchEvent(new MiniMailMessageEvent("MMME_unread",var_2602));
      }
      
      private function onAccountPreferences(param1:class_214) : void
      {
         var_1070 = param1.getParser().roomInvitesIgnored;
      }
      
      private function onHabboGroupDetails(param1:class_788) : void
      {
         if(_followingToGroupRoom)
         {
            _followingToGroupRoom = false;
            send(new class_916(param1.data.roomId));
         }
      }
      
      public function getRoomInvitesIgnored() : Boolean
      {
         return var_1070;
      }
      
      public function setRoomInvitesIgnored(param1:Boolean) : void
      {
         var_1070 = param1;
      }
      
      private function onMessengerInit(param1:IMessageEvent) : void
      {
         var_1534 = new com.sulake.habbo.messenger.MainView(this);
         addMessageEvent(new class_577(onNewConsoleMessage));
         addMessageEvent(new class_431(onInstantMessageError));
         addMessageEvent(new class_189(onRoomInvite));
      }
      
      public function startConversation(param1:int) : void
      {
         if(var_1534 != null)
         {
            var_1534.startConversation(param1);
            var_1534.show();
         }
      }
      
      public function getUnseenMiniMailMessageCount() : int
      {
         return var_2602;
      }
      
      public function setFollowingAllowed(param1:int, param2:Boolean) : void
      {
         if(var_1534 != null)
         {
            var_1534.setFollowingAllowed(param1,param2);
         }
      }
      
      public function setOnlineStatus(param1:int, param2:Boolean) : void
      {
         if(var_1534 != null)
         {
            var_1534.setOnlineStatus(param1,param2);
         }
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.connection.send(param1);
      }
      
      public function playSendSound() : void
      {
         if(_soundManager != null)
         {
            _soundManager.playSound("HBST_message_sent");
         }
      }
      
      public function isOpen() : Boolean
      {
         return var_1534 != null && false;
      }
      
      public function toggleMessenger() : void
      {
         if(var_1534 != null)
         {
            var_1534.toggle();
         }
      }
      
      public function getText(param1:String) : String
      {
         return _localization.getLocalization(param1,param1);
      }
      
      private function onNewConsoleMessage(param1:class_577) : void
      {
         var _loc2_:class_1408 = param1.getParser();
         class_14.log("Received console msg: " + _loc2_.messageText + ", " + _loc2_.senderId);
         if(var_1534 != null)
         {
            var_1534.addConsoleMessage(_loc2_.senderId,_loc2_.messageText,_loc2_.secondsSinceSent,_loc2_.extraData);
            if(true)
            {
               playMessageReceivedSound();
            }
         }
      }
      
      private function onRoomInvite(param1:class_189) : void
      {
         var _loc2_:class_1114 = param1.getParser();
         if(var_1534 != null)
         {
            var_1534.addRoomInvite(_loc2_.senderId,_loc2_.messageText);
            if(true)
            {
               playMessageReceivedSound();
            }
         }
      }
      
      private function playMessageReceivedSound() : void
      {
         if(_soundManager != null)
         {
            _soundManager.playSound("HBST_message_received");
         }
      }
      
      private function onInstantMessageError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1293 = (param1 as class_431).getParser();
         if(var_1534 != null)
         {
            var_1534.onInstantMessageError(_loc2_.userId,_loc2_.errorCode,_loc2_.message);
         }
      }
      
      public function conversationCountUpdated(param1:int) : void
      {
         events.dispatchEvent(new ActiveConversationEvent("ACCE_changed",param1));
      }
      
      public function getXmlWindow(param1:String) : class_3127
      {
         var _loc3_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc2_:XmlAsset = XmlAsset(_loc3_);
         return _windowManager.buildFromXML(XML(_loc2_.content));
      }
      
      public function trackGoogle(param1:String, param2:String, param3:int = -1) : void
      {
         if(_tracking)
         {
            _tracking.trackGoogle(param1,param2,param3);
         }
      }
      
      internal function getFriend(param1:int) : class_3191
      {
         return _friendList.getFriend(param1);
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      internal function reportUser(param1:int) : void
      {
         _help.reportUserFromIM(param1);
      }
      
      public function set followingToGroupRoom(param1:Boolean) : void
      {
         _followingToGroupRoom = param1;
      }
      
      public function closeConversation(param1:int) : void
      {
         var_1534.hideConversation(param1);
      }
      
      public function get hasfriendsListInitialized() : Boolean
      {
         return _friendList.hasfriendsListInitialized;
      }
   }
}
