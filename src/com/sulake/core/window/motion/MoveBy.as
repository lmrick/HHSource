package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   
   public class MoveBy extends MoveTo
   {
       
      
      public function MoveBy(param1:class_3127, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param3,param4);
      }
      
      override friend function start() : void
      {
         var_3048 = target.x + var_3048;
         var_2939 = target.y + var_2939;
         super.friend::start();
      }
   }
}
