package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   
   public class JumpBy extends Interval
   {
       
      
      protected var var_3492:int;
      
      protected var var_3515:int;
      
      protected var var_2754:Number;
      
      protected var var_2845:Number;
      
      protected var var_47:Number;
      
      protected var var_4096:int;
      
      public function JumpBy(param1:class_3127, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super(param1,param2);
         var_2754 = param3;
         var_2845 = param4;
         var_47 = -param5;
         var_4096 = param6;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         var_3492 = target.x;
         var_3515 = target.y;
      }
      
      override friend function update(param1:Number) : void
      {
         super.friend::update(param1);
         target.x = var_3492 + var_2754 * param1;
         target.y = var_3515 + var_47 * Math.abs(Math.sin(param1 * 3.141592653589793 * var_4096)) + var_2845 * param1;
      }
   }
}
