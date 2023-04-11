package com.sulake.habbo.inventory
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   
   public interface IInventoryModel extends class_13
   {
       
      
      function getWindowContainer() : class_3151;
      
      function requestInitialization() : void;
      
      function categorySwitch(param1:String) : void;
      
      function subCategorySwitch(param1:String) : void;
      
      function closingInventoryView() : void;
      
      function updateView() : void;
      
      function selectItemById(param1:String) : void;
   }
}
