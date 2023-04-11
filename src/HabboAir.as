package
{
   import com.sulake.air.class_12;
   import com.sulake.core.runtime.class_15;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.MouseWheelEnabler;
   import com.sulake.habbo.utils.CommunicationUtils;
   import flash.desktop.NativeApplication;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.BrowserInvokeEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.InvokeEvent;
   import flash.events.UncaughtErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.net.sendToURL;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import login.LoginFlow;

   public class HabboAir extends MovieClip
   {
      
      public static const CORE_RATIO:Number = 0.6;
      
      private static const APPROXIMATE_SWF_SIZE:int = 7000000;
      
      protected static var PROCESSLOG_ENABLED:Boolean = false;
      
      public static const ERROR_VARIABLE_IS_FATAL:String = "is_fatal";
      
      public static const ERROR_VARIABLE_CLIENT_CRASH_TIME:String = "crash_time";
      
      public static const ERROR_VARIABLE_CONTEXT:String = "error_ctx";
      
      public static const ERROR_VARIABLE_FLASH_VERSION:String = "flash_version";
      
      public static const ERROR_VARIABLE_AVERAGE_UPDATE_INTERVAL:String = "avg_update";
      
      public static const ERROR_VARIABLE_DEBUG:String = "debug";
      
      public static const ERROR_VARIABLE_DESCRIPTION:String = "error_desc";
      
      public static const ERROR_VARIABLE_CATEGORY:String = "error_cat";
      
      public static const ERROR_VARIABLE_DATA:String = "error_data";
      
      private static const RECEPTION_LOG_STEP_FUNCTION:String = "NewUserReception.logStep";
      
      private static const STEP_NUX_ENTERED:String = "NUX_ENTERED";
      
      private static const STEP_RECEPTION_EXITED:String = "RECEPTION_EXITED";
      
      private static const STEP_NUX_EXITED:String = "NUX_EXITED";
      
      private static const STEP_CLIENT_LOADED:String = "CLIENT_LOADED";
      
      public static const ERROR_CATEGORY_FINALIZE_PRELOADING:int = 9;
      
      public static const ERROR_CATEGORY_DOWNLOAD_FONT:int = 11;
      
      public static const ERROR_UNCAUGHT_ERROR:int = 40;
      
      private static const ARGUMENT_ENVIRONMENT:String = "server";
      
      private static const ARGUMENT_SSO_TOKEN:String = "ticket";

      public static var CONNECTION_HOST:String;
     
      public static var CONNECTION_PORTS:String;

      
      private static var _crashURL:String = "";
      
      private static var _crashed:Boolean = false;
      
      private static const REFRESH_PERIOD_IN_MILLIS:Number = 15000;
      
      private static var _lastRequestTime:Date;
       
      
      private var var_147:Boolean;
      
      private var var_123:uint;
      
      private var _cachedBytesLoaded:uint;
      
      private var _httpStatus:int;
      
      private var _disposed:Boolean = false;
      
      private var var_277:Boolean;
      
      private var _loadingScreen:IHabboLoadingScreen;
      
      private var _startTime:int;
      
      private var _loginFlow:LoginFlow = null;
      
      private var var_993:Boolean;
      
      private var var_1244:Boolean;
      
      private var var_1409:Boolean = true;
      
      private var var_931:Boolean = false;
      
      private var var_53:Dictionary;
      
      public function HabboAir()
      {
         var _loc1_:class_2 = new class_2();
       
         if(!_loc1_.method_4(this))
         {
            return;
         }
     
         super();
     
         _startTime = getTimer();
         stop();
         var_53 = new Dictionary();
        
         _isSpaWeb = (stage.loaderInfo.parameters["spaweb"] == "1");
         HabboWebTools.isSpaWeb = _isSpaWeb;
         CONNECTION_HOST = root.loaderInfo.parameters["connection.info.host"];
         CONNECTION_PORTS = root.loaderInfo.parameters["connection.info.port"];

         if(stage)
         {
            onAddedToStage();
         }
        
         else
         {
            this.addEventListener("addedToStage",onAddedToStage);
         }

         
         NativeApplication.nativeApplication.addEventListener("invoke",onInvoke);
         NativeApplication.nativeApplication.addEventListener("browserInvoke",onBrowserInvoke);
      }
      
      public static function trackLoginStep(param1:String, param2:String = null) : void
      {
         class_14.log("* HabboMain Login Step: " + param1);
       
         if(PROCESSLOG_ENABLED)
         {
            try
            {
               if(false)
               {
                  if(param2 != null)
                  {
                     ExternalInterface.call("FlashExternalInterface.logLoginStep",param1,param2);
                  }
                  else
                  {
                     ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
                  }
               }
               else
               {
                  class_14.log("ExternalInterface is not available, tracking is disabled");
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public static function reportCrash(param1:String, param2:int, param3:Boolean, param4:Error = null, param5:class_15 = null) : void
      {
         var _loc6_:String = param4 == null ? "" : param4.getStackTrace();
         reportCrashStack(param1,param2,param3,_loc6_,param5);
      }
      
      public static function reportCrashStack(param1:String, param2:int, param3:Boolean, param4:String, param5:class_15 = null) : void
      {
         var _loc10_:int = 0;
         if(_lastRequestTime != null && NaN > new Date().time)
         {
            return;
         }
         _lastRequestTime = new Date();
         var _loc6_:URLRequest = new URLRequest(HabboAir.var_396);
         var _loc7_:URLVariables;
       
         (_loc7_ = new URLVariables())["crash_time"] = new Date().getTime().toString();
         _loc7_["is_fatal"] = param3.toString();
         _loc7_["error_ctx"] = "";
         _loc7_["flash_version"] = Capabilities.version;
         _loc7_["avg_update"] = 0;
         _loc7_["error_desc"] = param1;
         _loc7_["error_cat"] = String(param2);
         if(param4 != "")
         {
            _loc7_["error_data"] = param4;
         }
         _loc7_["debug"] = "Memory usage: " + Math.round(0) + " MB";
         var _loc8_:Array;
         var _loc9_:int = int((_loc8_ = ErrorReportStorage.getParameterNames()).length);
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            _loc7_[_loc8_[_loc10_]] = ErrorReportStorage.getParameter(_loc8_[_loc10_]);
            _loc10_++;
         }
         _loc7_["debug"] = ErrorReportStorage.getDebugData();
         if(param3)
         {
            if(!var_1218)
            {
               var_1218 = true;
            }
         }
         _loc6_.data = _loc7_;
         _loc6_.method = "POST";
         try
         {
            sendToURL(_loc6_);
         }
         catch(e:Error)
         {
            class_14.log("Error while sending error report: undefined");
         }
      }
      
      private function onBrowserInvoke(param1:BrowserInvokeEvent) : void
      {
         class_14.log("Received Browser Invoke: " + param1.arguments);
         NativeApplication.nativeApplication.removeEventListener("browserInvoke",onBrowserInvoke);
         parseArguments(param1.arguments);
      }
      
      private function onInvoke(param1:InvokeEvent) : void
      {
         NativeApplication.nativeApplication.removeEventListener("invoke",onInvoke);
         parseArguments(param1.arguments);
      }
      
      private function parseArguments(param1:Array) : void
      {
       //  var _loc2_:int = 0;
       //  var _loc3_:int = 0;
       //  var _loc5_:String = null;
      //   var _loc4_:String = null;
         var_53 = new Dictionary();
      
      /*
         if(param1 && param1.length)
         {
            if(param1.length % 2 != 0)
            {
            }
            _loc2_ = param1.length / 2;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc3_ * 2 + 1 < param1.length)
               {
                  _loc5_ = String(param1[_loc3_ * 2]);
                  _loc4_ = String(param1[_loc3_ * 2 + 1]);
                  if((_loc5_ = _loc5_.replace("-","")) == "server")
                  {
                     _loc4_ = (_loc4_ = (_loc4_ = _loc4_.replace("hh","")).replace("br","pt")).replace("us","en");
                     var_53["environment.id"] = _loc4_;
                     CommunicationUtils.writeSOLProperty("environment",_loc4_);
                  }
                  if(_loc5_ == "ticket")
                  {
                     var_53["sso.token"] = _loc4_;
                  }
               }
               _loc3_++;
            }
         }
         */

         _SafeStr_245["environment.id"] = "en";
         _SafeStr_245["sso.token"] = stage.loaderInfo.parameters["sso.ticket"];
         
         var_1244 = true;
         tryInit();
      }
      
      private function onAddedToStage(param1:Event = null) : void
      {
         removeEventListener("addedToStage",onAddedToStage);
         var_993 = true;
         tryInit();
      }
      
      private function tryInit() : void
      {
         var clientFatalErrorUrl:String;
         var urlPrefix:String;
         if(!var_1244 || !var_993)
         {
            return;
         }
         clientFatalErrorUrl = "null";
         if(clientFatalErrorUrl != null)
         {
            var_396 = clientFatalErrorUrl;
         }
         else
         {
            urlPrefix = "null";
            if(urlPrefix != null)
            {
               var_396 = urlPrefix + "/flash_client_error";
            }
         }
         PROCESSLOG_ENABLED = false;
         trackLoginStep("client.init.start");
         stage.scaleMode = "noScale";
         stage.quality = "low";
         stage.align = "TL";
         root.loaderInfo.addEventListener("progress",onPreLoadingProgress);
         root.loaderInfo.addEventListener("httpStatus",onPreLoadingStatus);
         root.loaderInfo.addEventListener("complete",onPreLoadingCompleted);
         root.loaderInfo.addEventListener("ioError",onPreLoadingFailed);
         root.loaderInfo.uncaughtErrorEvents.addEventListener("uncaughtError",function(param1:UncaughtErrorEvent):void
         {
            reportCrash("Uncaught client error, eventType: " + param1.type + " errorID: " + param1.errorID + " runtime: " + (getTimer() - _startTime) / 1000 + "s",40,true,param1.error);
         });
         if(class_12.isSupported())
         {
            CommunicationUtils.encryptedLocalStorage = new class_12();
         }
         createNewUserLobbyOrLoadingScreen();
         checkPreLoadingStatus();
         MouseWheelEnabler.init(stage);
      }
      
      private function onLoginFLowFinished(param1:Event) : void
      {
         var_53["sso.token"] = _loginFlow.ssoToken;
         var_53["environment.id"] = CommunicationUtils.readSOLString("environment");
         _loginFlow.removeEventListener("LOGIN_FLOW_FINISHED_EVENT",onLoginFLowFinished);
         _loginFlow.dispose();
         _loginFlow = null;
         _loadingScreen = null;
         createLoadingScreen();
         checkPreLoadingStatus();
      }
      
      private function onPreLoadingStatus(param1:HTTPStatusEvent) : void
      {
         _httpStatus = param1.status;
      }
      
      private function onPreLoadingProgress(param1:Event) : void
      {
         checkPreLoadingStatus();
         updateLoadingBarProgress();
         var_147 = true;
      }
      
      private function onPreLoadingCompleted(param1:Event) : void
      {
         try
         {
            var_277 = true;
            checkPreLoadingStatus();
         }
         catch(error:Error)
         {
            trackLoginStep("client.init.swf.error");
            reportCrash("Failed to finalize main swf preloading: undefined runtime: " + (getTimer() - _startTime) / 1000 + "s",9,true,error);
         }
      }
      
      private function onPreLoadingFailed(param1:IOErrorEvent) : void
      {
         var event:IOErrorEvent = param1;
         setTimeout(function():void
         {
            trackLoginStep("client.init.swf.error");
            reportCrash("IO error in main swf preloading: undefined / URL: " + root.loaderInfo.loaderURL + " / HTTP status: " + _httpStatus + " / Loaded: " + root.loaderInfo.bytesLoaded + " of " + root.loaderInfo.bytesTotal + " bytes. Runtime: " + (getTimer() - _startTime) / 1000 + "s",9,true,null);
         },5000);
      }
      
      private function checkPreLoadingStatus() : void
      {
         if(_loginFlow != null)
         {
            return;
         }
         if(var_277 && progress >= 1)
         {
            finalizePreloading();
            return;
         }
      }
      
      private function calculateProgress() : void
      {
         _cachedBytesLoaded = root.loaderInfo.bytesLoaded;
         if(root.loaderInfo.bytesTotal == 0)
         {
            if(!var_931)
            {
               var_123 = 7000000;
               var_931 = true;
               trackLoginStep("client.gzip.environment");
            }
         }
         if(root.loaderInfo.bytesTotal != 0)
         {
            var_123 = root.loaderInfo.bytesTotal;
         }
         if(var_123 < _cachedBytesLoaded || var_277)
         {
            var_123 = _cachedBytesLoaded;
         }
         var_147 = false;
         if(!var_277 && _cachedBytesLoaded == var_123)
         {
            var_147 = true;
            _cachedBytesLoaded *= 0.99;
         }
      }
      
      private function clone(param1:Dictionary) : Dictionary
      {
         var _loc2_:Dictionary = new Dictionary();
         for(var _loc3_ in param1)
         {
            if(param1[_loc3_] is Dictionary)
            {
               _loc2_[_loc3_] = clone(param1[_loc3_]);
            }
            else
            {
               _loc2_[_loc3_] = param1[_loc3_];
            }
         }
         return _loc2_;
      }
      
      private function createNewUserLobbyOrLoadingScreen() : void
      {
         if(!ssoTokenAvailable && var_1409)
         {
            _loginFlow = new LoginFlow(clone(var_53));
            _loginFlow.addEventListener("LOGIN_FLOW_FINISHED_EVENT",onLoginFLowFinished);
            stage.addChild(_loginFlow);
            _loginFlow.init();
            updateLoadingBarProgress();
            return;
         }
         createLoadingScreen();
      }
      
      public function createLoadingScreen() : void
      {
         _loadingScreen = new HabboLoadingScreen(stage.stageWidth,stage.stageHeight,clone(var_53));
         updateLoadingBarProgress();
         stage.addChild(DisplayObject(_loadingScreen));
      }
      
      private function updateLoadingBarProgress() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = NaN;
         if(_loadingScreen != null)
         {
            _loc1_ = progress;
            if(_loc1_ == 0)
            {
               _loc2_ = bytesLoaded / 7000000 * 0.6;
            }
            else
            {
               _loc2_ = _loc1_ * 0.6;
            }
            _loadingScreen.updateLoadingBar(_loc2_);
         }
      }
      
      private function finalizePreloading() : void
      {
         var _loc1_:Class = null;
         var _loc2_:DisplayObject = null;
         trackLoginStep("client.init.swf.loaded");
         root.loaderInfo.removeEventListener("progress",onPreLoadingProgress);
         root.loaderInfo.removeEventListener("httpStatus",onPreLoadingStatus);
         root.loaderInfo.removeEventListener("complete",onPreLoadingCompleted);
         root.loaderInfo.removeEventListener("ioError",onPreLoadingFailed);
         nextFrame();
         _loc1_ = Class(getDefinitionByName("HabboAirMain"));
         if(_loc1_)
         {
            _loc2_ = new _loc1_(_loadingScreen,var_53) as DisplayObject;
            if(_loc2_)
            {
               _loc2_.addEventListener("removed",onMainRemoved,false,0,true);
               addChild(_loc2_);
            }
         }
      }
      
      private function onMainRemoved(param1:Event) : void
      {
         dispose();
      }
      
      private function dispose() : void
      {
         removeEventListener("addedToStage",onAddedToStage);
         if(!_disposed)
         {
            _disposed = true;
            if(_loadingScreen != null)
            {
               _loadingScreen = null;
            }
            if(parent)
            {
               parent.removeChild(this);
            }
         }
      }
      
      public function get progress() : Number
      {
         return this.bytesTotal != 0 ? bytesLoaded / bytesTotal : (var_277 ? 1 : 0);
      }
      
      public function get bytesLoaded() : uint
      {
         if(var_147)
         {
            calculateProgress();
         }
         return _cachedBytesLoaded;
      }
      
      public function get bytesTotal() : uint
      {
         if(var_147)
         {
            calculateProgress();
         }
         return var_123;
      }
      
      private function get ssoTokenAvailable() : Boolean
      {
         var _loc1_:String = "null";
         return _loc1_ != null && _loc1_.length > 0;
      }
   }
}
