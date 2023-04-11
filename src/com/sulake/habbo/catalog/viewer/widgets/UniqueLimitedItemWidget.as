package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.widgets.events.ProductOfferUpdatedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.window.utils.ILimitedItemOverlay;
   import com.sulake.habbo.window.widgets.ILimitedItemSupplyLeftOverlayWidget;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class UniqueLimitedItemWidget extends CatalogWidget implements class_3321
   {
      
      private static const SUPPLY_REFRESH_PERIOD_MS:int = 20000;
       
      
      private var _catalog:HabboCatalog;
      
      private var _overlay:ILimitedItemOverlay;
      
      private var var_2520:class_3159;
      
      private var var_2119:Timer;
      
      private var _overlayWidget:ILimitedItemSupplyLeftOverlayWidget;
      
      public function UniqueLimitedItemWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_2119 != null)
            {
               var_2119.stop();
               var_2119.removeEventListener("timer",onSupplyLeftTimer);
               var_2119 = null;
            }
            window.visible = false;
            _catalog = null;
            var_2520 = null;
            if(_overlay)
            {
               _overlay.dispose();
               _overlay = null;
            }
            events.removeEventListener("SELECT_PRODUCT",onSelectProduct);
            events.removeEventListener("CWE_PRODUCT_OFFER_UPDATED",onOfferUpdated);
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:class_3217 = class_3217(_window.findChildByName("unique_item_overlay_container"));
         _overlayWidget = ILimitedItemSupplyLeftOverlayWidget(_loc1_.widget);
         window.visible = false;
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         events.addEventListener("CWE_PRODUCT_OFFER_UPDATED",onOfferUpdated);
         var_2119 = new Timer(20000);
         var_2119.addEventListener("timer",onSupplyLeftTimer);
         return true;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_2520 = param1.offer;
         update(param1.offer,true);
      }
      
      private function onOfferUpdated(param1:ProductOfferUpdatedEvent) : void
      {
         var_2520 = param1.offer;
         update(param1.offer);
      }
      
      private function update(param1:class_3159, param2:Boolean = false) : void
      {
         var _loc3_:class_3169 = null;
         if(param1.pricingModel == "pricing_model_single" && param1.product.isUniqueLimitedItem)
         {
            _loc3_ = param1.product;
            _overlayWidget.supplyLeft = _loc3_.uniqueLimitedItemsLeft;
            _overlayWidget.seriesSize = _loc3_.uniqueLimitedItemSeriesSize;
            window.visible = true;
            if(param2)
            {
               _catalog.sendGetProductOffer(param1.offerId);
            }
            var_2119.start();
         }
         else
         {
            window.visible = false;
            var_2119.stop();
         }
      }
      
      private function onSupplyLeftTimer(param1:TimerEvent) : void
      {
         if(false && var_2520 != null)
         {
            update(var_2520,true);
         }
      }
   }
}
