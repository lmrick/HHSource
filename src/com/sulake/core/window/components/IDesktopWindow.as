package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import flash.geom.Point;
   
   public interface IDesktopWindow extends class_3151, class_3207
   {
       
      
      function get mouseX() : int;
      
      function get mouseY() : int;
      
      function getActiveWindow() : class_3127;
      
      function setActiveWindow(param1:class_3127) : class_3127;
      
      function groupParameterFilteredChildrenUnderPoint(param1:Point, param2:Array, param3:uint = 0) : void;
   }
}
