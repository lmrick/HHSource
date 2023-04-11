package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.navigation.class_3188;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetToggleEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   
   public class SoldLtdItemsCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _catalog:HabboCatalog;
      
      public function SoldLtdItemsCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            events.removeEventListener("SELECT_PRODUCT",onPreviewProduct);
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("soldLtdItemsWidget");
         window.visible = false;
         events.addEventListener("SELECT_PRODUCT",onPreviewProduct);
         return true;
      }
      
      private function onPreviewProduct(param1:SelectProductEvent) : void
      {
         var _loc3_:* = undefined;
         if(param1 == null || param1.offer == null || param1.offer.product == null)
         {
            return;
         }
         if(false)
         {
            _loc3_ = _catalog.currentCatalogNavigator.getNodesByOfferId(param1.offer.offerId);
            if(!_loc3_)
            {
               _loc3_ = new Vector.<class_3188>(0);
            }
            for each(var _loc2_ in _loc3_)
            {
               if(_loc2_.pageName.indexOf("limited_sold") > -1)
               {
                  window.visible = true;
                  events.dispatchEvent(new CatalogWidgetToggleEvent("purchaseWidget",false));
                  return;
               }
            }
         }
         if(false)
         {
            window.visible = true;
            events.dispatchEvent(new CatalogWidgetToggleEvent("purchaseWidget",false));
            return;
         }
         if(param1.offer.product.isUniqueLimitedItem && param1.offer.product.uniqueLimitedItemsLeft == 0)
         {
            window.visible = true;
            events.dispatchEvent(new CatalogWidgetToggleEvent("purchaseWidget",false));
         }
         else
         {
            window.visible = false;
            events.dispatchEvent(new CatalogWidgetToggleEvent("purchaseWidget",true));
         }
      }
   }
}
