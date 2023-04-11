package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.window.class_1684;
   
   public interface IMarketPlace
   {
       
      
      function get windowManager() : class_1684;
      
      function get localization() : class_18;
      
      function registerVisualization(param1:IMarketPlaceVisualization = null) : void;
      
      function onOffers(param1:IMessageEvent) : void;
      
      function onOwnOffers(param1:IMessageEvent) : void;
      
      function onBuyResult(param1:IMessageEvent) : void;
      
      function onCancelResult(param1:IMessageEvent) : void;
      
      function requestOffersByName(param1:String) : void;
      
      function requestOffersByPrice(param1:int) : void;
      
      function requestOffers(param1:int, param2:int, param3:String, param4:int) : void;
      
      function refreshOffers() : void;
      
      function requestOwnItems() : void;
      
      function requestItemStats(param1:int, param2:int) : void;
      
      function buyOffer(param1:int) : void;
      
      function redeemExpiredOffer(param1:int) : void;
      
      function latestOffers() : class_24;
      
      function latestOwnOffers() : class_24;
      
      function totalItemsFound() : int;
      
      function set itemStats(param1:class_3227) : void;
      
      function get itemStats() : class_3227;
      
      function get creditsWaiting() : int;
      
      function get averagePricePeriod() : int;
      
      function set averagePricePeriod(param1:int) : void;
      
      function getNameLocalizationKey(param1:IMarketPlaceOfferData) : String;
      
      function getDescriptionLocalizationKey(param1:IMarketPlaceOfferData) : String;
      
      function isAccountSafetyLocked() : Boolean;
   }
}
