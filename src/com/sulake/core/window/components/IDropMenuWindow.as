package com.sulake.core.window.components
{
   public interface IDropMenuWindow extends IInteractiveWindow
   {
       
      
      function get selection() : int;
      
      function set selection(param1:int) : void;
      
      function get numMenuItems() : int;
      
      function populate(param1:Array) : void;
      
      function populateWithVector(param1:Vector.<String>) : void;
      
      function enumerateSelection() : Array;
   }
}
