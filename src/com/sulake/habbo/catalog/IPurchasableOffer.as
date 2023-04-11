package com.sulake.habbo.catalog
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.class_3229;
   import com.sulake.habbo.catalog.viewer.class_3284;
   import com.sulake.habbo.catalog.viewer.class_3318;
   
   public interface IPurchasableOffer extends class_13
   {
       
      
      function get offerId() : int;
      
      function get priceInActivityPoints() : int;
      
      function get activityPointType() : int;
      
      function get priceInCredits() : int;
      
      function get page() : class_3229;
      
      function get priceType() : String;
      
      function get product() : class_3169;
      
      function get productContainer() : class_3318;
      
      function get gridItem() : class_3284;
      
      function get localizationId() : String;
      
      function get bundlePurchaseAllowed() : Boolean;
      
      function get isRentOffer() : Boolean;
      
      function get giftable() : Boolean;
      
      function get pricingModel() : String;
      
      function set previewCallbackId(param1:int) : void;
      
      function get previewCallbackId() : int;
      
      function get clubLevel() : int;
      
      function get badgeCode() : String;
      
      function set page(param1:class_3229) : void;
      
      function get localizationName() : String;
      
      function get localizationDescription() : String;
   }
}
