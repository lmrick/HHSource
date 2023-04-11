package com.sulake.habbo.inventory.bots
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_175.class_1616;
   
   public class BotsView implements IInventoryView, class_1870
   {
       
      
      private const STATE_NULL:int = 0;
      
      private const STATE_INITIALIZING:int = 1;
      
      private const STATE_EMPTY:int = 2;
      
      private const STATE_CONTENT:int = 3;
      
      private var _windowManager:class_1684;
      
      private var var_2029:class_21;
      
      private var var_1430:class_3151;
      
      private var var_1443:com.sulake.habbo.inventory.bots.BotsModel;
      
      private var _disposed:Boolean = false;
      
      private var var_1986:IItemGridWindow;
      
      private var _roomEngine:IRoomEngine;
      
      private var _avatarRenderer:class_1690;
      
      private var _gridItems:class_24;
      
      private var var_1749:com.sulake.habbo.inventory.bots.BotGridItem;
      
      private var var_2668:int = 0;
      
      private var var_3337:int;
      
      private var var_1420:Boolean = false;
      
      public function BotsView(param1:com.sulake.habbo.inventory.bots.BotsModel, param2:class_1684, param3:class_21, param4:IRoomEngine, param5:class_1690)
      {
         super();
         var_1443 = param1;
         var_2029 = param3;
         _windowManager = param2;
         _roomEngine = param4;
         _avatarRenderer = param5;
         _gridItems = new class_24();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get isVisible() : Boolean
      {
         return var_1430 && false && false;
      }
      
      public function dispose() : void
      {
         _windowManager = null;
         _avatarRenderer = null;
         _roomEngine = null;
         var_2029 = null;
         var_1443 = null;
         var_1430 = null;
         _disposed = true;
      }
      
      public function update() : void
      {
         if(!var_1420)
         {
            return;
         }
         updateGrid();
         updatePreview(var_1749);
         updateContainerVisibility();
      }
      
      public function removeItem(param1:int) : void
      {
         if(!var_1420)
         {
            return;
         }
         var _loc2_:com.sulake.habbo.inventory.bots.BotGridItem = _gridItems.remove(param1) as com.sulake.habbo.inventory.bots.BotGridItem;
         if(_loc2_ == null)
         {
            return;
         }
         var_1986.removeGridItem(_loc2_.window);
         if(var_1749 == _loc2_)
         {
            var_1749 = null;
            selectFirst();
         }
      }
      
      public function addItem(param1:class_1616) : void
      {
         if(!var_1420)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_gridItems.getValue(param1.id) != null)
         {
            return;
         }
         var _loc2_:com.sulake.habbo.inventory.bots.BotGridItem = new com.sulake.habbo.inventory.bots.BotGridItem(this,param1,_windowManager,var_2029,var_1443.isUnseen(param1.id));
         if(_loc2_ != null)
         {
            var_1986.addGridItem(_loc2_.window);
            _gridItems.add(param1.id,_loc2_);
            if(var_1749 == null)
            {
               selectFirst();
            }
         }
      }
      
      public function placeItemToRoom(param1:int, param2:Boolean = false) : void
      {
         var_1443.placeItemToRoom(param1,param2);
      }
      
      public function getWindowContainer() : class_3151
      {
         if(!var_1420)
         {
            init();
         }
         if(var_1430 == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return var_1430;
      }
      
      public function setSelectedGridItem(param1:com.sulake.habbo.inventory.bots.BotGridItem) : void
      {
         if(!var_1420)
         {
            return;
         }
         if(var_1749 != null)
         {
            var_1749.setSelected(false);
         }
         var_1749 = param1;
         if(var_1749 != null)
         {
            var_1749.setSelected(true);
         }
         updatePreview(param1);
      }
      
      public function updateState() : void
      {
         var _loc1_:int = 0;
         if(!var_1420)
         {
            return;
         }
         var _loc2_:class_24 = var_1443.items;
         if(!var_1443.isListInitialized())
         {
            _loc1_ = 1;
         }
         else if(!_loc2_ || _loc2_.length == 0)
         {
            _loc1_ = 2;
         }
         else
         {
            _loc1_ = 3;
         }
         if(var_2668 == _loc1_)
         {
            return;
         }
         var_2668 = _loc1_;
         updateContainerVisibility();
         if(var_2668 == 3)
         {
            updateGrid();
            updatePreview();
         }
      }
      
      public function getGridItemImage(param1:class_1616) : BitmapData
      {
         return getItemImage(param1,3,false,"h");
      }
      
      public function getItemImage(param1:class_1616, param2:int, param3:Boolean, param4:String) : BitmapData
      {
         var _loc5_:BitmapData = null;
         var _loc6_:class_3156;
         (_loc6_ = _avatarRenderer.createAvatarImage(param1.figure,param4,param1.gender,this)).setDirection("full",param2);
         if(param3)
         {
            _loc5_ = _loc6_.getCroppedImage("full");
         }
         else
         {
            _loc5_ = _loc6_.getCroppedImage("head");
         }
         _loc6_.dispose();
         return _loc5_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(disposed)
         {
            return;
         }
         for each(var _loc2_ in _gridItems)
         {
            if(_loc2_.data.figure == param1)
            {
               _loc2_.setImage(getGridItemImage(_loc2_.data));
            }
         }
      }
      
      private function selectFirst() : void
      {
         if(_gridItems == null || false)
         {
            updatePreview();
            return;
         }
         setSelectedGridItem(_gridItems.getWithIndex(0));
      }
      
      public function selectById(param1:int) : void
      {
         setSelectedGridItem(_gridItems.getValue(param1));
      }
      
      private function updateGrid() : void
      {
         var _loc4_:int = 0;
         var _loc3_:com.sulake.habbo.inventory.bots.BotGridItem = null;
         if(var_1430 == null)
         {
            return;
         }
         var _loc1_:Array = _gridItems.getKeys();
         var _loc2_:Array = !!var_1443.items ? var_1443.items.getKeys() : [];
         var_1986.lock();
         for each(_loc4_ in _loc1_)
         {
            if(_loc2_.indexOf(_loc4_) == -1)
            {
               removeItem(_loc4_);
            }
         }
         for each(_loc4_ in _loc2_)
         {
            if(_loc1_.indexOf(_loc4_) == -1)
            {
               addItem(var_1443.items.getValue(_loc4_));
            }
            _loc3_ = _gridItems.getValue(_loc4_);
            _loc3_.setUnseen(var_1443.isUnseen(_loc4_));
         }
         var_1986.unlock();
      }
      
      private function startPlacingHandler(param1:WindowMouseEvent) : void
      {
         if(var_1749 == null)
         {
            return;
         }
         var _loc2_:class_1616 = var_1749.data;
         if(_loc2_ == null)
         {
            return;
         }
         placeItemToRoom(_loc2_.id);
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
      }
      
      private function updateContainerVisibility() : void
      {
         if(var_1443.controller.currentCategoryId != "bots")
         {
            return;
         }
         var _loc1_:class_3151 = var_1443.controller.view.loadingContainer;
         var _loc3_:class_3151 = var_1443.controller.view.emptyContainer;
         var _loc4_:class_3127 = var_1430.findChildByName("grid");
         var _loc2_:class_3127 = var_1430.findChildByName("preview_container");
         switch(var_2668 - 1)
         {
            case 0:
               if(_loc1_)
               {
                  _loc1_.visible = true;
               }
               if(_loc3_)
               {
                  _loc3_.visible = false;
               }
               _loc4_.visible = false;
               _loc2_.visible = false;
               break;
            case 1:
               if(_loc1_)
               {
                  _loc1_.visible = false;
               }
               if(_loc3_)
               {
                  _loc3_.visible = true;
               }
               _loc4_.visible = false;
               _loc2_.visible = false;
               break;
            case 2:
               if(_loc1_)
               {
                  _loc1_.visible = false;
               }
               if(_loc3_)
               {
                  _loc3_.visible = false;
               }
               _loc4_.visible = true;
               _loc2_.visible = true;
         }
      }
      
      private function updatePreview(param1:com.sulake.habbo.inventory.bots.BotGridItem = null) : void
      {
         var _loc3_:BitmapData = null;
         var _loc11_:String = null;
         var _loc13_:String = null;
         var _loc10_:Boolean = false;
         var _loc4_:class_1616 = null;
         var _loc5_:BitmapData = null;
         if(var_1430 == null)
         {
            return;
         }
         var_3337 = -1;
         if(param1 == null || param1.data == null)
         {
            _loc3_ = new BitmapData(1,1);
            _loc11_ = "";
            _loc13_ = "";
            _loc10_ = false;
         }
         else
         {
            _loc11_ = (_loc4_ = param1.data).name;
            _loc13_ = _loc4_.motto;
            _loc3_ = getItemImage(_loc4_,4,true,"h");
            _loc10_ = true;
         }
         var _loc9_:class_3282;
         if((_loc9_ = var_1430.findChildByName("preview_image") as class_3282) != null)
         {
            _loc5_ = new BitmapData(_loc9_.width,_loc9_.height);
            _loc5_.fillRect(_loc5_.rect,0);
            _loc5_.copyPixels(_loc3_,_loc3_.rect,new Point(_loc5_.width / 2 - _loc3_.width / 2,_loc5_.height / 2 - _loc3_.height / 2));
            _loc9_.bitmap = _loc5_;
         }
         _loc3_.dispose();
         var _loc6_:ITextWindow;
         if((_loc6_ = var_1430.findChildByName("bot_name") as ITextWindow) != null)
         {
            _loc6_.caption = _loc11_;
         }
         if((_loc6_ = var_1430.findChildByName("bot_description") as ITextWindow) != null)
         {
            _loc6_.caption = _loc13_;
         }
         var _loc8_:Boolean = false;
         var _loc12_:Boolean = false;
         if(false)
         {
            _loc8_ = var_1443.roomSession.areBotsAllowed;
            _loc12_ = var_1443.roomSession.isRoomOwner;
         }
         var _loc2_:String = "";
         if(!_loc12_)
         {
            if(_loc8_)
            {
               _loc2_ = "${inventory.bots.allowed}";
            }
            else
            {
               _loc2_ = "${inventory.bots.forbidden}";
            }
         }
         if((_loc6_ = var_1430.findChildByName("preview_info") as ITextWindow) != null)
         {
            _loc6_.caption = _loc2_;
         }
         var _loc7_:class_3140;
         if((_loc7_ = var_1430.findChildByName("place_button") as class_3140) != null)
         {
            if(_loc10_ && (_loc12_ || _loc8_))
            {
               _loc7_.enable();
            }
            else
            {
               _loc7_.disable();
            }
         }
      }
      
      private function addUnseenItemSymbols() : void
      {
      }
      
      private function init() : void
      {
         var _loc1_:class_3140 = null;
         var_1430 = var_1443.controller.view.getView("bots");
         var_1430.visible = false;
         var_1430.procedure = windowEventHandler;
         addUnseenItemSymbols();
         var_1986 = var_1430.findChildByName("grid") as IItemGridWindow;
         _loc1_ = var_1430.findChildByName("place_button") as class_3140;
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",startPlacingHandler);
         }
         var _loc2_:class_3282 = var_1430.findChildByName("preview_image") as class_3282;
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_DOWN",startPlacingHandler);
         }
         updatePreview();
         updateState();
         selectFirst();
         var_1420 = true;
      }
   }
}
