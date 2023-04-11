package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent;
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.RoomDesktop;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   import package_110.class_652;
   import package_110.class_704;
   import package_110.class_731;
   import package_110.class_959;
   import package_148.class_1545;
   import package_55.class_330;
   import package_70.class_265;
   import package_81.class_326;
   import package_81.class_400;
   import package_81.class_838;
   import package_81.class_839;
   import package_81.class_914;
   
   public class CraftingWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var var_1429:CraftingWidget;
      
      private var var_2327:RoomDesktop;
      
      private var var_2555:IMessageEvent;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private var var_2200:int;
      
      private var var_3159:Boolean;
      
      private var var_2881:Boolean;
      
      private var var_3258:Boolean;
      
      private var var_3169:class_3200;
      
      public function CraftingWidgetHandler(param1:RoomDesktop)
      {
         super();
         var_2327 = param1;
      }
      
      public function dispose() : void
      {
         removeMessageEvents();
         var_1429 = null;
         _container = null;
         var_2327 = null;
         var_3169 = null;
         _disposed = true;
      }
      
      private function addMessageEvents() : void
      {
         if(!_container || true)
         {
            return;
         }
         _messageEvents = new Vector.<IMessageEvent>(0);
         _messageEvents.push(new class_959(onCraftableProductsMessage));
         _messageEvents.push(new class_704(onCraftingRecipeMessage));
         _messageEvents.push(new class_731(onCraftingResultMessage));
         _messageEvents.push(new class_652(onCraftingRecipesAvailableMessage));
         for each(var _loc1_ in _messageEvents)
         {
            _container.connection.addMessageEvent(_loc1_);
         }
      }
      
      private function removeMessageEvents() : void
      {
         if(!_container || true || !_messageEvents)
         {
            return;
         }
         for each(var _loc1_ in _messageEvents)
         {
            _container.connection.removeMessageEvent(_loc1_);
            _loc1_.dispose();
         }
         removeInventoryUpdateEvent();
         if(false && _container.inventory.events)
         {
            _container.inventory.events.removeEventListener("HFLPE_FURNI_LIST_PARSED",onFurniListParsed);
         }
         _messageEvents = null;
      }
      
      public function initializeData() : void
      {
         if(var_3159)
         {
            return;
         }
         var_3159 = true;
         if(_container.inventory.checkCategoryInitilization("furni"))
         {
            getCraftableProducts();
         }
      }
      
      private function onFurniListParsed(param1:HabboInventoryFurniListParsedEvent) : void
      {
         if(var_3159 && param1.category == "furni")
         {
            getCraftableProducts();
         }
      }
      
      private function getCraftableProducts() : void
      {
         _container.connection.send(new class_400(var_2200));
      }
      
      private function onCraftableProductsMessage(param1:class_959) : void
      {
         var_3159 = false;
         if(!var_1429)
         {
            return;
         }
         if(!param1.getParser().hasData())
         {
            var_1429.hide();
            return;
         }
         var_1429.showWidget();
         var_1429.showCraftingCategories(param1.getParser().recipeProductItems,param1.getParser().usableInventoryFurniClasses,_container.roomEngine,_container.sessionDataManager);
         var_2881 = false;
      }
      
      public function getCraftingRecipe(param1:String) : void
      {
         var_3169 = _container.sessionDataManager.getProductData(param1);
         _container.connection.send(new class_914(param1));
      }
      
      private function onCraftingRecipeMessage(param1:class_704) : void
      {
         var_1429.showCraftingRecipe(param1.getParser().ingredients);
      }
      
      public function getCraftingRecipesAvailable(param1:Vector.<int>) : void
      {
         _container.connection.send(new class_839(var_2200,param1));
      }
      
      private function onCraftingRecipesAvailableMessage(param1:class_652) : void
      {
         var_1429.infoCtrl.craftingSecretRecipesAvailable(param1.getParser().count,param1.getParser().recipeComplete);
      }
      
      public function doCraftingWithRecipe() : void
      {
         if(!var_3169)
         {
            return;
         }
         var_1429.infoCtrl.setState(1000);
         registerForFurniListInvalidate();
         _container.connection.send(new class_326(var_2200,var_3169.type));
      }
      
      public function doCraftingWithMixer() : void
      {
         var_1429.infoCtrl.setState(1000);
         var _loc1_:Vector.<int> = var_1429.getSelectedIngredients();
         registerForFurniListInvalidate();
         _container.connection.send(new class_838(var_2200,_loc1_));
      }
      
      private function onCraftingResultMessage(param1:class_731) : void
      {
         var _loc2_:class_1545 = null;
         var _loc3_:class_3148 = null;
         var_3258 = false;
         if(!param1.getParser().success)
         {
            var_1429.clearMixerItems();
            var_2881 = false;
            removeInventoryUpdateEvent();
            var_1429.setInfoState(1);
         }
         else
         {
            var_1429.clearMixerItems();
            _loc2_ = param1.getParser().productData;
            _loc3_ = _container.sessionDataManager.getFloorItemDataByName(_loc2_.furnitureClassName);
            if(!_loc3_)
            {
               return;
            }
            var_1429.setInfoState(999,_loc3_);
         }
      }
      
      private function registerForFurniListInvalidate() : void
      {
         var_2881 = true;
         if(var_2555 == null)
         {
            var_2555 = new class_330(onFurniListInvalidate);
            _container.connection.addMessageEvent(var_2555);
         }
      }
      
      private function onFurniListInvalidate(param1:class_330) : void
      {
         _container.connection.send(new class_265());
         _container.connection.send(new class_400(var_2200));
         removeInventoryUpdateEvent();
      }
      
      public function removeInventoryUpdateEvent() : void
      {
         if(var_2555)
         {
            _container.connection.removeMessageEvent(var_2555);
            var_2555 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get type() : String
      {
         return "RWE_CRAFTING";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         addMessageEvents();
         if(false && _container.inventory.events)
         {
            _container.inventory.events.addEventListener("HFLPE_FURNI_LIST_PARSED",onFurniListParsed);
         }
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function set widget(param1:CraftingWidget) : void
      {
         var_1429 = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         return null;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return ["RETWE_OPEN_WIDGET","RETWE_CLOSE_WIDGET"];
      }
      
      public function processEvent(param1:Event) : void
      {
         if(true || var_1429 == null)
         {
            return;
         }
         var _loc3_:RoomEngineToWidgetEvent = param1 as RoomEngineToWidgetEvent;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:IRoomObject = _container.roomEngine.getRoomObject(_loc3_.roomId,_loc3_.objectId,_loc3_.category);
         switch(param1.type)
         {
            case "RETWE_OPEN_WIDGET":
               if(false)
               {
                  return;
               }
               if(_loc2_ != null)
               {
                  var_2200 = _loc2_.getId();
                  initializeData();
                  break;
               }
               break;
            case "RETWE_CLOSE_WIDGET":
               var_2200 = -1;
               var_1429.hide();
         }
      }
      
      public function get isOwner() : Boolean
      {
         var _loc1_:int = _container.roomEngine.activeRoomId;
         var _loc2_:IRoomObject = _container.roomEngine.getRoomObject(_loc1_,var_2200,10);
         return _loc2_ != null && _container.isOwnerOfFurniture(_loc2_);
      }
      
      public function get craftingInProgress() : Boolean
      {
         return var_3258;
      }
      
      public function set craftingInProgress(param1:Boolean) : void
      {
         var_3258 = param1;
      }
      
      public function get inventoryDirty() : Boolean
      {
         return var_2881;
      }
      
      public function update() : void
      {
      }
   }
}
