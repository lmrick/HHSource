package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   
   public class Offer implements class_3159
   {
      
      public static const PRICING_MODEL_UNKNOWN:String = "pricing_model_unknown";
      
      public static const PRICING_MODEL_SINGLE:String = "pricing_model_single";
      
      public static const PRICING_MODEL_MULTI:String = "pricing_model_multi";
      
      public static const PRICING_MODEL_BUNDLE:String = "pricing_model_bundle";
      
      public static const PRICING_MODEL_FURNI:String = "pricing_model_furniture";
      
      public static const PRICE_TYPE_NONE:String = "price_type_none";
      
      public static const PRICE_TYPE_CREDITS:String = "price_type_credits";
      
      public static const PRICE_TYPE_ACTIVITYPOINTS:String = "price_type_activitypoints";
      
      public static const PRICE_TYPE_CREDITS_AND_ACTIVITYPOINTS:String = "price_type_credits_and_activitypoints";
       
      
      private var var_2083:String;
      
      private var var_2346:String;
      
      private var _offerId:int;
      
      private var var_983:String;
      
      private var var_342:int;
      
      private var var_538:int;
      
      private var var_349:int;
      
      private var var_859:Boolean;
      
      private var var_4131:Boolean;
      
      private var var_1552:com.sulake.habbo.catalog.viewer.class_3229;
      
      private var var_1685:com.sulake.habbo.catalog.viewer.class_3318;
      
      private var _disposed:Boolean = false;
      
      private var var_689:int = 0;
      
      private var var_331:String;
      
      private var var_924:Boolean = false;
      
      private var _catalog:HabboCatalog;
      
      private var var_3233:int;
      
      public function Offer(param1:int, param2:String, param3:Boolean, param4:int, param5:int, param6:int, param7:Boolean, param8:int, param9:Vector.<class_3169>, param10:Boolean, param11:HabboCatalog)
      {
         super();
         _offerId = param1;
         var_983 = param2;
         var_4131 = param3;
         var_342 = param4;
         var_538 = param5;
         var_349 = param6;
         var_859 = param7;
         var_689 = param8;
         var_924 = param10;
         _catalog = param11;
         analyzePricingModel(param9);
         analyzePriceType();
         createProductContainer(param9);
         for each(var _loc12_ in param9)
         {
            if(_loc12_.productType == "b")
            {
               var_331 = _loc12_.extraParam;
               break;
            }
         }
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
      
      public function get page() : com.sulake.habbo.catalog.viewer.class_3229
      {
         return var_1552;
      }
      
      public function set page(param1:com.sulake.habbo.catalog.viewer.class_3229) : void
      {
         var_1552 = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get localizationId() : String
      {
         return var_983;
      }
      
      public function get priceInCredits() : int
      {
         return var_342;
      }
      
      public function get priceInActivityPoints() : int
      {
         return var_538;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
      
      public function get giftable() : Boolean
      {
         return var_859;
      }
      
      public function get productContainer() : com.sulake.habbo.catalog.viewer.class_3318
      {
         return var_1685;
      }
      
      public function get product() : class_3169
      {
         return !!var_1685 ? var_1685.firstProduct : null;
      }
      
      public function get gridItem() : class_3284
      {
         return var_1685 as class_3284;
      }
      
      public function get pricingModel() : String
      {
         return var_2083;
      }
      
      public function get priceType() : String
      {
         return var_2346;
      }
      
      public function get previewCallbackId() : int
      {
         return var_3233;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_3233 = param1;
      }
      
      public function get bundlePurchaseAllowed() : Boolean
      {
         return var_924;
      }
      
      public function get isRentOffer() : Boolean
      {
         return var_4131;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         _disposed = true;
         _offerId = 0;
         var_983 = "";
         var_342 = 0;
         var_538 = 0;
         var_349 = 0;
         var_1552 = null;
         _catalog = null;
         if(var_1685 != null)
         {
            var_1685.dispose();
            var_1685 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function createProductContainer(param1:Vector.<class_3169>) : void
      {
         switch(var_2083)
         {
            case "pricing_model_single":
               var_1685 = new SingleProductContainer(this,param1,_catalog);
               break;
            case "pricing_model_multi":
               var_1685 = new MultiProductContainer(this,param1,_catalog);
               break;
            case "pricing_model_bundle":
               var_1685 = new BundleProductContainer(this,param1,_catalog);
               break;
            default:
               var_1685 = new ProductContainer(this,param1,_catalog);
               class_14.log("[Offer] Unknown pricing model" + var_2083);
         }
      }
      
      private function analyzePricingModel(param1:Vector.<class_3169>) : void
      {
         var _loc2_:Vector.<class_3169> = Product.stripAddonProducts(param1);
         if(_loc2_.length == 1)
         {
            if(_loc2_[0].productCount == 1)
            {
               var_2083 = "pricing_model_single";
            }
            else
            {
               var_2083 = "pricing_model_multi";
            }
         }
         else if(_loc2_.length > 1)
         {
            var_2083 = "pricing_model_bundle";
         }
         else
         {
            var_2083 = "pricing_model_unknown";
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_342 > 0 && var_538 > 0)
         {
            var_2346 = "price_type_credits_and_activitypoints";
         }
         else if(var_342 > 0)
         {
            var_2346 = "price_type_credits";
         }
         else if(var_538 > 0)
         {
            var_2346 = "price_type_activitypoints";
         }
         else
         {
            var_2346 = "price_type_none";
         }
      }
      
      public function clone() : Offer
      {
         var _loc4_:class_3148 = null;
         var _loc2_:Product = null;
         var _loc5_:Vector.<class_3169> = new Vector.<class_3169>(0);
         var _loc6_:class_3200 = _catalog.getProductData(localizationId);
         for each(var _loc3_ in var_1685.products)
         {
            _loc4_ = _catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc2_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc6_,_loc4_,_catalog);
            _loc5_.push(_loc2_);
         }
         var _loc1_:Offer = new Offer(offerId,localizationId,isRentOffer,priceInCredits,priceInActivityPoints,activityPointType,giftable,clubLevel,_loc5_,bundlePurchaseAllowed,_catalog);
         _loc1_.page = page;
         return _loc1_;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get localizationName() : String
      {
         var _loc1_:class_3200 = _catalog.getProductData(var_983);
         return !!_loc1_ ? _loc1_.name : "${" + var_983 + "}";
      }
      
      public function get localizationDescription() : String
      {
         var _loc1_:class_3200 = _catalog.getProductData(var_983);
         return !!_loc1_ ? _loc1_.description : "${" + var_983 + "}";
      }
   }
}
