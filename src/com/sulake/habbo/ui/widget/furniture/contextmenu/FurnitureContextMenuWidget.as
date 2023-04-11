package com.sulake.habbo.ui.widget.furniture.contextmenu
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_41;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.groups.class_1752;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
   import com.sulake.habbo.ui.widget.contextmenu.class_3167;
   import com.sulake.habbo.ui.widget.furniture.effectbox.EffectBoxOpenDialogView;
   import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniContextMenuView;
   import com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu.GuildFurnitureContextMenuView;
   import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxContextMenuView;
   import com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxOpenDialogView;
   import com.sulake.habbo.ui.widget.furniture.mysterytrophy.MysteryTrophyOpenDialogView;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   
   public class FurnitureContextMenuWidget extends RoomWidgetBase implements class_3167, class_41
   {
       
      
      private var var_1460:class_20;
      
      private var var_1430:com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
      
      private var _selectedObject:IRoomObject = null;
      
      private var var_2124:GuildFurnitureContextMenuView;
      
      private var var_2793:com.sulake.habbo.ui.widget.furniture.contextmenu.RandomTeleportContextMenuView;
      
      private var var_2673:com.sulake.habbo.ui.widget.furniture.contextmenu.MonsterPlantSeedContextMenuView;
      
      private var var_2010:com.sulake.habbo.ui.widget.furniture.contextmenu.MonsterPlantSeedConfirmationView;
      
      private var var_2274:EffectBoxOpenDialogView;
      
      private var var_2015:MysteryBoxContextMenuView;
      
      private var var_2341:MysteryTrophyOpenDialogView;
      
      private var var_3045:MysteryBoxOpenDialogView;
      
      private var var_2111:FriendFurniContextMenuView;
      
      private var var_2096:com.sulake.habbo.ui.widget.furniture.contextmenu.GenericUsableFurnitureContextMenuView;
      
      private var _catalog:IHabboCatalog;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_2413:com.sulake.habbo.ui.widget.furniture.contextmenu.PurchasableClothingConfirmationView;
      
      public function FurnitureContextMenuWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_19, param5:class_18, param6:class_20, param7:class_1752, param8:IHabboCatalog)
      {
         super(param1,param2,param3,param5);
         var_1460 = param6;
         var_2124 = new GuildFurnitureContextMenuView(this,param7,param2);
         var_2793 = new com.sulake.habbo.ui.widget.furniture.contextmenu.RandomTeleportContextMenuView(this);
         var_2673 = new com.sulake.habbo.ui.widget.furniture.contextmenu.MonsterPlantSeedContextMenuView(this);
         var_2015 = new MysteryBoxContextMenuView(this);
         var_2111 = new FriendFurniContextMenuView(this);
         var_2096 = new com.sulake.habbo.ui.widget.furniture.contextmenu.GenericUsableFurnitureContextMenuView(this);
         var_2010 = new com.sulake.habbo.ui.widget.furniture.contextmenu.MonsterPlantSeedConfirmationView(this);
         var_3045 = new MysteryBoxOpenDialogView(this);
         var_2274 = new EffectBoxOpenDialogView(this);
         var_2341 = new MysteryTrophyOpenDialogView(this);
         var_2413 = new com.sulake.habbo.ui.widget.furniture.contextmenu.PurchasableClothingConfirmationView(this);
         _catalog = param8;
         this.handler.widget = this;
         this.handler.roomEngine.events.addEventListener("REOE_REMOVED",onRoomObjectRemoved);
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_1460.removeUpdateReceiver(this);
         removeView(var_1430,false);
         var_2124.dispose();
         var_2124 = null;
         var_2793.dispose();
         var_2793 = null;
         var_2673.dispose();
         var_2673 = null;
         var_2010.dispose();
         var_2010 = null;
         var_2015.dispose();
         var_2015 = null;
         var_3045.dispose();
         var_3045 = null;
         var_2111.dispose();
         var_2111 = null;
         var_2096.dispose();
         var_2096 = null;
         var_2274.dispose();
         var_2274 = null;
         var_2341.dispose();
         var_2341 = null;
         var_2413.dispose();
         var_2413 = null;
         _catalog = null;
         super.dispose();
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function get handler() : FurnitureContextMenuWidgetHandler
      {
         return var_1453 as FurnitureContextMenuWidgetHandler;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return !!_container ? _container.roomEngine : null;
      }
      
      public function hideContextMenu(param1:IRoomObject) : void
      {
         if(_selectedObject != null && _selectedObject.getId() == param1.getId())
         {
            removeView(var_1430,false);
            var_1460.removeUpdateReceiver(this);
            _selectedObject = null;
         }
      }
      
      public function showGuildFurnitureContextMenu(param1:IRoomObject, param2:int, param3:String, param4:int, param5:Boolean, param6:Boolean) : void
      {
         _selectedObject = param1;
         var_2124.var_445 = param2;
         var_2124.var_581 = param4;
         var_2124.var_488 = param5;
         var_2124.var_452 = param6;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         var_1430 = var_2124;
         com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView.setup(var_1430,param1,param3);
         var_1460.registerUpdateReceiver(this,10);
      }
      
      public function showRandomTeleportContextMenu(param1:IRoomObject, param2:int) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         var_2793.objectCategory = param2;
         var_1430 = var_2793;
         com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView.setup(var_1430,param1);
         var_1460.registerUpdateReceiver(this,10);
      }
      
      public function showMonsterPlantSeedContextMenu(param1:IRoomObject, param2:int) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         var_2673.objectCategory = param2;
         var_1430 = var_2673;
         com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView.setup(var_1430,param1);
         var_1460.registerUpdateReceiver(this,10);
      }
      
      public function showPlantSeedConfirmationDialog(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(!var_2010)
         {
            var_2010 = new com.sulake.habbo.ui.widget.furniture.contextmenu.MonsterPlantSeedConfirmationView(this);
         }
         var_2010.open(param1.getId());
      }
      
      public function showPurchasableClothingConfirmationDialog(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(!var_2413)
         {
            var_2413 = new com.sulake.habbo.ui.widget.furniture.contextmenu.PurchasableClothingConfirmationView(this);
         }
         var_2413.open(param1.getId());
      }
      
      public function showEffectBoxOpenDialog(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(!var_2274)
         {
            var_2274 = new EffectBoxOpenDialogView(this);
         }
         var_2274.open(param1.getId());
      }
      
      public function showMysteryTrophyOpenDialog(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(!var_2341)
         {
            var_2341 = new MysteryTrophyOpenDialogView(this);
         }
         var_2341.open(param1.getId());
      }
      
      private function removePlantSeedConfirmationView() : void
      {
         if(var_2010 != null)
         {
            var_2010.close();
         }
      }
      
      public function showMysteryBoxContextMenu(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(var_2015 == null)
         {
            var_2015 = new MysteryBoxContextMenuView(this);
         }
         var_2015.isOwnerMode = handler.container.isOwnerOfFurniture(param1);
         var_2015.show();
         var_1430 = var_2015;
         com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView.setup(var_1430,param1);
         var_1460.registerUpdateReceiver(this,10);
      }
      
      public function showFriendFurnitureContextMenu(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(var_2111 == null)
         {
            var_2111 = new FriendFurniContextMenuView(this);
         }
         var_2111.show();
         var_1430 = var_2111;
         com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView.setup(var_1430,param1);
         var_1460.registerUpdateReceiver(this,10);
      }
      
      public function showUsableFurnitureContextMenu(param1:IRoomObject, param2:int) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         if(var_2096 == null)
         {
            var_2096 = new com.sulake.habbo.ui.widget.furniture.contextmenu.GenericUsableFurnitureContextMenuView(this);
         }
         var_2096.show();
         var_2096.objectCategory = param2;
         var_1430 = var_2096;
         com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView.setup(var_1430,param1);
         var_1460.registerUpdateReceiver(this,10);
      }
      
      public function showMysteryBoxOpenDialog(param1:IRoomObject) : void
      {
         _selectedObject = param1;
         if(var_1430 != null)
         {
            removeView(var_1430,false);
         }
         var_3045.startOpenFlow(param1);
      }
      
      public function removeView(param1:ContextInfoView, param2:Boolean) : void
      {
         if(param1)
         {
            param1.hide(false);
            if(param1 == var_1430)
            {
               var_1430 = null;
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         if(var_1430 && _selectedObject)
         {
            var_1430.update(this.handler.getObjectRectangle(_selectedObject.getId()),this.handler.getObjectScreenLocation(_selectedObject.getId()),param1);
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      private function onRoomObjectRemoved(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.category == 10)
         {
            _loc2_ = param1.objectId;
            if(_selectedObject != null && _selectedObject.getId() == _loc2_)
            {
               removeView(var_1430,false);
               removePlantSeedConfirmationView();
               var_1460.removeUpdateReceiver(this);
               _selectedObject = null;
            }
         }
      }
      
      public function get friendList() : class_1869
      {
         return null;
      }
   }
}
