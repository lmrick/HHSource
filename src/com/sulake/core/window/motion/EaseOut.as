package com.sulake.core.window.motion
{
   public class EaseOut extends EaseRate
   {
       
      
      public function EaseOut(param1:Interval, param2:Number)
      {
         super(param1,param2);
      }
      
      override friend function update(param1:Number) : void
      {
         var_3074.friend::update(Math.pow(param1,1 / var_3847));
      }
   }
}
