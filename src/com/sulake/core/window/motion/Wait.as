package com.sulake.core.window.motion
{
   import flash.utils.getTimer;
   
   public class Wait extends Motion
   {
       
      
      private var var_3859:int;
      
      private var var_4175:int;
      
      public function Wait(param1:int)
      {
         super(null);
         var_4175 = param1;
      }
      
      override public function get running() : Boolean
      {
         return var_86;
      }
      
      override friend function start() : void
      {
         super.friend::start();
         var_1589 = false;
         var_3859 = getTimer();
      }
      
      override friend function tick(param1:int) : void
      {
         var_1589 = param1 - var_3859 >= var_4175;
         if(var_1589)
         {
            friend::stop();
         }
         super.friend::tick(param1);
      }
   }
}
