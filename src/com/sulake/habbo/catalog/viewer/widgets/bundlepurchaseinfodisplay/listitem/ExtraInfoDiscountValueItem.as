package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.HabboCatalogUtils;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.UpdateableExtraInfoListItem;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ExtraInfoDiscountValueItem extends UpdateableExtraInfoListItem
   {
      
      private static const ELEMENT_SPLASH_STAR:String = "icon_splash_bitmap";
      
      private static const const_1050:String = "icon_bitmap";
      
      private static const const_966:String = "total_currency_value_left";
      
      private static const const_596:String = "total_currency_icon_left";
      
      private static const ELEMENT_TOTAL_LEFT_CURRENCY_STRIKETHROUGH:String = "striketrough_total_currency_left";
      
      private static const const_578:String = "total_currency_value_right";
      
      private static const const_711:String = "total_currency_icon_right";
      
      private static const ELEMENT_TOTAL_RIGHT_CURRENCY_STRIKETHROUGH:String = "striketrough_total_currency_right";
      
      private static const const_902:String = "discount_currency_value_left";
      
      private static const const_665:String = "discount_currency_icon_left";
      
      private static const const_546:String = "discount_currency_value_right";
      
      private static const const_1188:String = "discount_currency_icon_right";
      
      private static const STRIKETHROUGH_LEFT_MARGIN:int = 4;
      
      private static const STRIKETHROUGH_RIGHT_MARGIN:int = 20;
       
      
      private var _window:class_3151 = null;
      
      private var var_3378:Boolean = true;
      
      private var _catalog:HabboCatalog;
      
      private var _starAnimationOffset:int = 0;
      
      private var var_2539:Timer;
      
      private var var_2968:Boolean;
      
      private var var_2792:Boolean;
      
      private var var_3187:Boolean;
      
      private var var_3898:Boolean = false;
      
      public function ExtraInfoDiscountValueItem(param1:int, param2:ExtraInfoItemData, param3:HabboCatalog)
      {
         super(null,param1,param2,1,true);
         _catalog = param3;
         var_2539 = new Timer(150);
         var_2539.addEventListener("timer",starAnimationTimerEvent);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_2539 != null)
            {
               var_2539.stop();
               var_2539 = null;
            }
            _catalog = null;
            super.dispose();
         }
      }
      
      override public function update(param1:ExtraInfoItemData) : void
      {
         super.update(param1);
         var_2968 = false;
         var_2792 = false;
         var_3187 = false;
         if(param1.priceCredits > 0 && param1.priceActivityPoints > 0)
         {
            var_2968 = true;
         }
         else if(param1.priceActivityPoints > 0 && param1.priceCredits == 0)
         {
            var_3187 = true;
         }
         else
         {
            var_2792 = true;
         }
         var_3378 = true;
         render();
         if(!var_3898)
         {
            setCurrencyIcons();
         }
      }
      
      override public function getRenderedWindow() : class_3151
      {
         if(var_3378)
         {
            render();
         }
         return _window;
      }
      
      private function createWindow() : void
      {
         _window = class_3151(_catalog.utils.createWindow("discountValueItem"));
         setElementBitmap("icon_bitmap","thumb_up");
         startSplashAnimation();
      }
      
      private function render() : void
      {
         if(_window == null)
         {
            createWindow();
         }
         updateColumns();
         updatePriceIndicators();
         updateStrikeThroughElements();
         var_3378 = false;
      }
      
      private function updateColumns() : void
      {
         if(var_3187 || var_2792)
         {
            setLeftColumnVisibility(false);
         }
         else
         {
            setLeftColumnVisibility(true);
         }
      }
      
      private function setCurrencyIcons() : void
      {
         if(var_2968)
         {
            setIconStyle("total_currency_icon_left",-1);
            setIconStyle("discount_currency_icon_left",-1);
         }
         if(var_2792)
         {
            setIconStyle("total_currency_icon_right",-1);
            setIconStyle("discount_currency_icon_right",-1);
         }
         else
         {
            setIconStyle("total_currency_icon_right",data.activityPointType);
            setIconStyle("discount_currency_icon_right",data.activityPointType);
         }
         var_3898 = true;
      }
      
      private function updatePriceIndicators() : void
      {
         if(var_2968)
         {
            setElementText("total_currency_value_left",(0 * 0).toString());
            setElementText("discount_currency_value_left",(0 * 0 - 0).toString());
         }
         if(var_2792)
         {
            setElementText("total_currency_value_right",(0 * 0).toString());
            setElementText("discount_currency_value_right",(0 * 0 - 0).toString());
         }
         else
         {
            setElementText("total_currency_value_right",(0 * 0).toString());
            setElementText("discount_currency_value_right",(0 * 0 - 0).toString());
         }
      }
      
      private function updateStrikeThroughElements() : void
      {
         var _loc4_:ITextWindow;
         var _loc2_:int = (_loc4_ = ITextWindow(_window.findChildByName("total_currency_value_left"))).x + _loc4_.width - _loc4_.textWidth;
         var _loc5_:class_3151;
         (_loc5_ = class_3151(_window.findChildByName("striketrough_total_currency_left"))).x = _loc2_ - 4;
         _loc5_.width = 4 + _loc4_.textWidth + 20;
         var _loc1_:ITextWindow = ITextWindow(_window.findChildByName("total_currency_value_right"));
         var _loc3_:int = _loc1_.x + _loc1_.width - _loc1_.textWidth;
         var _loc6_:class_3151;
         (_loc6_ = class_3151(_window.findChildByName("striketrough_total_currency_right"))).x = _loc3_ - 4;
         _loc6_.width = 4 + _loc1_.textWidth + 20;
      }
      
      private function setElementText(param1:String, param2:String) : void
      {
         _window.findChildByName(param1).caption = param2;
      }
      
      private function setElementBitmap(param1:String, param2:String) : void
      {
         var _loc4_:class_3282 = class_3282(_window.findChildByName(param1));
         var _loc3_:BitmapData = BitmapData(_catalog.assets.getAssetByName(param2).content);
         HabboCatalogUtils.replaceCenteredImage(_loc4_,_loc3_);
      }
      
      private function setIconStyle(param1:String, param2:int) : void
      {
         var _loc3_:class_3127 = _window.findChildByName(param1);
         _loc3_.style = class_3244.getIconStyleFor(param2,_catalog,false);
      }
      
      private function setLeftColumnVisibility(param1:Boolean) : void
      {
         var _loc2_:* = ["discount_currency_icon_left","discount_currency_value_left","total_currency_icon_left","striketrough_total_currency_left","total_currency_value_left"];
         for each(var _loc3_ in _loc2_)
         {
            _window.findChildByName(_loc3_).visible = param1;
         }
      }
      
      private function startSplashAnimation() : void
      {
         var _loc1_:class_3282 = class_3282(_window.findChildByName("icon_splash_bitmap"));
         _loc1_.bitmap = new BitmapData(_loc1_.width,_loc1_.height,true,0);
         starAnimationTimerEvent(new TimerEvent("timer"));
         var_2539.start();
      }
      
      private function starAnimationTimerEvent(param1:TimerEvent) : void
      {
         var _loc2_:class_3282 = null;
         var _loc3_:IAsset = null;
         if(_window != null)
         {
            _loc2_ = class_3282(_window.findChildByName("icon_splash_bitmap"));
            _loc3_ = _catalog.assets.getAssetByName("bundle_discount_star_" + _starAnimationOffset);
            HabboCatalogUtils.replaceCenteredImage(_loc2_,BitmapData(_loc3_.content),BitmapDataAsset(_loc3_).rectangle);
            if(++_starAnimationOffset > 7)
            {
               _starAnimationOffset = 0;
            }
         }
      }
   }
}
