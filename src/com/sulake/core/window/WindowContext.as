package com.sulake.core.window
{
   import com.sulake.core.assets.IResourceManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.localization.class_17;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.class_3137;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.class_3337;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements class_3178, class_13, class_41
   {
      
      public static const INPUT_MODE_MOUSE:uint = 0;
      
      public static const INPUT_MODE_TOUCH:uint = 1;
      
      public static const ERROR_UNKNOWN:int = 0;
      
      public static const ERROR_INVALID_WINDOW:int = 1;
      
      public static const ERROR_WINDOW_NOT_FOUND:int = 2;
      
      public static const ERROR_WINDOW_ALREADY_EXISTS:int = 3;
      
      public static const ERROR_UNKNOWN_WINDOW_TYPE:int = 4;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static var inputEventQueue:IEventQueue;
      
      private static var inputEventProcessor:IEventProcessor;
      
      private static var inputModeFlag:uint = 0;
      
      private static var var_1612:class_3137;
      
      private static var stage:Stage;
       
      
      public var inputEventTrackers:Vector.<com.sulake.core.window.IInputEventTracker>;
      
      private var _linkEventTrackers:Vector.<ILinkEventTracker>;
      
      private var var_4031:EventProcessorState;
      
      protected var _localization:class_17;
      
      protected var _rootDisplayObject:DisplayObjectContainer;
      
      protected var _throwErrors:Boolean = true;
      
      protected var _lastError:Error;
      
      protected var var_3410:int = -1;
      
      protected var var_2822:IInternalWindowServices;
      
      protected var var_2920:class_3337;
      
      protected var var_3223:com.sulake.core.window.class_1682;
      
      protected var var_3278:com.sulake.core.window.class_1681;
      
      protected var var_2600:IResourceManager;
      
      protected var var_1537:class_3234;
      
      protected var var_3062:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_1682:Boolean = false;
      
      private var _rendering:Boolean = false;
      
      private var _name:String;
      
      private var _configuration:class_19;
      
      public function WindowContext(param1:String, param2:class_3137, param3:com.sulake.core.window.class_1682, param4:com.sulake.core.window.class_1681, param5:IResourceManager, param6:class_17, param7:class_19, param8:DisplayObjectContainer, param9:Rectangle, param10:Vector.<ILinkEventTracker>)
      {
         super();
         _name = param1;
         var_1612 = param2;
         _localization = param6;
         _configuration = param7;
         _rootDisplayObject = param8;
         var_2822 = new ServiceManager(this,param8);
         var_3223 = param3;
         var_3278 = param4;
         var_2600 = param5;
         var_2920 = new WindowParser(this);
         inputEventTrackers = new Vector.<com.sulake.core.window.IInputEventTracker>(0);
         _linkEventTrackers = param10;
         if(!stage)
         {
            if(_rootDisplayObject is Stage)
            {
               stage = _rootDisplayObject as Stage;
            }
            else if(false)
            {
               stage = _rootDisplayObject.stage;
            }
         }
         Classes.init();
         if(param9 == null)
         {
            param9 = new Rectangle(0,0,800,600);
         }
         var_1537 = new DesktopController("_CONTEXT_DESKTOP_" + _name,this,param9);
         var_1537.limits.maxWidth = param9.width;
         var_1537.limits.maxHeight = param9.height;
         _rootDisplayObject.addChild(var_1537.getDisplayObject());
         _rootDisplayObject.doubleClickEnabled = true;
         _rootDisplayObject.addEventListener("resize",stageResizedHandler);
         var_4031 = new EventProcessorState(var_1612,var_1537,var_1537,null,inputEventTrackers);
         inputMode = 0;
         var_3062 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return inputModeFlag;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         if(inputEventQueue)
         {
            if(inputEventQueue is class_13)
            {
               class_13(inputEventQueue).dispose();
            }
         }
         if(inputEventProcessor)
         {
            if(inputEventProcessor is class_13)
            {
               class_13(inputEventProcessor).dispose();
            }
         }
         switch(param1)
         {
            case INPUT_MODE_MOUSE:
               inputEventQueue = new MouseEventQueue(stage);
               inputEventProcessor = new MouseEventProcessor();
               try
               {
                  break;
               }
               catch(e:Error)
               {
                  break;
               }
               break;
            case 1:
               inputEventQueue = new TabletEventQueue(stage);
               inputEventProcessor = new TabletEventProcessor();
               try
               {
                  break;
               }
               catch(e:Error)
               {
                  break;
               }
               break;
            default:
               inputMode = INPUT_MODE_MOUSE;
               throw new Error("Unknown input mode " + param1);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _rootDisplayObject.removeEventListener("resize",stageResizedHandler);
            _rootDisplayObject.removeChild(IGraphicContextHost(var_1537).getGraphicContext(true) as DisplayObject);
            var_1537.destroy();
            var_1537 = null;
            var_3062.destroy();
            var_3062 = null;
            if(var_2822 is class_13)
            {
               class_13(var_2822).dispose();
            }
            var_2822 = null;
            var_2920.dispose();
            var_2920 = null;
            var_1612 = null;
            _localization = null;
            _rootDisplayObject = null;
            var_3223 = null;
            var_3278 = null;
            var_2600 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return _lastError;
      }
      
      public function getLastErrorCode() : int
      {
         return var_3410;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         _lastError = param2;
         var_3410 = param1;
         if(_throwErrors)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         _lastError = null;
         var_3410 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2822;
      }
      
      public function getWindowParser() : class_3337
      {
         return var_2920;
      }
      
      public function getWindowFactory() : com.sulake.core.window.class_1682
      {
         return var_3223;
      }
      
      public function getDesktopWindow() : class_3234
      {
         return var_1537;
      }
      
      public function findWindowByName(param1:String) : class_3127
      {
         return var_1537.findChildByName(param1);
      }
      
      public function findWindowByTag(param1:String) : class_3127
      {
         return var_1537.findChildByTag(param1);
      }
      
      public function groupChildrenWithTag(param1:String, param2:Array, param3:int = 0) : uint
      {
         return var_1537.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function registerLocalizationListener(param1:String, param2:class_3127) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:class_3127) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:class_3127, param9:uint, param10:Array = null, param11:String = "", param12:Array = null) : class_3127
      {
         var _loc14_:class_3127 = null;
         var _loc13_:Class;
         if((_loc13_ = Classes.getWindowClassByType(param3)) == null)
         {
            handleError(4,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 16)
            {
               param8 = var_3062;
            }
         }
         (_loc14_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : var_1537,param7,param10,param12,param9)).dynamicStyle = param11;
         if(param2 && param2.length)
         {
            _loc14_.caption = param2;
         }
         return _loc14_;
      }
      
      public function destroy(param1:class_3127) : Boolean
      {
         if(param1 == var_1537)
         {
            var_1537 = null;
         }
         if(param1.state != 1073741824)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:class_3127, param2:Rectangle, param3:uint) : void
      {
         if(!disposed)
         {
            var_1612.addToRenderQueue(param1,param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Error = null;
         var_1682 = true;
         if(_lastError)
         {
            _loc2_ = _lastError;
            _lastError = null;
            throw _loc2_;
         }
         inputEventProcessor.process(var_4031,inputEventQueue);
         var_1682 = false;
      }
      
      public function render(param1:uint) : void
      {
         _rendering = true;
         var_1612.render();
         _rendering = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(var_1537 != null && true)
         {
            if(_rootDisplayObject is Stage)
            {
               _loc2_ = int(Stage(_rootDisplayObject).stageWidth);
               _loc3_ = int(Stage(_rootDisplayObject).stageHeight);
            }
            else
            {
               _loc2_ = 0;
               _loc3_ = 0;
            }
            if(_loc2_ >= 10 && _loc3_ >= 10)
            {
               var_1537.limits.maxWidth = _loc2_;
               var_1537.limits.maxHeight = _loc3_;
               var_1537.width = _loc2_;
               var_1537.height = _loc3_;
            }
         }
      }
      
      public function addMouseEventTracker(param1:com.sulake.core.window.IInputEventTracker) : void
      {
         if(inputEventTrackers.indexOf(param1) < 0)
         {
            inputEventTrackers.push(param1);
         }
      }
      
      public function removeMouseEventTracker(param1:com.sulake.core.window.IInputEventTracker) : void
      {
         var _loc2_:int = inputEventTrackers.indexOf(param1);
         if(_loc2_ > -1)
         {
            inputEventTrackers.splice(_loc2_,1);
         }
      }
      
      public function getResourceManager() : IResourceManager
      {
         return var_2600;
      }
      
      public function getWidgetFactory() : com.sulake.core.window.class_1681
      {
         return var_3278;
      }
      
      public function get linkEventTrackers() : Vector.<ILinkEventTracker>
      {
         return _linkEventTrackers;
      }
   }
}
