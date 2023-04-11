package com.sulake.habbo.catalog.targetedoffers.data
{
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.class_3229;
   import com.sulake.habbo.catalog.viewer.class_3284;
   import com.sulake.habbo.catalog.viewer.class_3318;
   import com.sulake.habbo.session.product.class_3200;
   import flash.utils.getTimer;
   import package_8.class_1615;
   
   public class TargetedOffer extends class_1615 implements class_3159
   {
      
      public static const const_991:int = 10;
       
      
      public function TargetedOffer(param1:class_1615 = null)
      {
         super(param1);
      }
      
      public function get offerId() : int
      {
         return 0;
      }
      
      public function get page() : class_3229
      {
         return null;
      }
      
      public function set page(param1:class_3229) : void
      {
      }
      
      public function get priceType() : String
      {
         return "";
      }
      
      public function get product() : class_3169
      {
         return null;
      }
      
      public function get productContainer() : class_3318
      {
         return null;
      }
      
      public function get gridItem() : class_3284
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return "";
      }
      
      public function get bundlePurchaseAllowed() : Boolean
      {
         return false;
      }
      
      public function get isRentOffer() : Boolean
      {
         return false;
      }
      
      public function get giftable() : Boolean
      {
         return false;
      }
      
      public function get pricingModel() : String
      {
         return "";
      }
      
      public function get previewCallbackId() : int
      {
         return 0;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
      }
      
      public function get clubLevel() : int
      {
         return 0;
      }
      
      public function get badgeCode() : String
      {
         return "";
      }
      
      public function get localizationName() : String
      {
         return "";
      }
      
      public function get localizationDescription() : String
      {
         return "";
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function isExpired() : Boolean
      {
         return _expirationTime > 0 && getSecondsRemaining() <= 0;
      }
      
      public function getSecondsRemaining() : int
      {
         var _loc1_:uint = (_expirationTime - getTimer()) / 1000 - 10;
         return Math.max(0,_loc1_);
      }
      
      public function checkPurseBalance(param1:class_3160, param2:int) : Boolean
      {
         if(!param1 || param1.credits < var_342 * param2)
         {
            return false;
         }
         if(param1.getActivityPointsForType(var_349) < var_538 * param2)
         {
            return false;
         }
         return true;
      }
      
      public function getLocalizedSubProductNames(param1:IHabboCatalog) : Vector.<String>
      {
         var _loc4_:class_3200 = null;
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         for each(var _loc3_ in var_236)
         {
            _loc4_ = param1.getProductData(_loc3_);
            _loc2_.push(!!_loc4_ ? _loc4_.name : _loc3_);
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
      }
   }
}
