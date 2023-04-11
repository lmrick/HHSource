package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.configuration.enum.HabboComponentFlags;
   import com.sulake.habbo.friendbar.IHabboFriendBar;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendBar;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import package_137.class_1649;
   import package_36.class_1634;
   
   public class ModerationManager extends class_20 implements IHabboModeration
   {
       
      
      private var _windowManager:class_1684;
      
      private var _communication:class_25;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _navigator:class_1685;
      
      private var _soundManager:class_2089;
      
      private var _tracking:class_1693;
      
      private var _friendBar:IHabboFriendBar;
      
      private var var_4257:com.sulake.habbo.moderation.ModerationMessageHandler;
      
      private var var_2876:com.sulake.habbo.moderation.IssueManager;
      
      private var var_2580:com.sulake.habbo.moderation.StartPanelCtrl;
      
      private var var_3982:com.sulake.habbo.moderation.WindowTracker;
      
      private var _initMsg:class_1649;
      
      private var var_3990:int;
      
      public function ModerationManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_2580 = new com.sulake.habbo.moderation.StartPanelCtrl(this);
         var_3982 = new com.sulake.habbo.moderation.WindowTracker();
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         }),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            class_3243.setLocalizationManager(param1);
         }),new ComponentDependency(new IIDHabboFriendBar(),function(param1:IHabboFriendBar):void
         {
            _friendBar = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         if(HabboComponentFlags.isRoomViewerMode(flags))
         {
            return;
         }
         var_4257 = new com.sulake.habbo.moderation.ModerationMessageHandler(this);
         var_2876 = new com.sulake.habbo.moderation.IssueManager(this);
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_2580 != null)
         {
            var_2580.dispose();
            var_2580 = null;
         }
         super.dispose();
      }
      
      public function userSelected(param1:int, param2:String) : void
      {
         class_14.log("USER SELECTED: " + param1 + ", " + param2);
         this.var_2580.userSelected(param1,param2);
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get issueManager() : com.sulake.habbo.moderation.IssueManager
      {
         return var_2876;
      }
      
      public function get connection() : IConnection
      {
         return _communication.connection;
      }
      
      public function get startPanel() : com.sulake.habbo.moderation.StartPanelCtrl
      {
         return var_2580;
      }
      
      public function get initMsg() : class_1649
      {
         return _initMsg;
      }
      
      public function get messageHandler() : com.sulake.habbo.moderation.ModerationMessageHandler
      {
         return var_4257;
      }
      
      public function get windowTracker() : com.sulake.habbo.moderation.WindowTracker
      {
         return var_3982;
      }
      
      public function get currentFlatId() : int
      {
         return var_3990;
      }
      
      public function get soundManager() : class_2089
      {
         return _soundManager;
      }
      
      public function set initMsg(param1:class_1649) : void
      {
         _initMsg = param1;
      }
      
      public function set currentFlatId(param1:int) : void
      {
         var_3990 = param1;
      }
      
      public function get isModerator() : Boolean
      {
         return _sessionDataManager.hasSecurity(5);
      }
      
      public function getXmlWindow(param1:String, param2:String = "_xml", param3:int = 1) : class_3127
      {
         var _loc6_:IAsset = null;
         var _loc4_:XmlAsset = null;
         var _loc5_:class_3127 = null;
         try
         {
            _loc6_ = assets.getAssetByName(param1 + param2);
            _loc4_ = XmlAsset(_loc6_);
            _loc5_ = _windowManager.buildFromXML(XML(_loc4_.content),param3);
         }
         catch(e:Error)
         {
         }
         return _loc5_;
      }
      
      public function openHkPage(param1:String, param2:String) : void
      {
         var _loc4_:String;
         var _loc5_:String = (_loc4_ = getProperty(param1)) + param2;
         HabboWebTools.navigateToURL(_loc5_,"housekeeping");
      }
      
      public function goToRoom(param1:int) : void
      {
         _navigator.goToPrivateRoom(param1);
      }
      
      public function openThread(param1:int, param2:int) : void
      {
         context.createLinkEvent("groupforum/" + param1 + "/" + param2);
      }
      
      public function openThreadMessage(param1:int, param2:int, param3:int) : void
      {
         context.createLinkEvent("groupforum/" + param1 + "/" + param2 + "/" + param3);
      }
      
      internal function logEvent(param1:String, param2:String) : void
      {
         if(_tracking != null)
         {
            _tracking.trackEventLog("Moderation",param2,param1);
         }
      }
      
      internal function trackGoogle(param1:String, param2:int = -1) : void
      {
         if(_tracking != null)
         {
            _tracking.trackGoogle("moderationManager",param1,param2);
         }
      }
      
      public function set cfhTopics(param1:Vector.<class_1634>) : void
      {
         var_2876.setCfhTopics(param1);
      }
   }
}
