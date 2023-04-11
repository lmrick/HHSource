package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.catalog.class_3159;
   
   public class GameTokensOffer implements class_3159, class_13
   {
       
      
      private var _offerId:int;
      
      private var var_983:String;
      
      private var var_342:int;
      
      private var var_538:int;
      
      private var var_349:int;
      
      public function GameTokensOffer(param1:int, param2:String, param3:int, param4:int, param5:int)
      {
         super();
         _offerId = param1;
         var_983 = param2;
         var_342 = param3;
         var_538 = param4;
         var_349 = param5;
      }
      
      public function dispose() : void
      {
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInActivityPoints() : int
      {
         return var_538;
      }
      
      public function get activityPointType() : int
      {
         return var_349;
      }
      
      public function get priceInCredits() : int
      {
         return var_342;
      }
      
      public function get page() : class_3229
      {
         return null;
      }
      
      public function get priceType() : String
      {
         return "price_type_credits";
      }
      
      public function get productContainer() : class_3318
      {
         return null;
      }
      
      public function get product() : class_3169
      {
         return !!productContainer ? productContainer.firstProduct : null;
      }
      
      public function get gridItem() : class_3284
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return var_983;
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
      
      public function set previewCallbackId(param1:int) : void
      {
      }
      
      public function get previewCallbackId() : int
      {
         return 0;
      }
      
      public function get clubLevel() : int
      {
         return 0;
      }
      
      public function get badgeCode() : String
      {
         return "";
      }
      
      public function set page(param1:class_3229) : void
      {
      }
      
      public function get localizationName() : String
      {
         return "${" + localizationId + "}";
      }
      
      public function get localizationDescription() : String
      {
         return "${" + localizationId + "}";
      }
   }
}
