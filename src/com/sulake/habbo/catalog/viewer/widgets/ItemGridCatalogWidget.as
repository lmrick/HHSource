package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.BundleProductContainer;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.class_3232;
   import com.sulake.habbo.catalog.viewer.class_3284;
   import com.sulake.habbo.catalog.viewer.class_3318;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.object.data.StringArrayStuffData;
   import com.sulake.habbo.session.ISessionDataManager;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class ItemGridCatalogWidget extends CatalogWidget implements class_3321, IItemGrid, class_3232
   {
       
      
      protected var _itemGrid:IItemGridWindow;
      
      protected var _gridItemLayout:XML;
      
      protected var var_3347:XML;
      
      protected var var_3416:XML;
      
      protected var var_1749:class_3284;
      
      private var _bundleCounter:int = 0;
      
      protected var var_1635:Timer;
      
      protected var var_4326:Boolean = true;
      
      private var _offerInitIndex:int = 0;
      
      protected var _session:ISessionDataManager;
      
      private var var_3711:int = -1;
      
      private var _selectedGuildColor1:String;
      
      private var _selectedGuildColor2:String;
      
      private var var_3936:String;
      
      private var var_497:String;
      
      public var itemColors:Dictionary;
      
      public var chosenItemColorIndex:int = 0;
      
      private var lastChosenColorIndex:int = 0;
      
      public function ItemGridCatalogWidget(param1:class_3151, param2:ISessionDataManager, param3:String)
      {
         itemColors = new Dictionary();
         super(param1);
         _session = param2;
         var_497 = param3;
      }
      
      override public function dispose() : void
      {
         if(var_1635 != null)
         {
            var_1635.stop();
            var_1635.removeEventListener("timer",loadItemGridGraphics);
            var_1635 = null;
         }
         if(_itemGrid != null)
         {
            _itemGrid.destroyGridItems();
            _itemGrid = null;
         }
         _gridItemLayout = null;
         var_3347 = null;
         var_3416 = null;
         var_1749 = null;
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("itemGridWidget");
         var _loc2_:* = _window.tags.indexOf("FIXED") > -1;
         _itemGrid = _window.findChildByName("itemGrid") as IItemGridWindow;
         if(!_loc2_)
         {
            _window.getChildAt(0).width = _window.width;
            _window.getChildAt(0).height = _window.height;
         }
         _itemGrid.verticalSpacing = 0;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset;
         _gridItemLayout = _loc1_.content as XML;
         _loc1_ = page.viewer.catalog.assets.getAssetByName("grid_item_with_price_single") as XmlAsset;
         var_3416 = _loc1_.content as XML;
         _loc1_ = page.viewer.catalog.assets.getAssetByName("grid_item_with_price_multi") as XmlAsset;
         var_3347 = _loc1_.content as XML;
         populateItemGrid();
         if(var_4326)
         {
            var_1635 = new Timer(25);
            var_1635.addEventListener("timer",loadItemGridGraphics);
            var_1635.start();
         }
         else
         {
            loadItemGridGraphics();
         }
         events.addEventListener("GUILD_SELECTED",onGuildSelected);
         events.addEventListener("COLOUR_INDEX",onColourIndex);
         return true;
      }
      
      public function select(param1:class_3284, param2:Boolean) : void
      {
         if(var_1749 != null)
         {
            var_1749.deactivate();
         }
         var_1749 = param1;
         param1.activate();
         if(false)
         {
            var_1749.view.findChildByName("border_outline").color = var_497 == "NORMAL" ? 6538729 : 16758076;
         }
         var _loc4_:ProductContainer;
         if(!(_loc4_ = param1 as ProductContainer))
         {
            return;
         }
         if(_loc4_.isLazy)
         {
            return;
         }
         var _loc3_:class_3159 = _loc4_.offer;
         if(_loc3_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc3_));
            if(_loc3_.product && _loc3_.product.productType == "i")
            {
               events.dispatchEvent(new SetExtraPurchaseParameterEvent(_loc3_.product.extraParam));
            }
         }
         if(param2)
         {
            events.dispatchEvent(new CatalogWidgetColoursEvent(getCurrentItemColors(),"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3",getCurrentItemColourIndex()));
         }
      }
      
      public function startDragAndDrop(param1:class_3284) : Boolean
      {
         var _loc2_:class_3159 = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            if(_session.clubLevel >= _loc2_.clubLevel)
            {
               (page.viewer.catalog as HabboCatalog).requestSelectedItemToMover(this,_loc2_);
            }
         }
         return true;
      }
      
      public function onDragAndDropDone(param1:Boolean, param2:String) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1)
         {
            events.dispatchEvent(new CatalogWidgetInitPurchaseEvent(false,param2));
         }
      }
      
      public function stopDragAndDrop() : void
      {
      }
      
      protected function populateItemGrid() : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc7_:* = [];
         var _loc6_:Vector.<class_3159> = new Vector.<class_3159>();
         if(false)
         {
            page.offers.sort(sortByColourIndex);
            for each(_loc1_ in page.offers)
            {
               if(!_loc1_.product.furnitureData || !_loc1_.product.isColorable)
               {
                  _loc6_.push(_loc1_);
               }
               else
               {
                  _loc4_ = String(_loc1_.product.furnitureData.fullName.split("*")[0]);
                  _loc5_ = int(_loc1_.product.furnitureData.fullName.split("*")[1]);
                  if(true)
                  {
                     itemColors[_loc4_] = [];
                  }
                  if(_loc1_.product.furnitureData.colours)
                  {
                     for each(_loc2_ in _loc1_.product.furnitureData.colours)
                     {
                        if(_loc2_ != 16777215)
                        {
                           _loc3_ = _loc2_;
                        }
                     }
                     if(itemColors[_loc4_].indexOf(_loc3_) == -1)
                     {
                        itemColors[_loc4_][_loc5_] = _loc3_;
                     }
                  }
                  if(_loc7_.indexOf(_loc4_) == -1)
                  {
                     _loc6_.push(_loc1_);
                     _loc7_.push(_loc4_);
                  }
               }
            }
            page.offers.sort(sortByFurniTypeName);
         }
         else
         {
            _loc6_ = page.offers;
         }
         for each(_loc1_ in page.offers)
         {
            createGridItem(_loc1_.gridItem,_loc6_.indexOf(_loc1_) != -1);
            _loc1_.gridItem.grid = this;
            if(_loc1_.pricingModel == "pricing_model_bundle")
            {
               _bundleCounter++;
               if(_loc1_.productContainer is BundleProductContainer)
               {
                  (_loc1_.productContainer as BundleProductContainer).setBundleCounter(_bundleCounter);
               }
            }
         }
      }
      
      private function sortByColourIndex(param1:class_3159, param2:class_3159) : int
      {
         if(!param1.product.furnitureData.colourIndex || !param2.product.furnitureData.colourIndex)
         {
            return 1;
         }
         if(param1.product.furnitureData.colourIndex > param2.product.furnitureData.colourIndex)
         {
            return 1;
         }
         if(param1 == param2)
         {
            return 0;
         }
         return -1;
      }
      
      private function sortByFurniTypeName(param1:class_3159, param2:class_3159) : int
      {
         if(param1.product.furnitureData.className > param2.product.furnitureData.className)
         {
            return 1;
         }
         if(param1 == param2)
         {
            return 0;
         }
         return -1;
      }
      
      protected function resetTimer() : void
      {
         if(var_1635 != null)
         {
            var_1635.reset();
         }
         _offerInitIndex = 0;
      }
      
      protected function loadItemGridGraphics(param1:TimerEvent = null) : void
      {
         var _loc4_:int = 0;
         var _loc2_:class_3159 = null;
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
         }
         var _loc3_:int = int(page.offers.length);
         if(_loc3_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < 3)
            {
               if(_offerInitIndex >= 0 && _offerInitIndex < _loc3_)
               {
                  _loc2_ = page.offers[_offerInitIndex];
                  loadGraphics(_loc2_);
                  _loc2_.productContainer.grid = this;
               }
               _offerInitIndex++;
               if(_offerInitIndex >= _loc3_)
               {
                  resetTimer();
                  break;
               }
               _loc4_++;
            }
         }
      }
      
      protected function createGridItem(param1:class_3284, param2:Boolean = true) : void
      {
         var _loc3_:XML = null;
         var _loc6_:Boolean;
         var _loc4_:class_3318;
         if((_loc6_ = (_loc4_ = param1 as class_3318) != null && _loc4_.offer != null && (_loc4_.offer.priceInCredits > 0 || _loc4_.offer.priceInActivityPoints > 0)) && var_497 != "BUILDERS_CLUB")
         {
            if(_loc4_.offer && _loc4_.offer.priceInCredits > 0 && _loc4_.offer.priceInActivityPoints > 0)
            {
               _loc3_ = var_3347;
            }
            else
            {
               _loc3_ = var_3416;
            }
         }
         else
         {
            _loc3_ = _gridItemLayout;
         }
         var _loc5_:class_3151 = page.viewer.catalog.windowManager.buildFromXML(_loc3_) as class_3151;
         if(param2)
         {
            _itemGrid.addGridItem(_loc5_);
         }
         param1.view = _loc5_;
         if(_loc4_ is ProductContainer)
         {
            (_loc4_ as ProductContainer).createCurrencyIndicators(page.viewer.catalog as HabboCatalog);
         }
      }
      
      protected function loadGraphics(param1:class_3159) : void
      {
         var _loc3_:IStuffData = null;
         var _loc2_:* = null;
         var _loc4_:StringArrayStuffData = null;
         if(param1 != null && !param1.disposed)
         {
            _loc3_ = null;
            if(var_3711 != -1)
            {
               _loc2_ = [];
               _loc2_.push("0");
               _loc2_.push(var_3711.toString());
               _loc2_.push(var_3936);
               _loc2_.push(_selectedGuildColor1);
               _loc2_.push(_selectedGuildColor2);
               (_loc4_ = new StringArrayStuffData()).setArray(_loc2_);
               _loc3_ = _loc4_;
            }
            param1.productContainer.initProductIcon(page.viewer.roomEngine,_loc3_);
         }
      }
      
      private function onGuildSelected(param1:CatalogWidgetGuildSelectedEvent) : void
      {
         if(disposed)
         {
            return;
         }
         var_3711 = param1.guildId;
         _selectedGuildColor1 = param1.color1;
         _selectedGuildColor2 = param1.color2;
         var_3936 = param1.badgeCode;
         _itemGrid.destroyGridItems();
         for each(var _loc2_ in page.offers)
         {
            createGridItem(_loc2_.gridItem);
            loadGraphics(_loc2_);
            _loc2_.productContainer.grid = this;
         }
      }
      
      private function removeColorableGridItemIfExists(param1:class_3159) : void
      {
         if(_itemGrid.getGridItemIndex(param1.gridItem.view) >= 0)
         {
            _itemGrid.removeGridItem(param1.gridItem.view);
         }
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         for each(_loc2_ in page.offers)
         {
            if(_loc2_.gridItem == var_1749)
            {
               _loc3_ = _loc2_;
            }
         }
         if(!_loc3_ || !_loc3_.product.isColorable)
         {
            return;
         }
         _loc5_ = _itemGrid.getGridItemIndex(_loc3_.gridItem.view);
         removeColorableGridItemIfExists(_loc3_);
         var _loc4_:String = _loc3_.product.furnitureData.fullName.split("*")[0] + "*" + (param1.index + 1);
         for each(_loc2_ in page.offers)
         {
            if(_loc2_.product.furnitureData.fullName == _loc4_)
            {
               _itemGrid.addGridItemAt(_loc2_.gridItem.view,_loc5_);
               select(_loc2_.gridItem,false);
               _loc2_.gridItem.grid = this;
            }
         }
      }
      
      public function getCurrentItemColors() : Array
      {
         var _loc2_:* = null;
         for each(var _loc1_ in page.offers)
         {
            if(_loc1_.gridItem == var_1749)
            {
               _loc2_ = _loc1_;
            }
         }
         if(!_loc2_ || !_loc2_.product.isColorable)
         {
            return [];
         }
         var _loc3_:String = String(_loc2_.product.furnitureData.fullName.split("*")[0]);
         if(_loc3_ != null && _loc3_.indexOf("bc_alpha") >= 0 && false)
         {
            return itemColors[_loc3_].concat("0xffffff");
         }
         return itemColors[_loc3_];
      }
      
      private function getCurrentItemColourIndex() : int
      {
         var _loc2_:* = null;
         for each(var _loc1_ in page.offers)
         {
            if(_loc1_.gridItem == var_1749)
            {
               _loc2_ = _loc1_;
            }
         }
         if(!_loc2_ || !_loc2_.product.isColorable)
         {
            return 0;
         }
         return Math.max(_loc2_.product.furnitureData.colourIndex - 1,0);
      }
   }
}
