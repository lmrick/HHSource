package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.class_3202;
   import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
   import com.sulake.habbo.inventory.items.CreditTradingItem;
   import com.sulake.habbo.inventory.items.FurnitureItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
   import com.sulake.habbo.room.object.data.class_1610;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import package_22.class_916;
   import package_55.class_1598;
   import package_70.class_265;
   import package_70.class_813;
   import package_70.class_925;
   
   public class FurniModel implements IInventoryModel
   {
      
      private static const IMAGE_UPDATE_DELAY_MS:int = 100;
       
      
      private var var_282:HabboInventory;
      
      private var var_1430:com.sulake.habbo.inventory.furni.FurniView;
      
      private var var_1489:Vector.<GroupItem>;
      
      private var _assets:class_21;
      
      private var _windowManager:class_1684;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:class_25;
      
      private var _soundManager:class_2089;
      
      private var _disposed:Boolean = false;
      
      private var var_3081:int = -1;
      
      private var var_1818:Boolean;
      
      private var var_2241:Timer;
      
      private var var_3634:Boolean;
      
      private var _catalog:IHabboCatalog;
      
      private var var_2488:Dictionary;
      
      private var _localization:class_18;
      
      private var var_3778:Array;
      
      private var var_4254:Boolean;
      
      private var _categorySelection:Dictionary;
      
      private var var_774:String;
      
      private var _imageUpdateCumulativeTime:int = 0;
      
      private var var_2524:FurnitureItem = null;
      
      private var _isInRoom:Boolean = false;
      
      public function FurniModel(param1:HabboInventory, param2:MarketplaceModel, param3:class_1684, param4:class_25, param5:class_21, param6:IRoomEngine, param7:IHabboCatalog, param8:class_2089, param9:class_18)
      {
         super();
         var_282 = param1;
         _communication = param4;
         _windowManager = param3;
         _assets = param5;
         _roomEngine = param6;
         _roomEngine.events.addEventListener("REOE_PLACED",onObjectPlaced);
         _catalog = param7;
         _soundManager = param8;
         _localization = param9;
         var_2488 = new Dictionary();
         var_3778 = var_282.getProperty("catalog.preview.alignment.bottom").split(",");
         var_2241 = new Timer(100);
         var_2241.addEventListener("timer",onImageUpdateTimerEvent);
         _categorySelection = new Dictionary();
         _categorySelection["furni"] = null;
         _categorySelection["rentables"] = null;
         clearFurniList();
         var_1430 = new com.sulake.habbo.inventory.furni.FurniView(this,param2,_windowManager,_assets,_roomEngine);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get controller() : HabboInventory
      {
         return var_282;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get isTradingOpen() : Boolean
      {
         return var_282.getSubCategoryViewId() == "trading";
      }
      
      public function get isPrivateRoom() : Boolean
      {
         if(!var_282 || true)
         {
            return false;
         }
         return var_282.roomSession.isPrivateRoom;
      }
      
      public function get furniData() : Vector.<GroupItem>
      {
         return var_1489;
      }
      
      public function get soundManager() : class_2089
      {
         return _soundManager;
      }
      
      public function get showingRentedFurni() : Boolean
      {
         return var_4254;
      }
      
      public function set categorySelection(param1:GroupItem) : void
      {
         _categorySelection[var_774] = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_282 = null;
            if(var_1489 != null)
            {
               var_1489 = null;
            }
            if(var_1430 != null)
            {
               var_1430.dispose();
               var_1430 = null;
            }
            if(_roomEngine != null)
            {
               if(false)
               {
                  _roomEngine.events.removeEventListener("REOE_PLACED",onObjectPlaced);
               }
               _roomEngine = null;
            }
            _communication = null;
            _assets = null;
            _windowManager = null;
            _catalog = null;
            _soundManager = null;
            _localization = null;
            if(var_2241 != null)
            {
               var_2241.removeEventListener("timerComplete",onImageUpdateTimerEvent);
               var_2241.stop();
               var_2241 = null;
            }
            for each(var _loc1_ in var_2488)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            var_2488 = null;
            _disposed = true;
         }
      }
      
      public function createItemWindow(param1:*) : class_3151
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:XML = null;
         if(true)
         {
            _loc4_ = _assets.getAssetByName(param1);
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = XML(_loc2_.content);
            var_2488[param1] = _windowManager.buildFromXML(_loc3_) as class_3151;
         }
         return var_2488[param1].clone();
      }
      
      public function insertFurniture(param1:class_24) : void
      {
         var _loc2_:FurnitureItem = null;
         var _loc4_:class_1598 = null;
         var _loc7_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:int = 0;
         var _loc13_:HabboInventoryItemAddedEvent = null;
         var_282.setInventoryCategoryInit("furni");
         var_282.setInventoryCategoryInit("rentables");
         var _loc11_:Vector.<int> = getAllStripIds();
         var _loc9_:Array = param1.getKeys();
         var _loc3_:Vector.<int> = new Vector.<int>(0);
         var _loc12_:Vector.<int> = new Vector.<int>(0);
         _loc7_ = 0;
         while(_loc7_ < _loc9_.length)
         {
            _loc6_ = int(_loc9_[_loc7_]);
            if(_loc11_.indexOf(_loc6_) == -1)
            {
               _loc3_.push(_loc6_);
            }
            _loc7_++;
         }
         for each(_loc10_ in _loc11_)
         {
            if(_loc9_.indexOf(_loc10_) == -1)
            {
               _loc12_.push(_loc10_);
            }
         }
         var _loc8_:* = _loc11_.length == 0;
         for each(_loc10_ in _loc12_)
         {
            removeFurni(_loc10_);
         }
         for each(_loc10_ in _loc3_)
         {
            _loc4_ = class_1598(param1.getValue(_loc10_));
            _loc2_ = new FurnitureItem(_loc4_);
            addOrUpdateItem(_loc2_,true);
         }
         if(!_loc8_)
         {
            if(_loc3_.length > 0)
            {
               updateItemLocks();
            }
         }
         setListInitialized();
         var_1430.addItems(var_1489);
         if(_loc8_)
         {
            selectFirstItem();
         }
         else if(getSelectedItem() == null)
         {
            selectFirstItem();
         }
         setViewToState();
         initListImages();
         for each(var _loc5_ in _loc9_)
         {
            if(_loc3_.indexOf(_loc5_) > -1)
            {
               _loc13_ = new HabboInventoryItemAddedEvent(_loc4_.itemTypeId,_loc4_.itemId,_loc4_.category);
               var_282.events.dispatchEvent(_loc13_);
            }
         }
      }
      
      public function isListInited() : Boolean
      {
         return var_3634;
      }
      
      public function setListInitialized() : void
      {
         if(!var_3634)
         {
            var_3634 = true;
            setViewToState();
         }
      }
      
      public function createGroupItem(param1:int, param2:int, param3:IStuffData, param4:Number = NaN, param5:Boolean = false) : GroupItem
      {
         var _loc8_:BitmapData = null;
         var _loc7_:IAsset = null;
         if(param2 == 2)
         {
            if((_loc7_ = _windowManager.assets.getAssetByName("inventory_furni_icon_wallpaper")) != null)
            {
               _loc8_ = (_loc7_.content as BitmapData).clone();
            }
         }
         else if(param2 == 3)
         {
            if((_loc7_ = _windowManager.assets.getAssetByName("inventory_furni_icon_floor")) != null)
            {
               _loc8_ = (_loc7_.content as BitmapData).clone();
            }
         }
         else if(param2 == 4)
         {
            if((_loc7_ = _windowManager.assets.getAssetByName("inventory_furni_icon_landscape")) != null)
            {
               _loc8_ = (_loc7_.content as BitmapData).clone();
            }
         }
         var _loc9_:String = "center";
         var _loc6_:String = _roomEngine.getFurnitureType(param1);
         if(var_3778.indexOf(_loc6_) > -1)
         {
            _loc9_ = "bottom";
         }
         return new GroupItem(this,param1,param2,_roomEngine,param3,param4,_loc8_,param5,_loc9_);
      }
      
      public function createCreditGroupItem(param1:int) : GroupItem
      {
         return new CreditTradingItem(this,_windowManager.assets,_roomEngine,param1);
      }
      
      public function requestInitialization() : void
      {
         var _loc1_:IConnection = _communication.connection;
         if(_loc1_ != null)
         {
            if(_isInRoom)
            {
               _loc1_.send(new class_265());
            }
            else
            {
               _loc1_.send(new class_813());
            }
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(false)
         {
            class_14.log("FurniMode.categorySwitch: " + param1);
            switch(param1)
            {
               case "furni":
               case "rentables":
                  var_774 = param1;
                  var_4254 = var_774 == "rentables";
                  var_1430.resetFilters(param1);
                  updateCategorySelection();
                  updateItemLocks();
            }
         }
      }
      
      public function getWindowContainer() : class_3151
      {
         var_282.checkCategoryInitilization("marketplace");
         return var_1430.getWindowContainer();
      }
      
      public function closingInventoryView() : void
      {
         if(false)
         {
            resetUnseenItems();
         }
      }
      
      public function updateItemLocks() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = [];
         var _loc1_:TradingModel = var_282.tradingModel;
         if(_loc1_ != null)
         {
            _loc3_ = _loc3_.concat(_loc1_.getOwnItemIdsInTrade());
         }
         var _loc4_:MarketplaceModel;
         if((_loc4_ = var_282.marketplaceModel) != null && _loc4_.getOfferItem() != null)
         {
            _loc3_ = _loc3_.concat([_loc4_.getOfferItem().ref]);
         }
         if(_loc3_.length == 0)
         {
            removeAllLocks();
            return;
         }
         for each(_loc2_ in var_1489)
         {
            _loc2_.updateLocks(_loc3_);
         }
         var_1430.updateActionView();
      }
      
      public function addLockTo(param1:int) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_1489)
         {
            _loc2_.addLockTo(param1);
         }
         var_1430.updateActionView();
      }
      
      public function removeLockFrom(param1:int) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_1489)
         {
            _loc2_.removeLockFrom(param1);
         }
         var_1430.updateActionView();
      }
      
      public function clearFurniList() : void
      {
         var_1489 = new Vector.<GroupItem>(0);
         if(var_1430 != null)
         {
            var_1430.clearViews();
         }
      }
      
      public function removeUnseenFurniCounter(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc6_:class_3202;
         if((_loc6_ = var_282.unseenItemTracker) == null)
         {
            return false;
         }
         var _loc4_:GroupItem;
         if((_loc4_ = getItemById(param1)) == null)
         {
            return false;
         }
         if(var_774 == "rentables")
         {
            _loc3_ = 2;
         }
         else
         {
            _loc3_ = 1;
         }
         var _loc5_:Boolean;
         if(_loc5_ = var_282.unseenItemTracker.isUnseen(_loc3_,param1))
         {
            _loc2_ = _loc6_.removeUnseen(_loc3_,param1);
         }
         if(_loc2_)
         {
            _loc6_.resetCategoryIfEmpty(_loc3_);
         }
         return _loc2_;
      }
      
      public function getItemWithStripId(param1:int) : GroupItem
      {
         var _loc2_:class_3172 = null;
         for each(var _loc3_ in var_1489)
         {
            _loc2_ = _loc3_.getItem(param1);
            if(_loc2_)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getGroupItemByItemTypeId(param1:int) : GroupItem
      {
         for each(var _loc2_ in var_1489)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addOrUpdateItem(param1:FurnitureItem, param2:Boolean) : void
      {
         var _loc3_:GroupItem = null;
         if(!param1.groupable)
         {
            _loc3_ = addOrUpdateNonGroupableItem(param1,param2);
         }
         else
         {
            _loc3_ = addOrUpdateGroupableItem(param1,param2);
         }
         if(!param2)
         {
            _loc3_.hasUnseenItems = true;
         }
         if(_loc3_.isSelected)
         {
            var_1430.updateActionView();
         }
      }
      
      public function setViewToState() : void
      {
         var_1430.setViewToState();
      }
      
      public function removeFurni(param1:int) : GroupItem
      {
         var _loc3_:GroupItem = null;
         var _loc4_:int = 0;
         var _loc2_:class_3172 = null;
         _loc4_ = 0;
         while(_loc4_ < var_1489.length)
         {
            _loc3_ = var_1489[_loc4_] as GroupItem;
            _loc2_ = _loc3_.remove(param1);
            if(_loc2_)
            {
               if(var_3081 == _loc2_.ref)
               {
                  cancelFurniInMover();
                  if(!requestSelectedFurniPlacement())
                  {
                     var_282.showView();
                  }
               }
               if(_loc3_.getTotalCount() <= 0)
               {
                  var_1489.splice(_loc4_,1);
                  if(var_1430 && false)
                  {
                     var_1430.grid.itemWasUpdated(_loc3_);
                  }
                  if(_loc3_.isSelected)
                  {
                     selectFirstItem();
                  }
                  _loc3_.dispose();
               }
               else
               {
                  var_1430.updateActionView();
               }
               var_1430.setViewToState();
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function updatePostItCount(param1:int, param2:int) : void
      {
         var _loc3_:FurnitureItem = null;
         var _loc5_:class_1610 = null;
         for each(var _loc4_ in var_1489)
         {
            _loc3_ = _loc4_.getItem(param1) as FurnitureItem;
            if(_loc3_ != null)
            {
               (_loc5_ = _loc3_.stuffData as class_1610).setString(String(param2));
               _loc3_.stuffData = _loc5_;
               _loc4_.replaceItem(param1,_loc3_);
            }
         }
      }
      
      public function selectFirstItem() : void
      {
         var _loc2_:class_3151 = var_1430.getFirstThumb();
         if(_loc2_ == null)
         {
            return;
         }
         for each(var _loc1_ in var_1489)
         {
            if(_loc1_.window == _loc2_)
            {
               _loc1_.isSelected = true;
               _loc1_.selectedItemIndex = -1;
               break;
            }
         }
         var_1430.updateActionView();
      }
      
      public function displayItemInfo(param1:GroupItem) : void
      {
         if(var_1430)
         {
            var_1430.displayItemInfo(param1);
         }
      }
      
      public function getSelectedItem() : GroupItem
      {
         for each(var _loc1_ in var_1489)
         {
            if(_loc1_.isSelected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function removeSelections() : void
      {
         for each(var _loc1_ in var_1489)
         {
            _loc1_.isSelected = false;
         }
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         return var_282.canUserOfferToTrade();
      }
      
      public function removeAllLocks() : void
      {
         for each(var _loc1_ in var_1489)
         {
            _loc1_.removeAllLocks();
         }
         if(var_1430 != null)
         {
            var_1430.updateActionView();
         }
      }
      
      public function cancelFurniInMover() : void
      {
         if(var_3081 > -1)
         {
            _roomEngine.cancelRoomObjectInsert();
            var_1818 = false;
            var_3081 = -1;
         }
      }
      
      public function requestSelectedFurniPlacement(param1:Boolean = false) : Boolean
      {
         var _loc2_:FurnitureItem = null;
         var _loc3_:GroupItem = getSelectedItem();
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc3_.getUnlockedCount() == 0)
         {
            return false;
         }
         if(_loc3_.selectedItemIndex >= 0)
         {
            _loc2_ = _loc3_.getAt(_loc3_.selectedItemIndex);
            if(!_loc2_)
            {
               _loc2_ = _loc3_.peek();
            }
         }
         else
         {
            _loc2_ = _loc3_.peek();
         }
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.isRented && _loc2_.flatId > -1)
         {
            return false;
         }
         if(_loc2_.category == 3 || _loc2_.category == 2 || _loc2_.category == 4)
         {
            if(param1)
            {
               return false;
            }
            _communication.connection.send(new class_925(_loc2_.id));
         }
         else
         {
            requestSelectedFurniToMover(_loc2_);
         }
         var_1430.updateActionView();
         return true;
      }
      
      public function requestSelectedFurniToTrading(param1:int = 1, param2:ITextFieldWindow = null) : void
      {
         var itemsInTrade:Vector.<class_3172>;
         var coreItem:class_3172;
         var itemIds:Vector.<int>;
         var furnitureItem:class_3172;
         var trading:TradingModel;
         var ownItemCount:int;
         var itemsToTrade:int = param1;
         var offerInTradingCount:ITextFieldWindow = param2;
         var groupItem:GroupItem = getSelectedItem();
         if(groupItem == null)
         {
            return;
         }
         itemsInTrade = groupItem.getItemsForTrade(itemsToTrade);
         if(false)
         {
            return;
         }
         coreItem = null;
         itemIds = new Vector.<int>();
         for each(furnitureItem in itemsInTrade)
         {
            itemIds.push(furnitureItem.id);
            if(coreItem == null)
            {
               coreItem = furnitureItem;
            }
         }
         if(coreItem == null)
         {
            return;
         }
         trading = var_282.tradingModel;
         if(trading != null)
         {
            ownItemCount = int(trading.getOwnItemIdsInTrade().length);
            if(ownItemCount + itemIds.length <= 1500)
            {
               if(offerInTradingCount != null)
               {
                  offerInTradingCount.caption = "null";
               }
               trading.requestAddItemsToTrading(itemIds,coreItem.isWallItem,coreItem.type,coreItem.category,coreItem.groupable,coreItem.stuffData);
            }
            else
            {
               if(offerInTradingCount != null)
               {
                  offerInTradingCount.caption = "1";
               }
               _windowManager.alert("${trading.items.too_many_items.title}","${trading.items.too_many_items.desc}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
            }
         }
         else if(offerInTradingCount != null)
         {
            offerInTradingCount.caption = "1";
         }
         var_1430.updateActionView();
      }
      
      public function gotoRoom() : void
      {
         var _loc2_:GroupItem = getSelectedItem();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc1_:FurnitureItem = _loc2_.peek();
         if(_loc1_ == null)
         {
            return;
         }
         if(_communication == null)
         {
            return;
         }
         var _loc3_:IConnection = _communication.connection;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.send(new class_916(_loc1_.flatId));
         var_2524 = _loc1_;
      }
      
      public function requestSelectedFurniSelling() : void
      {
         var _loc2_:GroupItem = getSelectedItem();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc1_:FurnitureItem = _loc2_.getOneForTrade();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = var_282.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.startOfferMaking(_loc1_);
      }
      
      public function requestCurrentActionOnSelection() : void
      {
         if(isTradingOpen)
         {
            requestSelectedFurniToTrading();
         }
         else
         {
            requestSelectedFurniPlacement(false);
         }
      }
      
      public function requestClose() : void
      {
         var_282.closeView();
      }
      
      public function showUseProductSelection() : void
      {
         var _loc1_:class_3172 = null;
         var _loc2_:GroupItem = getSelectedItem();
         if(_loc2_ != null && _loc2_.peek() != null)
         {
            _loc1_ = _loc2_.peek();
            if(_loc1_)
            {
               _roomEngine.showUseProductSelection(_loc1_.ref,_loc1_.type);
            }
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case "trading":
               cancelFurniInMover();
               if(var_1430 != null)
               {
                  var_1430.updateActionView();
                  break;
               }
               break;
            case "empty":
               removeAllLocks();
               if(var_1430 != null)
               {
                  var_1430.updateActionView();
                  break;
               }
         }
      }
      
      public function updateActionView() : void
      {
         var_1430.updateActionView();
      }
      
      public function updateView() : void
      {
         if(var_1430 != null)
         {
            var_1430.updateActionView();
            var_1430.updateGridFilters();
         }
      }
      
      public function resetUnseenItems() : void
      {
         if(!var_1430)
         {
            return;
         }
         var _loc2_:Boolean = false;
         if(var_774 == "rentables")
         {
            var_282.unseenItemTracker.resetCategory(2);
            _loc2_ = true;
         }
         else
         {
            var_282.unseenItemTracker.resetCategory(1);
         }
         for each(var _loc1_ in var_1489)
         {
            if(_loc1_.hasUnseenItems && _loc1_.isRented == _loc2_)
            {
               _loc1_.hasUnseenItems = false;
            }
         }
         var_282.updateUnseenItemCounts();
      }
      
      public function updateUnseenItemsThumbs() : void
      {
         var _loc2_:Array = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(!var_1430 || true)
         {
            return;
         }
         var _loc1_:* = [];
         var _loc5_:Array = var_282.unseenItemTracker.getIds(1);
         var _loc6_:Array = var_282.unseenItemTracker.getIds(2);
         _loc1_ = _loc1_.concat(_loc5_);
         _loc1_ = _loc1_.concat(_loc6_);
         if(!_loc1_ || _loc1_.length == 0)
         {
            return;
         }
         for each(_loc3_ in var_1489)
         {
            _loc2_ = _loc3_.getFurniIds();
            for each(_loc4_ in _loc2_)
            {
               if(_loc1_.indexOf(_loc4_) != -1)
               {
                  _loc3_.hasUnseenItems = true;
                  moveItemToTop(_loc3_);
                  var_1430.grid.itemWasUpdated(_loc3_);
                  break;
               }
            }
         }
      }
      
      public function extendRentPeriod() : void
      {
         var _loc2_:GroupItem = getSelectedItem();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc1_:FurnitureItem = _loc2_.peek();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc3_:class_3148 = var_282.getFurnitureData(_loc1_.type,_loc1_.isWallItem ? "i" : "s");
         _catalog.openRentConfirmationWindow(_loc3_,false,-1,_loc1_.id);
      }
      
      public function buyRentedItem() : void
      {
         var _loc2_:GroupItem = getSelectedItem();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc1_:FurnitureItem = _loc2_.peek();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc3_:class_3148 = var_282.getFurnitureData(_loc1_.type,_loc1_.isWallItem ? "i" : "s");
         _catalog.openRentConfirmationWindow(_loc3_,true,-1,_loc1_.id);
      }
      
      private function addItemToTop(param1:GroupItem) : void
      {
         var_1489.unshift(param1);
      }
      
      private function addItemToBottom(param1:GroupItem) : void
      {
         var_1489.push(param1);
      }
      
      private function removeItem(param1:GroupItem) : void
      {
         var _loc2_:int = var_1489.indexOf(param1);
         if(_loc2_ > -1)
         {
            var_1489.splice(_loc2_,1);
         }
      }
      
      private function moveItemToTop(param1:GroupItem) : void
      {
         removeItem(param1);
         addItemToTop(param1);
      }
      
      private function getAllStripIds() : Vector.<int>
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         for each(var _loc2_ in var_1489)
         {
            _loc4_ = _loc2_.getTotalCount();
            if(_loc2_.category == 5)
            {
               _loc4_ = 1;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc1_.push(_loc2_.getAt(_loc3_).id);
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      private function initListImages() : void
      {
         var _loc1_:* = null;
         if(true)
         {
            var_2241.start();
         }
         if(var_1430 && false)
         {
            for each(_loc1_ in var_1430.currentPageItems)
            {
               if(!_loc1_.isImageInited)
               {
                  _loc1_.initImage(false);
                  break;
               }
            }
         }
      }
      
      private function getItemById(param1:int) : GroupItem
      {
         for each(var _loc2_ in var_1489)
         {
            if(_loc2_.getItem(param1) !== null)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function isUnseen(param1:FurnitureItem) : Boolean
      {
         var _loc2_:int = 0;
         if(param1.isRented)
         {
            _loc2_ = 2;
         }
         else
         {
            _loc2_ = 1;
         }
         return var_282.unseenItemTracker.isUnseen(_loc2_,param1.id);
      }
      
      private function addOrUpdateNonGroupableItem(param1:FurnitureItem, param2:Boolean) : GroupItem
      {
         var _loc3_:GroupItem = null;
         var _loc4_:Vector.<GroupItem> = new Vector.<GroupItem>(0);
         for each(_loc3_ in var_1489)
         {
            if(_loc3_.type == param1.type)
            {
               _loc4_.push(_loc3_);
            }
         }
         for each(_loc3_ in _loc4_)
         {
            if(_loc3_.getItem(param1.id) != null)
            {
               return _loc3_;
            }
         }
         var _loc5_:Boolean = isUnseen(param1);
         _loc3_ = createGroupItem(param1.type,param1.category,param1.stuffData,param1.extra,param2);
         _loc3_.push(param1,_loc5_);
         if(_loc5_)
         {
            _loc3_.hasUnseenItems = true;
            addItemToTop(_loc3_);
         }
         else
         {
            addItemToBottom(_loc3_);
         }
         if(var_1430 && false)
         {
            var_1430.grid.itemWasUpdated(_loc3_);
         }
         return _loc3_;
      }
      
      private function addOrUpdateGroupableItem(param1:FurnitureItem, param2:Boolean) : GroupItem
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = isUnseen(param1);
         for each(var _loc3_ in var_1489)
         {
            if(_loc3_.type == param1.type && _loc3_.isWallItem == param1.isWallItem && _loc3_.isGroupable)
            {
               if(param1.category == 6)
               {
                  if(_loc3_.stuffData.getLegacyString() == param1.stuffData.getLegacyString())
                  {
                     _loc4_ = _loc3_;
                     break;
                  }
               }
               else
               {
                  if(param1.category != 17)
                  {
                     _loc4_ = _loc3_;
                     break;
                  }
                  if(param1.stuffData.compare(_loc3_.stuffData))
                  {
                     _loc4_ = _loc3_;
                     break;
                  }
               }
            }
         }
         if(_loc4_)
         {
            _loc4_.push(param1,_loc5_);
            if(_loc5_)
            {
               _loc4_.hasUnseenItems = true;
               moveItemToTop(_loc4_);
            }
            if(var_1430 && false)
            {
               var_1430.grid.itemWasUpdated(_loc4_);
            }
            return _loc4_;
         }
         _loc3_ = createGroupItem(param1.type,param1.category,param1.stuffData,param1.extra,param2);
         _loc3_.push(param1,_loc5_);
         if(_loc5_)
         {
            _loc3_.hasUnseenItems = true;
            addItemToTop(_loc3_);
         }
         else
         {
            addItemToBottom(_loc3_);
         }
         if(var_1430 && false)
         {
            var_1430.grid.itemWasUpdated(_loc3_);
         }
         return _loc3_;
      }
      
      private function requestSelectedFurniToMover(param1:FurnitureItem) : void
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
         if(param1.category == 6 || isExternalImageItem(param1))
         {
            _loc2_ = _roomEngine.initializeRoomObjectInsert("inventory",param1.id,_loc3_,param1.type,param1.stuffData.getLegacyString());
         }
         else
         {
            _loc2_ = _roomEngine.initializeRoomObjectInsert("inventory",param1.id,_loc3_,param1.type,param1.extra.toString(),param1.stuffData);
         }
         if(_loc2_)
         {
            var_3081 = param1.ref;
            requestClose();
            var_1818 = true;
         }
         var_1430.updateActionView();
      }
      
      private function isExternalImageItem(param1:FurnitureItem) : Boolean
      {
         var _loc2_:class_3148 = _catalog.getFurnitureData(param1.type,"i");
         return _loc2_ && _loc2_.isExternalImageType;
      }
      
      private function updateCategorySelection() : void
      {
         var _loc2_:int = 0;
         removeSelections();
         var _loc1_:GroupItem = _categorySelection[var_774];
         if(_loc1_ != null)
         {
            _loc2_ = var_1489.indexOf(_loc1_);
            if(_loc2_ > -1)
            {
               _loc1_.isSelected = true;
               _loc1_.selectedItemIndex = -1;
            }
         }
         else
         {
            selectFirstItem();
         }
         var_1430.updateActionView();
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(var_1818 && param1.type == "REOE_PLACED")
         {
            var_1818 = false;
            if(!(param1 as RoomEngineObjectPlacedEvent).placedInRoom)
            {
               var_282.showView();
            }
            else if(var_774 == "rentables")
            {
               var_282.showView();
            }
         }
      }
      
      private function onImageUpdateTimerEvent(param1:TimerEvent) : void
      {
         var _loc5_:* = undefined;
         var _loc3_:FurnitureItem = null;
         initListImages();
         _imageUpdateCumulativeTime += 100;
         if(_imageUpdateCumulativeTime >= 1000)
         {
            _loc5_ = new Vector.<int>(0);
            for each(var _loc2_ in var_1489)
            {
               _loc3_ = _loc2_.getAt(0);
               if(_loc3_ && _loc3_.isRented && _loc3_.hasRentPeriodStarted && _loc3_.secondsToExpiration <= 0)
               {
                  _loc5_.push(_loc3_.id);
               }
            }
            for each(var _loc4_ in _loc5_)
            {
               removeFurni(_loc4_);
            }
            if(_loc5_.length > 0)
            {
               var_1430.updateGridFilters();
            }
            var_1430.updateRentedItem();
            _imageUpdateCumulativeTime = 0;
         }
      }
      
      public function roomEntered() : void
      {
         var _loc1_:int = 0;
         _isInRoom = true;
         if(var_2524 == null)
         {
            return;
         }
         if(_roomEngine != null)
         {
            _loc1_ = var_2524.isWallItem ? 20 : 10;
            _roomEngine.selectRoomObject(var_2524.flatId,Math.abs(var_2524.id),_loc1_);
         }
         var_2524 = null;
      }
      
      public function roomLeft() : void
      {
         _isInRoom = false;
      }
      
      public function selectItemById(param1:String) : void
      {
         var _loc2_:GroupItem = getItemById(-int(param1));
         if(_loc2_ != null)
         {
            categorySelection = _loc2_;
         }
      }
   }
}
