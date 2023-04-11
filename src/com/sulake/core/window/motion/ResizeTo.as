package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   
   public class ResizeTo extends Interval
   {
       
      
      protected var var_3685:Number;
      
      protected var var_3482:Number;
      
      protected var var_3973:Number;
      
      protected var var_4196:Number;
      
      protected var var_3872:Number;
      
      protected var var_3922:Number;
      
      public function ResizeTo(param1:class_3127, param2:int, param3:int, param4:int)
      {
         super(param1,param2);
         var_3973 = param3;
         var_4196 = param4;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         var_3685 = target.width;
         var_3482 = target.height;
         var_3872 = var_3973 - var_3685;
         var_3922 = var_4196 - var_3482;
      }
      
      override friend function update(param1:Number) : void
      {
         target.width = var_3685 + var_3872 * param1;
         target.height = var_3482 + var_3922 * param1;
      }
   }
}
