package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.localization.class_18;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   import package_8.class_1542;
   
   public class ClubExtendConfirmationDialog
   {
      
      private static const CREDIT_IMAGE_COUNT:int = 7;
      
      private static const YOUR_PRICE_ICON_BITMAP_ELEMENT_NAME:String = "your_price_icon_left";
      
      private static const const_1087:String = "${image.library.catalogue.url}catalogue/vip_extend_tsr.png";
      
      private static const TEASER_IMAGE_MIME_TYPE:String = "image/png";
      
      private static const ANIMATION_TRIGGER_INTERVAL:int = 2000;
      
      private static const const_1009:int = 75;
      
      private static const LINK_COLOR_DEFAULT:uint = 0;
      
      private static const LINK_COLOR_HOVER:uint = 9552639;
       
      
      private var var_282:com.sulake.habbo.catalog.club.ClubExtendController;
      
      private var var_1430:class_3281;
      
      private var _offer:class_1542;
      
      private var _maybeLaterRegion:IRegionWindow;
      
      private var var_2161:ITextWindow;
      
      private var var_1904:class_3282;
      
      private var var_2141:Vector.<BitmapData>;
      
      private var var_2308:Timer;
      
      private var var_1884:Timer;
      
      private var _animationFrame:int = 0;
      
      private var var_2833:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var _localizationKey:String = "catalog.club.extend.";
      
      public function ClubExtendConfirmationDialog(param1:com.sulake.habbo.catalog.club.ClubExtendController, param2:class_1542)
      {
         super();
         var_282 = param1;
         _offer = param2;
         var_2141 = new Vector.<BitmapData>(7);
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         if(_disposed)
         {
            return;
         }
         _offer = null;
         var_282 = null;
         clearAnimation();
         if(_maybeLaterRegion)
         {
            _maybeLaterRegion.removeEventListener("WME_OUT",onMouseOutLaterRegion);
            _maybeLaterRegion.removeEventListener("WME_OVER",onMouseOverLaterRegion);
            _maybeLaterRegion = null;
         }
         if(var_2161)
         {
            var_2161 = null;
         }
         if(var_1904)
         {
            var_1904 = null;
         }
         if(var_2141)
         {
            while(_loc1_ < 7)
            {
               var_2141[_loc1_].dispose();
               var_2141[_loc1_] = null;
               _loc1_++;
            }
            var_2141 = null;
         }
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         _disposed = true;
      }
      
      public function showConfirmation() : void
      {
         var _loc10_:IIconWindow = null;
         var _loc11_:String = null;
         var _loc8_:int = 0;
         var _loc6_:BitmapDataAsset = null;
         var _loc12_:BitmapData = null;
         if(!_offer || !var_282 || _disposed)
         {
            return;
         }
         var_1430 = createWindow("club_extend_confirmation") as class_3281;
         if(!var_1430)
         {
            return;
         }
         var_1430.procedure = windowEventHandler;
         var_1430.center();
         if(true)
         {
            _localizationKey += "basic.";
            if(_loc10_ = var_1430.findChildByName("club_level_icon") as IIconWindow)
            {
               _loc10_.style = 17;
               _loc10_.x += 15;
            }
         }
         var _loc3_:class_18 = var_282.localization;
         var_1430.findChildByName("normal_price_price_left").caption = _offer.originalPrice.toString();
         var_1430.findChildByName("normal_price_price_right").caption = _offer.originalActivityPointPrice.toString();
         var_1430.findChildByName("you_save_price_left").caption = _offer.discountCreditAmount.toString();
         var_1430.findChildByName("you_save_price_right").caption = _offer.discountActivityPointAmount.toString();
         var_1430.findChildByName("your_price_price_left").caption = _offer.priceCredits.toString();
         var_1430.findChildByName("your_price_price_right").caption = _offer.priceActivityPoints.toString();
         var_1430.title.caption = _loc3_.getLocalization(_localizationKey + "confirm.caption");
         var_1430.findChildByName("extend_title").caption = _loc3_.getLocalization(_localizationKey + "confirm.title");
         var_1430.findChildByName("normal_price_label").caption = _loc3_.getLocalization(_localizationKey + "normal.label");
         var_1430.findChildByName("you_save_label").caption = _loc3_.getLocalization(_localizationKey + "save.label");
         var_1430.findChildByName("your_price_label").caption = _loc3_.getLocalization(_localizationKey + "price.label");
         var_1430.findChildByName("buy_now_button").caption = _loc3_.getLocalization(_localizationKey + "buy.button");
         var_1430.findChildByName("maybe_later_link").caption = _loc3_.getLocalization(_localizationKey + "later.link");
         if(false)
         {
            _loc3_.registerParameter(_localizationKey + "expiration_days_left","day",_offer.subscriptionDaysLeft.toString());
            _loc3_.registerParameter(_localizationKey + "expiration_days_left","duration",0.toString());
            _loc11_ = String(_loc3_.getLocalization(_localizationKey + "expiration_days_left"));
         }
         else
         {
            _loc11_ = String(_loc3_.getLocalization(_localizationKey + "expires_today"));
         }
         var_1430.findChildByName("offer_expiration").caption = _loc11_;
         _maybeLaterRegion = var_1430.findChildByName("maybe_later_region") as IRegionWindow;
         var_2161 = var_1430.findChildByName("maybe_later_link") as ITextWindow;
         if(!_maybeLaterRegion || !var_2161)
         {
            return;
         }
         _maybeLaterRegion.addEventListener("WME_OUT",onMouseOutLaterRegion);
         _maybeLaterRegion.addEventListener("WME_OVER",onMouseOverLaterRegion);
         var _loc5_:BitmapData = getBitmapDataFromAsset("icon_credit_0");
         setElementBitmapData("normal_price_icon_left",_loc5_);
         setElementBitmapData("you_save_icon_left",_loc5_);
         setActivityPointIconStyle("normal_price_icon_right");
         setActivityPointIconStyle("you_save_icon_right");
         setActivityPointIconStyle("your_price_icon_right");
         var _loc1_:class_3282 = var_1430.findChildByName("club_teaser") as class_3282;
         _loc1_.x = 1;
         _loc1_.y = -144;
         _loc1_.height = 144;
         _loc1_.width = 133;
         var _loc7_:String = String(var_282.config.interpolate("${image.library.catalogue.url}catalogue/vip_extend_tsr.png"));
         if(false)
         {
            _loc7_ = String(var_282.config.updateUrlProtocol(_loc7_));
         }
         loadAssetFromUrl("club_teaser","club_teaser",_loc7_,"image/png",onTeaserLoaded);
         var _loc9_:IItemListWindow;
         if(!(_loc9_ = var_1430.findChildByName("itemlist_vertical") as IItemListWindow))
         {
            return;
         }
         var _loc4_:class_3151;
         if(!(_loc4_ = var_1430.findChildByName("total_amount_line") as class_3151))
         {
            return;
         }
         var _loc2_:class_3151 = var_1430.findChildByName("background_container") as class_3151;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.height = _loc9_.y + _loc4_.height + _loc4_.y;
         var_1904 = var_1430.findChildByName("your_price_icon_left") as class_3282;
         if(var_1904 == null)
         {
            return;
         }
         _loc8_ = 0;
         while(_loc8_ < 7)
         {
            _loc12_ = (_loc6_ = var_282.assets.getAssetByName("icon_credit_" + _loc8_) as BitmapDataAsset).content as BitmapData;
            var_2141[_loc8_] = _loc12_.clone();
            _loc8_++;
         }
         startAnimation();
      }
      
      private function setActivityPointIconStyle(param1:String) : void
      {
         var _loc2_:class_3127 = var_1430.findChildByName(param1);
         _loc2_.style = class_3244.getIconStyleFor(_offer.originalActivityPointType,var_282.config,true);
      }
      
      private function onMouseOutLaterRegion(param1:WindowMouseEvent) : void
      {
         if(var_2161)
         {
            var_2161.textColor = 0;
         }
      }
      
      private function onMouseOverLaterRegion(param1:WindowMouseEvent) : void
      {
         if(var_2161)
         {
            var_2161.textColor = 9552639;
         }
      }
      
      private function startAnimation() : void
      {
         if(var_2308)
         {
            clearAnimation();
         }
         setAnimationFrame();
         var_2308 = new Timer(2000);
         var_2308.addEventListener("timer",onAnimationTrigger);
         var_2308.start();
      }
      
      private function clearAnimation() : void
      {
         _animationFrame = 0;
         var_2833 = 0;
         if(var_1884)
         {
            var_1884.stop();
            var_1884 = null;
         }
         if(var_2308)
         {
            var_2308.stop();
            var_2308 = null;
         }
      }
      
      private function setAnimationFrame() : void
      {
         if(!var_1904)
         {
            return;
         }
         if(false)
         {
            var_1904.bitmap.dispose();
         }
         if(_animationFrame < 7)
         {
            var_1904.bitmap = new BitmapData(var_1904.width,var_1904.height,true,0);
            var_1904.bitmap.copyPixels(var_2141[_animationFrame],var_2141[_animationFrame].rect,new Point(0,0));
         }
         else
         {
            class_14.log("Animation frame " + _animationFrame);
         }
      }
      
      private function startAnimationFrame() : void
      {
         var_1884 = new Timer(75,6);
         var_1884.addEventListener("timer",onAnimationFrame);
         var_1884.addEventListener("timerComplete",onAnimationFrameComplete);
         var_1884.start();
      }
      
      private function onAnimationTrigger(param1:TimerEvent) : void
      {
         startAnimationFrame();
      }
      
      private function onAnimationFrame(param1:TimerEvent) : void
      {
         _animationFrame += 1;
         setAnimationFrame();
      }
      
      private function onAnimationFrameComplete(param1:TimerEvent) : void
      {
         if(var_1884)
         {
            var_1884.stop();
            var_1884 = null;
         }
         _animationFrame = 0;
         setAnimationFrame();
         if(var_2833 == 0)
         {
            var_2833 = 1;
            startAnimationFrame();
         }
         else
         {
            var_2833 = 0;
         }
      }
      
      private function getBitmapDataFromAsset(param1:String) : BitmapData
      {
         var _loc2_:BitmapDataAsset = var_282.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return _loc2_.content as BitmapData;
         }
         return null;
      }
      
      private function setElementBitmapData(param1:String, param2:BitmapData) : void
      {
         var _loc3_:class_3282 = var_1430.findChildByName(param1) as class_3282;
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
         }
         if(param2 != null && _loc3_ != null)
         {
            if(_loc3_.width != param2.width)
            {
               _loc3_.width = param2.width;
            }
            if(_loc3_.height != param2.height)
            {
               _loc3_.height = param2.height;
            }
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
      }
      
      private function loadAssetFromUrl(param1:String, param2:String, param3:String, param4:String, param5:Function) : Boolean
      {
         var _loc8_:BitmapData;
         if((_loc8_ = getBitmapDataFromAsset(param2)) != null)
         {
            setElementBitmapData(param1,_loc8_);
            return true;
         }
         var _loc6_:URLRequest = new URLRequest(param3);
         var _loc7_:AssetLoaderStruct;
         if(!(_loc7_ = var_282.assets.loadAssetFromFile(param2,_loc6_,param4)))
         {
            return false;
         }
         _loc7_.addEventListener("AssetLoaderEventComplete",param5);
         return true;
      }
      
      private function onTeaserLoaded(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = null;
         var _loc3_:BitmapData = null;
         if(!_disposed)
         {
            _loc2_ = param1.target as AssetLoaderStruct;
            if(_loc2_ != null)
            {
               _loc3_ = getBitmapDataFromAsset(_loc2_.assetName);
               setElementBitmapData("club_teaser",_loc3_);
            }
         }
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(!param1 || !param2 || !var_282 || !_offer || _disposed)
         {
            return;
         }
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "buy_now_button":
               var_282.confirmSelection();
               break;
            case "header_button_close":
            case "maybe_later_region":
               var_282.closeConfirmation();
         }
      }
      
      private function createWindow(param1:String) : class_3127
      {
         if(!var_282 || true || true || _disposed)
         {
            return null;
         }
         var _loc3_:XmlAsset = var_282.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc3_ || !_loc3_.content)
         {
            return null;
         }
         var _loc2_:XML = _loc3_.content as XML;
         if(!_loc2_)
         {
            return null;
         }
         return var_282.windowManager.buildFromXML(_loc2_);
      }
   }
}
