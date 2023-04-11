package com.sulake.habbo.ui.widget.crafting.controller
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.crafting.renderer.CraftingRecipeItemRenderer;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   import package_148.class_1536;
   
   public class CraftingRecipeListController extends CraftingGridControllerBase
   {
       
      
      private var var_2911:CraftingFurnitureItem;
      
      private var _items:Vector.<CraftingRecipeItemRenderer>;
      
      public function CraftingRecipeListController(param1:CraftingWidget)
      {
         super(param1);
         _items = new Vector.<CraftingRecipeItemRenderer>(0);
      }
      
      override public function dispose() : void
      {
         clearItems();
         var_2911 = null;
         super.dispose();
      }
      
      public function clearItems() : void
      {
         if(_items)
         {
            for each(var _loc1_ in _items)
            {
               _loc1_.dispose();
            }
            _items.length = 0;
         }
         if(container)
         {
            container.destroyGridItems();
         }
      }
      
      public function populateRecipeItems(param1:Vector.<CraftingFurnitureItem>) : void
      {
         var _loc4_:int = 0;
         var _loc3_:CraftingRecipeItemRenderer = null;
         if(!container)
         {
            return;
         }
         var _loc2_:class_3151 = getItemTemplate();
         container.removeGridItems();
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = new CraftingRecipeItemRenderer(param1[_loc4_],_loc2_.clone() as class_3151,var_1429);
            container.addGridItem(_loc3_.window);
            _items.push(_loc3_);
            _loc4_++;
         }
      }
      
      public function showRecipe(param1:CraftingFurnitureItem, param2:Vector.<class_1536>) : void
      {
         var _loc3_:int = 0;
         var _loc8_:class_3148 = null;
         var _loc4_:Array = null;
         var _loc7_:int = 0;
         var _loc10_:CraftingFurnitureItem = null;
         var_2911 = param1;
         if(!param2)
         {
            var_1429.setInfoState(7);
            return;
         }
         var_1429.mixerCtrl.clearItems();
         var _loc9_:Boolean = true;
         var _loc6_:Vector.<String> = new Vector.<String>(0);
         for each(var _loc5_ in param2)
         {
            if(!(_loc8_ = var_1429.sessionDataManager.getFloorItemDataByName(_loc5_.furnitureClassName)))
            {
               return;
            }
            if((_loc4_ = var_1429.handler.container.inventory.getNonRentedInventoryIds("furni",_loc8_.id)) == null || _loc4_.length < _loc5_.count)
            {
               _loc9_ = false;
            }
            _loc7_ = 0;
            while(_loc7_ < _loc5_.count)
            {
               _loc10_ = new CraftingFurnitureItem(null,_loc8_);
               if(_loc4_ && _loc4_.length)
               {
                  _loc3_ = _loc4_.shift();
               }
               else
               {
                  _loc3_ = 0;
                  if(_loc6_.indexOf(_loc8_.localizedName) == -1)
                  {
                     _loc6_.push(_loc8_.localizedName);
                  }
               }
               var_1429.mixerCtrl.addItemToMixer(_loc10_,_loc3_);
               _loc7_++;
            }
         }
         if(_loc9_)
         {
            var_1429.setInfoState(8,var_2911.furnitureData);
         }
         else
         {
            var_1429.setInfoState(7,var_2911.furnitureData,_loc6_);
         }
      }
      
      private function get container() : IItemGridWindow
      {
         return !!mainWindow ? mainWindow.findChildByName("itemgrid_products") as IItemGridWindow : null;
      }
   }
}
