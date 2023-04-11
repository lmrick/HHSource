package com.sulake.habbo.ui.widget.crafting.renderer
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   
   public class CraftingMixerItemRenderer extends FurniThumbnailRendererBase
   {
       
      
      private var var_2717:int;
      
      public function CraftingMixerItemRenderer(param1:CraftingFurnitureItem, param2:class_3151, param3:CraftingWidget)
      {
         super(param1,param2,param3);
      }
      
      override protected function onTriggered() : void
      {
         if(!var_1429 || false || false)
         {
            return;
         }
         if(var_2717 == 0)
         {
            var_1429.setInfoState(9,furnitureData);
            return;
         }
         if(false)
         {
            var_1429.mixerCtrl.removeListItem(this);
         }
      }
      
      public function returnItemToInventory() : void
      {
         if(var_2717 != 0)
         {
            var_45.returnItemToInventory(var_2717);
         }
         this.dispose();
      }
      
      override public function updateItemCount() : void
      {
         updateBitmapBlend(var_2717 != 0);
      }
      
      public function get inventoryId() : int
      {
         return var_2717;
      }
      
      public function set inventoryId(param1:int) : void
      {
         var_2717 = param1;
         updateItemCount();
      }
   }
}
