package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3127;
   
   public interface ISelectableWindow extends class_3127
   {
       
      
      function get selector() : ISelectorWindow;
      
      function get isSelected() : Boolean;
      
      function set isSelected(param1:Boolean) : void;
      
      function select() : Boolean;
      
      function unselect() : Boolean;
   }
}
