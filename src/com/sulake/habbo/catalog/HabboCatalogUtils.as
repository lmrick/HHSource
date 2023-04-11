package com.sulake.habbo.catalog
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.club.VipBenefitsWindow;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import package_8.class_1535;
   
   public class HabboCatalogUtils implements class_13, class_3158
   {
      
      private static const PRICE_CREDIT:String = "credit";
      
      private static const PRICE_ACTIVITY_POINT:String = "activityPoint";
       
      
      private var BADGE_WIDGET_NAME:String = "HCU_dynamic_badge";
      
      private var _disposed:Boolean = false;
      
      private var _catalog:com.sulake.habbo.catalog.HabboCatalog;
      
      private var var_2481:VipBenefitsWindow;
      
      private var var_3164:Array;
      
      private var var_3306:int;
      
      private var _productBitmapWrappers:Dictionary;
      
      private var var_4122:Boolean = false;
      
      private var var_3825:Boolean = false;
      
      private var var_4156:Boolean = false;
      
      public function HabboCatalogUtils(param1:com.sulake.habbo.catalog.HabboCatalog)
      {
         var_3164 = new Array(0);
         _productBitmapWrappers = new Dictionary();
         super();
         _catalog = param1;
      }
      
      public static function buildersClub(param1:String) : Boolean
      {
         return param1.indexOf("builders_club") == 0 || param1.indexOf("loyalty_bc") == 0;
      }
      
      public static function replaceCenteredImage(param1:class_3282, param2:BitmapData, param3:Rectangle = null) : void
      {
         if(!param1.bitmap)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
         else
         {
            param1.bitmap.fillRect(param1.bitmap.rect,0);
         }
         var _loc5_:BitmapData = param1.bitmap;
         var _loc4_:Rectangle = param3 != null ? param3 : param2.rect;
         _loc5_.copyPixels(param2,_loc4_,new Point((_loc5_.width - _loc4_.width) / 2,(_loc5_.height - _loc4_.height) / 2),null,null,true);
         param1.invalidate();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_2481 != null)
            {
               var_2481.dispose();
               var_2481 = null;
            }
            _catalog = null;
            _productBitmapWrappers = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function createWindow(param1:String, param2:uint = 1, param3:class_24 = null) : class_3127
      {
         var _loc5_:* = null;
         var _loc6_:class_3282 = null;
         if(true || true)
         {
            return null;
         }
         var _loc9_:XmlAsset;
         if((_loc9_ = _catalog.assets.getAssetByName(param1) as XmlAsset) == null || _loc9_.content == null)
         {
            return null;
         }
         var _loc4_:class_3151;
         var _loc8_:class_3127;
         if((_loc4_ = (_loc8_ = _catalog.windowManager.buildFromXML(_loc9_.content as XML,param2,param3)) as class_3151) != null)
         {
            _loc5_ = [];
            _loc4_.groupChildrenWithTag("bitmap",_loc5_,-1);
            for each(var _loc7_ in _loc5_)
            {
               if((_loc6_ = _loc7_ as class_3282) != null)
               {
                  _loc6_.disposesBitmap = false;
                  setCatalogItemImage(_loc6_,_loc6_.bitmapAssetName);
               }
            }
         }
         return _loc8_;
      }
      
      public function showPriceInContainer(param1:class_3151, param2:class_3159, param3:int = 1, param4:Boolean = false, param5:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc6_:Array = getPriceArray(param2,param3,param4);
         renderPriceInContainer(param1,_loc6_,param4,param5,false);
      }
      
      private function renderPriceInContainer(param1:class_3151, param2:Array, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc7_:IItemListWindow;
         if((_loc7_ = createPriceContainer(param1)) == null)
         {
            return;
         }
         _loc6_ = 0;
         while(_loc6_ < param2.length)
         {
            renderPriceItem(_loc7_,_loc6_,param2[_loc6_],param3,param4,param5);
            _loc6_++;
         }
         var _loc8_:int = _loc6_ * 2;
         while(_loc7_.numListItems > _loc8_)
         {
            _loc7_.removeListItemAt(_loc8_);
         }
         param1.addChild(_loc7_);
      }
      
      private function renderPriceItem(param1:IItemListWindow, param2:int, param3:Object, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         var _loc7_:ITextWindow = param1.getListItemByName("amount_" + param2) as ITextWindow;
         var _loc8_:class_3127 = param1.getListItemByName("unit_" + param2);
         _loc7_.text = param6 ? "" : (param2 > 0 ? "+ " : "") + param3.amount;
         _loc8_.style = class_3244.getIconStyleFor(param3.unit,_catalog,true,param5);
         _loc8_.width = param4 && param5 ? 53 : 22;
      }
      
      private function createPriceContainer(param1:class_3151) : IItemListWindow
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IItemListWindow = createWindow("price_display") as IItemListWindow;
         if(_loc2_ == null)
         {
            return null;
         }
         while(param1.numChildren > 0)
         {
            param1.removeChildAt(0).dispose();
         }
         return _loc2_;
      }
      
      private function getPriceArray(param1:class_3159, param2:int, param3:Boolean) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = -1;
         var _loc4_:* = [];
         if(param1.priceInCredits > 0)
         {
            _loc6_ = calculateBundlePrice(param1.bundlePurchaseAllowed,param1.priceInCredits,param2);
            _loc5_ = int(param3 ? _catalog.getSeasonalCurrencyActivityPointType() : -1);
            _loc4_.push({
               "amount":_loc6_,
               "unit":_loc5_
            });
         }
         if(param1.priceInActivityPoints > 0)
         {
            _loc6_ = calculateBundlePrice(param1.bundlePurchaseAllowed,param1.priceInActivityPoints,param2);
            _loc4_.push({
               "amount":_loc6_,
               "unit":param1.activityPointType
            });
         }
         if(_loc4_.length == 0)
         {
            _loc4_.push({
               "amount":0,
               "unit":-1
            });
         }
         return _loc4_;
      }
      
      public function getPriceMap(param1:class_3159, param2:int) : class_24
      {
         var _loc4_:int = 0;
         var _loc3_:class_24 = new class_24();
         if(param1.priceInCredits > 0)
         {
            _loc4_ = calculateBundlePrice(param1.bundlePurchaseAllowed,param1.priceInCredits,param2);
            _loc3_.add("credit",{"amount":_loc4_});
         }
         if(param1.priceInActivityPoints > 0)
         {
            _loc4_ = calculateBundlePrice(param1.bundlePurchaseAllowed,param1.priceInActivityPoints,param2);
            _loc3_.add("activityPoint",{
               "amount":_loc4_,
               "activityPointType":param1.activityPointType
            });
         }
         if(_loc3_.length == 0)
         {
            _loc3_.add("credit",{"amount":0});
         }
         return _loc3_;
      }
      
      public function showPriceOnProduct(param1:class_3159, param2:class_3151, param3:class_3127, param4:class_3127, param5:int, param6:Boolean, param7:int, param8:Boolean = false, param9:Boolean = false) : class_3127
      {
         var _loc10_:* = null;
         if(param3 != null)
         {
            param2.removeChild(param3);
            param3.dispose();
         }
         if(false)
         {
            return null;
         }
         param3 = _catalog.utils.createWindow("priceDisplayWidget");
         param2.addChild(param3);
         var _loc11_:class_3151;
         if((_loc11_ = param2.findChildByName("price_box_new") as class_3151) != null)
         {
            _catalog.utils.showPriceInContainer(_loc11_,param1,1,param8,param9);
            if((_loc10_ = param2.findChildByName("room_canvas_container")) == null)
            {
               _loc10_ = param4;
            }
            if(_loc10_ != null)
            {
               param3.x = _loc10_.x + _loc10_.width + param5 - param3.width;
               if(param6)
               {
                  param3.y = _loc10_.y + param7;
               }
               else
               {
                  param3.y = _loc10_.y + _loc10_.height - (param3.height + param7);
               }
            }
            if(param1.priceInActivityPoints == 0)
            {
               param3.color = 14992765;
            }
            if(param1.priceInCredits == 0)
            {
               switch(param1.activityPointType)
               {
                  case 0:
                     param3.color = 11257559;
                     break;
                  default:
                     param3.color = 9032648;
               }
            }
         }
         return param3;
      }
      
      public function showBadgeOnProduct(param1:String, param2:class_3151, param3:int, param4:int, param5:Boolean = true, param6:Boolean = true) : void
      {
         var _loc8_:class_3151;
         if((_loc8_ = param2.findChildByName(BADGE_WIDGET_NAME) as class_3151) == null)
         {
            (_loc8_ = createWindow("badgeDisplayWidget") as class_3151).name = BADGE_WIDGET_NAME;
         }
         IStaticBitmapWrapperWindow(_loc8_.findChildByName("asset_image")).assetUri = "catalogue_badge_background";
         var _loc9_:class_3217;
         var _loc7_:class_3366 = (_loc9_ = _loc8_.findChildByName("badge_image") as class_3217).widget as class_3366;
         _loc9_.visible = true;
         _loc7_.badgeId = param1;
         param2.addChild(_loc8_);
         _loc8_.x = param6 ? param3 : param2.width - _loc8_.width - param3;
         _loc8_.y = param5 ? param4 : param2.height - _loc8_.height - param4;
      }
      
      public function hideBadgeFromProduct(param1:class_3151) : void
      {
         var _loc2_:class_3151 = param1.findChildByName(BADGE_WIDGET_NAME) as class_3151;
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
         }
      }
      
      public function showAssetImageAsBadgeOnProduct(param1:String, param2:class_3151, param3:int, param4:int, param5:Boolean = true, param6:Boolean = true) : void
      {
         var _loc7_:class_3151;
         if((_loc7_ = param2.findChildByName(BADGE_WIDGET_NAME) as class_3151) == null)
         {
            (_loc7_ = createWindow("badgeDisplayWidget") as class_3151).name = BADGE_WIDGET_NAME;
         }
         _loc7_.findChildByName("badge_image").visible = false;
         IStaticBitmapWrapperWindow(_loc7_.findChildByName("badge_image")).assetUri = param1;
         param2.addChild(_loc7_);
         _loc7_.x = param6 ? param3 : param2.width - _loc7_.width - param3;
         _loc7_.y = param5 ? param4 : param2.height - _loc7_.height - param4;
      }
      
      public function setCatalogItemImage(param1:class_3282, param2:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc6_:IAsset;
         if((_loc6_ = _catalog.assets.getAssetByName(param2)) == null)
         {
            return;
         }
         var _loc3_:BitmapData = _loc6_.content as BitmapData;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1.bitmap != null)
         {
            param1.bitmap.dispose();
            param1.bitmap = null;
         }
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
         var _loc4_:int = (param1.width - _loc3_.width) * 0.5;
         var _loc5_:int = (param1.height - _loc3_.height) * 0.5;
         param1.bitmap.draw(_loc3_,new Matrix(1,0,0,1,_loc4_,_loc5_));
      }
      
      public function showVipBenefits() : void
      {
         if(_catalog.getBoolean("catalog.vip.benefits.enabled"))
         {
            if(var_2481 == null || false)
            {
               var_2481 = new VipBenefitsWindow(_catalog);
            }
         }
         else
         {
            openLink(_catalog.getProperty("link.format.club"));
         }
      }
      
      public function openLink(param1:String) : void
      {
         if(param1 != "")
         {
            _catalog.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLinkAlertClose);
            HabboWebTools.openWebPage(param1,"habboMain");
         }
      }
      
      private function onExternalLinkAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      public function calculateBundlePrice(param1:Boolean, param2:int, param3:int) : int
      {
         return param2 * param3;
      }
      
      public function getDiscountItemsCount(param1:int) : int
      {
         var _loc2_:int = getBasicBundleDiscountSize(param1);
         _loc2_ += getBonusBundleDiscountSize(param1);
         return _loc2_ + getThresholdBundleDiscountSize(param1);
      }
      
      private function getBasicBundleDiscountSize(param1:int) : int
      {
         var _loc3_:class_1535 = _catalog.bundleDiscountRuleset;
         if(!_loc3_ || _loc3_.bundleSize <= 0)
         {
            return 0;
         }
         var _loc2_:int = param1 / _loc3_.bundleSize;
         return _loc2_ * _loc3_.bundleDiscountSize;
      }
      
      private function getBonusBundleDiscountSize(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:class_1535 = _catalog.bundleDiscountRuleset;
         if(!_loc3_ || _loc3_.bundleSize <= 0)
         {
            return 0;
         }
         var _loc2_:int = param1 / _loc3_.bundleSize;
         if(_loc2_ >= _loc3_.bonusThreshold)
         {
            if((_loc4_ = param1 % _loc3_.bundleSize) == _loc3_.bundleSize - 1)
            {
               _loc5_++;
            }
            _loc5_ += _loc2_ - _loc3_.bonusThreshold;
         }
         return _loc5_;
      }
      
      private function getThresholdBundleDiscountSize(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc2_:class_1535 = _catalog.bundleDiscountRuleset;
         if(_loc2_)
         {
            for each(var _loc3_ in _loc2_.additionalBonusDiscountThresholdQuantities)
            {
               if(param1 >= _loc3_)
               {
                  _loc4_++;
               }
            }
         }
         return _loc4_;
      }
      
      public function get bundleDiscountFlatPriceSteps() : Array
      {
         return var_3164;
      }
      
      public function get bundleDiscountHighestFlatPriceStep() : int
      {
         return var_3306;
      }
      
      public function resolveBundleDiscountFlatPriceSteps() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var_3164 = [];
         var_3306 = 0;
         _loc1_ = 0;
         while(_loc1_ < 99)
         {
            _loc2_ = calculateBundlePrice(true,1,_loc1_);
            _loc3_ = calculateBundlePrice(true,1,_loc1_ + 1);
            if(_loc2_ == _loc3_)
            {
               var_3164.push(_loc1_);
               var_3306 = _loc1_;
            }
            _loc1_++;
         }
      }
      
      public function spinnerValueChangedEventTrack() : void
      {
         if(!var_4122)
         {
            HabboTracking.getInstance().trackEventLog("Catalog","spinnerValueChanged","client.bundle.discounts");
            var_4122 = true;
         }
      }
      
      public function bundlesInfoShownEventTrack() : void
      {
         if(!var_3825)
         {
            HabboTracking.getInstance().trackEventLog("Catalog","bundlesInfoOpened","client.bundle.discounts");
            var_3825 = true;
         }
      }
      
      public function discountShownEventTrack() : void
      {
         if(!var_4156)
         {
            HabboTracking.getInstance().trackEventLog("Catalog","discountItemShown","client.bundle.discounts");
            var_4156 = true;
         }
      }
      
      public function displayProductIcon(param1:String, param2:int, param3:class_3282) : void
      {
         var _loc4_:class_3266 = null;
         var _loc5_:* = undefined;
         if(_catalog == null)
         {
            return;
         }
         switch(param1)
         {
            case "s":
               _loc4_ = _catalog.roomEngine.getFurnitureIcon(param2,this);
               break;
            case "i":
               _loc4_ = _catalog.roomEngine.getWallItemIcon(param2,this);
               break;
            case "e":
               param3.bitmap = _catalog.getPixelEffectIcon(param2);
               break;
            case "h":
               param3.bitmap = _catalog.getSubscriptionProductIcon(param2);
         }
         if(_loc4_ != null)
         {
            param3.bitmap = _loc4_.data;
            if(_loc4_.id != 0)
            {
               if((_loc5_ = _productBitmapWrappers[_loc4_.id]) == null)
               {
                  _loc5_ = new Vector.<class_3282>(0);
                  _productBitmapWrappers[_loc4_.id] = _loc5_;
               }
               _loc5_.push(param3);
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:Vector.<class_3282> = _productBitmapWrappers[param1];
         if(_loc3_ == null)
         {
            return;
         }
         for each(var _loc4_ in _loc3_)
         {
            _loc4_.bitmap = param2;
         }
         delete _productBitmapWrappers[param1];
      }
      
      public function imageFailed(param1:int) : void
      {
      }
   }
}
