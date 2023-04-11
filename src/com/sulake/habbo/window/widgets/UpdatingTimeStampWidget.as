package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class UpdatingTimeStampWidget implements class_3368
   {
      
      public static const TYPE:String = "updating_timestamp";
      
      private static const UPDATE_TIMER:Timer = new Timer(60000);
      
      {
         UPDATE_TIMER.start();
      }
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:ILabelWindow;
      
      private var var_912:Number;
      
      public function UpdatingTimeStampWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.create("",12,100,16,new Rectangle()) as ILabelWindow;
         var_464.textColor = 5592405;
         var_1547.rootWindow = var_464;
         UPDATE_TIMER.addEventListener("timer",onTimerTick);
         reset();
      }
      
      public function reset() : void
      {
         var_912 = new Date().getTime();
         onTimerTick();
      }
      
      public function get properties() : Array
      {
         return [];
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function set align(param1:String) : void
      {
         var_464.defaultTextFormat.align = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            UPDATE_TIMER.removeEventListener("timer",onTimerTick);
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            if(var_1547 != null)
            {
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      public function get timeStamp() : Number
      {
         return var_912;
      }
      
      public function set timeStamp(param1:Number) : void
      {
         var_912 = param1;
         onTimerTick();
      }
      
      private function onTimerTick(param1:TimerEvent = null) : void
      {
         if(_disposed || !var_464 || !_windowManager || true)
         {
            return;
         }
         var_464.caption = FriendlyTime.getFriendlyTime(_windowManager.localization,(new Date().getTime() - Math.abs(var_912)) / 1000,".ago",1);
      }
   }
}
