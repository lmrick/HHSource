package com.sulake.habbo.inventory.pets
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
   import com.sulake.habbo.avatar.pets.PetCustomPart;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_144.class_1552;
   import package_144.class_1572;
   
   public class PetsView implements IInventoryView, class_3158
   {
      
      private static const UNSEEN_SYMBOL_MARGIN:int = 4;
       
      
      private const STATE_NULL:int = 0;
      
      private const STATE_INITIALIZING:int = 1;
      
      private const STATE_EMPTY:int = 2;
      
      private const STATE_CONTENT:int = 3;
      
      private var _windowManager:class_1684;
      
      private var var_2029:class_21;
      
      private var var_1430:class_3151;
      
      private var var_1443:com.sulake.habbo.inventory.pets.PetsModel;
      
      private var _disposed:Boolean = false;
      
      private var var_1986:IItemGridWindow;
      
      private var _roomEngine:IRoomEngine;
      
      private var _gridItems:class_24;
      
      private var var_1749:com.sulake.habbo.inventory.pets.PetsGridItem;
      
      private var var_2668:int = 0;
      
      private var var_3337:int;
      
      private var var_1420:Boolean = false;
      
      public function PetsView(param1:com.sulake.habbo.inventory.pets.PetsModel, param2:class_1684, param3:class_21, param4:IRoomEngine)
      {
         super();
         var_1443 = param1;
         var_2029 = param3;
         _windowManager = param2;
         _roomEngine = param4;
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
         if(!_disposed)
         {
            _windowManager = null;
            var_1443 = null;
            var_1430 = null;
            _disposed = true;
         }
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
      
      public function removePet(param1:int) : void
      {
         if(!var_1420)
         {
            return;
         }
         var _loc2_:com.sulake.habbo.inventory.pets.PetsGridItem = _gridItems.remove(param1) as com.sulake.habbo.inventory.pets.PetsGridItem;
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
      
      public function addPet(param1:class_1572) : void
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
         var _loc2_:com.sulake.habbo.inventory.pets.PetsGridItem = new com.sulake.habbo.inventory.pets.PetsGridItem(this,param1,_windowManager,var_2029,var_1443.isUnseen(param1.id));
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
      
      public function placePetToRoom(param1:int, param2:Boolean = false) : void
      {
         var_1443.placePetToRoom(param1,param2);
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
      
      public function setSelectedGridItem(param1:com.sulake.habbo.inventory.pets.PetsGridItem) : void
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
         var _loc2_:int = 0;
         if(!var_1420)
         {
            return;
         }
         var _loc1_:class_24 = var_1443.pets;
         if(!var_1443.isListInitialized())
         {
            _loc2_ = 1;
         }
         else if(!_loc1_ || _loc1_.length == 0)
         {
            _loc2_ = 2;
         }
         else
         {
            _loc2_ = 3;
         }
         if(var_2668 == _loc2_)
         {
            return;
         }
         var_2668 = _loc2_;
         updateContainerVisibility();
         if(var_2668 == 3)
         {
            updateGrid();
            updatePreview();
         }
      }
      
      public function getPetImage(param1:class_1572, param2:int, param3:Boolean, param4:com.sulake.habbo.inventory.pets.PetsGridItem = null, param5:int = 64, param6:String = null) : BitmapData
      {
         var _loc9_:int = 0;
         var _loc10_:class_1552 = param1.figureData;
         var _loc7_:BitmapData = null;
         var _loc8_:uint = parseInt(_loc10_.color,16);
         var _loc13_:* = [];
         _loc9_ = 0;
         while(_loc9_ < _loc10_.customPartCount * 3)
         {
            _loc13_.push(new PetCustomPart(_loc10_.customParts[_loc9_],_loc10_.customParts[_loc9_ + 1],_loc10_.customParts[_loc9_ + 2]));
            _loc9_ += 3;
         }
         var _loc12_:class_3266;
         if((_loc12_ = _roomEngine.getPetImage(_loc10_.typeId,_loc10_.paletteId,_loc8_,new Vector3d(param2 * 45),param5,this,param3,0,_loc13_,param6)) != null)
         {
            _loc7_ = _loc12_.data;
            if(param4 != null)
            {
               param4.imageDownloadId = _loc12_.id;
            }
            else if(param3)
            {
               var_3337 = _loc12_.id;
            }
         }
         if(_loc7_ == null)
         {
            _loc7_ = new BitmapData(30,30,false,4289374890);
         }
         return _loc7_;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == var_3337)
         {
            updatePreview(var_1749);
            return;
         }
         for each(var _loc3_ in _gridItems)
         {
            if(_loc3_.imageDownloadId == param1)
            {
               _loc3_.setPetImage(param2);
               return;
            }
         }
      }
      
      public function imageFailed(param1:int) : void
      {
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
         var _loc3_:com.sulake.habbo.inventory.pets.PetsGridItem = null;
         if(var_1430 == null)
         {
            return;
         }
         var _loc1_:Array = _gridItems.getKeys();
         var _loc2_:Array = !!var_1443.pets ? var_1443.pets.getKeys() : [];
         var_1986.lock();
         for each(_loc4_ in _loc1_)
         {
            if(_loc2_.indexOf(_loc4_) == -1)
            {
               removePet(_loc4_);
            }
         }
         for each(_loc4_ in _loc2_)
         {
            if(_loc1_.indexOf(_loc4_) == -1)
            {
               addPet(var_1443.pets.getValue(_loc4_));
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
         var _loc2_:class_1572 = var_1749.pet;
         if(_loc2_ == null)
         {
            return;
         }
         placePetToRoom(_loc2_.id);
      }
      
      private function updateContainerVisibility() : void
      {
         if(var_1443.controller.currentCategoryId != "pets")
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
      
      private function updatePreview(param1:com.sulake.habbo.inventory.pets.PetsGridItem = null) : void
      {
         var _loc15_:BitmapData = null;
         var _loc8_:String = null;
         var _loc7_:String = null;
         var _loc11_:Boolean = false;
         var _loc16_:class_1572 = null;
         var _loc3_:BitmapData = null;
         if(var_1430 == null)
         {
            return;
         }
         var _loc17_:int = 4;
         var _loc14_:Boolean = true;
         var _loc4_:String = null;
         var_3337 = -1;
         if(param1 == null || param1.pet == null)
         {
            _loc15_ = new BitmapData(1,1);
            _loc8_ = "";
            _loc7_ = "";
            _loc11_ = false;
         }
         else
         {
            _loc8_ = (_loc16_ = param1.pet).name;
            if(_loc16_.typeId == 16)
            {
               _loc17_ = 2;
               _loc14_ = true;
               if(_loc16_.level >= 7)
               {
                  _loc4_ = "std";
               }
               else
               {
                  _loc4_ = "grw" + _loc16_.level;
               }
            }
            _loc15_ = getPetImage(_loc16_,_loc17_,_loc14_,null,64,_loc4_);
            _loc11_ = true;
         }
         var _loc10_:class_3282;
         if((_loc10_ = var_1430.findChildByName("preview_image") as class_3282) != null)
         {
            _loc3_ = new BitmapData(_loc10_.width,_loc10_.height);
            _loc3_.fillRect(_loc3_.rect,0);
            _loc3_.copyPixels(_loc15_,_loc15_.rect,new Point(_loc3_.width / 2 - _loc15_.width / 2,_loc3_.height / 2 - _loc15_.height / 2));
            _loc10_.bitmap = _loc3_;
         }
         _loc15_.dispose();
         var _loc6_:ITextWindow;
         if((_loc6_ = var_1430.findChildByName("preview_text") as ITextWindow) != null)
         {
            _loc6_.caption = _loc8_;
         }
         if((_loc6_ = var_1430.findChildByName("preview_description") as ITextWindow) != null)
         {
            _loc6_.caption = _loc7_;
         }
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         if(false)
         {
            _loc12_ = var_1443.roomSession.arePetsAllowed;
            _loc13_ = var_1443.roomSession.isRoomOwner;
         }
         var _loc2_:String = "";
         if(!_loc13_)
         {
            if(_loc12_)
            {
               _loc2_ = "${inventory.pets.allowed}";
            }
            else
            {
               _loc2_ = "${inventory.pets.forbidden}";
            }
         }
         if((_loc6_ = var_1430.findChildByName("preview_info") as ITextWindow) != null)
         {
            _loc6_.caption = _loc2_;
         }
         var _loc9_:class_3140;
         if((_loc9_ = var_1430.findChildByName("place_button") as class_3140) != null)
         {
            if(_loc11_ && (_loc13_ || _loc12_))
            {
               _loc9_.enable();
            }
            else
            {
               _loc9_.disable();
            }
         }
      }
      
      private function init() : void
      {
         var _loc1_:class_3140 = null;
         var_1430 = var_1443.controller.view.getView("pets");
         var_1430.visible = false;
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
         var_1420 = true;
      }
   }
}
