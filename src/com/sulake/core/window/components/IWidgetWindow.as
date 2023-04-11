package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3197;
   import com.sulake.core.window.utils.IIterable;
   
   public interface IWidgetWindow extends class_3127, IIterable
   {
       
      
      function get widget() : class_3197;
      
      function get rootWindow() : class_3127;
      
      function set rootWindow(param1:class_3127) : void;
   }
}
