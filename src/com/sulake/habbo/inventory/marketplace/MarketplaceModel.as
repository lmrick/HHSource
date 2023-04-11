package com.sulake.habbo.inventory.marketplace
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FurnitureItem;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.class_1684;
   import package_9.class_238;
   import package_9.class_262;
   import package_9.class_388;
   import package_9.class_481;
   import package_9.class_872;
   
   public class MarketplaceModel implements IInventoryModel
   {
       
      
      private var var_282:HabboInventory;
      
      private var _assets:class_21;
      
      private var _windowManager:class_1684;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:class_25;
      
      private var _disposed:Boolean = false;
      
      private var var_302:FurnitureItem;
      
      private var var_787:Boolean;
      
      private var _commission:int;
      
      private var var_1318:int;
      
      private var var_592:int;
      
      private var _offerMinPrice:int;
      
      private var _offerMaxPrice:int;
      
      private var _expirationHours:int;
      
      private var var_1092:int;
      
      private var var_1181:int;
      
      private var var_777:int;
      
      private var var_989:int;
      
      private var var_4126:int;
      
      private var var_3848:int;
      
      private var var_1430:com.sulake.habbo.inventory.marketplace.MarketplaceView;
      
      private var var_2857:Boolean = false;
      
      public function MarketplaceModel(param1:HabboInventory, param2:class_1684, param3:class_25, param4:class_21, param5:IRoomEngine, param6:class_18)
      {
         super();
         var_282 = param1;
         _communication = param3;
         _windowManager = param2;
         _assets = param4;
         _roomEngine = param5;
         var_1430 = new com.sulake.habbo.inventory.marketplace.MarketplaceView(this,_windowManager,_assets,param5,param6,param1);
      }
      
      public function get id() : String
      {
         return "marketplace";
      }
      
      public function set isEnabled(param1:Boolean) : void
      {
         var_787 = param1;
      }
      
      public function set commission(param1:int) : void
      {
         _commission = param1;
      }
      
      public function set tokenBatchPrice(param1:int) : void
      {
         var_1318 = param1;
      }
      
      public function set tokenBatchSize(param1:int) : void
      {
         var_592 = param1;
      }
      
      public function set offerMinPrice(param1:int) : void
      {
         _offerMinPrice = param1;
      }
      
      public function set offerMaxPrice(param1:int) : void
      {
         _offerMaxPrice = param1;
      }
      
      public function set expirationHours(param1:int) : void
      {
         _expirationHours = param1;
      }
      
      public function set averagePricePeriod(param1:int) : void
      {
         var_1092 = param1;
      }
      
      public function set sellingFeePercentage(param1:int) : void
      {
         var_1181 = param1;
      }
      
      public function set revenueLimit(param1:int) : void
      {
         var_777 = param1;
      }
      
      public function set halfTaxLimit(param1:int) : void
      {
         var_989 = param1;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_787;
      }
      
      public function get commission() : int
      {
         return _commission;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1318;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_592;
      }
      
      public function get offerMinPrice() : int
      {
         return _offerMinPrice;
      }
      
      public function get offerMaxPrice() : int
      {
         return _offerMaxPrice;
      }
      
      public function get expirationHours() : int
      {
         return _expirationHours;
      }
      
      public function get sellingFeePercentage() : int
      {
         return var_1181;
      }
      
      public function get revenueLimit() : int
      {
         return var_777;
      }
      
      public function get halfTaxLimit() : int
      {
         return var_989;
      }
      
      public function get controller() : HabboInventory
      {
         return var_282;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var_282 = null;
         _communication = null;
         _windowManager = null;
         _assets = null;
         _roomEngine = null;
      }
      
      public function releaseItem() : void
      {
         if(var_282 != null && false && var_302 != null)
         {
            var_282.furniModel.removeLockFrom(var_302.id);
            var_302 = null;
         }
      }
      
      public function startOfferMaking(param1:FurnitureItem) : void
      {
         if(var_302 != null || param1 == null)
         {
            return;
         }
         if(var_282 == null)
         {
            return;
         }
         var _loc2_:FurniModel = var_282.furniModel;
         if(_loc2_ == null)
         {
            return;
         }
         var_302 = param1;
         _loc2_.addLockTo(param1.id);
         send(new class_481());
      }
      
      public function buyMarketplaceTokens() : void
      {
         send(new class_262());
         var_2857 = true;
      }
      
      public function makeOffer(param1:int) : void
      {
         if(var_302 == null)
         {
            return;
         }
         var _loc2_:int = var_302.isWallItem ? 2 : 1;
         send(new class_872(param1,_loc2_,var_302.ref));
         releaseItem();
      }
      
      public function getItemStats() : void
      {
         if(var_302 == null)
         {
            return;
         }
         var _loc1_:int = var_302.isWallItem ? 2 : 1;
         var_4126 = _loc1_;
         var_3848 = var_302.type;
         send(new class_388(_loc1_,var_302.type));
      }
      
      public function proceedOfferMaking(param1:int, param2:int) : void
      {
         var_2857 = false;
         switch(param1 - 1)
         {
            case 0:
               var_1430.showMakeOffer(var_302);
               break;
            case 1:
               var_1430.showAlert("${inventory.marketplace.no_trading_privilege.title}","${inventory.marketplace.no_trading_privilege.info}");
               break;
            case 2:
               var_1430.showAlert("${inventory.marketplace.no_trading_pass.title}","${inventory.marketplace.no_trading_pass.info}");
               break;
            case 3:
               var_1430.showBuyTokens(var_1318,var_592);
               break;
            case 4:
               break;
            case 5:
               var_1430.showAlert("${inventory.marketplace.trading_lock.title}","${inventory.marketplace.trading_lock.info}");
         }
      }
      
      public function endOfferMaking(param1:int) : void
      {
         if(!var_1430)
         {
            return;
         }
         var_1430.showResult(param1);
      }
      
      public function setAveragePrice(param1:int, param2:int, param3:int) : void
      {
         if(param1 != var_4126 || param2 != var_3848)
         {
            return;
         }
         if(!var_1430)
         {
            return;
         }
         var_1430.updateAveragePrice(param3,var_1092);
      }
      
      public function onNotEnoughCredits() : void
      {
         if(var_2857)
         {
            var_2857 = false;
            releaseItem();
         }
      }
      
      public function requestInitialization() : void
      {
         send(new class_238());
      }
      
      public function getOfferItem() : class_3172
      {
         return var_302;
      }
      
      public function getWindowContainer() : class_3151
      {
         return null;
      }
      
      public function categorySwitch(param1:String) : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function updateView() : void
      {
      }
      
      private function send(param1:IMessageComposer) : void
      {
         if(_communication != null && false)
         {
            _communication.connection.send(param1);
         }
      }
      
      public function selectItemById(param1:String) : void
      {
         class_14.log("NOT SUPPORTED: MARKETPLACE SELECT BY ID");
      }
   }
}
