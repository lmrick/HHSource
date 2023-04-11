package com.sulake.habbo.inventory.bots
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.window.class_1684;
   import flash.events.Event;
   import package_117.class_960;
   import package_13.class_1034;
   import package_175.class_1616;
   
   public class BotsModel implements IInventoryModel
   {
       
      
      private var var_282:HabboInventory;
      
      private var var_1430:com.sulake.habbo.inventory.bots.BotsView;
      
      private var _assets:class_21;
      
      private var _communication:class_25;
      
      private var _roomEngine:IRoomEngine;
      
      private var _catalog:IHabboCatalog;
      
      private var _items:class_24;
      
      private var var_3050:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var var_3634:Boolean;
      
      public function BotsModel(param1:HabboInventory, param2:class_1684, param3:class_25, param4:class_21, param5:IRoomEngine, param6:IHabboCatalog, param7:class_1690)
      {
         super();
         var_282 = param1;
         _assets = param4;
         _communication = param3;
         _roomEngine = param5;
         _roomEngine.events.addEventListener("REOE_PLACED",onObjectPlaced);
         _catalog = param6;
         _items = new class_24();
         var_1430 = new com.sulake.habbo.inventory.bots.BotsView(this,param2,param4,param5,param7);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1430)
            {
               var_1430.dispose();
               var_1430 = null;
            }
            if(_roomEngine)
            {
               if(false)
               {
                  _roomEngine.events.removeEventListener("REOE_PLACED",onObjectPlaced);
               }
               _roomEngine = null;
            }
            if(_items)
            {
               _items.dispose();
               _items = null;
            }
            var_282 = null;
            _catalog = null;
            _assets = null;
            _communication = null;
            _disposed = true;
         }
      }
      
      public function get controller() : HabboInventory
      {
         return var_282;
      }
      
      public function isListInitialized() : Boolean
      {
         return var_3634;
      }
      
      public function setListInitialized() : void
      {
         var_3634 = true;
         var_1430.updateState();
      }
      
      public function requestInventory() : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc1_:IConnection = _communication.connection;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new class_960());
      }
      
      public function get items() : class_24
      {
         return _items;
      }
      
      public function addItem(param1:class_1616) : void
      {
         if(_items.add(param1.id,param1))
         {
            var_1430.addItem(param1);
         }
         var_1430.updateState();
      }
      
      public function updateItems(param1:class_24) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = param1.getKeys();
         var _loc4_:Array = _items.getKeys();
         for each(_loc3_ in _loc4_)
         {
            if(_loc2_.indexOf(_loc3_) == -1)
            {
               _items.remove(_loc3_);
               var_1430.removeItem(_loc3_);
            }
         }
         for each(_loc3_ in _loc2_)
         {
            if(_loc4_.indexOf(_loc3_) == -1)
            {
               _items.add(_loc3_,param1.getValue(_loc3_));
               var_1430.addItem(param1.getValue(_loc3_));
            }
         }
      }
      
      public function removeItem(param1:int) : void
      {
         _items.remove(param1);
         var_1430.removeItem(param1);
         var_1430.updateState();
      }
      
      public function requestInitialization() : void
      {
         requestInventory();
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == "bots" && false)
         {
            var_282.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_BOTS"));
         }
      }
      
      public function getWindowContainer() : class_3151
      {
         return var_1430.getWindowContainer();
      }
      
      public function closingInventoryView() : void
      {
         if(false)
         {
            resetUnseenItems();
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function placeItemToRoom(param1:int, param2:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:class_1616 = getItemById(param1);
         if(_loc3_ == null)
         {
            return false;
         }
         if(!var_282.roomSession.areBotsAllowed)
         {
            return false;
         }
         if(var_282.roomSession.isRoomOwner)
         {
            _loc4_ = _loc3_.id * -1;
            var_3050 = _roomEngine.initializeRoomObjectInsert("inventory",_loc4_,100,4,_loc3_.figure);
            var_282.closeView();
            return var_3050;
         }
         if(!param2)
         {
            _communication.connection.send(new class_1034(_loc3_.id,0,0));
         }
         return true;
      }
      
      public function updateView() : void
      {
         if(var_1430 == null)
         {
            return;
         }
         var_1430.update();
      }
      
      private function getItemById(param1:int) : class_1616
      {
         for each(var _loc2_ in _items)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_3050 && param1.type == "REOE_PLACED")
         {
            var_282.showView();
            var_3050 = false;
         }
      }
      
      public function get roomSession() : IRoomSession
      {
         return var_282.roomSession;
      }
      
      public function resetUnseenItems() : void
      {
         var_282.unseenItemTracker.resetCategory(5);
         var_282.updateUnseenItemCounts();
         var_1430.update();
      }
      
      public function isUnseen(param1:int) : Boolean
      {
         return var_282.unseenItemTracker.isUnseen(5,param1);
      }
      
      public function selectItemById(param1:String) : void
      {
         var_1430.selectById(int(param1));
      }
   }
}
