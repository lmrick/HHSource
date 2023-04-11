package com.sulake.core.window.services
{
   import com.sulake.core.window.class_3127;
   
   public interface IGestureAgentService
   {
      function dispose() : void;
      
      function begin(param1:class_3127, param2:Function, param3:uint, param4:int, param5:int) : class_3127;
      
      function end(param1:class_3127) : class_3127;
   }
}
