package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   
   public class Dispose extends Motion
   {
       
      
      public function Dispose(param1:class_3127)
      {
         super(param1);
      }
      
      override friend function tick(param1:int) : void
      {
         super.friend::tick(param1);
         if(target)
         {
            target.dispose();
            target = null;
         }
      }
   }
}
