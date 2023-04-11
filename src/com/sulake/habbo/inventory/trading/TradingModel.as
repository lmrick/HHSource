package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FurnitureItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.class_3172;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.room.object.data.StringArrayStuffData;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import package_16.class_183;
   import package_16.class_256;
   import package_16.class_302;
   import package_16.class_339;
   import package_16.class_392;
   import package_16.class_503;
   import package_16.class_510;
   import package_16.class_666;
   import package_16.class_824;
   import package_90.class_365;
   import package_90.class_394;
   import package_90.class_487;
   import package_90.class_494;
   import package_90.class_633;
   import package_90.class_681;
   import package_90.class_747;
   import package_90.class_777;
   import package_90.class_799;
   
   public class TradingModel implements IInventoryModel, class_3158
   {
      
      public static const MAX_ITEMS_TO_TRADE:uint = 9;
      
      public static const TRADING_STATE_READY:uint = 0;
      
      public static const TRADING_STATE_RUNNING:uint = 1;
      
      public static const TRADING_STATE_COUNTDOWN:uint = 2;
      
      public static const TRADING_STATE_CONFIRMING:uint = 3;
      
      public static const TRADING_STATE_CONFIRMED:uint = 4;
      
      public static const TRADING_STATE_COMPLETED:uint = 5;
      
      public static const TRADING_STATE_CANCELLED:uint = 6;
       
      
      private var _inventory:HabboInventory;
      
      private var var_2029:class_21;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:class_25;
      
      private var _localization:class_18;
      
      private var _soundManager:class_2089;
      
      private var var_1479:com.sulake.habbo.inventory.trading.TradingView;
      
      private var _disposed:Boolean = false;
      
      private var var_86:Boolean = false;
      
      private var var_159:uint = 0;
      
      private var var_2422:int = -1;
      
      private var _ownUserName:String = "";
      
      private var _ownUserItems:class_24;
      
      private var _ownUserNumItems:int = 0;
      
      private var var_3012:int = 0;
      
      private var var_2149:Boolean = false;
      
      private var var_4069:Boolean = false;
      
      private var var_3450:int = -1;
      
      private var _otherUserName:String = "";
      
      private var _otherUserItems:class_24;
      
      private var _otherUserNumItems:int = 0;
      
      private var var_3063:int = 0;
      
      private var var_2595:Boolean = false;
      
      private var var_394:Boolean = false;
      
      public function TradingModel(param1:HabboInventory, param2:class_1684, param3:class_25, param4:class_21, param5:IRoomEngine, param6:class_18, param7:class_2089)
      {
         super();
         _inventory = param1;
         _communication = param3;
         var_2029 = param4;
         _roomEngine = param5;
         _localization = param6;
         _soundManager = param7;
         var_1479 = new com.sulake.habbo.inventory.trading.TradingView(this,param2,param4,param5,param6,param7);
      }
      
      public static function getGuildFurniType(param1:int, param2:IStuffData) : String
      {
         var _loc5_:int = 0;
         var _loc4_:String = param1.toString();
         var _loc3_:StringArrayStuffData = param2 as StringArrayStuffData;
         if(!_loc3_)
         {
            return _loc4_;
         }
         _loc5_ = 1;
         while(_loc5_ < 5)
         {
            _loc4_ += "," + _loc3_.getValue(_loc5_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function get running() : Boolean
      {
         return var_159 != 0;
      }
      
      public function get state() : uint
      {
         return var_159;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownUserId() : int
      {
         return var_2422;
      }
      
      public function get ownUserName() : String
      {
         return _ownUserName;
      }
      
      public function get ownUserItems() : class_24
      {
         return _ownUserItems;
      }
      
      public function get ownUserAccepts() : Boolean
      {
         return var_2149;
      }
      
      public function get ownUserCanTrade() : Boolean
      {
         return var_4069;
      }
      
      public function get otherUserId() : int
      {
         return var_3450;
      }
      
      public function get otherUserName() : String
      {
         return _otherUserName;
      }
      
      public function get otherUserItems() : class_24
      {
         return _otherUserItems;
      }
      
      public function get otherUserAccepts() : Boolean
      {
         return var_2595;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return var_394;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1479)
            {
               var_1479.dispose();
               var_1479 = null;
            }
            _inventory = null;
            _communication = null;
            var_2029 = null;
            _roomEngine = null;
            _localization = null;
            _disposed = true;
         }
      }
      
      public function startTrading(param1:int, param2:String, param3:Boolean, param4:int, param5:String, param6:Boolean) : void
      {
         var_2422 = param1;
         _ownUserName = param2;
         _ownUserItems = new class_24();
         var_2149 = false;
         var_4069 = param3;
         var_3450 = param4;
         _otherUserName = param5;
         _otherUserItems = new class_24();
         var_2595 = false;
         var_394 = param6;
         var_86 = true;
         state = 1;
         var_1479.setup(param1,param3,param4,param6);
         var_1479.updateItemList(var_2422);
         var_1479.updateItemList(var_3450);
         var_1479.updateUserInterface();
         var_1479.clearItemLists();
         _inventory.toggleInventoryPage("furni");
         _inventory.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_TRADING"));
      }
      
      public function close() : void
      {
         if(var_86)
         {
            if(var_159 != 0 && var_159 != 5)
            {
               requestCancelTrading();
               state = 6;
            }
            state = 0;
            _inventory.toggleInventorySubPage("empty");
            var_86 = false;
         }
         var_1479.setMinimized(false);
      }
      
      public function categorySwitch(param1:String) : void
      {
         var_1479.setMinimized(param1 != "furni");
         _inventory.updateSubView();
      }
      
      public function set state(param1:uint) : void
      {
         class_14.log("OLD STATE: " + var_159 + " NEW STATE: " + param1 + " OWN: " + var_2149 + " OTHER: " + var_2595);
         var _loc2_:Boolean = false;
         if(var_159 == param1)
         {
            return;
         }
         switch(int(var_159))
         {
            case 0:
               if(param1 == 1 || param1 == 5)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  break;
               }
               break;
            case 1:
               if(param1 == 2)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  startConfirmCountdown();
                  break;
               }
               if(param1 == 6)
               {
                  var_159 = param1;
                  var_1479.setMinimized(false);
                  _loc2_ = true;
                  break;
               }
               break;
            case 2:
               if(param1 == 3)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  break;
               }
               if(param1 == 6)
               {
                  var_159 = param1;
                  var_1479.setMinimized(false);
                  _loc2_ = true;
                  break;
               }
               if(param1 == 1)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  cancelConfirmCountdown();
                  break;
               }
               break;
            case 3:
               if(param1 == 4)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  break;
               }
               if(param1 == 5)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  close();
                  break;
               }
               if(param1 == 6)
               {
                  var_159 = param1;
                  var_1479.setMinimized(false);
                  _loc2_ = true;
                  close();
                  break;
               }
               break;
            case 4:
               if(param1 == 5)
               {
                  var_159 = param1;
                  var_1479.setMinimized(false);
                  _loc2_ = true;
                  close();
                  break;
               }
               if(param1 == 6)
               {
                  var_159 = param1;
                  var_1479.setMinimized(false);
                  _loc2_ = true;
                  close();
                  break;
               }
               break;
            case 5:
               if(param1 == 0)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  break;
               }
               break;
            case 6:
               if(param1 == 0)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  break;
               }
               if(param1 == 1)
               {
                  var_159 = param1;
                  _loc2_ = true;
                  break;
               }
               break;
            default:
               throw new Error("Unknown trading progress state: \"" + var_159 + "\"");
         }
         if(_loc2_)
         {
            var_1479.updateUserInterface();
            return;
         }
         throw new Error("Error assigning trading process status! States does not match: (from) " + var_159 + " (to) " + param1);
      }
      
      public function getFurniInventoryModel() : FurniModel
      {
         return _inventory.furniModel;
      }
      
      public function getInventory() : HabboInventory
      {
         return _inventory;
      }
      
      public function updateItemGroupMaps(param1:class_824, param2:class_24, param3:class_24) : void
      {
         if(_inventory == null)
         {
            return;
         }
         if(_ownUserItems != null)
         {
            _ownUserItems.dispose();
         }
         if(_otherUserItems != null)
         {
            _otherUserItems.dispose();
         }
         if(param1.firstUserID == var_2422)
         {
            _ownUserItems = param2;
            _ownUserNumItems = param1.firstUserNumItems;
            var_3012 = param1.firstUserNumCredits;
            _otherUserItems = param3;
            _otherUserNumItems = param1.secondUserNumItems;
            var_3063 = param1.secondUserNumCredits;
         }
         else
         {
            _ownUserItems = param3;
            _ownUserNumItems = param1.secondUserNumItems;
            var_3012 = param1.secondUserNumCredits;
            _otherUserItems = param2;
            _otherUserNumItems = param1.firstUserNumItems;
            var_3063 = param1.firstUserNumCredits;
         }
         var_2149 = false;
         var_2595 = false;
         var_1479.updateItemList(var_2422);
         var_1479.updateItemList(var_3450);
         var_1479.updateUserInterface();
         var _loc4_:FurniModel;
         if((_loc4_ = _inventory.furniModel) != null)
         {
            _loc4_.updateItemLocks();
         }
      }
      
      public function getOwnItemIdsInTrade() : Array
      {
         var _loc5_:GroupItem = null;
         var _loc2_:class_3172 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = [];
         if(_ownUserItems == null || false)
         {
            return _loc1_;
         }
         _loc3_ = 0;
         while(_loc3_ < _ownUserItems.length)
         {
            if((_loc5_ = _ownUserItems.getWithIndex(_loc3_) as GroupItem) != null)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc5_.getTotalCount())
               {
                  _loc2_ = _loc5_.getAt(_loc4_);
                  if(_loc2_ != null)
                  {
                     _loc1_.push(_loc2_.ref);
                  }
                  _loc4_++;
               }
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function get ownUserNumItems() : int
      {
         return _ownUserNumItems;
      }
      
      public function get ownUserNumCredits() : int
      {
         return var_3012;
      }
      
      public function get otherUserNumItems() : int
      {
         return _otherUserNumItems;
      }
      
      public function get otherUserNumCredits() : int
      {
         return var_3063;
      }
      
      public function getWindowContainer() : class_3151
      {
         return var_1479.getWindowContainer();
      }
      
      public function requestInitialization() : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         if(var_86)
         {
            if(var_159 != 0)
            {
               requestCancelTrading();
            }
         }
      }
      
      public function closingInventoryView() : void
      {
         if(var_86)
         {
            close();
         }
      }
      
      public function startConfirmCountdown() : void
      {
         var_1479.startConfirmCountdown();
      }
      
      public function cancelConfirmCountdown() : void
      {
         var_1479.cancelConfirmCountdown();
      }
      
      public function confirmCountdownReady() : void
      {
         if(var_159 == 2)
         {
            state = 3;
         }
      }
      
      public function getItemImage(param1:FurnitureItem) : BitmapData
      {
         var _loc2_:class_3266 = null;
         if(!param1.isWallItem)
         {
            _loc2_ = _roomEngine.getFurnitureImage(param1.type,new Vector3d(180,0,0),64,this,0,String(param1.extra),-1,-1,param1.stuffData);
         }
         else
         {
            _loc2_ = _roomEngine.getWallItemImage(param1.type,new Vector3d(180,0,0),64,this,0,param1.stuffData.getLegacyString());
         }
         return _loc2_.data as BitmapData;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var_1479.updateItemImage(param1,param2);
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      public function handleMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:class_503 = null;
         if(param1 is class_666)
         {
            class_14.log("TRADING::TradingOpenFailedEvent");
            if(class_666(param1).getParser().reason == 7 || class_666(param1).getParser().reason == 8)
            {
               var_1479.alertPopup(2);
            }
            else
            {
               var_1479.alertTradeOpenFailed(class_666(param1));
            }
         }
         else if(param1 is class_302)
         {
            class_14.log("TRADING::TradingAcceptEvent");
            if(class_302(param1).userID == var_2422)
            {
               var_2149 = class_302(param1).userAccepts != 0;
            }
            else
            {
               var_2595 = class_302(param1).userAccepts != 0;
            }
            var_1479.updateUserInterface();
         }
         else if(param1 is class_183)
         {
            class_14.log("TRADING::TradingConfirmationEvent");
            state = 2;
         }
         else if(param1 is class_510)
         {
            class_14.log("TRADING::TradingCompletedEvent");
            state = 5;
         }
         else if(param1 is class_503)
         {
            class_14.log("TRADING::TradingCloseEvent");
            if(!var_86)
            {
               class_14.log("Received TradingCloseEvent, but trading already stopped!!!");
               return;
            }
            _loc2_ = param1 as class_503;
            if(_loc2_.getParser().reason == 1)
            {
               if(_inventory.getBoolean("trading.commiterror.enabled"))
               {
                  var_1479.windowManager.simpleAlert("${inventory.trading.notification.title}","${inventory.trading.notification.commiterror.caption}","${inventory.trading.notification.commiterror.info}");
               }
            }
            else if(_loc2_.getParser().userID != var_2422)
            {
               var_1479.alertPopup(1);
            }
            close();
         }
         else if(param1 is class_392)
         {
            class_14.log("TRADING::TradingNotOpenEvent");
         }
         else if(param1 is class_256)
         {
            var_1479.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
         }
         else if(param1 is class_339)
         {
            var_1479.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
         }
         else
         {
            class_14.log("TRADING/Unknown message event: " + param1);
         }
      }
      
      public function requestFurniViewOpen() : void
      {
         _inventory.toggleInventoryPage("furni");
      }
      
      public function requestOpenTrading(param1:int) : void
      {
         _communication.connection.send(new class_394(param1));
      }
      
      public function requestAddItemsToTrading(param1:Vector.<int>, param2:Boolean, param3:int, param4:int, param5:Boolean, param6:IStuffData) : void
      {
         var _loc8_:* = undefined;
         if(!param5 && param1.length > 0)
         {
            _communication.connection.send(new class_777(param1.pop()));
         }
         else
         {
            _loc8_ = new Vector.<int>();
            for each(var _loc7_ in param1)
            {
               if(canAddItemToTrade(param2,param3,param4,param5,param6))
               {
                  _loc8_.push(_loc7_);
               }
            }
            if(_loc8_.length > 0)
            {
               if(_loc8_.length == 1)
               {
                  _communication.connection.send(new class_777(_loc8_.pop()));
               }
               else
               {
                  _communication.connection.send(new class_365(_loc8_));
               }
            }
         }
      }
      
      public function canAddItemToTrade(param1:Boolean, param2:int, param3:int, param4:Boolean, param5:IStuffData) : Boolean
      {
         var _loc6_:String = null;
         if(var_2149)
         {
            return false;
         }
         if(_ownUserItems == null)
         {
            return false;
         }
         if(true)
         {
            return true;
         }
         if(!param4)
         {
            return false;
         }
         _loc6_ = String(param2);
         if(param3 == 6)
         {
            _loc6_ = String(param2) + "poster" + param5.getLegacyString();
         }
         else if(param3 == 17)
         {
            _loc6_ = getGuildFurniType(param2,param5);
         }
         else
         {
            _loc6_ = (param1 ? "I" : "S") + _loc6_;
         }
         return _ownUserItems.getValue(_loc6_) != null;
      }
      
      public function requestRemoveItemFromTrading(param1:int) : void
      {
         var _loc2_:class_3172 = null;
         if(var_2149)
         {
            return;
         }
         var _loc3_:GroupItem = ownUserItems.getWithIndex(param1);
         if(_loc3_)
         {
            _loc2_ = _loc3_.peek();
            if(_loc2_)
            {
               _communication.connection.send(new class_633(_loc2_.id));
            }
         }
      }
      
      public function requestAcceptTrading() : void
      {
         _communication.connection.send(new class_799());
      }
      
      public function requestUnacceptTrading() : void
      {
         _communication.connection.send(new class_747());
      }
      
      public function requestConfirmAcceptTrading() : void
      {
         state = 4;
         _communication.connection.send(new class_487());
      }
      
      public function requestConfirmDeclineTrading() : void
      {
         _communication.connection.send(new class_681());
      }
      
      public function requestCancelTrading() : void
      {
         _communication.connection.send(new class_494());
      }
      
      public function isCreditFurniPresent() : Boolean
      {
         return var_3012 > 0 || var_3063 > 0;
      }
      
      private function get citizenshipTalentTrackEnabled() : Boolean
      {
         return _inventory.getBoolean("talent.track.citizenship.enabled");
      }
      
      public function updateView() : void
      {
      }
      
      public function selectItemById(param1:String) : void
      {
         class_14.log("NOT SUPPORTED: TRADING VIEW SELECT BY ID");
      }
   }
}
