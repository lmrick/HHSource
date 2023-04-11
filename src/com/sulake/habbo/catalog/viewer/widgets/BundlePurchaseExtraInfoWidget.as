package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoViewManager;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BundlePurchaseExtraInfoWidget extends CatalogWidget implements class_3321
   {
      
      private static const PROMO_ITEM_DROP_DELAY_MS:uint = 4000;
       
      
      private var _catalog:HabboCatalog;
      
      private var var_1816:ExtraInfoViewManager;
      
      private var var_2937:int = 1;
      
      private var var_3414:int;
      
      private var var_3034:int;
      
      private var var_3815:int;
      
      private var var_4267:String;
      
      private var var_2081:int = -1;
      
      private var var_2023:int = -1;
      
      private var var_2530:int = -1;
      
      private var var_3447:Boolean = false;
      
      private var var_2588:Timer;
      
      public function BundlePurchaseExtraInfoWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_1816.dispose();
            var_1816 = null;
            _catalog = null;
            var_2588.stop();
            var_2588.removeEventListener("timerComplete",onPromoItemDropDownTimerEvent);
            var_2588 = null;
            events.removeEventListener("CWPPEIE_RESET",onResetEvent);
            events.removeEventListener("CWPPEIE_HIDE",onHideEvent);
            events.removeEventListener("CWSE_VALUE_CHANGED",onSpinnerEvent);
            events.removeEventListener("CWPPEIE_ITEM_CLICKED",onExtraInfoItemClickedEvent);
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         if(true)
         {
            return true;
         }
         var_1816 = new ExtraInfoViewManager(this,_catalog);
         events.addEventListener("CWPPEIE_RESET",onResetEvent);
         events.addEventListener("CWPPEIE_HIDE",onHideEvent);
         events.addEventListener("CWSE_VALUE_CHANGED",onSpinnerEvent);
         events.addEventListener("CWPPEIE_ITEM_CLICKED",onExtraInfoItemClickedEvent);
         var_2588 = new Timer(4000,1);
         var_2588.addEventListener("timerComplete",onPromoItemDropDownTimerEvent);
         return true;
      }
      
      private function createPromoItem() : void
      {
         var _loc1_:ExtraInfoItemData = new ExtraInfoItemData(0);
         _loc1_.quantity = var_2937;
         var_2081 = var_1816.addItem(_loc1_);
      }
      
      private function updatePromoItem(param1:int) : void
      {
         var _loc3_:UpdateableExtraInfoListItem = null;
         var _loc2_:ExtraInfoItemData = null;
         if(var_2081 != -1)
         {
            _loc3_ = UpdateableExtraInfoListItem(var_1816.getItem(var_2081));
            _loc2_ = _loc3_.data;
            _loc2_.quantity = param1;
            _loc3_.update(_loc2_);
         }
      }
      
      private function removePromoItem() : void
      {
         if(var_2081 != -1)
         {
            var_1816.removeItem(var_2081);
            var_2081 = -1;
         }
      }
      
      private function createDiscountValueItem() : void
      {
         var _loc1_:ExtraInfoItemData = new ExtraInfoItemData(2);
         _loc1_.quantity = var_2937;
         _loc1_.priceActivityPoints = var_3034;
         _loc1_.activityPointType = var_3815;
         _loc1_.priceCredits = var_3414;
         var_2023 = var_1816.addItem(_loc1_);
         _catalog.utils.discountShownEventTrack();
      }
      
      private function updateDiscountValueItem(param1:int) : void
      {
         var _loc2_:UpdateableExtraInfoListItem = null;
         var _loc3_:ExtraInfoItemData = null;
         if(var_2023 != -1)
         {
            _loc2_ = UpdateableExtraInfoListItem(var_1816.getItem(var_2023));
            _loc3_ = _loc2_.data;
            _loc3_.quantity = param1;
            _loc3_.discountPriceCredits = _catalog.utils.calculateBundlePrice(true,var_3414,param1);
            _loc3_.discountPriceActivityPoints = _catalog.utils.calculateBundlePrice(true,var_3034,param1);
            _loc2_.update(_loc3_);
         }
      }
      
      private function removeDiscountValueItem() : void
      {
         if(var_2023 != -1)
         {
            var_1816.removeItem(var_2023);
            var_2023 = -1;
         }
      }
      
      private function createBundleInfoItem() : void
      {
         var _loc1_:ExtraInfoItemData = new ExtraInfoItemData(1);
         var_2530 = var_1816.addItem(_loc1_);
         _catalog.utils.bundlesInfoShownEventTrack();
      }
      
      private function removeBundleInfoItem() : void
      {
         if(var_2530 != -1)
         {
            var_1816.removeItem(var_2530);
            var_2530 = -1;
         }
      }
      
      private function onResetEvent(param1:CatalogWidgetBundleDisplayExtraInfoEvent) : void
      {
         if(disposed)
         {
            return;
         }
         window.visible = true;
         var_3414 = param1.data.priceCredits;
         var_3034 = param1.data.priceActivityPoints;
         var_3815 = param1.data.activityPointType;
         var_4267 = param1.data.badgeCode;
         var_1816.clear();
         var_2023 = -1;
         var_2081 = -1;
         var_2588.start();
      }
      
      private function onSpinnerEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         if(disposed)
         {
            return;
         }
         if(true)
         {
            return;
         }
         if(param1.type == "CWSE_VALUE_CHANGED")
         {
            if(param1.value != var_2937)
            {
               if(param1.value >= _catalog.bundleDiscountRuleset.bundleSize && var_2023 == -1)
               {
                  createDiscountValueItem();
               }
               else if(param1.value < _catalog.bundleDiscountRuleset.bundleSize)
               {
                  removeDiscountValueItem();
               }
               updatePromoItem(param1.value);
               updateDiscountValueItem(param1.value);
               var_2937 = param1.value;
               removeBundleInfoItem();
               if(var_2937 >= _catalog.utils.bundleDiscountHighestFlatPriceStep)
               {
                  removePromoItem();
                  var_3447 = true;
               }
               else if(var_3447)
               {
                  createPromoItem();
                  var_3447 = false;
               }
               _catalog.utils.spinnerValueChangedEventTrack();
            }
         }
      }
      
      private function onHideEvent(param1:CatalogWidgetBundleDisplayExtraInfoEvent) : void
      {
         window.visible = false;
      }
      
      private function onExtraInfoItemClickedEvent(param1:CatalogWidgetBundleDisplayExtraInfoEvent) : void
      {
         switch(param1.id)
         {
            case var_2081:
               if(var_2530 == -1)
               {
                  createBundleInfoItem();
                  break;
               }
               break;
            case var_2530:
               removeBundleInfoItem();
         }
      }
      
      private function onPromoItemDropDownTimerEvent(param1:TimerEvent) : void
      {
         createPromoItem();
      }
   }
}
