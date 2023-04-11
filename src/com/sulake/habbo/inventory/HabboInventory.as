package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.configuration.enum.HabboComponentFlags;
   import com.sulake.habbo.inventory.badges.Badge;
   import com.sulake.habbo.inventory.badges.BadgesModel;
   import com.sulake.habbo.inventory.bots.BotsModel;
   import com.sulake.habbo.inventory.effects.EffectsModel;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.pets.PetsModel;
   import com.sulake.habbo.inventory.purse.Purse;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.*;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_118.class_981;
   import package_7.class_696;
   import package_88.class_362;
   
   public class HabboInventory extends class_20 implements class_1697, ILinkEventTracker
   {
       
      
      private var _communication:class_25;
      
      private var var_2619:com.sulake.habbo.inventory.class_3136;
      
      private var _windowManager:class_1684;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _localization:class_18;
      
      private var _soundManager:class_2089;
      
      private var var_1430:com.sulake.habbo.inventory.InventoryMainView;
      
      private var var_1502:class_24;
      
      private var _roomEngine:IRoomEngine;
      
      private var _roomSession:IRoomSession;
      
      private var var_2664:Array;
      
      private var var_1532:Purse;
      
      private var _avatarRenderer:class_1690;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1420:Boolean;
      
      private var var_1972:com.sulake.habbo.inventory.UnseenItemTracker;
      
      private var var_4044:Boolean = false;
      
      private var var_1508:String;
      
      private var var_608:Vector.<int>;
      
      private var var_627:Vector.<String>;
      
      private var var_1695:Timer;
      
      public function HabboInventory(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_1532 = new Purse();
         var_2664 = [];
         var_608 = new Vector.<int>(0);
      }
      
      public function get isVisible() : Boolean
      {
         return var_1430.isVisible;
      }
      
      public function get isMainViewActive() : Boolean
      {
         return var_1430.isActive;
      }
      
      public function get isInitialized() : Boolean
      {
         return var_1420;
      }
      
      public function get unseenItemTracker() : class_3202
      {
         return var_1972;
      }
      
      public function get view() : com.sulake.habbo.inventory.InventoryMainView
      {
         return var_1430;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDRoomEngine(),function(param1:IRoomEngine):void
         {
            _roomEngine = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         }),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarRenderer = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),null,false,[{
            "type":"RSE_STARTED",
            "callback":roomSessionEventHandler
         },{
            "type":"RSE_ENDED",
            "callback":roomSessionEventHandler
         },{
            "type":"RSDUE_ALLOW_PETS",
            "callback":roomSessionEventHandler
         }]),new ComponentDependency(new IIDHabboToolbar(),null,false,[{
            "type":"HTE_TOOLBAR_CLICK",
            "callback":habboToolbarEventHandler
         }]),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         })]);
      }
      
      private function habboToolbarEventHandler(param1:HabboToolbarEvent) : void
      {
         if(var_1430 != null)
         {
            var_1430.onHabboToolbarEvent(param1);
         }
      }
      
      override protected function initComponent() : void
      {
         if(HabboComponentFlags.isRoomViewerMode(flags))
         {
            return;
         }
         var_2619 = new com.sulake.habbo.inventory.class_3136(this);
         context.addLinkEventTracker(this);
         var_1972 = new com.sulake.habbo.inventory.UnseenItemTracker(_communication,events,this);
         var_1430 = new com.sulake.habbo.inventory.InventoryMainView(this,_windowManager,assets);
         _communication.connection.send(new class_981());
         _communication.connection.send(new class_696("habbo_club"));
         _communication.connection.send(new class_362());
      }
      
      override public function dispose() : void
      {
         var _loc4_:Array = null;
         var _loc1_:int = 0;
         var _loc3_:String = null;
         var _loc2_:IInventoryModel = null;
         if(disposed)
         {
            return;
         }
         if(var_1695 != null)
         {
            var_1695.stop();
            var_1695.removeEventListener("timer",onPurseTimer);
            var_1695 = null;
         }
         if(var_1502)
         {
            _loc4_ = var_1502.getKeys();
            _loc1_ = 0;
            while(_loc1_ < _loc4_.length)
            {
               _loc3_ = String(_loc4_[_loc1_]);
               _loc2_ = var_1502.getValue(_loc3_) as IInventoryModel;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_1502.dispose();
            var_1502 = null;
         }
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         _roomSession = null;
         if(var_1972 != null)
         {
            var_1972.dispose();
            var_1972 = null;
         }
         if(var_2619 != null)
         {
            var_2619.dispose();
            var_2619 = null;
         }
         super.dispose();
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function getModel(param1:String) : IInventoryModel
      {
         if(!var_1420)
         {
            init();
         }
         return var_1502.getValue(param1);
      }
      
      public function get furniModel() : FurniModel
      {
         return disposed ? null : FurniModel(getModel("furni"));
      }
      
      public function get tradingModel() : TradingModel
      {
         return disposed ? null : TradingModel(getModel("trading"));
      }
      
      public function get effectsModel() : EffectsModel
      {
         return disposed ? null : EffectsModel(getModel("effects"));
      }
      
      public function get badgesModel() : BadgesModel
      {
         return disposed ? null : BadgesModel(getModel("badges"));
      }
      
      public function get petsModel() : PetsModel
      {
         return disposed ? null : PetsModel(getModel("pets"));
      }
      
      public function get botsModel() : BotsModel
      {
         return disposed ? null : BotsModel(getModel("bots"));
      }
      
      public function get marketplaceModel() : MarketplaceModel
      {
         return disposed ? null : MarketplaceModel(getModel("marketplace"));
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get roomSession() : IRoomSession
      {
         return _roomSession;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get clubDays() : int
      {
         return var_1532.clubDays;
      }
      
      public function get clubPeriods() : int
      {
         return var_1532.clubPeriods;
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1532.clubPastPeriods;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1532.clubHasEverBeenMember;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return var_1532.clubIsExpiring;
      }
      
      public function get citizenshipVipIsExpiring() : Boolean
      {
         return var_1532.citizenshipVipIsExpiring;
      }
      
      public function get clubMinutesUntilExpiration() : int
      {
         return var_1532.minutesUntilExpiration;
      }
      
      public function get clubLevel() : int
      {
         if(clubDays == 0 && clubPeriods == 0)
         {
            return 0;
         }
         if(false)
         {
            return 2;
         }
         return 1;
      }
      
      public function get hasRoomSession() : Boolean
      {
         return _roomSession != null;
      }
      
      public function getSubCategoryViewId() : String
      {
         return var_1430.getSubCategoryViewId();
      }
      
      public function setClubStatus(param1:int, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean, param7:int, param8:int) : void
      {
         var_1532.clubPeriods = param1;
         var_1532.clubDays = param2;
         var_1532.clubHasEverBeenMember = param3;
         var_1532.isVIP = param4;
         var_1532.clubIsExpiring = param5;
         var_1532.citizenshipVipIsExpiring = param6;
         var_1532.minutesUntilExpiration = param7;
         var_1532.minutesSinceLastModified = param8;
         if(param7 > 0 && param7 < 86400000)
         {
            if(var_1695 == null)
            {
               var_1695 = new Timer(60000,0);
               var_1695.addEventListener("timer",onPurseTimer);
            }
            if(true)
            {
               var_1695.start();
            }
         }
         else if(var_1695 != null)
         {
            var_1695.stop();
            var_1695.removeEventListener("timer",onPurseTimer);
            var_1695 = null;
         }
      }
      
      private function onPurseTimer(param1:TimerEvent) : void
      {
         _communication.connection.send(new class_696("habbo_club"));
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case "RSE_STARTED":
               _roomSession = param1.session;
               if(var_1420)
               {
                  if(petsModel != null)
                  {
                     petsModel.updatePetsAllowed();
                  }
                  if(furniModel != null)
                  {
                     furniModel.updateView();
                     break;
                  }
                  break;
               }
               break;
            case "RSE_ENDED":
               _roomSession = null;
               if(var_1420)
               {
                  deselectAllEffects();
                  break;
               }
               break;
            case "RSDUE_ALLOW_PETS":
               if(var_1420)
               {
                  if(petsModel != null)
                  {
                     petsModel.updatePetsAllowed();
                     break;
                  }
                  break;
               }
         }
      }
      
      private function init() : void
      {
         if(!allRequiredDependenciesInjected)
         {
            return;
         }
         var_1502 = new class_24();
         var _loc6_:MarketplaceModel = new MarketplaceModel(this,_windowManager,_communication,assets,_roomEngine,_localization);
         var_1502.add("marketplace",_loc6_);
         var _loc1_:FurniModel = new FurniModel(this,_loc6_,_windowManager,_communication,assets,_roomEngine,_catalog,_soundManager,_localization);
         var_1502.add("furni",_loc1_);
         var_1502.add("rentables",_loc1_);
         var _loc2_:BadgesModel = new BadgesModel(this,_windowManager,_communication,assets);
         var_1502.add("badges",_loc2_);
         var _loc3_:EffectsModel = new EffectsModel(this,_windowManager,_communication,assets,_localization);
         var_1502.add("effects",_loc3_);
         var _loc4_:TradingModel = new TradingModel(this,_windowManager,_communication,assets,_roomEngine,_localization,_soundManager);
         var_1502.add("trading",_loc4_);
         var _loc7_:PetsModel = new PetsModel(this,_windowManager,_communication,assets,_roomEngine,_catalog);
         var_1502.add("pets",_loc7_);
         var _loc5_:BotsModel = new BotsModel(this,_windowManager,_communication,assets,_roomEngine,_catalog,_avatarRenderer);
         var_1502.add("bots",_loc5_);
         var_1420 = true;
      }
      
      public function getCategoryWindowContainer(param1:String) : class_3151
      {
         var _loc2_:IInventoryModel = IInventoryModel(var_1502.getValue(param1));
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getWindowContainer();
      }
      
      public function updateView(param1:String) : void
      {
         var _loc2_:IInventoryModel = IInventoryModel(var_1502.getValue(param1));
         if(_loc2_ == null)
         {
            return;
         }
         return _loc2_.updateView();
      }
      
      public function getCategorySubWindowContainer(param1:String) : class_3151
      {
         var _loc2_:IInventoryModel = IInventoryModel(var_1502.getValue(param1));
         return _loc2_ == null ? null : _loc2_.getWindowContainer();
      }
      
      public function getActivatedAvatarEffects() : Array
      {
         return effectsModel == null ? [] : effectsModel.getEffects(1);
      }
      
      public function getAvatarEffects() : Array
      {
         return effectsModel == null ? [] : effectsModel.getEffects();
      }
      
      public function setEffectSelected(param1:int) : void
      {
         var _loc2_:EffectsModel = effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.useEffect(param1);
         notifyChangedEffects();
      }
      
      public function setEffectDeselected(param1:int) : void
      {
         var _loc2_:EffectsModel = effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.stopUsingEffect(param1,true);
         notifyChangedEffects();
      }
      
      public function deselectAllEffects(param1:Boolean = false) : void
      {
         var _loc2_:EffectsModel = effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.stopUsingAllEffects(true,true,param1);
         notifyChangedEffects();
      }
      
      public function getAvatarEffect(param1:int) : class_3141
      {
         return effectsModel == null ? null : effectsModel.getEffectInterface(param1);
      }
      
      public function closeView() : void
      {
         if(var_1430 && false)
         {
            var_1430.hideInventory();
         }
      }
      
      public function showView() : void
      {
         if(var_1430)
         {
            var_1430.showInventory();
         }
      }
      
      public function get isMainViewInitialized() : Boolean
      {
         return false;
      }
      
      public function initializeFurniturePage() : void
      {
         if(var_1430)
         {
            toggleInventoryPage("furni");
            var_1430.hideInventory();
         }
      }
      
      public function toggleInventoryPage(param1:String, param2:String = null, param3:Boolean = false) : void
      {
         var_1508 = param1;
         var _loc4_:Boolean;
         if(_loc4_ = var_1430.toggleCategoryView(param1,false,param3))
         {
            inventoryViewOpened(param1);
            if(param2 != null)
            {
               IInventoryModel(var_1502.getValue(var_1508)).selectItemById(param2);
            }
         }
         if(!_loc4_)
         {
            events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_CLOSED"));
         }
      }
      
      public function toggleInventorySubPage(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IInventoryModel = null;
         var_1430.toggleSubCategoryView(param1,false);
         _loc2_ = 0;
         while(_loc2_ < var_1502.length)
         {
            _loc3_ = var_1502.getWithIndex(_loc2_) as IInventoryModel;
            _loc3_.subCategorySwitch(param1);
            _loc2_++;
         }
         var _loc4_:* = param1;
         if("trading" === _loc4_)
         {
            var_1430.toggleCategoryView("furni",false);
         }
      }
      
      public function updateSubView() : void
      {
         var_1430.updateSubCategoryView();
      }
      
      public function closingInventoryView() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IInventoryModel = null;
         if(var_1502)
         {
            _loc1_ = 0;
            while(_loc1_ < var_1502.length)
            {
               _loc2_ = var_1502.getWithIndex(_loc1_) as IInventoryModel;
               _loc2_.closingInventoryView();
               _loc1_++;
            }
         }
         events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_CLOSED"));
      }
      
      public function preparingInventoryView() : void
      {
         if(!var_1420)
         {
            init();
         }
      }
      
      public function inventoryViewOpened(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IInventoryModel = null;
         _loc2_ = 0;
         while(_loc2_ < var_1502.length)
         {
            _loc3_ = var_1502.getWithIndex(_loc2_) as IInventoryModel;
            _loc3_.categorySwitch(param1);
            _loc2_++;
         }
      }
      
      public function setupTrading(param1:int, param2:String) : void
      {
         if(!var_1420)
         {
            init();
         }
         var _loc3_:TradingModel = tradingModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.requestOpenTrading(param1);
      }
      
      public function get tradingActive() : Boolean
      {
         return tradingModel == null ? false : tradingModel.running;
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         var _loc1_:TradingModel = tradingModel;
         return _loc1_ != null ? _loc1_.ownUserCanTrade : false;
      }
      
      public function setInventoryCategoryInit(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         if(param2)
         {
            if(var_2664.indexOf(param1) == -1)
            {
               var_2664.push(param1);
            }
         }
         else
         {
            _loc3_ = var_2664.indexOf(param1);
            if(_loc3_ >= 0)
            {
               var_2664.splice(_loc3_,1);
            }
            if(var_1430 != null && false)
            {
               if(param1 != "rentables")
               {
                  requestInventoryCategoryInit(param1);
               }
            }
         }
      }
      
      public function isInventoryCategoryInit(param1:String) : Boolean
      {
         return var_2664.indexOf(param1) >= 0;
      }
      
      public function checkCategoryInitilization(param1:String) : Boolean
      {
         if(isInventoryCategoryInit(param1))
         {
            return true;
         }
         requestInventoryCategoryInit(param1);
         return false;
      }
      
      public function requestInventoryCategoryInit(param1:String) : void
      {
         var _loc2_:IInventoryModel = var_1502.getValue(param1) as IInventoryModel;
         if(_loc2_ != null)
         {
            _loc2_.requestInitialization();
         }
      }
      
      public function notifyChangedEffects() : void
      {
         events.dispatchEvent(new HabboInventoryEffectsEvent("HIEE_EFFECTS_CHANGED"));
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function requestSelectedFurniToMover(param1:class_3172) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         if(param1.isWallItem)
         {
            _loc3_ = 20;
         }
         else
         {
            _loc3_ = 10;
         }
         if(param1.category == 6)
         {
            _loc2_ = _roomEngine.initializeRoomObjectInsert("inventory",param1.id,_loc3_,param1.type,param1.stuffData.getLegacyString());
         }
         else
         {
            _loc2_ = _roomEngine.initializeRoomObjectInsert("inventory",param1.id,_loc3_,param1.type,param1.extra.toString(),param1.stuffData);
         }
         return _loc2_;
      }
      
      public function getFloorItemById(param1:int) : class_3172
      {
         var _loc2_:class_3172 = null;
         for each(var _loc3_ in furniModel.furniData)
         {
            _loc2_ = _loc3_.getItem(param1);
            if(_loc2_ != null && !_loc2_.isWallItem)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getWallItemById(param1:int) : class_3172
      {
         var _loc2_:class_3172 = null;
         for each(var _loc3_ in furniModel.furniData)
         {
            _loc2_ = _loc3_.getItem(param1);
            if(_loc2_ != null && _loc2_.isWallItem)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getNonRentedInventoryIds(param1:String, param2:int) : Array
      {
         var _loc4_:FurniModel;
         if(!(_loc4_ = var_1502.getValue(param1)))
         {
            return null;
         }
         var _loc3_:GroupItem = furniModel.getGroupItemByItemTypeId(param2);
         if(!_loc3_)
         {
            return null;
         }
         return _loc3_.getNonRentedFurnitureIds();
      }
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : Boolean
      {
         return petsModel.placePetToRoom(param1,param2);
      }
      
      public function updateUnseenItemCounts() : void
      {
         var _loc4_:int = 0;
         _loc4_ = var_1972.getCount(1);
         var_1430.updateUnseenFurniCount(_loc4_);
         _loc4_ = var_1972.getCount(2);
         var_1430.updateUnseenRentedFurniCount(_loc4_);
         var _loc1_:int = var_1972.getCount(3);
         var_1430.updateUnseenPetsCount(_loc1_);
         var _loc3_:int = var_1972.getCount(4);
         var_1430.updateUnseenBadgeCount(_loc3_);
         var _loc2_:int = var_1972.getCount(5);
         var_1430.updateUnseenBotCount(_loc2_);
      }
      
      public function removeUnseenFurniCounter(param1:int) : Boolean
      {
         var _loc2_:Boolean = furniModel.removeUnseenFurniCounter(param1);
         if(_loc2_)
         {
            updateUnseenItemCounts();
         }
         return _loc2_;
      }
      
      public function removeUnseenPetCounter(param1:int) : Boolean
      {
         var _loc2_:Boolean = petsModel.removeUnseenFurniCounter(param1);
         if(_loc2_)
         {
            updateUnseenItemCounts();
         }
         return _loc2_;
      }
      
      public function get botsMax() : int
      {
         return getInteger("inventory.bots.max",150);
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get currentCategoryId() : String
      {
         return var_1508;
      }
      
      public function getFurnitureData(param1:int, param2:String) : class_3148
      {
         var _loc3_:class_3148 = null;
         if(_sessionDataManager == null)
         {
            return null;
         }
         if(param2 == "s")
         {
            _loc3_ = _sessionDataManager.getFloorItemData(param1);
         }
         if(param2 == "i")
         {
            _loc3_ = _sessionDataManager.getWallItemData(param1);
         }
         return _loc3_;
      }
      
      public function getFurnitureDataByName(param1:String, param2:String, param3:int = 0) : class_3148
      {
         var _loc4_:class_3148 = null;
         if(_sessionDataManager == null)
         {
            return null;
         }
         if(param2 == "s")
         {
            _loc4_ = _sessionDataManager.getFloorItemDataByName(param1);
         }
         if(param2 == "i")
         {
            _loc4_ = _sessionDataManager.getWallItemDataByName(param1);
         }
         return _loc4_;
      }
      
      public function get linkPattern() : String
      {
         return "inventory/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         var _loc3_:* = _loc2_[1];
         if("open" !== _loc3_)
         {
            class_14.log("Inventory unknown link-type received: " + _loc2_[1]);
         }
         else if(_loc2_.length == 2)
         {
            toggleInventoryPage("furni");
         }
         else if(_loc2_.length == 3)
         {
            toggleInventoryPage(_loc2_[2]);
         }
         else if(_loc2_.length == 4)
         {
            toggleInventoryPage(_loc2_[2],_loc2_[3]);
         }
      }
      
      public function getAllMyBadgeIds(param1:Array) : Array
      {
         var _loc2_:BadgesModel = var_1502.getValue("badges");
         var _loc4_:* = [];
         if(_loc2_.getBadges().length == 0 && !var_4044)
         {
            badgesModel.requestInitialization();
            var_4044 = true;
         }
         for each(var _loc3_ in _loc2_.getBadges())
         {
            if(param1 == null || param1.indexOf(_loc3_.badgeId) == -1)
            {
               _loc4_.push(_loc3_.badgeId);
            }
         }
         return _loc4_;
      }
      
      public function hasFigureSetIdInInventory(param1:int) : Boolean
      {
         return var_608.indexOf(param1) > -1;
      }
      
      public function hasBoundFigureSetFurniture(param1:String) : Boolean
      {
         return var_627.indexOf(param1) > -1;
      }
      
      public function updatePurchasedFigureSetIds(param1:Vector.<int>, param2:Vector.<String>) : void
      {
         var_608 = param1;
         var_627 = param2;
      }
      
      public function getLastActivatedEffect() : int
      {
         return effectsModel.lastActivatedEffect;
      }
   }
}
