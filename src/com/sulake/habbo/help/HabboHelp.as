package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.communication.messages.parser.help.class_1154;
   import com.sulake.habbo.communication.messages.parser.help.class_1230;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.help.cfh.registry.chat.ChatEventHandler;
   import com.sulake.habbo.help.cfh.registry.chat.ChatRegistry;
   import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageEventHandler;
   import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistry;
   import com.sulake.habbo.help.cfh.registry.user.UserRegistry;
   import com.sulake.habbo.help.namechange.NameChangeController;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import package_10.class_847;
   import package_11.class_846;
   import package_123.class_1323;
   import package_132.class_1084;
   import package_150.class_1134;
   import package_154.class_1250;
   import package_154.class_1256;
   import package_165.class_1168;
   import package_17.class_1562;
   import package_17.class_486;
   import package_17.class_532;
   import package_185.HumanGameObjectData;
   import package_33.class_234;
   import package_36.class_1634;
   import package_36.class_173;
   import package_36.class_608;
   import package_4.class_121;
   import package_4.class_178;
   import package_4.class_485;
   import package_4.class_896;
   import package_54.class_643;
   import package_69.class_269;
   import package_69.class_506;
   import package_69.class_535;
   import package_7.class_795;
   import package_80.class_605;
   
   public class HabboHelp extends class_20 implements IHabboHelp, ILinkEventTracker
   {
      
      public static const REPORT_TYPE_EMERGENCY:int = 1;
      
      public static const REPORT_TYPE_GUIDE:int = 2;
      
      public static const REPORT_TYPE_IM:int = 3;
      
      public static const REPORT_TYPE_ROOM:int = 4;
      
      public static const REPORT_TYPE_BULLY:int = 6;
      
      public static const REPORT_TYPE_THREAD:int = 7;
      
      public static const REPORT_TYPE_MESSAGE:int = 8;
      
      public static const REPORT_TYPE_PHOTO:int = 9;
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _windowManager:class_1684;
      
      private var _communicationManager:class_25;
      
      private var _localizationManager:class_18;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _navigator:class_1685;
      
      private var _tracking:class_1693;
      
      private var _soundManager:class_2089;
      
      private var _friendList:class_1869;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private var var_2645:ChatEventHandler;
      
      private var var_4299:InstantMessageEventHandler;
      
      private var var_1831:com.sulake.habbo.help.GuideHelpManager;
      
      private var _userRegistry:UserRegistry;
      
      private var _chatRegistry:ChatRegistry;
      
      private var _instantMessageRegistry:InstantMessageRegistry;
      
      private var var_2110:NameChangeController;
      
      private var var_1448:com.sulake.habbo.help.CallForHelpManager;
      
      private var var_2048:com.sulake.habbo.help.WelcomeScreenController;
      
      private var var_2173:com.sulake.habbo.help.HabboWayController;
      
      private var var_1821:com.sulake.habbo.help.HabboWayQuizController;
      
      private var var_2246:com.sulake.habbo.help.SafetyBookletController;
      
      private var _outsideRoom:Boolean;
      
      private var var_1646:int;
      
      private var _reportMessage:IMessageComposer;
      
      private var var_2366:int = -1;
      
      private var var_1433:int;
      
      private var var_232:Vector.<class_1634>;
      
      private var var_1737:com.sulake.habbo.help.TopicsFlowHelpController;
      
      private var _sanctionInfo:com.sulake.habbo.help.SanctionInfo;
      
      public function HabboHelp(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         _userRegistry = new UserRegistry();
         _chatRegistry = new ChatRegistry();
         _instantMessageRegistry = new InstantMessageRegistry();
         super(param1,param2,param3);
      }
      
      public function get localization() : class_18
      {
         return _localizationManager;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return _roomSessionManager;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get communicationManager() : class_25
      {
         return _communicationManager;
      }
      
      public function get navigator() : class_1685
      {
         return _navigator;
      }
      
      public function get tracking() : class_1693
      {
         return _tracking;
      }
      
      public function get soundManager() : class_2089
      {
         return _soundManager;
      }
      
      public function get newUserTourEnabled() : Boolean
      {
         return getBoolean("guide.help.new.user.tour.enabled");
      }
      
      public function get newIdentity() : Boolean
      {
         return getInteger("new.identity",0) > 0;
      }
      
      public function get citizenshipEnabled() : Boolean
      {
         return getBoolean("talent.track.citizenship.enabled");
      }
      
      public function get safetyQuizDisabled() : Boolean
      {
         return getBoolean("safety_quiz.disabled");
      }
      
      public function requestGuide() : void
      {
         if(getBoolean("guides.enabled"))
         {
            var_1831.createHelpRequest(0);
         }
      }
      
      public function reportBully(param1:int) : void
      {
         if(var_1448 != null)
         {
            var_1448.reportBully(param1,var_1433);
         }
      }
      
      public function startPhotoReportingInNewCfhFlow(param1:int, param2:String, param3:String, param4:int) : void
      {
         if(var_1448 != null)
         {
            var_1448.reportedRoomId = var_1433;
            var_1448.reportedUserId = param1;
            var_1448.reportedUserName = param2;
            var_1448.reportedRoomObjectId = param4;
            var_1448.reportedExtraDataId = param3;
            var_1737.openReportingContentReasonCategory(9);
         }
      }
      
      public function reportUser(param1:int, param2:int, param3:String) : void
      {
         var_1448.reportedUserId = param1;
         var_1737.openReportingChatLineSelection();
      }
      
      public function reportUserName(param1:int, param2:String) : void
      {
         var_1448.reportedUserId = param1;
         var_1448.reportedUserName = param2;
         var_1448.reportedRoomId = -1;
         var_1737.openReportingUserName();
      }
      
      public function reportUserFromIM(param1:int) : void
      {
         if(var_1448 != null)
         {
            var_1448.reportedUserId = param1;
            var_1737.openReportingIMSelection();
         }
      }
      
      public function reportRoom(param1:int, param2:String, param3:String) : void
      {
         if(var_1448 != null)
         {
            var_1448.reportedRoomId = param1;
            var_1448.reportedRoomName = param2;
            var_1448.reportedUserId = -1;
            var_1448.reportedUserName = "";
            var_1737.openReportingContentReasonCategory(4);
         }
      }
      
      public function reportThread(param1:int, param2:int) : void
      {
         if(var_1448 != null)
         {
            var_1448.reportedGroupId = param1;
            var_1448.reportedThreadId = param2;
            var_1737.openReportingContentReasonCategory(7);
         }
      }
      
      public function reportSelfie(param1:String, param2:String, param3:int, param4:int, param5:int) : Boolean
      {
         if(var_1448 != null)
         {
            if(param2.length < getInteger("help.cfh.length.minimum",15))
            {
               windowManager.alert("${generic.alert.title}","${help.cfh.error.msgtooshort}",0,null);
               return false;
            }
            var_1448.reportSelfie(param1,param2,param3,param4,param5);
            return true;
         }
         return false;
      }
      
      public function reportPhoto(param1:String, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         if(var_1448 != null)
         {
            if(param2 == 0)
            {
               windowManager.alert("${generic.alert.title}","${help.cfh.error.notopic}",0,null);
               return false;
            }
            var_1448.reportPhoto(param1,param2,param3,param4,param5);
            return true;
         }
         return false;
      }
      
      public function reportMessage(param1:int, param2:int, param3:int) : void
      {
         if(var_1448 != null)
         {
            var_1448.reportedGroupId = param1;
            var_1448.reportedThreadId = param2;
            var_1448.reportedMessageId = param3;
            var_1737.openReportingContentReasonCategory(8);
         }
      }
      
      public function startNameChange() : void
      {
         if(var_2110 != null)
         {
            var_2110.showView();
         }
      }
      
      public function startEmergencyRequest() : void
      {
         if(var_1448 != null)
         {
            var_1448.openEmergencyHelpRequest();
         }
      }
      
      public function showWelcomeScreen(param1:String, param2:String, param3:int, param4:String = null) : void
      {
         if(var_2048 == null || false)
         {
            var_2048 = new com.sulake.habbo.help.WelcomeScreenController(this);
         }
         var_2048.showWelcomeScreen(param1,param2,param3,param4);
      }
      
      public function showHabboWay() : void
      {
         if(!var_2173)
         {
            var_2173 = new com.sulake.habbo.help.HabboWayController(this);
         }
         var_2173.showHabboWay();
      }
      
      public function closeHabboWay() : void
      {
         if(var_2173 != null)
         {
            var_2173.closeWindow();
         }
      }
      
      public function showSafetyBooklet() : void
      {
         if(!var_2246)
         {
            var_2246 = new com.sulake.habbo.help.SafetyBookletController(this);
         }
         var_2246.openSafetyBooklet();
      }
      
      public function closeSafetyBooklet() : void
      {
         if(var_2246 != null)
         {
            var_2246.closeWindow();
         }
      }
      
      public function showHabboWayQuiz() : void
      {
         if(var_1821 == null || false)
         {
            var_1821 = new com.sulake.habbo.help.HabboWayQuizController(this);
         }
         var_1821.showHabboWayQuiz();
      }
      
      public function showSafetyQuiz() : void
      {
         if(var_1821 == null || false)
         {
            var_1821 = new com.sulake.habbo.help.HabboWayQuizController(this);
         }
         var_1821.showSafetyQuiz();
      }
      
      public function showTourPopup() : void
      {
         var_1831.openTourPopup();
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         },false),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         },true,[{
            "type":"HTE_TOOLBAR_CLICK",
            "callback":onHabboToolbarEvent
         },{
            "type":"HTE_GROUP_ROOM_INFO_CLICK",
            "callback":onHabboToolbarEvent
         },{
            "type":"HTE_RESIZED",
            "callback":onHabboToolbarEvent
         }]),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         },true),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         },false),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         },false),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         },false),new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _friendList = param1;
         },false)]);
      }
      
      override protected function initComponent() : void
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_178(onCallForHelpDisabledNotify));
         addMessageEvent(new class_532(onUsers));
         addMessageEvent(new class_608(onSanctionStatusEvent));
         addMessageEvent(new class_486(onRoomEnter));
         addMessageEvent(new class_173(onCfhTopics));
         addMessageEvent(new class_847(onRoomReady));
         addMessageEvent(new class_896(onPendingCallsForHelpDeleted));
         addMessageEvent(new class_485(onGuideReportingStatus));
         addMessageEvent(new class_643(onGameStageStarting));
         addMessageEvent(new class_846(onGuestRoomResult));
         addMessageEvent(new class_121(onPendingCallsForHelp));
         var_2645 = new ChatEventHandler(this);
         var_1831 = new com.sulake.habbo.help.GuideHelpManager(this);
         var_1448 = new com.sulake.habbo.help.CallForHelpManager(this);
         var_2110 = new NameChangeController(this);
         var_4299 = new InstantMessageEventHandler(this);
         var_1737 = new com.sulake.habbo.help.TopicsFlowHelpController(this);
         _sanctionInfo = new com.sulake.habbo.help.SanctionInfo(this);
         context.addLinkEventTracker(this);
         if(getBoolean("show.sanction.info.on.login") && Math.random() < 0.2)
         {
            requestSanctionInfo(true);
         }
      }
      
      public function addMessageEvent(param1:IMessageEvent) : void
      {
         _messageEvents.push(_communicationManager.addHabboConnectionMessageEvent(param1));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_messageEvents != null && _communicationManager != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communicationManager.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         if(var_2246 != null)
         {
            var_2246.dispose();
            var_2246 = null;
         }
         if(var_2173 != null)
         {
            var_2173.dispose();
            var_2173 = null;
         }
         if(var_2048 != null)
         {
            var_2048.dispose();
            var_2048 = null;
         }
         if(var_2110 != null)
         {
            var_2110.dispose();
            var_2110 = null;
         }
         if(var_1831)
         {
            var_1831.dispose();
            var_1831 = null;
         }
         if(var_1448)
         {
            var_1448.dispose();
            var_1448 = null;
         }
         if(var_1821)
         {
            var_1821.dispose();
            var_1821 = null;
         }
         if(var_1737)
         {
            var_1737.dispose();
            var_1737 = null;
         }
         if(_sanctionInfo)
         {
            _sanctionInfo.dispose();
            _sanctionInfo = null;
         }
         super.dispose();
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         var _loc5_:IAsset = null;
         var _loc3_:XmlAsset = null;
         var _loc4_:class_3127 = null;
         try
         {
            _loc5_ = assets.getAssetByName(param1 + "_xml");
            _loc3_ = XmlAsset(_loc5_);
            _loc4_ = _windowManager.buildFromXML(XML(_loc3_.content),param2);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboNavigator","Failed to build window " + param1 + "_xml, " + _loc5_ + ", " + _windowManager + "!");
            throw e;
         }
         return _loc4_;
      }
      
      public function getModalXmlWindow(param1:String) : IModalDialog
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:IModalDialog = null;
         try
         {
            _loc4_ = assets.getAssetByName(param1 + "_xml");
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = _windowManager.buildModalDialogFromXML(XML(_loc2_.content));
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboNavigator","Failed to build window " + param1 + "_xml, " + _loc4_ + ", " + _windowManager + "!");
            throw e;
         }
         return _loc3_;
      }
      
      public function trackGoogle(param1:String, param2:String, param3:int = -1) : void
      {
         if(_tracking)
         {
            _tracking.trackGoogle(param1,param2,param3);
         }
      }
      
      public function setReportMessage(param1:IMessageComposer) : void
      {
         _reportMessage = param1;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(_communicationManager != null && param1 != null)
         {
            _communicationManager.connection.send(param1);
         }
      }
      
      public function get ownUserName() : String
      {
         return var_2110.ownUserName;
      }
      
      public function get ownUserId() : int
      {
         return var_2110.ownUserId;
      }
      
      public function get outsideRoom() : Boolean
      {
         return _outsideRoom;
      }
      
      public function set outsideRoom(param1:Boolean) : void
      {
         _outsideRoom = param1;
      }
      
      public function queryForPendingCallsForHelp(param1:int) : void
      {
         var_1646 = param1;
         sendMessage(new class_506());
      }
      
      public function queryForGuideReportingStatus(param1:int) : void
      {
         var_2366 = param1;
         sendMessage(new class_605());
         sendMessage(new class_535());
      }
      
      private function onPendingCallsForHelp(param1:IMessageEvent) : void
      {
         var _loc4_:String = null;
         var _loc3_:int = 0;
         var _loc2_:class_1154 = class_121(param1).getParser();
         if(_loc2_.callCount == 0 || var_1646 == 9 && _loc2_.callCount < 3)
         {
            proceedWithReporting();
         }
         else
         {
            _loc4_ = "";
            _loc3_ = 0;
            while(_loc3_ < _loc2_.callArray.length && _loc3_ < 10)
            {
               _loc4_ += _loc2_.callArray[_loc3_].message;
               if(_loc3_ < _loc2_.callArray.length - 1 && _loc3_ < 9)
               {
                  _loc4_ += "\n";
               }
               _loc3_++;
            }
            var_1448.showPendingRequest(_loc4_);
         }
      }
      
      private function onPendingCallsForHelpDeleted(param1:IMessageEvent) : void
      {
         var_1737.submitCallForHelp(false);
      }
      
      private function onGuideReportingStatus(param1:class_485) : void
      {
         var _loc2_:class_1230 = param1.getParser();
         switch(_loc2_.statusCode)
         {
            case 0:
               toggleNewHelpWindow();
               break;
            case 1:
               var_1831.showPendingTicket(_loc2_.pendingTicket);
               break;
            default:
               var_1831.showFeedback(_loc2_.localizationCode);
         }
      }
      
      private function proceedWithReporting() : void
      {
         switch(var_1646 - 1)
         {
            case 0:
            case 2:
            case 3:
            case 6:
            case 7:
               var_1448.showEmergencyHelpRequest(var_1646);
               break;
            case 1:
               var_1831.openReportWindow();
               break;
            case 8:
               if(_reportMessage != null)
               {
                  sendMessage(_reportMessage);
                  _reportMessage = null;
                  break;
               }
         }
         var_1646 = 0;
      }
      
      private function onCallForHelpDisabledNotify(param1:class_178) : void
      {
         _windowManager.simpleAlert("${help.emergency.global_mute.caption}","${help.emergency.global_mute.subtitle}","${help.emergency.global_mute.message}","${help.emergency.global_mute.link}",param1.getParser().infoUrl);
      }
      
      public function get friendList() : class_1869
      {
         return _friendList;
      }
      
      public function ignoreAndUnfriendReportedUser() : void
      {
         var _loc1_:class_234 = null;
         if(false)
         {
            sendMessage(new class_795(var_1448.reportedUserId));
            if(_friendList.getFriend(var_1448.reportedUserId) != null)
            {
               _loc1_ = new class_234();
               _loc1_.addRemovedFriend(var_1448.reportedUserId);
               sendMessage(_loc1_);
            }
         }
      }
      
      private function onUsers(param1:IMessageEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:class_1562 = null;
         var _loc2_:class_1250 = class_532(param1).getParser();
         _loc3_ = 0;
         while(_loc3_ < _loc2_.getUserCount())
         {
            if((_loc4_ = _loc2_.getUser(_loc3_)).webID != ownUserId && _loc4_.userType == 1)
            {
               _userRegistry.registerUser(_loc4_.webID,_loc4_.name,_loc4_.figure);
            }
            _loc3_++;
         }
      }
      
      private function onGameStageStarting(param1:class_643) : void
      {
         var _loc6_:HumanGameObjectData = null;
         var _loc2_:class_1323 = param1.getParser();
         var _loc5_:Array = _loc2_.gameObjects.gameObjects;
         var _loc4_:int = 0;
         var _loc3_:String = "null";
         _userRegistry.registerRoom(-1,"SnowStorm");
         for each(var _loc7_ in _loc5_)
         {
            if((_loc6_ = _loc7_ as HumanGameObjectData) != null && _loc6_.userId != ownUserId)
            {
               _userRegistry.registerUser(_loc6_.userId,_loc6_.name,_loc6_.figure);
            }
         }
         _userRegistry.registerRoom(_loc4_,_loc3_);
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         var _loc2_:class_1134 = class_847(param1).getParser();
         _userRegistry.registerRoom(_loc2_.roomId,"");
      }
      
      private function onGuestRoomResult(param1:IMessageEvent) : void
      {
         var _loc2_:class_1084 = class_846(param1).getParser();
         _userRegistry.registerRoom(_loc2_.data.flatId,_loc2_.data.roomName);
      }
      
      public function get userRegistry() : UserRegistry
      {
         return _userRegistry;
      }
      
      public function get chatRegistry() : ChatRegistry
      {
         return _chatRegistry;
      }
      
      public function get instantMessageRegistry() : InstantMessageRegistry
      {
         return _instantMessageRegistry;
      }
      
      private function onRoomEnter(param1:class_486) : void
      {
         var _loc2_:class_1256 = class_486(param1).getParser();
         var_1433 = _loc2_.guestRoomId;
      }
      
      private function onCfhTopics(param1:class_173) : void
      {
         var _loc2_:class_1168 = param1.getParser();
         var_232 = _loc2_.callForHelpCategories;
      }
      
      public function get callForHelpCategories() : Vector.<class_1634>
      {
         return var_232;
      }
      
      public function get guardiansEnabled() : Boolean
      {
         return getBoolean("guardians.enabled");
      }
      
      public function get linkPattern() : String
      {
         return "help/";
      }
      
      public function get reportedUserId() : int
      {
         return var_1448.reportedUserId;
      }
      
      public function get reportedUserName() : String
      {
         return var_1448.reportedUserName;
      }
      
      public function get reportedRoomId() : int
      {
         return var_1448.reportedRoomId;
      }
      
      public function get reportedExtraDataId() : String
      {
         return var_1448.reportedExtraDataId;
      }
      
      public function get reportedRoomObjectId() : int
      {
         return var_1448.reportedRoomObjectId;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1448.reportedUserId = param1;
      }
      
      public function set reportedRoomId(param1:int) : void
      {
         var_1448.reportedRoomId = param1;
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(param1 == "help/tour")
         {
            requestGuide();
         }
         if(param1.indexOf("help/report/room/") == 0)
         {
            _loc2_ = param1.split("/");
            if(_loc2_.length >= 5)
            {
               _loc3_ = parseInt(_loc2_[3]);
               _loc4_ = unescape(_loc2_.splice(4).join("/"));
               reportRoom(_loc3_,_loc4_,"");
            }
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(var_2048 != null)
         {
            var_2048.onHabboToolbarEvent(param1);
         }
         if(var_1831 != null)
         {
            var_1831.onHabboToolbarEvent(param1);
         }
      }
      
      public function get callForHelpManager() : com.sulake.habbo.help.CallForHelpManager
      {
         return var_1448;
      }
      
      public function toggleNewHelpWindow() : void
      {
         var_1737.toggleWindow();
      }
      
      public function requestSanctionInfo(param1:Boolean) : void
      {
         sendMessage(new class_269(param1));
      }
      
      private function onSanctionStatusEvent(param1:class_608) : void
      {
         _sanctionInfo.openWindow(param1);
      }
      
      public function openCfhFaq() : void
      {
         var _loc1_:String = String(context.configuration.getProperty("cfh.faq.url"));
         if(!StringUtil.isEmpty(_loc1_))
         {
            navigateToURL(new URLRequest(_loc1_));
         }
      }
      
      public function get guideHelpManager() : com.sulake.habbo.help.GuideHelpManager
      {
         return var_1831;
      }
   }
}
