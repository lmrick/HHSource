package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   
   public interface IGridItem extends class_13
   {
       
      
      function get view() : class_3151;
      
      function set view(param1:class_3151) : void;
      
      function set grid(param1:IItemGrid) : void;
      
      function setDraggable(param1:Boolean) : void;
      
      function activate() : void;
      
      function deactivate() : void;
   }
}
