package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.session.furniture.class_3148;
   
   public class FurnitureOffer implements class_3159
   {
       
      
      private var var_1489:class_3148;
      
      private var var_3233:int;
      
      private var var_1552:com.sulake.habbo.catalog.viewer.class_3229;
      
      private var var_1685:com.sulake.habbo.catalog.viewer.FurniProductContainer;
      
      private var var_3873:com.sulake.habbo.catalog.viewer.Product;
      
      public function FurnitureOffer(param1:class_3148, param2:HabboCatalog)
      {
         super();
         var_1489 = param1;
         var_1685 = new com.sulake.habbo.catalog.viewer.FurniProductContainer(this,new Vector.<class_3169>(0),param2,var_1489);
         var_3873 = new com.sulake.habbo.catalog.viewer.Product(var_1489.type,var_1489.id,var_1489.customParams,1,param2.getProductData(var_1489.className),var_1489,param2);
      }
      
      public function dispose() : void
      {
         var_1489 = null;
         var_1552 = null;
         var_3233 = -1;
      }
      
      public function get disposed() : Boolean
      {
         return var_1489 == null;
      }
      
      public function get offerId() : int
      {
         return isRentOffer ? var_1489.rentOfferId : var_1489.purchaseOfferId;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return 0;
      }
      
      public function get priceInCredits() : int
      {
         return 0;
      }
      
      public function get page() : com.sulake.habbo.catalog.viewer.class_3229
      {
         return var_1552;
      }
      
      public function get priceType() : String
      {
         return "";
      }
      
      public function get productContainer() : class_3318
      {
         return var_1685;
      }
      
      public function get product() : class_3169
      {
         return var_3873;
      }
      
      public function get gridItem() : class_3284
      {
         return var_1685 as class_3284;
      }
      
      public function get localizationId() : String
      {
         return "roomItem.name.undefined";
      }
      
      public function get bundlePurchaseAllowed() : Boolean
      {
         return false;
      }
      
      public function get isRentOffer() : Boolean
      {
         return !(var_1552 != null && false);
      }
      
      public function get giftable() : Boolean
      {
         return false;
      }
      
      public function get pricingModel() : String
      {
         return "pricing_model_furniture";
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_3233 = param1;
      }
      
      public function get previewCallbackId() : int
      {
         return var_3233;
      }
      
      public function get clubLevel() : int
      {
         return 0;
      }
      
      public function get badgeCode() : String
      {
         return "";
      }
      
      public function set page(param1:com.sulake.habbo.catalog.viewer.class_3229) : void
      {
         var_1552 = param1;
      }
      
      public function get localizationName() : String
      {
         return var_1489.localizedName;
      }
      
      public function get localizationDescription() : String
      {
         return var_1489.description;
      }
   }
}
