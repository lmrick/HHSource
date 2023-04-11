package com.sulake.habbo.catalog
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.navigation.class_3125;
   import com.sulake.habbo.catalog.offers.IOfferCenter;
   import com.sulake.habbo.catalog.offers.IOfferExtension;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public interface IHabboCatalog extends IUnknown
   {
       
      
      function redeemVoucher(param1:String) : void;
      
      function loadCatalogPage(param1:int, param2:int, param3:String) : void;
      
      function get assets() : class_21;
      
      function get windowManager() : class_1684;
      
      function get events() : IEventDispatcher;
      
      function get localization() : class_18;
      
      function get connection() : IConnection;
      
      function get navigator() : class_1685;
      
      function get videoOffers() : IVideoOfferManager;
      
      function toggleCatalog(param1:String, param2:Boolean = false, param3:Boolean = true) : void;
      
      function openCatalog() : void;
      
      function openCatalogPage(param1:String, param2:String = null) : void;
      
      function openRoomAdCatalogPageInExtendedMode(param1:String, param2:String, param3:String, param4:String, param5:Date, param6:int) : void;
      
      function openCatalogPageById(param1:int, param2:int, param3:String) : void;
      
      function openCatalogPageByOfferId(param1:int, param2:String) : void;
      
      function openInventoryCategory(param1:String) : void;
      
      function openCreditsHabblet() : void;
      
      function get privateRoomSessionActive() : Boolean;
      
      function get tradingActive() : Boolean;
      
      function getProductData(param1:String) : class_3200;
      
      function getFurnitureData(param1:int, param2:String) : class_3148;
      
      function getPixelEffectIcon(param1:int) : BitmapData;
      
      function getSubscriptionProductIcon(param1:int) : BitmapData;
      
      function getPurse() : class_3160;
      
      function getMarketPlace() : IMarketPlace;
      
      function getPublicMarketPlaceOffers(param1:int, param2:int, param3:String, param4:int) : void;
      
      function getOwnMarketPlaceOffers() : void;
      
      function buyMarketPlaceOffer(param1:int) : void;
      
      function redeemSoldMarketPlaceOffers() : void;
      
      function redeemExpiredMarketPlaceOffer(param1:int) : void;
      
      function getMarketplaceItemStats(param1:int, param2:int) : void;
      
      function showNotEnoughCreditsAlert() : void;
      
      function showNotEnoughActivityPointsAlert(param1:int) : void;
      
      function getHabboClubOffers(param1:int) : void;
      
      function openClubCenter() : void;
      
      function openVault() : void;
      
      function verifyClubLevel(param1:int = 1) : Boolean;
      
      function set giftReceiver(param1:String) : void;
      
      function buySnowWarTokensOffer(param1:String) : void;
      
      function get imageGalleryHost() : String;
      
      function showVipBenefits() : void;
      
      function displayProductIcon(param1:String, param2:int, param3:class_3282) : void;
      
      function openRentConfirmationWindow(param1:class_3148, param2:Boolean, param3:int = -1, param4:int = -1, param5:Boolean = false) : void;
      
      function get buildersClubEnabled() : Boolean;
      
      function toggleBuilderCatalog() : void;
      
      function get catalogType() : String;
      
      function getCatalogNavigator(param1:String) : class_3125;
      
      function get isDoorModeOverriddenInCurrentRoom() : Boolean;
      
      function getOfferCenter(param1:IOfferExtension) : IOfferCenter;
   }
}
