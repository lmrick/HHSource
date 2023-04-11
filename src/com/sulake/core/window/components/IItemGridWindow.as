package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.utils.IIterable;
   
   public interface IItemGridWindow extends class_3127, IScrollableWindow, IIterable
   {
       
      
      function get spacing() : int;
      
      function set spacing(param1:int) : void;
      
      function set verticalSpacing(param1:int) : void;
      
      function get scaleToFitItems() : Boolean;
      
      function set scaleToFitItems(param1:Boolean) : void;
      
      function get autoArrangeItems() : Boolean;
      
      function set autoArrangeItems(param1:Boolean) : void;
      
      function get resizeOnItemUpdate() : Boolean;
      
      function set resizeOnItemUpdate(param1:Boolean) : void;
      
      function get numColumns() : uint;
      
      function get numRows() : uint;
      
      function get numGridItems() : uint;
      
      function addGridItem(param1:class_3127) : class_3127;
      
      function addGridItemAt(param1:class_3127, param2:uint) : class_3127;
      
      function getGridItemAt(param1:uint) : class_3127;
      
      function getGridItemByID(param1:uint) : class_3127;
      
      function getGridItemByName(param1:String) : class_3127;
      
      function getGridItemByTag(param1:String) : class_3127;
      
      function getGridItemIndex(param1:class_3127) : int;
      
      function removeGridItem(param1:class_3127) : class_3127;
      
      function removeGridItemAt(param1:int) : class_3127;
      
      function setGridItemIndex(param1:class_3127, param2:int) : void;
      
      function swapGridItems(param1:class_3127, param2:class_3127) : void;
      
      function swapGridItemsAt(param1:int, param2:int) : void;
      
      function removeGridItems() : void;
      
      function destroyGridItems() : void;
      
      function set shouldRebuildGridOnResize(param1:Boolean) : void;
      
      function get shouldRebuildGridOnResize() : Boolean;
      
      function rebuildGridStructure() : void;
      
      function set containerResizeToColumns(param1:Boolean) : void;
      
      function get containerResizeToColumns() : Boolean;
      
      function populate(param1:Array) : void;
   }
}
