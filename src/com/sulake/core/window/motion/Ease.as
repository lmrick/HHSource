package com.sulake.core.window.motion
{
   public class Ease extends com.sulake.core.window.motion.Interval
   {
       
      
      protected var var_3074:com.sulake.core.window.motion.Interval;
      
      public function Ease(param1:com.sulake.core.window.motion.Interval)
      {
         super(param1.target,param1.duration);
         var_3074 = param1;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         var_3074.friend::start();
      }
      
      override friend function update(param1:Number) : void
      {
         super.friend::update(param1);
         var_3074.friend::update(param1);
      }
      
      override friend function stop() : void
      {
         super.friend::stop();
         var_3074.friend::stop();
      }
   }
}
