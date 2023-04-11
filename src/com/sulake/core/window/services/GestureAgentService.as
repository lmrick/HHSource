package com.sulake.core.window.services
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GestureAgentService implements class_3452, class_13
   {
       
      
      private var _disposed:Boolean = false;
      
      protected var var_2312:Boolean;
      
      protected var _window:class_3127;
      
      protected var var_1635:Timer;
      
      protected var var_423:uint = 0;
      
      protected var _callback:Function;
      
      protected var var_2754:int;
      
      protected var var_2845:int;
      
      public function GestureAgentService()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         end(_window);
         _disposed = true;
      }
      
      public function begin(param1:class_3127, param2:Function, param3:uint, param4:int, param5:int) : class_3127
      {
         var_423 = param3;
         var _loc6_:class_3127 = _window;
         if(_window != null)
         {
            end(_window);
         }
         if(param1 && !param1.disposed)
         {
            _window = param1;
            _window.addEventListener("WE_DESTROYED",clientWindowDestroyed);
            _callback = param2;
            var_2312 = true;
            var_2754 = param4;
            var_2845 = param5;
            var_1635 = new Timer(40,0);
            var_1635.addEventListener("timer",operate);
            var_1635.start();
         }
         return _loc6_;
      }
      
      protected function operate(param1:TimerEvent) : void
      {
         var_2754 *= 0.75;
         var_2845 *= 0.75;
         if(Math.abs(var_2754) <= 1 && Math.abs(var_2845) <= 1)
         {
            end(_window);
         }
         else if(_callback != null)
         {
            _callback(var_2754,var_2845);
         }
      }
      
      public function end(param1:class_3127) : class_3127
      {
         var _loc2_:class_3127 = _window;
         if(var_1635)
         {
            var_1635.stop();
            var_1635.removeEventListener("timer",operate);
            var_1635 = null;
         }
         if(var_2312)
         {
            if(_window == param1)
            {
               if(true)
               {
                  _window.removeEventListener("WE_DESTROYED",clientWindowDestroyed);
               }
               _window = null;
               var_2312 = false;
            }
         }
         return _loc2_;
      }
      
      private function clientWindowDestroyed(param1:class_3134) : void
      {
         end(_window);
      }
   }
}
