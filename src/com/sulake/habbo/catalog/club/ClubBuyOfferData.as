package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.class_3229;
   import com.sulake.habbo.catalog.viewer.class_3284;
   import com.sulake.habbo.catalog.viewer.class_3318;
   
   public class ClubBuyOfferData implements class_3159
   {
       
      
      private var _offerId:int;
      
      private var var_343:String;
      
      private var var_908:int;
      
      private var var_703:int;
      
      private var var_964:int;
      
      private var var_725:Boolean;
      
      private var var_880:int;
      
      private var var_1264:int;
      
      private var var_1552:class_3229;
      
      private var var_364:int;
      
      private var _month:int;
      
      private var var_690:int;
      
      private var var_2725:String;
      
      private var var_3976:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var var_1295:int;
      
      private var var_859:Boolean;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:Boolean = false)
      {
         super();
         _offerId = param1;
         var_343 = param2;
         var_908 = param3;
         var_703 = param4;
         var_964 = param5;
         var_725 = param6;
         var_880 = param7;
         var_1295 = param8;
         var_1264 = param9;
         var_364 = param10;
         _month = param11;
         var_690 = param12;
         var_859 = param13;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         _disposed = true;
         var_1552 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get extraParameter() : String
      {
         return var_2725;
      }
      
      public function set extraParameter(param1:String) : void
      {
         var_2725 = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get priceCredits() : int
      {
         return var_908;
      }
      
      public function get vip() : Boolean
      {
         return var_725;
      }
      
      public function get months() : int
      {
         return var_880;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1264;
      }
      
      public function get year() : int
      {
         return var_364;
      }
      
      public function get month() : int
      {
         return _month;
      }
      
      public function get day() : int
      {
         return var_690;
      }
      
      public function get isGiftable() : Boolean
      {
         return var_859;
      }
      
      public function get priceInActivityPoints() : int
      {
         return var_703;
      }
      
      public function get activityPointType() : int
      {
         return var_964;
      }
      
      public function get priceInCredits() : int
      {
         return var_908;
      }
      
      public function get page() : class_3229
      {
         return var_1552;
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
         return var_343;
      }
      
      public function set page(param1:class_3229) : void
      {
         var_1552 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_3976;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_3976 = param1;
      }
      
      public function get extraDays() : int
      {
         return var_1295;
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
         return var_859;
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
