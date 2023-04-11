package com.sulake.core.window.components
{
   import com.sulake.core.runtime.class_13;
   
   public interface IFocusWindow extends class_13
   {
       
      
      function get focused() : Boolean;
      
      function focus() : Boolean;
      
      function unfocus() : Boolean;
   }
}
