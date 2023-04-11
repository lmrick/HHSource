package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   
   public class MoveTo extends Interval
   {
       
      
      protected var var_3492:Number;
      
      protected var var_3515:Number;
      
      protected var var_3048:Number;
      
      protected var var_2939:Number;
      
      protected var var_2754:Number;
      
      protected var var_2845:Number;
      
      public function MoveTo(param1:class_3127, param2:int, param3:int, param4:int)
      {
         super(param1,param2);
         var_3048 = param3;
         var_2939 = param4;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         var_3492 = target.x;
         var_3515 = target.y;
         var_2754 = var_3048 - var_3492;
         var_2845 = var_2939 - var_3515;
      }
      
      override friend function update(param1:Number) : void
      {
         target.x = var_3492 + var_2754 * param1;
         target.y = var_3515 + var_2845 * param1;
      }
   }
}
