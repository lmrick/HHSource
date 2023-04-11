package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   import flash.utils.getTimer;
   
   public class Interval extends Motion
   {
       
      
      private var var_3859:int;
      
      private var _duration:int;
      
      public function Interval(param1:class_3127, param2:int)
      {
         super(param1);
         var_1589 = false;
         _duration = param2;
      }
      
      public function get duration() : int
      {
         return _duration;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         var_1589 = false;
         var_3859 = getTimer();
      }
      
      final override friend function tick(param1:int) : void
      {
         var _loc2_:Number = (param1 - var_3859) / _duration;
         if(_loc2_ < 1)
         {
            friend::update(_loc2_);
         }
         else
         {
            friend::update(1);
            var_1589 = true;
         }
      }
   }
}
