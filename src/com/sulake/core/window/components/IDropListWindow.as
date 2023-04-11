package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.utils.IIterable;
   
   public interface IDropListWindow extends IInteractiveWindow, IIterable
   {
       
      
      function get selection() : int;
      
      function set selection(param1:int) : void;
      
      function get numMenuItems() : int;
      
      function addMenuItem(param1:class_3127) : class_3127;
      
      function addMenuItemAt(param1:class_3127, param2:int) : class_3127;
      
      function getMenuItemIndex(param1:class_3127) : int;
      
      function getMenuItemAt(param1:int) : class_3127;
      
      function removeMenuItem(param1:class_3127) : class_3127;
      
      function removeMenuItemAt(param1:int) : class_3127;
   }
}
