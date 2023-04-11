package com.sulake.core.window.motion
{
   public class Callback extends Motion
   {
       
      
      protected var _callback:Function;
      
      public function Callback(param1:Function)
      {
         _callback = param1;
         super(null);
      }
      
      override public function get running() : Boolean
      {
         return var_86 && _callback != null;
      }
      
      override friend function tick(param1:int) : void
      {
         super.friend::tick(param1);
         if(_callback != null)
         {
            _callback(this);
            _callback = null;
         }
      }
   }
}
