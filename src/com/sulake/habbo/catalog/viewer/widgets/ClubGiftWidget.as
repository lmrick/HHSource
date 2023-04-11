package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.club.ClubGiftController;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.Product;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.class_3318;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_8.class_1409;
   import package_8.class_1539;
   import package_8.class_1608;
   
   public class ClubGiftWidget extends CatalogWidget implements class_3321
   {
       
      
      private var var_282:ClubGiftController;
      
      private var _offers:class_24;
      
      private var _preview:class_3151;
      
      private var _catalog:HabboCatalog;
      
      private const DAYS_IN_MONTH:int = 31;
      
      public function ClubGiftWidget(param1:class_3151, param2:ClubGiftController, param3:HabboCatalog)
      {
         super(param1);
         _catalog = param3;
         var_282 = param2;
         _offers = new class_24();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_282 = null;
         _catalog = null;
         if(_preview)
         {
            _preview.dispose();
            _preview = null;
         }
      }
      
      override public function init() : Boolean
      {
         if(!window)
         {
            return false;
         }
         if(!super.init())
         {
            return false;
         }
         var_282.widget = this;
         attachWidgetView("clubGiftWidget");
         _window.findChildByName("info_text").caption = "";
         _window.findChildByName("past_club_days").caption = "";
         _window.findChildByName("past_vip_days").caption = "";
         update();
         return true;
      }
      
      public function update() : void
      {
         updateInfo();
         updateList();
      }
      
      private function updateInfo() : void
      {
         var _loc6_:String = null;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         if(!var_282 || !window)
         {
            return;
         }
         var _loc7_:class_3127;
         if(!(_loc7_ = window.findChildByName("info_text")))
         {
            return;
         }
         if(false)
         {
            _loc6_ = "catalog.club_gift.available";
            var_282.localization.registerParameter(_loc6_,"amount",var_282.giftsAvailable.toString());
         }
         else if(false)
         {
            _loc6_ = "catalog.club_gift.days_until_next";
            var_282.localization.registerParameter(_loc6_,"days",var_282.daysUntilNextGift.toString());
         }
         else if(false)
         {
            _loc6_ = "catalog.club_gift.not_available";
         }
         else
         {
            _loc6_ = "catalog.club_gift.no_club";
         }
         _loc7_.caption = var_282.localization.getLocalization(_loc6_);
         if(true)
         {
            return;
         }
         var _loc2_:class_3127 = window.findChildByName("past_club_days");
         if(_loc2_)
         {
            _loc6_ = (_loc5_ = var_282.purse.pastClubDays + var_282.purse.pastVipDays) >= 31 ? "catalog.club_gift.past_club.long" : "catalog.club_gift.past_club";
            _loc4_ = _loc5_ % 31;
            _loc1_ = _loc5_ / 31;
            var_282.localization.registerParameter(_loc6_,"days",_loc4_.toString());
            var_282.localization.registerParameter(_loc6_,"months",_loc1_.toString());
            _loc2_.caption = var_282.localization.getLocalization(_loc6_);
         }
         var _loc3_:class_3127 = window.findChildByName("past_vip_days");
         if(_loc3_)
         {
            _loc6_ = var_282.purse.pastVipDays >= 31 ? "catalog.club_gift.past_vip.long" : "catalog.club_gift.past_vip";
            _loc4_ = var_282.purse.pastVipDays % 31;
            _loc1_ = var_282.purse.pastVipDays / 31;
            var_282.localization.registerParameter(_loc6_,"days",_loc4_.toString());
            var_282.localization.registerParameter(_loc6_,"months",_loc1_.toString());
            _loc3_.caption = var_282.localization.getLocalization(_loc6_);
         }
      }
      
      private function updateList() : void
      {
         var _loc1_:class_3159 = null;
         var _loc3_:class_3127 = null;
         var _loc11_:* = undefined;
         var _loc12_:class_3200 = null;
         var _loc9_:class_3148 = null;
         var _loc5_:Product = null;
         var _loc6_:class_1539 = null;
         if(!var_282 || !window || !page)
         {
            return;
         }
         for each(_loc1_ in _offers)
         {
            _loc1_.dispose();
         }
         _offers.reset();
         var _loc2_:Array = var_282.getOffers();
         if(!_loc2_)
         {
            return;
         }
         var _loc4_:class_24;
         if(!(_loc4_ = var_282.getGiftData()))
         {
            return;
         }
         var _loc10_:IItemListWindow;
         if(!(_loc10_ = window.findChildByName("gift_list") as IItemListWindow))
         {
            return;
         }
         _loc10_.destroyListItems();
         for each(var _loc7_ in _loc2_)
         {
            _loc11_ = new Vector.<class_3169>(0);
            _loc12_ = var_282.catalog.getProductData(_loc7_.localizationId);
            for each(var _loc8_ in _loc7_.products)
            {
               _loc9_ = var_282.catalog.getFurnitureData(_loc8_.furniClassId,_loc8_.productType);
               _loc5_ = new Product(_loc8_.productType,_loc8_.furniClassId,_loc8_.extraParam,_loc8_.productCount,_loc12_,_loc9_,_catalog);
               _loc11_.push(_loc5_);
            }
            _loc1_ = new Offer(_loc7_.offerId,_loc7_.localizationId,_loc7_.isRent,_loc7_.priceInCredits,_loc7_.priceInActivityPoints,_loc7_.activityPointType,_loc7_.giftable,_loc7_.clubLevel,_loc11_,_loc7_.bundlePurchaseAllowed,_catalog);
            _loc1_.page = page;
            _loc6_ = _loc4_.getValue(_loc1_.offerId) as class_1539;
            _loc3_ = createListItem(_loc1_,_loc6_);
            if(_loc3_)
            {
               _loc10_.addListItem(_loc3_);
               _offers.add(_loc1_.offerId,_loc1_);
            }
         }
      }
      
      private function createListItem(param1:class_3159, param2:class_1539) : class_3127
      {
         var _loc9_:int = 0;
         var _loc13_:String = null;
         var _loc8_:int = 0;
         var _loc12_:int = 0;
         if(!param1 || !param1.product || !param2)
         {
            return null;
         }
         var _loc3_:class_3151 = createWindow("club_gift_list_item") as class_3151;
         if(!_loc3_)
         {
            return null;
         }
         _loc3_.procedure = clickHandler;
         var _loc4_:class_3169;
         if(!(_loc4_ = param1.product))
         {
            return null;
         }
         var _loc6_:class_3200;
         if(!(_loc6_ = _loc4_.productData))
         {
            return null;
         }
         setText(_loc3_.findChildByName("gift_name"),_loc6_.name);
         setText(_loc3_.findChildByName("gift_desc"),_loc6_.description);
         if(param2.isVip)
         {
            _loc9_ = param2.daysRequired - var_282.purse.pastVipDays;
         }
         else
         {
            _loc9_ = param2.daysRequired - (var_282.purse.pastClubDays + var_282.purse.pastVipDays);
         }
         if(!param2.isSelectable && _loc9_ > 0)
         {
            if(param2.isVip)
            {
               _loc13_ = "catalog.club_gift.vip_missing";
            }
            else
            {
               _loc13_ = "catalog.club_gift.club_missing";
            }
            if(_loc9_ >= 31)
            {
               _loc13_ += ".long";
            }
            _loc8_ = _loc9_ % 31;
            _loc12_ = _loc9_ / 31;
            var_282.localization.registerParameter(_loc13_,"days",_loc8_.toString());
            var_282.localization.registerParameter(_loc13_,"months",_loc12_.toString());
         }
         else if(false)
         {
            _loc13_ = "catalog.club_gift.selectable";
         }
         else
         {
            _loc13_ = "";
         }
         setText(_loc3_.findChildByName("months_required"),_loc13_.length > 0 ? var_282.localization.getLocalization(_loc13_) : "");
         var _loc10_:IIconWindow;
         if(_loc10_ = _loc3_.findChildByName("vip_icon") as IIconWindow)
         {
            _loc10_.visible = param2.isVip;
         }
         var _loc11_:class_3140;
         if(_loc11_ = _loc3_.findChildByName("select_button") as class_3140)
         {
            if(param2.isSelectable && false)
            {
               _loc11_.enable();
            }
            else
            {
               _loc11_.disable();
            }
            _loc11_.id = param1.offerId;
         }
         var _loc7_:class_3318;
         if(!(_loc7_ = param1.productContainer))
         {
            return null;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return null;
         }
         var _loc5_:class_3151;
         if(_loc5_ = _loc3_.findChildByName("image_container") as class_3151)
         {
            _loc7_.view = _loc5_;
            _loc7_.initProductIcon(page.viewer.roomEngine);
            _loc5_.procedure = mouseOverHandler;
            _loc5_.id = param1.offerId;
         }
         return _loc3_;
      }
      
      private function setText(param1:class_3127, param2:String) : void
      {
         param1.caption = param2;
      }
      
      private function clickHandler(param1:class_3134, param2:class_3127) : void
      {
         if(!param1 || !param2 || !_offers || !var_282)
         {
            return;
         }
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(param2.name != "select_button")
         {
            return;
         }
         var _loc3_:class_3159 = _offers.getValue(param2.id);
         if(!_loc3_)
         {
            return;
         }
         var_282.selectGift(_loc3_);
      }
      
      private function mouseOverHandler(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:Rectangle = null;
         if(!param1 || !param2 || !_offers)
         {
            return;
         }
         if(param2.name != "image_container")
         {
            return;
         }
         var _loc3_:class_3159 = _offers.getValue(param2.id);
         if(!_loc3_)
         {
            return;
         }
         if(param1.type == "WME_OVER")
         {
            _loc4_ = new Rectangle();
            param2.getGlobalRectangle(_loc4_);
         }
         if(param1.type == "WME_OUT")
         {
            hidePreview();
         }
      }
      
      private function showPreview(param1:Offer, param2:Rectangle) : void
      {
         var _loc6_:class_3266 = null;
         if(!param1 || !param1.productContainer)
         {
            return;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return;
         }
         var _loc4_:class_3169;
         if(!(_loc4_ = param1.product))
         {
            return;
         }
         if(!_preview)
         {
            _preview = createWindow("club_gift_preview") as class_3151;
         }
         if(!_preview)
         {
            return;
         }
         var _loc3_:class_3282 = _preview.findChildByName("image") as class_3282;
         if(!_loc3_)
         {
            return;
         }
         switch(_loc4_.productType)
         {
            case "s":
               _loc6_ = page.viewer.roomEngine.getFurnitureImage(_loc4_.productClassId,new Vector3d(90),64,null,0,_loc4_.extraParam);
               break;
            case "i":
               _loc6_ = page.viewer.roomEngine.getWallItemImage(_loc4_.productClassId,new Vector3d(90),64,null,0,_loc4_.extraParam);
               break;
            default:
               return;
         }
         if(!_loc6_ || !_loc6_.data)
         {
            return;
         }
         _loc3_.width = _loc6_.data.width;
         _loc3_.height = _loc6_.data.height;
         if(_loc3_.bitmap)
         {
            _loc3_.bitmap.dispose();
         }
         _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height);
         _loc3_.bitmap.draw(_loc6_.data);
         _loc6_.data.dispose();
         var _loc5_:Point = Point.interpolate(param2.topLeft,param2.bottomRight,0.5);
         _preview.setGlobalPosition(_loc5_.subtract(new Point(0,0)));
         _preview.visible = true;
         _preview.activate();
      }
      
      private function hidePreview() : void
      {
         if(_preview)
         {
            _preview.visible = false;
         }
      }
      
      private function createWindow(param1:String) : class_3127
      {
         if(!var_282 || true || true)
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
