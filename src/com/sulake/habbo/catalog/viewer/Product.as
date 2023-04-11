package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.widgets.BundleGridViewCatalogWidget;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import flash.display.BitmapData;
   
   public class Product extends ProductGridItem implements class_3169, class_3158
   {
      
      public static const EFFECT_CLASSID_NINJA_DISAPPEAR:int = 108;
       
      
      private var var_358:String;
      
      private var var_531:int;
      
      private var var_388:String;
      
      private var var_516:int;
      
      private var var_1008:class_3200;
      
      private var var_1807:class_3148;
      
      private var var_3983:Boolean;
      
      private var var_1231:int;
      
      private var var_751:int;
      
      private var var_1685:com.sulake.habbo.catalog.viewer.class_3318;
      
      public function Product(param1:String, param2:int, param3:String, param4:int, param5:class_3200, param6:class_3148, param7:HabboCatalog, param8:Boolean = false, param9:int = 0, param10:int = 0)
      {
         super(param7);
         var_358 = param1;
         var_531 = param2;
         var_388 = param3;
         var_516 = param4;
         var_1008 = param5;
         var_1807 = param6;
         var_3983 = param8;
         var_1231 = param9;
         var_751 = param10;
      }
      
      public static function stripAddonProducts(param1:Vector.<class_3169>) : Vector.<class_3169>
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            return param1;
         }
         var _loc3_:Vector.<class_3169> = new Vector.<class_3169>(0);
         for each(_loc2_ in param1)
         {
            if(_loc2_.productType != "b" && !(_loc2_.productType == "e" && _loc2_.productClassId == 108))
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
      
      public function get productType() : String
      {
         return var_358;
      }
      
      public function get productClassId() : int
      {
         return var_531;
      }
      
      public function set extraParam(param1:String) : void
      {
         var_388 = param1;
      }
      
      public function get extraParam() : String
      {
         return var_388;
      }
      
      public function get productCount() : int
      {
         return var_516;
      }
      
      public function get productData() : class_3200
      {
         return var_1008;
      }
      
      public function get furnitureData() : class_3148
      {
         return var_1807;
      }
      
      public function get isUniqueLimitedItem() : Boolean
      {
         return var_3983;
      }
      
      public function get uniqueLimitedItemSeriesSize() : int
      {
         return var_1231;
      }
      
      public function get uniqueLimitedItemsLeft() : int
      {
         return var_751;
      }
      
      public function set uniqueLimitedItemsLeft(param1:int) : void
      {
         var_751 = param1;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_358 = "";
         var_531 = 0;
         var_388 = "";
         var_516 = 0;
         var_1008 = null;
         var_1807 = null;
         if(catalog && false)
         {
            catalog.sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY",onBadgeImageReady);
         }
         super.dispose();
      }
      
      public function initIcon(param1:com.sulake.habbo.catalog.viewer.class_3318, param2:class_3158 = null, param3:class_1870 = null, param4:class_3159 = null, param5:class_3282 = null, param6:IStuffData = null, param7:Function = null) : BitmapData
      {
         var _loc10_:IRoomEngine = null;
         var _loc8_:class_3266 = null;
         var _loc11_:String = null;
         if(disposed)
         {
            return null;
         }
         var _loc9_:BitmapData = null;
         if(param2 == null)
         {
            param2 = {};
         }
         if(param1 is BundleGridViewCatalogWidget)
         {
            _loc10_ = (param1 as BundleGridViewCatalogWidget).offer.page.viewer.roomEngine;
         }
         else
         {
            _loc10_ = (param1 as ProductContainer).offer.page.viewer.roomEngine;
         }
         if(!_loc10_ || !catalog)
         {
            return null;
         }
         switch(var_358)
         {
            case "s":
               _loc8_ = _loc10_.getFurnitureIcon(productClassId,param2,null,param6);
               break;
            case "i":
               if(param4 && var_1807)
               {
                  _loc11_ = "";
                  switch(var_1807.className)
                  {
                     case "floor":
                        _loc11_ = ["th",var_1807.className,param4.product.extraParam].join("_");
                        break;
                     case "wallpaper":
                        _loc11_ = ["th","wall",param4.product.extraParam].join("_");
                        break;
                     case "landscape":
                        _loc11_ = ["th",var_1807.className,param4.product.extraParam.replace(".","_"),"001"].join("_");
                        break;
                     default:
                        _loc8_ = _loc10_.getWallItemIcon(productClassId,param2,var_388);
                  }
                  catalog.setImageFromAsset(param5,_loc11_,param7);
                  break;
               }
               _loc8_ = _loc10_.getWallItemIcon(productClassId,param2,var_388);
               break;
            case "e":
               _loc9_ = catalog.getPixelEffectIcon(productClassId);
               if(param2 == this)
               {
                  this.setIconImage(_loc9_,true);
                  break;
               }
               break;
            case "h":
               _loc9_ = catalog.getSubscriptionProductIcon(productClassId);
               break;
            case "b":
               catalog.sessionDataManager.events.addEventListener("BIRE_BADGE_IMAGE_READY",onBadgeImageReady);
               _loc9_ = catalog.sessionDataManager.getBadgeImage(var_388);
               var_1685 = param1;
               break;
            case "r":
               _loc9_ = renderAvatarImage(var_388,param3);
               setIconImage(_loc9_,false);
               break;
            default:
               class_14.log("[Product] Can not yet handle this type of product: " + productType);
         }
         if(_loc8_ != null)
         {
            _loc9_ = _loc8_.data;
            if(param2 == this)
            {
               this.setIconImage(_loc9_,true);
            }
         }
         return _loc9_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(!disposed)
         {
            setIconImage(param2,true);
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(!disposed)
         {
            if(var_358 == "b" && param1.badgeId == var_388)
            {
               ProductGridItem(var_1685).setIconImage(param1.badgeImage,false);
               if(catalog && false)
               {
                  catalog.sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY",onBadgeImageReady);
               }
            }
         }
      }
      
      public function get isColorable() : Boolean
      {
         if(var_1807 && false)
         {
            return var_1807.fullName.indexOf("*") != -1;
         }
         return false;
      }
      
      override public function set view(param1:class_3151) : void
      {
         var _loc2_:class_3127 = null;
         var _loc3_:ITextWindow = null;
         if(!param1)
         {
            return;
         }
         super.view = param1;
         if(var_516 > 1)
         {
            _loc2_ = var_1430.findChildByName("multiContainer");
            if(_loc2_)
            {
               _loc2_.visible = true;
            }
            _loc3_ = var_1430.findChildByName("multiCounter") as ITextWindow;
            if(_loc3_)
            {
               _loc3_.text = "x" + productCount;
            }
         }
      }
   }
}
