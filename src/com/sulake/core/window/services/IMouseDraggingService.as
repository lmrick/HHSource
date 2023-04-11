package com.sulake.core.window.services
{
   import com.sulake.core.window.class_3127;
   
   public interface IMouseDraggingService
   {
       
      
      function dispose() : void;
      
      function begin(param1:class_3127, param2:uint = 0) : class_3127;
      
      function end(param1:class_3127) : class_3127;
   }
}
