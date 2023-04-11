package com.sulake.habbo.ui.widget.crafting.renderer
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   
   public class CraftingRecipeItemRenderer extends FurniThumbnailRendererBase
   {
       
      
      public function CraftingRecipeItemRenderer(param1:CraftingFurnitureItem, param2:class_3151, param3:CraftingWidget)
      {
         super(param1,param2,param3);
         hideItemCount();
      }
      
      override protected function onTriggered() : void
      {
         if(!var_1429 || !content || false)
         {
            return;
         }
         var_1429.showCraftableProduct(content);
      }
   }
}
