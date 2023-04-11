package com.sulake.habbo.ui.widget.crafting
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.RoomUI;
   import com.sulake.habbo.ui.handler.CraftingWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.crafting.controller.CraftingInfoController;
   import com.sulake.habbo.ui.widget.crafting.controller.CraftingInventoryListController;
   import com.sulake.habbo.ui.widget.crafting.controller.CraftingMixerController;
   import com.sulake.habbo.ui.widget.crafting.controller.CraftingRecipeListController;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.IModalDialog;
   import package_148.class_1536;
   import package_148.class_1545;
   
   public class CraftingWidget extends RoomWidgetBase
   {
      
      public static const MODE_NONE:int = 0;
      
      public static const MODE_SECRET_RECIPE:int = 1;
      
      public static const MODE_PUBLIC_RECIPE:int = 2;
       
      
      private var _roomUI:RoomUI;
      
      private var var_2888:CraftingFurnitureItem;
      
      private var var_1603:IModalDialog;
      
      private var var_2536:class_3151;
      
      private var var_2418:CraftingInventoryListController;
      
      private var var_2237:CraftingRecipeListController;
      
      private var var_2072:CraftingMixerController;
      
      private var var_2113:CraftingInfoController;
      
      private var var_2203:int = 0;
      
      public function CraftingWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:RoomUI)
      {
         super(param1,param2,assets,localizations);
         _roomUI = param3;
         var_2418 = new CraftingInventoryListController(this);
         var_2237 = new CraftingRecipeListController(this);
         var_2072 = new CraftingMixerController(this);
         var_2113 = new CraftingInfoController(this);
         _assets = param3.assets;
         this.handler.widget = this;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         hide();
         _roomUI = null;
         if(var_2418)
         {
            var_2418.dispose();
            var_2418 = null;
         }
         if(var_2237)
         {
            var_2237.dispose();
            var_2237 = null;
         }
         if(var_2072)
         {
            var_2072.dispose();
            var_2072 = null;
         }
         if(var_2113)
         {
            var_2113.dispose();
            var_2113 = null;
         }
         if(var_2536)
         {
            var_2536.dispose();
            var_2536 = null;
         }
         super.dispose();
      }
      
      public function hide() : void
      {
         handler.removeInventoryUpdateEvent();
         var_2072.clearItems();
         var_2418.clearItems();
         var_2237.clearItems();
         if(craftingInProgress)
         {
            var_2113.cancelCrafting();
         }
         var_2203 = 0;
         if(var_1603 != null)
         {
            var_1603.dispose();
            var_1603 = null;
         }
      }
      
      private function createMainWindow() : void
      {
         if(window != null)
         {
            return;
         }
         var_1603 = windowManager.buildModalDialogFromXML(XML(assets.getAssetByName("craftingwidget_xml").content));
         if(!var_1603 || true)
         {
            return;
         }
         var _loc2_:class_3127 = window.findChildByTag("close");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onClose);
         }
         var _loc1_:IItemGridWindow = window.findChildByName("itemgrid_products") as IItemGridWindow;
         var_2536 = _loc1_.getGridItemAt(0) as class_3151;
         _loc1_.removeGridItem(var_2536);
         window.procedure = onInput;
         window.center();
      }
      
      public function populateInventoryItems(param1:Vector.<CraftingFurnitureItem>) : void
      {
         var_2418.populateInventoryItems(param1);
      }
      
      public function populateRecipeItems(param1:Vector.<CraftingFurnitureItem>) : void
      {
         var_2237.populateRecipeItems(param1);
      }
      
      public function setInfoState(param1:int, ... rest) : void
      {
         if(var_2113)
         {
            var_2113.setState(param1,rest);
         }
      }
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_DOWN")
         {
            return;
         }
         var _loc3_:* = param2.name;
         if("header_button_close" === _loc3_)
         {
            hide();
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         hide();
      }
      
      public function setInfoText(param1:String) : void
      {
         var _loc2_:ITextWindow = !!window ? window.findChildByName("header_mixer") as ITextWindow : null;
         if(_loc2_)
         {
            _loc2_.text = param1;
         }
      }
      
      public function showWidget() : void
      {
         if(window)
         {
            return;
         }
         createMainWindow();
         setInfoText("");
         setInfoState(0);
      }
      
      public function showCraftingCategories(param1:Vector.<class_1545>, param2:Vector.<String>, param3:IRoomEngine, param4:ISessionDataManager) : void
      {
         var _loc8_:* = undefined;
         var _loc6_:* = null;
         var _loc9_:class_3148 = null;
         var _loc10_:CraftingFurnitureItem = null;
         var _loc5_:Array = null;
         _loc8_ = new Vector.<CraftingFurnitureItem>(0);
         for each(_loc6_ in param2)
         {
            if(_loc9_ = param4.getFloorItemDataByName(_loc6_))
            {
               _loc10_ = new CraftingFurnitureItem(null,_loc9_);
               if((_loc5_ = handler.container.inventory.getNonRentedInventoryIds("furni",_loc10_.typeId)) && _loc5_.length > 0)
               {
                  _loc10_.inventoryIds = Vector.<int>(_loc5_);
               }
               _loc8_.push(_loc10_);
            }
         }
         populateInventoryItems(_loc8_);
         _loc8_ = new Vector.<CraftingFurnitureItem>(0);
         for each(var _loc7_ in param1)
         {
            if(_loc9_ = param4.getFloorItemDataByName(_loc7_.furnitureClassName))
            {
               _loc8_.push(new CraftingFurnitureItem(_loc7_.productCode,_loc9_));
            }
         }
         populateRecipeItems(_loc8_);
      }
      
      public function showCraftableProduct(param1:CraftingFurnitureItem) : void
      {
         var_2888 = param1;
         if(!var_2888)
         {
            return;
         }
         setInfoText(!!var_2888.furnitureData ? var_2888.furnitureData.localizedName : "");
         handler.getCraftingRecipe(var_2888.productCode);
      }
      
      public function showCraftingRecipe(param1:Vector.<class_1536>) : void
      {
         showCraftableProductView();
         var_2237.showRecipe(var_2888,param1);
      }
      
      public function clearMixerItems() : void
      {
         if(var_2072)
         {
            var_2072.clearItems();
         }
      }
      
      public function mixerContentChanged(param1:Vector.<int>) : void
      {
         if(param1.length > 0)
         {
            setInfoState(1000);
            handler.getCraftingRecipesAvailable(param1);
         }
         else
         {
            setInfoState(1);
         }
      }
      
      public function showSecretRecipeView() : void
      {
         if(var_2203 != 1)
         {
            clearMixerItems();
         }
         var_2203 = 1;
         setInfoText("");
         setInfoState(1);
      }
      
      public function showCraftableProductView() : void
      {
         if(var_2203 != 2)
         {
            clearMixerItems();
         }
         var_2203 = 2;
         setInfoState(6);
      }
      
      public function doCrafting() : void
      {
         switch(var_2203 - 1)
         {
            case 0:
               handler.doCraftingWithMixer();
               break;
            case 1:
               handler.doCraftingWithRecipe();
         }
      }
      
      public function getSelectedIngredients() : Vector.<int>
      {
         return var_2072.collectSelectedFurnitureIds();
      }
      
      public function get inSecretRecipeMode() : Boolean
      {
         return var_2203 == 1;
      }
      
      public function get craftingInProgress() : Boolean
      {
         return handler.craftingInProgress;
      }
      
      public function get inventoryDirty() : Boolean
      {
         return handler.inventoryDirty;
      }
      
      public function get itemTemplate() : class_3151
      {
         return var_2536;
      }
      
      public function get handler() : CraftingWidgetHandler
      {
         return var_1453 as CraftingWidgetHandler;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return handler.container.sessionDataManager;
      }
      
      public function get inventoryCtrl() : CraftingInventoryListController
      {
         return var_2418;
      }
      
      public function get recipeCtrl() : CraftingRecipeListController
      {
         return var_2237;
      }
      
      public function get mixerCtrl() : CraftingMixerController
      {
         return var_2072;
      }
      
      public function get infoCtrl() : CraftingInfoController
      {
         return var_2113;
      }
      
      public function get window() : class_3151
      {
         return !!var_1603 ? var_1603.rootWindow as class_3151 : null;
      }
   }
}
