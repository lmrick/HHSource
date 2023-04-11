package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.class_3284;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.session.ISessionDataManager;
   
   public class SpacesNewCatalogWidget extends ItemGridCatalogWidget implements class_13, class_3321, IItemGrid
   {
       
      
      private var var_3143:Array;
      
      private var var_1583:Array;
      
      private var _selectedGroup:int = 0;
      
      private var var_2612:Array;
      
      private var var_1995:ISelectorWindow;
      
      private var var_1298:Array;
      
      public function SpacesNewCatalogWidget(param1:class_3151, param2:ISessionDataManager, param3:String)
      {
         var_3143 = ["wallpaper","floor","landscape"];
         var_1583 = [];
         var_2612 = [0,0,0];
         var_1298 = ["group.walls","group.floors","group.views"];
         super(param1,param2,param3);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         for each(var _loc2_ in var_1583)
         {
            for each(var _loc1_ in _loc2_)
            {
               _loc1_.dispose();
            }
         }
         var_1583 = null;
      }
      
      override public function init() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:class_3127 = null;
         class_14.log("Init Item Group Catalog Widget (Spaces New)");
         createOfferGroups();
         if(!super.init())
         {
            return false;
         }
         events.addEventListener("WIDGETS_INITIALIZED",onWidgetsInitialized);
         var_1995 = _window.findChildByName("groups") as ISelectorWindow;
         if(var_1995)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1995.numSelectables)
            {
               _loc1_ = var_1995.getSelectableAt(_loc2_);
               if(_loc1_ is ISelectableWindow)
               {
                  _loc1_.addEventListener("WE_SELECTED",onSelectGroup);
               }
               _loc2_++;
            }
         }
         switchCategory(var_1298[_selectedGroup]);
         updateRoomPreview();
         return true;
      }
      
      public function onWidgetsInitialized(param1:CatalogWidgetEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:class_3159 = var_1583[_selectedGroup][_loc3_];
         this.select(_loc2_.gridItem,false);
      }
      
      public function selectIndex(param1:int) : void
      {
         var _loc2_:class_3159 = null;
         if(param1 > -1 && param1 < _itemGrid.numGridItems)
         {
            _loc2_ = var_1583[_selectedGroup][param1];
            this.select(_loc2_.gridItem,false);
         }
      }
      
      override public function select(param1:class_3284, param2:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
         super.select(param1,false);
         var _loc3_:class_3159 = (param1 as ProductContainer).offer;
         if(_loc3_ == null)
         {
            return;
         }
         events.dispatchEvent(new SetExtraPurchaseParameterEvent(_loc3_.product.extraParam));
         var_2612[_selectedGroup] = (var_1583[_selectedGroup] as Vector.<class_3159>).indexOf(_loc3_);
         updateRoomPreview();
      }
      
      private function updateRoomPreview() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:class_3159 = var_1583[0].length > _loc5_ ? var_1583[0][_loc5_] : null;
         var _loc4_:class_3159 = var_1583[1].length > _loc6_ ? var_1583[1][_loc6_] : null;
         var _loc1_:class_3159 = var_1583[2].length > _loc3_ ? var_1583[2][_loc3_] : null;
         if(!_loc4_ || !_loc2_ || !_loc1_)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetUpdateRoomPreviewEvent(_loc4_.product.extraParam,_loc2_.product.extraParam,_loc1_.product.extraParam,64));
      }
      
      private function createOfferGroups() : Boolean
      {
         var _loc2_:class_3169 = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         for each(var _loc1_ in page.offers)
         {
            if(!(_loc1_.pricingModel == "pricing_model_single" || _loc1_.pricingModel == "pricing_model_multi"))
            {
               continue;
            }
            _loc2_ = _loc1_.product;
            if(_loc2_ == null)
            {
               continue;
            }
            _loc3_ = _loc2_.productClassId;
            if(!(_loc2_.productType == "i" || _loc2_.productType == "s"))
            {
               continue;
            }
            if(_loc2_.furnitureData == null)
            {
               continue;
            }
            _loc4_ = _loc2_.furnitureData.className;
            _loc5_ = var_3143.indexOf(_loc4_);
            if(var_3143.indexOf(_loc4_) == -1)
            {
               var_3143.push(_loc4_);
            }
            while(false)
            {
               var_1583.push(new Vector.<class_3159>(0));
            }
            switch(_loc4_)
            {
               case "floor":
                  (var_1583[_loc5_] as Vector.<class_3159>).push(_loc1_);
                  break;
               case "wallpaper":
                  (var_1583[_loc5_] as Vector.<class_3159>).push(_loc1_);
                  break;
               case "landscape":
                  (var_1583[_loc5_] as Vector.<class_3159>).push(_loc1_);
                  break;
               default:
                  class_14.log("[Spaces Catalog Widget] : " + _loc4_);
                  break;
            }
         }
         page.replaceOffers(new Vector.<class_3159>(0),false);
         return true;
      }
      
      private function onSelectGroup(param1:class_3134) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ISelectableWindow = param1.target as ISelectableWindow;
         if(_loc3_)
         {
            _loc2_ = var_1995.getSelectableIndex(_loc3_);
            class_14.log("select: " + [_loc3_.name,_loc2_]);
            switchCategory(_loc3_.name);
         }
      }
      
      private function switchCategory(param1:String) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(disposed)
         {
            return;
         }
         if(!var_1995)
         {
            return;
         }
         var_1995.setSelected(var_1995.getSelectableByName(param1));
         var _loc4_:int = -1;
         switch(param1)
         {
            case "group.walls":
               _loc4_ = 0;
               break;
            case "group.floors":
               _loc4_ = 1;
               break;
            case "group.views":
               _loc4_ = 2;
               break;
            default:
               _loc4_ = -1;
         }
         if(_loc4_ > -1)
         {
            if(var_1749 != null)
            {
               var_1749.deactivate();
            }
            var_1749 = null;
            _selectedGroup = _loc4_;
            if(_itemGrid)
            {
               _itemGrid.destroyGridItems();
            }
            _loc2_ = var_1583[_selectedGroup] == null ? new Vector.<class_3159>(0) : var_1583[_selectedGroup];
            page.replaceOffers(_loc2_,false);
            resetTimer();
            populateItemGrid();
            loadItemGridGraphics();
            if(var_1635)
            {
               var_1635.start();
            }
            _loc3_ = 0;
            selectIndex(_loc3_);
         }
      }
   }
}
