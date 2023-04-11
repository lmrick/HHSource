package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import package_127.class_1235;
   import package_127.class_1267;
   import package_127.class_1388;
   import package_127.class_1426;
   import package_65.class_1011;
   import package_65.class_1590;
   import package_65.class_524;
   import package_65.class_599;
   import package_65.class_871;
   import package_9.class_238;
   
   public class MarketPlaceLogic implements IMarketPlace
   {
      
      private static const TYPE_POSTER:String = "poster";
       
      
      public const PURCHASE_CONFIRM_TYPE_NORMAL:int = 1;
      
      public const PURCHASE_CONFIRM_TYPE_HIGHER:int = 2;
      
      public const const_818:int = 3;
      
      private var _catalog:HabboCatalog;
      
      private var _windowManager:class_1684;
      
      private var _roomEngine:IRoomEngine;
      
      private var _visualization:com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization;
      
      private var var_1511:com.sulake.habbo.catalog.marketplace.MarketplaceConfirmationDialog;
      
      private var _latestOffers:class_24;
      
      private var _latestOwnOffers:class_24;
      
      private var var_1253:int;
      
      private var var_1092:int = -1;
      
      private var var_3911:com.sulake.habbo.catalog.marketplace.class_3227;
      
      private var var_4126:int;
      
      private var var_3848:int;
      
      private var var_1116:int;
      
      private var _minPrice:int = 0;
      
      private var _maxPrice:int = 0;
      
      private var _searchString:String = "";
      
      private var var_1157:int = -1;
      
      private var _disposed:Boolean = false;
      
      public function MarketPlaceLogic(param1:HabboCatalog, param2:class_1684, param3:IRoomEngine)
      {
         super();
         _catalog = param1;
         _windowManager = param2;
         _roomEngine = param3;
         getConfiguration();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = null;
         _windowManager = null;
         if(_latestOffers != null)
         {
            disposeOffers(_latestOffers);
            _latestOffers = null;
         }
         if(_latestOwnOffers != null)
         {
            disposeOffers(_latestOwnOffers);
            _latestOwnOffers = null;
         }
         _disposed = true;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localization() : class_18
      {
         return _catalog.localization;
      }
      
      public function registerVisualization(param1:com.sulake.habbo.catalog.marketplace.IMarketPlaceVisualization = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         _visualization = param1;
      }
      
      private function getConfiguration() : void
      {
         if(!_catalog || true)
         {
            return;
         }
         _catalog.connection.send(new class_238());
      }
      
      private function showConfirmation(param1:int, param2:MarketPlaceOfferData) : void
      {
         if(!var_1511)
         {
            var_1511 = new com.sulake.habbo.catalog.marketplace.MarketplaceConfirmationDialog(this,_catalog,_roomEngine);
         }
         var_1511.showConfirmation(param1,param2);
      }
      
      public function requestOffersByName(param1:String) : void
      {
         if(_catalog)
         {
            _catalog.getPublicMarketPlaceOffers(-1,-1,param1,-1);
         }
      }
      
      public function requestOffersByPrice(param1:int) : void
      {
         if(_catalog)
         {
            _catalog.getPublicMarketPlaceOffers(param1,-1,"",-1);
         }
      }
      
      public function requestOffers(param1:int, param2:int, param3:String, param4:int) : void
      {
         _minPrice = param1;
         _maxPrice = param2;
         _searchString = param3;
         var_1157 = param4;
         if(_catalog)
         {
            _catalog.getPublicMarketPlaceOffers(param1,param2,param3,param4);
         }
      }
      
      public function refreshOffers() : void
      {
         requestOffers(_minPrice,_maxPrice,_searchString,var_1157);
      }
      
      public function requestOwnItems() : void
      {
         if(_catalog)
         {
            _catalog.getOwnMarketPlaceOffers();
         }
      }
      
      public function requestItemStats(param1:int, param2:int) : void
      {
         if(_catalog)
         {
            var_3848 = param2;
            var_4126 = param1;
            _catalog.getMarketplaceItemStats(param1,param2);
         }
      }
      
      public function buyOffer(param1:int) : void
      {
         if(!_latestOffers || !_catalog || !_catalog.getPurse())
         {
            return;
         }
         var _loc2_:MarketPlaceOfferData = _latestOffers.getValue(param1) as MarketPlaceOfferData;
         if(!_loc2_)
         {
            return;
         }
         if(_catalog.getPurse().credits < _loc2_.price)
         {
            _catalog.showNotEnoughCreditsAlert();
            return;
         }
         showConfirmation(1,_loc2_);
      }
      
      public function redeemExpiredOffer(param1:int) : void
      {
         if(_catalog)
         {
            _catalog.redeemExpiredMarketPlaceOffer(param1);
         }
      }
      
      private function disposeOffers(param1:class_24) : void
      {
         if(param1 != null)
         {
            for each(var _loc2_ in param1)
            {
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            param1.dispose();
         }
      }
      
      public function onOffers(param1:IMessageEvent) : void
      {
         var _loc3_:MarketPlaceOfferData = null;
         var _loc4_:class_599;
         if((_loc4_ = param1 as class_599) == null)
         {
            return;
         }
         var _loc2_:class_1267 = _loc4_.getParser() as class_1267;
         if(_loc2_ == null)
         {
            return;
         }
         disposeOffers(_latestOffers);
         _latestOffers = new class_24();
         for each(var _loc5_ in _loc2_.offers)
         {
            _loc3_ = new MarketPlaceOfferData(_loc5_.offerId,_loc5_.furniId,_loc5_.furniType,_loc5_.extraData,_loc5_.stuffData,_loc5_.price,_loc5_.status,_loc5_.averagePrice,_loc5_.offerCount);
            _loc3_.timeLeftMinutes = _loc5_.timeLeftMinutes;
            _latestOffers.add(_loc5_.offerId,_loc3_);
         }
         var_1116 = _loc2_.totalItemsFound;
         if(_visualization != null)
         {
            _visualization.listUpdatedNotify();
         }
      }
      
      public function onOwnOffers(param1:IMessageEvent) : void
      {
         var _loc3_:MarketPlaceOfferData = null;
         var _loc4_:class_524;
         if((_loc4_ = param1 as class_524) == null)
         {
            return;
         }
         var _loc2_:class_1235 = _loc4_.getParser() as class_1235;
         if(_loc2_ == null)
         {
            return;
         }
         disposeOffers(_latestOwnOffers);
         _latestOwnOffers = new class_24();
         var_1253 = _loc2_.creditsWaiting;
         for each(var _loc5_ in _loc2_.offers)
         {
            _loc3_ = new MarketPlaceOfferData(_loc5_.offerId,_loc5_.furniId,_loc5_.furniType,_loc5_.extraData,_loc5_.stuffData,_loc5_.price,_loc5_.status,_loc5_.averagePrice);
            _loc3_.timeLeftMinutes = _loc5_.timeLeftMinutes;
            _latestOwnOffers.add(_loc5_.offerId,_loc3_);
         }
         if(_visualization != null)
         {
            _visualization.listUpdatedNotify();
         }
      }
      
      public function onBuyResult(param1:IMessageEvent) : void
      {
         var parser:class_1388;
         var item:MarketPlaceOfferData;
         var updateItem:MarketPlaceOfferData;
         var event:IMessageEvent = param1;
         var buyEvent:class_1011 = event as class_1011;
         if(event == null)
         {
            return;
         }
         parser = buyEvent.getParser() as class_1388;
         if(parser == null)
         {
            return;
         }
         if(false)
         {
            refreshOffers();
         }
         else if(false)
         {
            item = _latestOffers.remove(parser.requestedOfferId);
            if(item != null)
            {
               item.dispose();
            }
            if(_visualization != null)
            {
               _visualization.listUpdatedNotify();
            }
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.marketplace.not_available_title}","${catalog.marketplace.not_available_header}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
            }
         }
         else if(false)
         {
            updateItem = _latestOffers.getValue(parser.requestedOfferId) as MarketPlaceOfferData;
            if(updateItem)
            {
               updateItem.offerId = parser.offerId;
               updateItem.price = parser.newPrice;
               updateItem.offerCount = -1;
               _latestOffers.add(parser.offerId,updateItem);
            }
            _latestOffers.remove(parser.requestedOfferId);
            showConfirmation(2,updateItem);
            if(_visualization != null)
            {
               _visualization.listUpdatedNotify();
            }
         }
         else if(false)
         {
            if(_windowManager != null)
            {
               _windowManager.alert("${catalog.alert.notenough.title}","${catalog.alert.notenough.credits.description}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
            }
         }
      }
      
      public function onCancelResult(param1:IMessageEvent) : void
      {
         var parser:class_1426;
         var item:MarketPlaceOfferData;
         var event:IMessageEvent = param1;
         var cancelEvent:class_871 = event as class_871;
         if(event == null)
         {
            return;
         }
         parser = cancelEvent.getParser() as class_1426;
         if(parser == null)
         {
            return;
         }
         if(false)
         {
            item = _latestOwnOffers.remove(parser.offerId);
            if(item != null)
            {
               item.dispose();
            }
            if(_visualization != null)
            {
               _visualization.listUpdatedNotify();
            }
         }
         else if(_windowManager != null)
         {
            _windowManager.alert("${catalog.marketplace.operation_failed.topic}","${catalog.marketplace.cancel_failed}",0,function(param1:class_3132, param2:class_3134):void
            {
               param1.dispose();
            });
         }
      }
      
      public function latestOffers() : class_24
      {
         return _latestOffers;
      }
      
      public function latestOwnOffers() : class_24
      {
         return _latestOwnOffers;
      }
      
      public function totalItemsFound() : int
      {
         return var_1116;
      }
      
      public function set itemStats(param1:com.sulake.habbo.catalog.marketplace.class_3227) : void
      {
         if(param1.furniCategoryId != var_4126 || param1.furniTypeId != var_3848)
         {
            return;
         }
         var_3911 = param1;
         if(_visualization != null)
         {
            _visualization.updateStats();
         }
      }
      
      public function get itemStats() : com.sulake.habbo.catalog.marketplace.class_3227
      {
         return var_3911;
      }
      
      public function get creditsWaiting() : int
      {
         return var_1253;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1092;
      }
      
      public function set averagePricePeriod(param1:int) : void
      {
         var_1092 = param1;
      }
      
      private function isPosterItem(param1:IMarketPlaceOfferData) : Boolean
      {
         var _loc2_:class_3148 = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         if(param1.furniType == 2 && param1.extraData != null)
         {
            _loc2_ = _catalog.getFurnitureData(param1.furniId,"i");
            if(_loc2_)
            {
               _loc3_ = _loc2_.className;
               if(_loc3_ != null && _loc3_ == "poster")
               {
                  _loc4_ = true;
               }
            }
         }
         return _loc4_;
      }
      
      public function getNameLocalizationKey(param1:IMarketPlaceOfferData) : String
      {
         var _loc2_:String = "";
         if(param1 != null)
         {
            if(isPosterItem(param1))
            {
               _loc2_ = "poster_" + param1.extraData + "_name";
            }
            else if(param1.furniType == 1)
            {
               _loc2_ = "roomItem.name." + param1.furniId;
            }
            else if(param1.furniType == 2)
            {
               _loc2_ = "wallItem.name." + param1.furniId;
            }
         }
         return _loc2_;
      }
      
      public function getDescriptionLocalizationKey(param1:IMarketPlaceOfferData) : String
      {
         var _loc2_:String = "";
         if(param1 != null)
         {
            if(isPosterItem(param1))
            {
               _loc2_ = "poster_" + param1.extraData + "_desc";
            }
            else if(param1.furniType == 1)
            {
               _loc2_ = "roomItem.desc." + param1.furniId;
            }
            else if(param1.furniType == 2)
            {
               _loc2_ = "wallItem.desc." + param1.furniId;
            }
         }
         return _loc2_;
      }
      
      public function isAccountSafetyLocked() : Boolean
      {
         if(_catalog)
         {
            return _catalog.sessionDataManager.isAccountSafetyLocked();
         }
         return false;
      }
   }
}
