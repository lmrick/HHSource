package com.sulake.habbo.ui.widget.crafting.renderer
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   
   public class CraftingInventoryItemRenderer extends FurniThumbnailRendererBase
   {
       
      
      public function CraftingInventoryItemRenderer(param1:CraftingFurnitureItem, param2:class_3151, param3:CraftingWidget)
      {
         super(param1,param2,param3);
      }
      
      override protected function onTriggered() : void
      {
         if(!var_1429 || false || false)
         {
            return;
         }
         if(!var_1429.mixerCtrl.canAdd())
         {
            return;
         }
         var _loc1_:int = content.getItemToMixer();
         if(_loc1_ == 0)
         {
            return;
         }
         var_1429.showSecretRecipeView();
         var_1429.mixerCtrl.addItemToMixer(content,_loc1_);
         var_1429.inventoryCtrl.updateItemCounts();
      }
      
      override public function updateItemCount() : void
      {
         if(content)
         {
            updateGroupItemCount(content.countInInventory);
            updateBitmapBlend(false);
         }
      }
   }
}
