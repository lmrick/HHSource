package com.sulake.core.window.motion
{
   import com.sulake.core.window.class_3127;
   
   public class Motion
   {
       
      
      protected var var_319:class_3127;
      
      protected var var_86:Boolean;
      
      protected var var_1589:Boolean = true;
      
      protected var var_1290:String;
      
      public function Motion(param1:class_3127)
      {
         super();
         var_319 = param1;
      }
      
      public function get running() : Boolean
      {
         return var_86 && var_319;
      }
      
      public function get complete() : Boolean
      {
         return var_1589;
      }
      
      public function set target(param1:class_3127) : void
      {
         var_319 = param1;
      }
      
      public function get target() : class_3127
      {
         return var_319;
      }
      
      public function set tag(param1:String) : void
      {
         var_1290 = param1;
      }
      
      public function get tag() : String
      {
         return var_1290;
      }
      
      friend function start() : void
      {
         var_86 = true;
      }
      
      friend function update(param1:Number) : void
      {
      }
      
      friend function stop() : void
      {
         var_319 = null;
         var_86 = false;
      }
      
      friend function tick(param1:int) : void
      {
      }
   }
}
