package com.sulake.habbo.ui.widget.crafting.controller
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   
   public class CraftingGridControllerBase
   {
       
      
      protected var var_1429:CraftingWidget;
      
      public function CraftingGridControllerBase(param1:CraftingWidget)
      {
         super();
         var_1429 = param1;
      }
      
      public function dispose() : void
      {
         var_1429 = null;
      }
      
      public function get mainWindow() : class_3151
      {
         return var_1429.window;
      }
      
      public function getItemTemplate() : class_3151
      {
         return var_1429.itemTemplate;
      }
   }
}
