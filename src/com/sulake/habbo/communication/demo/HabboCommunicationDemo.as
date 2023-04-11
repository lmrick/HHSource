package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.class_79;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ErrorEvent;
   import com.sulake.core.runtime.events.HotelViewEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.IHabboWebApiSession;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.communication.login.AvatarData;
   import com.sulake.habbo.communication.login.ILoginProvider;
   import com.sulake.habbo.communication.login.WebApiLoginProvider;
   import com.sulake.habbo.configuration.enum.HabboComponentFlags;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.utils.CommunicationUtils;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.iid.*;
   import flash.display.Stage;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import package_1.*;
   import package_6.*;
   
   public class HabboCommunicationDemo extends class_20
   {
      
      public static const ERROR_TYPE_IO_ERROR:String = "ioError";
      
      public static const ERROR_CODE_MAINTENANCE:String = "maintenance";
      
      private static const AUTO_RECONNECT:Boolean = false;
       
      
      private var var_22:com.sulake.habbo.communication.demo.class_3251;
      
      private var var_2532:Boolean;
      
      private var var_1251:String;
      
      private var var_2619:com.sulake.habbo.communication.demo.class_3136;
      
      private var _communication:class_25;
      
      private var _localization:class_18;
      
      private var _windowManager:class_1684;
      
      private var var_1736:String;
      
      private var var_3355:String;
      
      private var _loginName:String;
      
      private var var_976:String;
      
      private var var_114:ILoginProvider;
      
      private var var_1418:Boolean;
      
      private var _autoLogin:Boolean;
      
      private var var_1417:Boolean;
      
      public function HabboCommunicationDemo(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         param1.events.addEventListener("unload",unloading);
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function set ssoTicket(param1:String) : void
      {
         var_1736 = param1;
      }
      
      public function set flashClientUrl(param1:String) : void
      {
         var_3355 = param1;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         },!isRoomViewerMode),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         },true,[{
            "type":"complete",
            "callback":onLocalizationsComplete
         },{
            "type":"LOCALIZATION_EVENT_LOCALIZATION_FAILED",
            "callback":onLocalizationFailed
         }])]);
      }
      
      override protected function initComponent() : void
      {
         class_79.instance.events.addEventListener("COMPONENT_EVENT_ERROR",onCoreError);
         var _loc1_:Stage = context.displayObjectContainer.stage;
         if(_loc1_ != null)
         {
            _loc1_.dispatchEvent(new HotelViewEvent("HOTEL_VIEW_READY"));
         }
         var_1418 = false;
         if(var_2619)
         {
            var_2619.dispose();
            if(_communication)
            {
               _communication.renewSocket();
            }
         }
         var_2619 = new com.sulake.habbo.communication.demo.class_3136(this,_communication);
         context.events.addEventListener("HHVE_ERROR",onHotelViewError);
         prepareProperties();
         HabboWebTools.baseUrl = getProperty("url.prefix");
         if(_autoLogin)
         {
            initWithStoredCredentials();
         }
         else if(var_1736)
         {
            initWithSSO(var_1736);
         }
         else
         {
            initWithLoginView();
         }
      }
      
      override public function dispose() : void
      {
         if(class_79.instance.events)
         {
            class_79.instance.events.removeEventListener("COMPONENT_EVENT_ERROR",onCoreError);
         }
         if(var_22)
         {
            var_22.dispose();
            var_22 = null;
         }
         if(var_2619)
         {
            var_2619.dispose();
            var_2619 = null;
         }
         _localization = null;
         _communication = null;
      }
      
      public function initGameSocket() : void
      {
         dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_INIT");
         if(var_1736 != null)
         {
            _communication.mode = 0;
         }
         else
         {
            _communication.mode = 0;
         }
         _communication.initConnection("habbo");
      }
      
      private function prepareProperties() : void
      {
         _localization.loadDefaultEmbedLocalizations("en");
         _loginName = CommunicationUtils.readSOLString("login");
         var_976 = CommunicationUtils.restorePassword();
         var _loc2_:* = CommunicationUtils.readSOLString("environment");
         var _loc3_:String = CommunicationUtils.readSOLString("loginmethod","habbo");
         var _loc6_:Boolean = CommunicationUtils.readSOLBoolean("autologin");
         var _loc5_:Boolean = false;
         CommunicationUtils.forcedAutoLoginEnabled = false;
         var _loc4_:Array;
         if((_loc4_ = getProperty("live.environment.list").split("/")).indexOf(_loc2_) == -1)
         {
            class_14.log("Missing environment, require hotel selection! " + _loc2_);
            _loc2_ = null;
            CommunicationUtils.writeSOLProperty("environment",null);
         }
         if(_loc2_ != null)
         {
            initEnvironment(_loc2_);
         }
         var_1736 = getProperty("sso.token");
         var_3355 = getProperty("flash.client.url");
         var_1251 = getProperty("external.variables.txt");
         var _loc1_:Boolean = getBoolean("use.sso");
      }
      
      private function initWithStoredCredentials() : void
      {
         _communication.mode = 0;
         var_22.showLoadingScreen();
         var _loc1_:String = CommunicationUtils.readSOLString("environment");
         initEnvironment(_loc1_);
      }
      
      private function initWithSSO(param1:String) : void
      {
         var_1736 = param1;
         _communication.mode = 0;
         initGameSocket();
      }
      
      private function initWithLoginView() : void
      {
         var _loc1_:String = CommunicationUtils.readSOLString("environment");
         if(_loc1_ == null || _loc1_ == "")
         {
         }
         if(_windowManager != null && !isRoomViewerMode)
         {
            class_79.crash("Login without an SSO ticket is not supported",29);
         }
         if(_loc1_ && _loc1_ == "")
         {
            var_114.init(_communication);
         }
      }
      
      private function onInitLogin(param1:Event) : void
      {
         var _loc2_:IHabboWebApiSession = null;
         if(false)
         {
            _loc2_ = _communication.getHabboWebApiSession();
            _loc2_.login(var_22.name,var_22.password);
         }
         else
         {
            initGameSocket();
         }
      }
      
      private function onAvatarSelected(param1:Event) : void
      {
         var _loc2_:IHabboWebApiSession = null;
         if(false)
         {
            _loc2_ = _communication.getHabboWebApiSession();
            _loc2_.selectAvatar(var_22.selectedAccount.uniqueId);
         }
         else
         {
            sendTryLoginDevelopmentOnly(var_22.name,var_22.password,var_22.avatarId);
         }
      }
      
      private function onEnvironmentSelected(param1:Event) : void
      {
         initEnvironment(var_22.selectedEnvironment);
      }
      
      private function initEnvironment(param1:String) : void
      {
         setProperty("environment.id",param1);
         CommunicationUtils.writeSOLProperty("environment",param1);
         updateEnvironmentVariables(param1);
         _communication.updateHostParameters();
         _communication.resetHabboWebApiSession();
         _localization.loadDefaultEmbedLocalizations(param1);
         if(var_22 != null)
         {
            if(false)
            {
               var_114.init(_communication);
            }
            else
            {
               var_22.environmentReady();
            }
         }
      }
      
      private function onConfigurationLoaded(param1:Event) : void
      {
         class_14.log("[HabboCommunicationDemo] Configuration Loaded!");
      }
      
      private function onConfigurationError(param1:Event) : void
      {
         var _loc2_:DataEvent = param1 as DataEvent;
         class_14.log("[HabboCommunicationDemo] Configuration Error!");
         if(_loc2_ && _loc2_.data == "503")
         {
         }
      }
      
      private function onLocalizationsComplete(param1:Event) : void
      {
      }
      
      private function onLocalizationFailed(param1:Event) : void
      {
      }
      
      public function setSSOTicket(param1:String) : void
      {
         if(param1 && !var_1736)
         {
            var_1736 = param1;
            initGameSocket();
         }
      }
      
      public function sendTryLoginDevelopmentOnly(param1:String, param2:String, param3:int = 0) : void
      {
         var _loc5_:IConnection;
         if(!(_loc5_ = _communication.connection))
         {
            _communication.initConnection("habbo");
            _loc5_ = _communication.connection;
         }
         var _loc4_:class_3164 = new class_3164(param1,param2,param3);
         _loc5_.send(_loc4_);
      }
      
      public function sendConnectionParameters(param1:IConnection) : void
      {
         var _loc2_:class_884 = null;
         param1.send(new class_466(401,var_3355,var_1251));
         var _loc3_:String = CommunicationUtils.readSOLString("machineid");
         var _loc4_:String = CommunicationUtils.generateFingerprint();
         var _loc5_:Array = Capabilities.version.split(" ");
         param1.send(new class_511(_loc3_,_loc4_,_loc5_.join("/")));
         if(var_1736 && false)
         {
            _loc2_ = new class_884(var_1736);
            param1.send(_loc2_);
         }
      }
      
      public function loginOk() : void
      {
         var_1418 = false;
         if(var_22 != null)
         {
            var_22.closeLoginWindow();
            var_22.dispose();
            var_22 = null;
         }
         var_1417 = false;
      }
      
      public function alert(param1:String, param2:String) : void
      {
         var titleKey:String = param1;
         var messageKey:String = param2;
         _windowManager.alert(titleKey,messageKey,0,function(param1:class_3132, param2:class_3134):void
         {
            param1.dispose();
         });
      }
      
      public function dispatchLoginStepEvent(param1:String) : void
      {
         if(class_20(context) == null || class_20(context).events == null)
         {
            return;
         }
         class_20(context).events.dispatchEvent(new Event(param1));
      }
      
      private function unloading(param1:Event) : void
      {
         var_2532 = true;
      }
      
      public function onUserList(param1:Vector.<AvatarData>) : void
      {
         var _loc3_:String = null;
         var _loc2_:Timer = null;
         if(_autoLogin)
         {
            _loc3_ = CommunicationUtils.readSOLString("useruniqueid");
            if(userExists(param1,_loc3_))
            {
               _loc2_ = new Timer(500,1);
               _loc2_.addEventListener("timerComplete",onAutoSendLogin);
               _loc2_.start();
            }
            else
            {
               var_22.populateCharacterList(param1);
            }
         }
         else
         {
            var_22.populateCharacterList(param1);
         }
      }
      
      private function onAutoSendLogin(param1:TimerEvent) : void
      {
         var _loc2_:int = CommunicationUtils.readSOLInteger("userid");
         sendTryLoginDevelopmentOnly(_loginName,var_976,_loc2_);
      }
      
      private function userExists(param1:Vector.<AvatarData>, param2:String) : Boolean
      {
         for each(var _loc3_ in param1)
         {
            if(_loc3_.uniqueId == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function disconnected(param1:int, param2:String) : void
      {
         var _loc3_:String = null;
         var_1418 = true;
         if(!var_22)
         {
            if(param2 == null || param2.length < 6)
            {
               param2 = String(_localization.getLocalization(class_274.resolveDisconnectedReasonLocalizationKey(param1)));
            }
            _loc3_ = "connection.login.logged_out";
            _localization.registerParameter(_loc3_,"reason",param1.toString());
            _localization.registerParameter(_loc3_,"reasonName",param2);
            alert(class_274.resolveDisconnectedReasonLocalizationKey(param1),"${connection.login.logged_out}");
            return;
         }
         onBufferedDisconnected(param1,param2);
      }
      
      private function onBufferedDisconnected(param1:int, param2:String) : void
      {
         var _loc5_:Boolean = false;
         var _loc3_:String = null;
         var _loc4_:* = false;
         if(param1 == 20)
         {
            var_22.showInvalidLoginError(null);
         }
         else
         {
            _loc5_ = _loginName && false && var_976 && false;
            _loc3_ = CommunicationUtils.readSOLString("loginmethod","habbo");
            _loc4_ = _loc3_ == "facebook";
            if(param1 != -3 || !_loc5_ && !_loc4_ || true)
            {
               var_22.showDisconnected(param1,param2);
               if(_communication)
               {
                  _communication.disconnect();
               }
            }
            else
            {
               var_1417 = true;
               CommunicationUtils.forcedAutoLoginEnabled = true;
               initComponent();
            }
         }
      }
      
      public function handleErrorMessage(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case 0:
               localization.registerParameter("connection.server.error.desc","errorCode",String(param1));
               alert("${connection.server.error.title}","${connection.server.error.desc}");
               break;
            case 1001:
            case 1002:
            case 1003:
            case 1004:
            case 1005:
            case 1006:
            case 1007:
            case 1008:
            case 1009:
            case 1010:
            case 1011:
            case 1012:
            case 1013:
            case 1014:
            case 1015:
            case 1016:
            case 1017:
            case 1018:
            case 1019:
               _communication.connection.close();
               break;
            case 4013:
               alert("${connection.room.maintenance.title}","${connection.room.maintenance.desc}");
               break;
            default:
               localization.registerParameter("connection.server.error.desc","errorCode",String(param1));
               alert("${connection.server.error.title}","${connection.server.error.desc}");
         }
      }
      
      private function onCoreError(param1:ErrorEvent) : void
      {
         switch(param1.category)
         {
            case 30:
            case 29:
            case 1:
            case 3:
            case 20:
            case 8:
            case 12:
            case 7:
               if(param1.critical)
               {
                  disconnected(-2,_localization.getLocalization("disconnected.reason.maintenance"));
               }
               break;
            default:
               if(param1.critical)
               {
                  disconnected(-1,class_274.resolveDisconnectedReasonLocalizationKey(-1));
               }
         }
      }
      
      public function handleLoginFailedHotelClosedMessage(param1:int, param2:int) : void
      {
         if(var_22)
         {
            var_22.showDisconnectedWithText(12);
         }
      }
      
      private function updateEnvironmentVariables(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc2_:String = null;
         var _loc5_:String = null;
         (_loc4_ = []).push("connection.info.host");
         _loc4_.push("connection.info.port");
         _loc4_.push("url.prefix");
         _loc4_.push("site.url");
         _loc4_.push("flash.dynamic.download.url");
         _loc4_.push("flash.dynamic.download.name.template");
         _loc4_.push("flash.dynamic.avatar.download.configuration");
         _loc4_.push("flash.dynamic.avatar.download.url");
         _loc4_.push("pocket.api");
         _loc4_.push("web.api");
         _loc4_.push("facebook.application.id");
         _loc4_.push("web.terms_of_service.link");
         for each(var _loc3_ in _loc4_)
         {
            _loc2_ = getProperty(_loc3_);
            _loc5_ = _loc3_ + "." + param1;
            if(propertyExists(_loc5_))
            {
               setProperty(_loc3_,getProperty(_loc5_));
            }
            else
            {
               setProperty(_loc3_,_loc2_);
            }
         }
      }
      
      private function onHotelViewError(param1:Event) : void
      {
         disconnected(-2,_localization.getLocalization("disconnected.reason.maintenance"));
      }
      
      public function get isRoomViewerMode() : Boolean
      {
         return HabboComponentFlags.isRoomViewerMode(flags);
      }
   }
}
