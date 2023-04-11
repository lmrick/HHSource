package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import flash.events.Event;
   
   public class TotalPriceWidget extends CatalogWidget implements class_3321
   {
      
      private static const ELEMENT_TOTAL_PRICE_CONTAINER:String = "totalprice_container";
      
      private static const ELEMENT_PLUS:String = "plus";
      
      private static const const_529:String = "amount_text_left";
      
      private static const ELEMENT_AMOUNT_TEXT_RIGHT:String = "amount_text_right";
      
      private static const const_845:String = "total_left";
      
      private static const ELEMENT_TOTAL_RIGHT:String = "total_right";
      
      private static const const_538:String = "currency_indicator_bitmap_left";
      
      private static const ELEMENT_CURRENCY_INDICATOR_BITMAP_RIGHT:String = "currency_indicator_bitmap_right";
       
      
      private var _catalog:HabboCatalog;
      
      private var var_3414:int;
      
      private var var_3034:int;
      
      private var var_3815:int;
      
      private var var_2360:class_3127;
      
      private var var_3041:class_3127;
      
      private var var_1720:class_3151;
      
      private var var_2106:class_3151;
      
      private var var_2187:int = 1;
      
      public function TotalPriceWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            _catalog = null;
            events.removeEventListener("CWSE_VALUE_CHANGED",onSpinnerValueChangedEvent);
            events.removeEventListener("SELECT_PRODUCT",onSelectProductEvent);
            clear();
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("totalPriceWidget");
         window.visible = false;
         if(true)
         {
            return true;
         }
         events.addEventListener("CWSE_VALUE_CHANGED",onSpinnerValueChangedEvent);
         events.addEventListener("SELECT_PRODUCT",onSelectProductEvent);
         events.dispatchEvent(new Event("TOTAL_PRICE_WIDGET_INITIALIZED"));
         return true;
      }
      
      private function onSpinnerValueChangedEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         var_2187 = param1.value;
         updateCurrencyIndicators();
      }
      
      private function onSelectProductEvent(param1:SelectProductEvent) : void
      {
         window.visible = param1.offer.bundlePurchaseAllowed;
         var_3414 = param1.offer.priceInCredits;
         var_3034 = param1.offer.priceInActivityPoints;
         var_3815 = param1.offer.activityPointType;
         var_2187 = 1;
         clear();
         createCurrencyIndicators();
         updateCurrencyIndicators();
      }
      
      private function clear() : void
      {
         var_2360 = null;
         var_3041 = null;
         var_1720 = null;
         var_2106 = null;
         _window.findChildByName("plus").visible = false;
         _window.findChildByName("amount_text_left").visible = false;
         if(_window.findChildByName("total_left"))
         {
            _window.findChildByName("total_left").visible = false;
         }
         if(_window.findChildByName("total_right"))
         {
            _window.findChildByName("total_right").visible = false;
         }
         _window.findChildByName("currency_indicator_bitmap_left").visible = false;
      }
      
      private function updateCurrencyIndicators() : void
      {
         var _loc4_:class_3127 = null;
         var _loc6_:class_3127 = null;
         var _loc3_:int = var_2187 * var_3414;
         var _loc5_:int = var_2187 * var_3034;
         var _loc1_:* = _loc3_;
         var _loc2_:* = _loc5_;
         if(false)
         {
            _loc1_ = _catalog.utils.calculateBundlePrice(true,var_3414,var_2187);
            _loc2_ = _catalog.utils.calculateBundlePrice(true,var_3034,var_2187);
         }
         if(var_2360 != null)
         {
            var_2360.caption = _catalog.bundleDiscountEnabled ? _loc1_.toString() : _loc3_.toString();
         }
         if(var_3041 != null)
         {
            var_3041.caption = _catalog.bundleDiscountEnabled ? _loc2_.toString() : _loc5_.toString();
         }
         if(var_1720)
         {
            var_1720.visible = _loc3_ != _loc1_;
            (_loc4_ = var_1720.findChildByName("text")).caption = !!var_1720.visible ? _loc3_.toString() : "0";
            var_1720.findChildByName("strike").width = _loc4_.width;
         }
         if(var_2106)
         {
            var_2106.visible = _loc5_ != _loc2_;
            (_loc6_ = var_2106.findChildByName("text")).caption = !!var_2106.visible ? _loc5_.toString() : "0";
            var_2106.findChildByName("strike").width = _loc6_.width;
         }
      }
      
      private function createCurrencyIndicators() : void
      {
         var _loc1_:class_3127 = null;
         var _loc2_:class_3127 = null;
         if(var_3414 > 0)
         {
            if(var_3034 > 0)
            {
               var_2360 = _window.findChildByName("amount_text_left");
               var_2360.visible = true;
               var_1720 = _window.findChildByName("total_left") as class_3151;
               if(var_1720)
               {
                  var_1720.visible = false;
               }
               _loc1_ = _window.findChildByName("currency_indicator_bitmap_left");
               _loc1_.visible = true;
               _window.findChildByName("plus").visible = true;
            }
            else
            {
               var_2360 = _window.findChildByName("amount_text_right");
               var_1720 = _window.findChildByName("total_right") as class_3151;
               if(var_1720)
               {
                  var_1720.visible = false;
               }
               _loc1_ = _window.findChildByName("currency_indicator_bitmap_right");
            }
            if(false)
            {
               _loc1_.style = class_3244.getIconStyleFor(_catalog.getSeasonalCurrencyActivityPointType(),_catalog,true,true);
               _loc1_.width = 53;
            }
            else
            {
               _loc1_.style = class_3244.getIconStyleFor(-1,_catalog,true);
               _loc1_.width = 22;
            }
         }
         if(var_3034 > 0)
         {
            var_3041 = ITextWindow(_window.findChildByName("amount_text_right"));
            var_2106 = _window.findChildByName("total_left") as class_3151;
            if(var_2106)
            {
               var_2106.visible = false;
            }
            _loc2_ = _window.findChildByName("currency_indicator_bitmap_right");
            _loc2_.style = class_3244.getIconStyleFor(var_3815,_catalog,true);
         }
         IItemListWindow(_window.findChildByName("totalprice_container")).arrangeListItems();
      }
   }
}
