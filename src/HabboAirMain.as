package
{
   import com.sulake.air.FileProxy;
   import com.sulake.air.NativeApplicationProxy;
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_35;
   import com.sulake.core.runtime.class_491;
   import com.sulake.core.runtime.class_803;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.utils.class_474;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDRoomEngine;
   import flash.desktop.NativeApplication;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setInterval;

   public class HabboAirMain extends Sprite
   {
      
      public static const CORE_RATIO:Number = 0.6;
      
      private static const INIT_STEPS:int = 3;
       
      
      private var _core:ICore;
      
      private var _loadingScreen:IHabboLoadingScreen;
      
      private var _totalSteps:int = 3;
      
      private var _loadedFiles:int = 0;
      
      private var _completedInitSteps:int = 0;
      
      private var roomEngineReady:Boolean = false;
      
      private var coreRunning:Boolean = false;
      
      private var var_53:Dictionary;
      
      private var _prepareCoreOnNextFrame:Boolean;
      
      public function HabboAirMain(param1:IHabboLoadingScreen, param2:Dictionary)
      {
         super();
         _loadingScreen = param1;
         var_53 = param2;
         addEventListener("addedToStage",onAddedToStage);
         addEventListener("exitFrame",onExitFrame);
         class_14.log(getQualifiedClassName(class_79) + " version: " + class_79.version);
      }
      
      private function dispose() : void
      {
         removeEventListener("progress",onProgressEvent);
         removeEventListener("complete",onCompleteEvent);
         removeEventListener("addedToStage",onAddedToStage);
         removeEventListener("exitFrame",onExitFrame);
         if(_loadingScreen)
         {
            _loadingScreen.dispose();
            _loadingScreen = null;
         }
         if(_core != null)
         {
            _core.events.removeEventListener("COMPONENT_EVENT_RUNNING",onCoreRunning);
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      public function unloading() : void
      {
         try
         {
            if(_core)
            {
               ErrorReportStorage.addDebugData("Unload","Client unloading started");
               _core.events.dispatchEvent(new Event("unload"));
            }
         }
         catch(error:Error)
         {
         }
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         var _loc3_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc5_:Namespace = _loc3_.namespace();
         var _loc2_:String = _loc3_._loc5_::copyright;
         var _loc4_:String = _loc3_._loc5_::versionLabel;
         var _loc6_:String = _loc3_._loc5_::versionNumber;
         class_14.log("AIR Runtime version: " + NativeApplication.nativeApplication.runtimeVersion);
         class_14.log("Application ID: " + NativeApplication.nativeApplication.applicationID);
         class_14.log("Copyright: " + _loc2_);
         class_14.log("Version: " + _loc4_);
         class_14.log("VersionNumber: " + _loc6_);
         try
         {
            init();
         }
         catch(error:Error)
         {
            HabboAir.trackLoginStep("client.init.core.fail");
            HabboAir.reportCrash("Failed to prepare the core: undefined",10,true,error);
            class_79.dispose();
         }
      }
      
      private function init() : void
      {
         var _loc2_:String = Capabilities.version.toLowerCase();
         if(_loc2_.indexOf("win") > -1 || _loc2_.indexOf("mac") > -1)
         {
         }
         _prepareCoreOnNextFrame = true;
      }
      
      protected function onExitFrame(param1:Event = null) : void
      {
         if(_prepareCoreOnNextFrame)
         {
            _prepareCoreOnNextFrame = false;
            prepareCore();
            return;
         }
         if(roomEngineReady && coreRunning)
         {
            dispose();
         }
      }
      
      private function prepareCore() : void
      {
         var _loc1_:class_491 = null;
         var _loc2_:XML = null;
         try
         {
            _loc1_ = Capabilities.playerType != "StandAlone" ? new HabboCoreErrorReporter() : null;
            _core = class_79.instantiate(stage,1,_loc1_,var_53);
            _core.events.addEventListener("COMPONENT_EVENT_ERROR",onCoreError);
            _core.events.addEventListener("COMPONENT_EVENT_REBOOT",onCoreReboot);
            _core.prepareComponent(HabboTrackingLib);
            addEventListener("progress",onProgressEvent);
            addEventListener("complete",onCompleteEvent);
           
            _loc2_ = <config>
					<asset-libraries>
						<library url="hh_human_body.swf"/>
						<library url="hh_human_item.swf"/>
					</asset-libraries>
					<service-libraries/>
					<component-libraries/>
				</config>;
          
            _loc2_ = new XML();
            _core.readConfigDocument(_loc2_,this);
            (_core as class_803).fileProxy = new FileProxy();
           
            if(false)
            {
               class_474.nativeApplicationProxy.dispose();
            }
            class_474.nativeApplicationProxy = new NativeApplicationProxy();
            _totalSteps = _core.getNumberOfFilesPending() + _core.getNumberOfFilesLoaded() + 3;
            _core.prepareComponent(CoreCommunicationFrameworkLib);
            _core.prepareComponent(HabboRoomObjectLogicLib);
            _core.prepareComponent(HabboRoomObjectVisualizationLib);
            _core.prepareComponent(RoomManagerLib);
            _core.prepareComponent(RoomSpriteRendererLib);
            _core.prepareComponent(HabboRoomSessionManagerLib);
            _core.prepareComponent(HabboAvatarRenderLib);
            _core.prepareComponent(HabboSessionDataManagerLib);
            _core.prepareComponent(HabboConfigurationCom);
            _core.prepareComponent(HabboLocalizationCom);
            _core.prepareComponent(HabboWindowManagerCom);
            _core.prepareComponent(HabboCommunicationCom);
            _core.prepareComponent(HabboCommunicationDemoCom);
            _core.prepareComponent(HabboNavigatorCom);
            _core.prepareComponent(HabboFriendListCom);
            _core.prepareComponent(HabboMessengerCom);
            _core.prepareComponent(HabboInventoryCom);
            _core.prepareComponent(HabboToolbarCom);
            _core.prepareComponent(HabboCatalogCom);
            _core.prepareComponent(HabboRoomEngineCom);
            _core.prepareComponent(HabboRoomUICom);
            _core.prepareComponent(HabboAvatarEditorCom);
            _core.prepareComponent(HabboNotificationsCom);
            _core.prepareComponent(HabboHelpCom);
            _core.prepareComponent(HabboAdManagerCom);
            _core.prepareComponent(HabboModerationCom);
            _core.prepareComponent(HabboUserDefinedRoomEventsCom);
            _core.prepareComponent(HabboSoundManagerFlash10Com);
            _core.prepareComponent(HabboQuestEngineCom);
            _core.prepareComponent(HabboFriendBarCom);
            _core.prepareComponent(HabboGroupsCom);
            _core.prepareComponent(HabboGamesCom);
            _core.prepareComponent(HabboFreeFlowChatCom);
            _core.prepareComponent(HabboNewNavigatorCom);
            addInitializationProgressListeners();
         }
         catch(error:Error)
         {
            class_79.dispose();
         }
      }
      
      private function updateProgressBar() : void
      {
         var _loc1_:Number = NaN;
         if(_loadingScreen != null)
         {
            _loc1_ = 0.6 + (_completedInitSteps + _loadedFiles) / _totalSteps * 0.4;
            _loadingScreen.updateLoadingBar(_loc1_);
         }
      }
      
      private function onProgressEvent(param1:ProgressEvent) : void
      {
         _loadedFiles = _core.getNumberOfFilesLoaded();
         updateProgressBar();
      }
      
      private function onCompleteEvent(param1:Event) : void
      {
         removeEventListener("progress",onProgressEvent);
         removeEventListener("complete",onCompleteEvent);
         initializeCore();
      }
      
      private function initializeCore() : void
      {
         HabboAir.trackLoginStep("client.init.core.init");
         try
         {
            _core.initialize();
            if(false)
            {
               ExternalInterface.addCallback("unloading",unloading);
            }
         }
         catch(error:Error)
         {
            HabboAir.trackLoginStep("client.init.core.fail");
            class_79.crash("Failed to initialize the core: undefined",10,error);
         }
      }
      
      public function onCoreError(param1:Event) : void
      {
         class_14.log("onCoreError " + param1.type);
      }
      
      private function onCoreReboot(param1:Event) : void
      {
         class_14.log("Reboot application! undefined",System.totalMemory,System.totalMemoryNumber);
         _core.events.removeEventListener("COMPONENT_EVENT_ERROR",onCoreError);
         _core.events.removeEventListener("COMPONENT_EVENT_REBOOT",onCoreReboot);
         class_79.dispose();
         _core = null;
         class_14.log("Application ready for restart! undefined",System.totalMemory,System.totalMemoryNumber);
         NativeApplication.nativeApplication.exit(1);
      }
      
      private function simpleQueueInterface(param1:IID, param2:Function) : void
      {
         var _loc3_:Object = _core.queueInterface(param1,param2);
         if(_loc3_ != null)
         {
            param2(param1,_loc3_);
         }
      }
      
      private function addInitializationProgressListeners() : void
      {
         simpleQueueInterface(new IIDHabboLocalizationManager(),function(param1:IID, param2:class_20):void
         {
            param2.events.addEventListener("complete",onLocalizationComplete);
         });
         simpleQueueInterface(new IIDHabboConfigurationManager(),onConfigurationComplete);
         simpleQueueInterface(new IIDRoomEngine(),function(param1:IID, param2:class_20):void
         {
            param2.events.addEventListener("REE_ENGINE_INITIALIZED",onRoomEngineReady);
         });
         _core.events.addEventListener("COMPONENT_EVENT_RUNNING",onCoreRunning);
      }
      
      private function onLocalizationComplete(param1:Event) : void
      {
         HabboAir.trackLoginStep("client.init.localization.loaded");
         _completedInitSteps++;
         updateProgressBar();
      }
      
      private function onConfigurationComplete(param1:IID, param2:class_20) : void
      {
         HabboAir.trackLoginStep("client.init.config.loaded");
         _completedInitSteps++;
         updateProgressBar();
      }
      
      private function onRoomEngineReady(param1:Event) : void
      {
         roomEngineReady = true;
         HabboAir.trackLoginStep("client.init.room.ready");
         if(_core.getInteger("spaweb",0) == 1)
         {
            startSendingHeartBeat();
         }
      }
      
      private function startSendingHeartBeat() : void
      {
         sendHeartBeat();
         setInterval(sendHeartBeat,10000);
      }
      
      private function sendHeartBeat() : void
      {
         HabboWebTools.sendHeartBeat();
      }
      
      private function onCoreRunning(param1:Event) : void
      {
         coreRunning = true;
         HabboAir.trackLoginStep("client.init.core.running");
         _completedInitSteps++;
         updateProgressBar();
      }
   }
}

import com.sulake.core.runtime.class_15;
import com.sulake.core.runtime.class_491;

class HabboCoreErrorReporter implements class_491
{
    
   
   private var _logger:class_15;
   
   public function HabboCoreErrorReporter()
   {
      super();
   }
   
   public function logError(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
   {
      HabboAir.reportCrash(param1,param3,param2,param4,_logger);
   }
   
   public function set errorLogger(param1:class_15) : void
   {
      _logger = param1;
   }
}
