package com.sulake.habbo.toolbar.extensions.purse
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.utils.class_403;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CurrencyIndicatorBase implements class_3260
   {
      
      protected static const const_842:int = 0;
      
      protected static const const_636:int = 1;
      
      private static const const_658:Number = 0.025;
       
      
      protected var _window:class_3151;
      
      protected var _windowManager:class_1684;
      
      protected var _assets:class_21;
      
      private var _disposed:Boolean = false;
      
      private var var_3121:IStaticBitmapWrapperWindow;
      
      private var var_4059:uint;
      
      private var var_4238:uint;
      
      private var _textElementName:String;
      
      private var var_1756:Vector.<String>;
      
      private var var_4116:uint;
      
      private var var_4229:String = null;
      
      private var _animDirection:uint = 0;
      
      private var _animOffset:int;
      
      private var var_2054:Timer;
      
      private var _overlayTimer:Timer;
      
      private var _overlayPhase:Number;
      
      private var _overlayStartValue:int;
      
      private var _overlayEndValue:int;
      
      public function CurrencyIndicatorBase(param1:class_1684, param2:class_21)
      {
         var_1756 = new Vector.<String>();
         super();
         _window = null;
         _windowManager = param1;
         _assets = param2;
         var_2054 = null;
         _overlayTimer = new Timer(40);
         _overlayTimer.addEventListener("timer",onOverlayTimer);
      }
      
      protected function set bgColorLight(param1:uint) : void
      {
         var_4059 = param1;
      }
      
      protected function set bgColorDark(param1:uint) : void
      {
         var_4238 = param1;
      }
      
      protected function set textElementName(param1:String) : void
      {
         _textElementName = param1;
      }
      
      protected function set iconAnimationDelay(param1:uint) : void
      {
         var_4116 = param1;
      }
      
      protected function set amountZeroText(param1:String) : void
      {
         var_4229 = param1;
      }
      
      protected function get amountZeroText() : String
      {
         return var_4229;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(_overlayTimer != null)
         {
            _overlayTimer.stop();
            _overlayTimer = null;
         }
         if(var_2054)
         {
            var_2054.stop();
            var_2054 = null;
         }
         if(var_1756)
         {
            var_1756 = null;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         _disposed = true;
      }
      
      public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
      }
      
      public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
      }
      
      protected function onContainerClick(param1:WindowMouseEvent) : void
      {
      }
      
      protected function createWindow(param1:String, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:XmlAsset = _assets.getAssetByName(param1) as XmlAsset;
         if(_loc3_)
         {
            _window = _windowManager.buildFromXML(_loc3_.content as XML,1) as class_3151;
            if(_window)
            {
               _window.addEventListener("WME_CLICK",onContainerClick);
               _window.addEventListener("WME_OVER",onContainerMouseOver);
               _window.addEventListener("WME_OUT",onContainerMouseOut);
               _loc4_ = [];
               if(_window.groupChildrenWithTag("ICON",_loc4_,-1) == 1)
               {
                  var_3121 = _loc4_[0] as IStaticBitmapWrapperWindow;
                  setIconBitmap(param2);
               }
            }
         }
      }
      
      protected function animateIcon(param1:int) : void
      {
         _animDirection = param1;
         if(var_3121 && false)
         {
            if(_animDirection == 0)
            {
               _animOffset = 0;
            }
            else
            {
               _animOffset = -1;
            }
            var_2054 = new Timer(var_4116,var_1756.length);
            var_2054.addEventListener("timer",onAnimationTimer);
            var_2054.addEventListener("timerComplete",onAnimationTimerComplete);
            var_2054.start();
            onAnimationTimer(null);
         }
      }
      
      protected function setAmount(param1:int, param2:int = -1) : void
      {
         setText(param1.toString());
      }
      
      protected function setText(param1:String) : void
      {
         if(_window)
         {
            _window.findChildByName(_textElementName).caption = param1;
         }
      }
      
      protected function setTextUnderline(param1:Boolean) : void
      {
         if(_window)
         {
            ITextWindow(_window.findChildByName(_textElementName)).underline = param1;
         }
      }
      
      protected function set iconAnimationSequence(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            var_1756.push(_loc2_);
         }
      }
      
      private function onAnimationTimer(param1:TimerEvent) : void
      {
         if(var_3121 && false)
         {
            setIconBitmap(var_1756[_animOffset]);
            if(_animDirection == 0)
            {
               _animOffset++;
               _animOffset = _animOffset < var_1756.length ? _animOffset : -1;
            }
            else
            {
               _animOffset--;
               _animOffset = _animOffset >= 0 ? _animOffset : 0;
            }
         }
      }
      
      private function onAnimationTimerComplete(param1:TimerEvent) : void
      {
         if(false)
         {
            setIconBitmap(var_1756[0]);
         }
      }
      
      private function setIconBitmap(param1:String) : void
      {
         if(var_3121)
         {
            var_3121.assetUri = param1;
         }
      }
      
      private function onContainerMouseOver(param1:WindowMouseEvent) : void
      {
         _window.findChildByTag("BGCOLOR").color = var_4059;
      }
      
      private function onContainerMouseOut(param1:WindowMouseEvent) : void
      {
         _window.findChildByTag("BGCOLOR").color = var_4238;
      }
      
      protected function animateChange(param1:int, param2:int) : void
      {
         var _loc3_:class_3127 = null;
         _overlayPhase = 0;
         _overlayStartValue = param1;
         _overlayEndValue = param2;
         if(_window != null)
         {
            _loc3_ = _window.findChildByName("change");
            if(_loc3_ != null)
            {
               _loc3_.caption = (param2 > param1 ? "+" : "") + (param2 - param1).toString();
            }
         }
         _overlayTimer.start();
         onOverlayTimer(null);
      }
      
      private function onOverlayTimer(param1:TimerEvent) : void
      {
         var _loc3_:Number = Math.pow(_overlayPhase - 0.5,3) * 4 + 0.5;
         setAmount(int(class_403.lerp(Math.max(0,_overlayPhase * 2 - 1),_overlayStartValue,_overlayEndValue)));
         var _loc2_:class_3151 = _window.findChildByName("change_overlay") as class_3151;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         _loc2_.blend = 1 - Math.abs(0.5 - _loc3_) * 2;
         _loc2_.x = class_403.lerp(_loc3_,0,0 - _loc2_.width);
         _overlayPhase += 0.025;
         if(_overlayPhase >= 1)
         {
            _loc2_.visible = false;
            _overlayTimer.stop();
            setAmount(_overlayEndValue);
         }
      }
   }
}
