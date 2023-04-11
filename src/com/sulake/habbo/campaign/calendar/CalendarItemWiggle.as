package com.sulake.habbo.campaign.calendar
{
   import com.sulake.core.window.class_3127;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CalendarItemWiggle
   {
      
      private static const TIMER_INTERVAL:int = 80;
      
      private static const const_1170:int = 10;
      
      private static const const_559:int = 40;
      
      private static const const_793:int = 7;
       
      
      private var _window:class_3127;
      
      private var var_1635:Timer;
      
      private var _direction:int;
      
      private var var_1186:int;
      
      private var var_2434:int;
      
      public function CalendarItemWiggle(param1:class_3127)
      {
         super();
        
         if(!param1)
         {
            return;
         }
     
         _window = param1;
         var_2434 = param1.y;
         param1.y -= 10;
         _direction = 1;
         var_1635 = new Timer(80);
         var_1635.addEventListener("timer",onTimerEvent);
         var_1635.start();
      }
      
      private function onTimerEvent(param1:TimerEvent) : void
      {
        
         if(!_window)
         {
            dispose();
         }
       
         var _loc3_:Number = 10 * ((7 - var_1186) / 7);
         var _loc4_:Number = Math.abs(0 - var_2434) / _loc3_;
         var _loc2_:Number = Math.max(2,Math.sin(_loc4_) * 40) * _direction;
         _window.y += _loc2_;
       
         if(_direction > 0)
         {
            if(_window.y > var_2434)
            {
               _direction *= -1;
               _window.y = var_2434;
               var_1186++;
            }
         }
   
         else if(_window.y <= var_2434 - _loc3_)
         {
            _direction *= -1;
            _window.y = var_2434 - _loc3_;
            var_1186++;
         }
     
         if(var_1186 >= 7)
         {
            dispose();
         }
      }
      
      private function dispose() : void
      {
         _window.y = var_2434;
         _window = null;
         var_1635.reset();
         var_1635 = null;
      }
   }
}
