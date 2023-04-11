package com.sulake.habbo.ui.widget.contextmenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.utils.FixedSizeStack;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ContextInfoView implements class_13
   {
      
      protected static const CONTEXT_INFO_DELAY:uint = 3000;
      
      protected static const BUTTON_COLOR_DEFAULT:uint = 4281149991;
      
      protected static const BUTTON_COLOR_HOVER:uint = 4282950861;
      
      protected static const const_1148:uint = 4288230144;
      
      protected static const LINK_COLOR_ACTIONS_DEFAULT:uint = 16777215;
      
      protected static const LINK_COLOR_ACTIONS_HOVER:uint = 9552639;
      
      protected static const const_579:uint = 16777215;
      
      protected static const const_1097:uint = 5789011;
      
      protected static const ICON_COLOR_ENABLED:uint = 13947341;
      
      protected static const ICON_COLOR_DISABLED:uint = 5789011;
      
      private static const const_566:int = 25;
      
      private static const const_963:int = 3;
      
      protected static var var_1726:Boolean = false;
       
      
      protected var _window:class_3151;
      
      protected var var_1854:class_3151;
      
      protected var var_1495:class_3151;
      
      private var _forcedPositionUpdate:Boolean;
      
      protected var var_1429:com.sulake.habbo.ui.widget.contextmenu.class_3167;
      
      protected var _lockPosition:Boolean;
      
      protected var var_3721:FixedSizeStack;
      
      protected var var_3532:int = -1000000;
      
      protected var _disposed:Boolean = false;
      
      private var _forceActivateOnUpdate:Boolean = true;
      
      protected var var_2059:Timer;
      
      protected var var_3606:int = 3000;
      
      protected var var_3006:Boolean;
      
      protected var var_2989:Boolean;
      
      protected var var_2092:Number;
      
      protected var _fadeTime:int;
      
      protected var _fadeLength:int = 500;
      
      protected var var_1566:Boolean;
      
      public function ContextInfoView(param1:com.sulake.habbo.ui.widget.contextmenu.class_3167)
      {
         var_3721 = new FixedSizeStack(25);
         super();
         var_1429 = param1;
         var_1566 = true;
         var_3006 = false;
         var_2989 = false;
      }
      
      public static function setupContext(param1:ContextInfoView) : void
      {
         param1.var_3006 = false;
         param1._fadeLength = 500;
         param1.var_2989 = false;
         param1.var_2092 = 1;
         if(param1.var_1566)
         {
            if(!param1.var_2059)
            {
               param1.var_2059 = new Timer(param1.var_3606,1);
               param1.var_2059.addEventListener("timerComplete",param1.onTimerComplete);
            }
            param1.var_2059.reset();
            param1.var_2059.start();
         }
         param1.updateWindow();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get maximumBlend() : Number
      {
         return 1;
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         var_1495 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1854)
         {
            var_1854.dispose();
            var_1854 = null;
         }
         if(var_2059)
         {
            var_2059.removeEventListener("timerComplete",onTimerComplete);
            var_2059.reset();
            var_2059 = null;
         }
         _disposed = true;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         var_2989 = true;
         _fadeTime = 0;
         hide(true);
      }
      
      protected function addMouseClickListener(param1:class_3127, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener("WME_CLICK",param2);
         }
      }
      
      protected function updateWindow() : void
      {
      }
      
      protected function clickHandler(param1:WindowMouseEvent) : void
      {
         var_1429.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage("RWUAM_START_NAME_CHANGE"));
         var_1429.removeView(this,false);
      }
      
      public function setImageAsset(param1:class_3282, param2:String, param3:Boolean = false) : void
      {
         var _loc6_:Point = null;
         if(!param1 || !var_1429 || true)
         {
            return;
         }
         var _loc5_:BitmapDataAsset;
         if(!(_loc5_ = var_1429.assets.getAssetByName(param2) as BitmapDataAsset))
         {
            return;
         }
         var _loc4_:BitmapData;
         if(!(_loc4_ = _loc5_.content as BitmapData))
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.fillRect(param1.bitmap.rect,0);
         }
         else
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
         if(param3)
         {
            _loc6_ = new Point((param1.bitmap.width - _loc4_.width) / 2,(param1.bitmap.height - _loc4_.height) / 2);
         }
         else
         {
            _loc6_ = new Point(0,0);
         }
         param1.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc6_,null,null,true);
         param1.invalidate();
      }
      
      public function show() : void
      {
         if(var_1495 != null)
         {
            var_1495.visible = true;
            if(!(var_1495.parent is class_3234))
            {
               var_1429.windowManager.getDesktop(0).addChild(var_1495);
            }
            if(_forceActivateOnUpdate)
            {
               var_1495.activate();
            }
         }
      }
      
      public function hide(param1:Boolean) : void
      {
         if(var_1495 != null)
         {
            if(!var_3006 && param1)
            {
               var_3006 = true;
               var_2059.start();
            }
            else
            {
               var_1495.visible = false;
               var_1495.parent = null;
            }
         }
      }
      
      protected function getOffset(param1:Rectangle) : int
      {
         var _loc2_:int = 0;
         return int(_loc2_ - 4);
      }
      
      public function update(param1:Rectangle, param2:Point, param3:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1)
         {
            return;
         }
         if(!var_1495)
         {
            updateWindow();
         }
         if(var_2989)
         {
            _fadeTime += param3;
            var_2092 = (1 - _fadeTime / _fadeLength) * maximumBlend;
         }
         else
         {
            var_2092 = maximumBlend;
         }
         if(var_2092 <= 0)
         {
            var_1429.removeView(this,false);
            return;
         }
         if(!_lockPosition || _forcedPositionUpdate)
         {
            _loc4_ = getOffset(param1);
            _loc5_ = param2.y - param1.top;
            var_3721.addValue(_loc5_);
            if((_loc6_ = var_3721.getMax()) < var_3532 - 3)
            {
               _loc6_ = var_3532 - 3;
            }
            _loc7_ = param2.y - _loc6_;
            var_3532 = _loc6_;
            var_1495.x = param2.x - 0;
            var_1495.y = _loc7_ + _loc4_;
            _forcedPositionUpdate = false;
         }
         var_1495.blend = var_2092;
         show();
      }
      
      protected function onMouseHoverEvent(param1:WindowMouseEvent) : void
      {
         if(param1.type == "WME_OVER")
         {
            _lockPosition = true;
         }
         else if(param1.type == "WME_OUT")
         {
            if(!param1.window.hitTestGlobalPoint(new Point(param1.stageX,param1.stageY)))
            {
               _lockPosition = false;
            }
         }
      }
      
      protected function setMinimized(param1:Boolean) : void
      {
         var_1726 = param1;
         _forcedPositionUpdate = true;
         updateWindow();
      }
      
      protected function getMinimizedView() : class_3151
      {
         var _loc1_:XML = null;
         if(!var_1854)
         {
            _loc1_ = XmlAsset(var_1429.assets.getAssetByName("minimized_menu")).content as XML;
            var_1854 = var_1429.windowManager.buildFromXML(_loc1_,0) as class_3151;
            var_1854.findChildByName("minimize").addEventListener("WME_CLICK",onMaximize);
            var_1854.findChildByName("minimize").addEventListener("WME_OVER",onMinimizeHover);
            var_1854.findChildByName("minimize").addEventListener("WME_OUT",onMinimizeHover);
            var_1854.addEventListener("WME_OVER",onMouseHoverEvent);
            var_1854.addEventListener("WME_OUT",onMouseHoverEvent);
         }
         return var_1854;
      }
      
      private function onMaximize(param1:WindowMouseEvent) : void
      {
         setMinimized(false);
      }
      
      protected function set activeView(param1:class_3151) : void
      {
         if(!param1)
         {
            return;
         }
         if(var_1495)
         {
            var_1495.parent = null;
         }
         var_1495 = param1;
      }
      
      protected function onMinimize(param1:WindowMouseEvent) : void
      {
         setMinimized(true);
      }
      
      protected function onMinimizeHover(param1:WindowMouseEvent) : void
      {
         var _loc3_:class_3127 = null;
         var _loc2_:class_3151 = param1.window as class_3151;
         if(_loc2_)
         {
            _loc3_ = _loc2_.findChildByName("icon");
            if(_loc3_)
            {
               if(param1.type == "WME_OVER")
               {
                  _loc3_.color = 4282950861;
               }
               else
               {
                  _loc3_.color = 16777215;
               }
            }
         }
      }
      
      public function set forceActivateOnUpdate(param1:Boolean) : void
      {
         _forceActivateOnUpdate = param1;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
   }
}
