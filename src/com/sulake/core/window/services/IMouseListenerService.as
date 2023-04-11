package com.sulake.core.window.services
{
   import com.sulake.core.window.class_3127;
   
   public interface IMouseListenerService
   {
       
      
      function get eventTypes() : Array;
      
      function get areaLimit() : uint;
      
      function set areaLimit(param1:uint) : void;
      
      function dispose() : void;
      
      function begin(param1:class_3127, param2:uint = 0) : class_3127;
      
      function end(param1:class_3127) : class_3127;
   }
}
