package com.sulake.habbo.inventory.items
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.window.widgets.ILimitedItemGridOverlayWidget;
   import com.sulake.habbo.window.widgets.IRarityItemGridOverlayWidget;
   import flash.display.BitmapData;
   
   public class GroupItem implements class_3158
   {
      
      private static const THUMB_WINDOW_LAYOUT:String = "inventory_thumb_xml";
      
      private static const THUMB_COLOR_NORMAL:int = 13421772;
      
      private static const THUMB_COLOR_UNSEEN:int = 10275685;
       
      
      private const THUMB_BLEND_ITEMS_AVAILABLE:Number = 1;
      
      private const THUMB_BLEND_ITEMS_NOT_AVAILABLE:Number = 0.2;
      
      protected var _items:class_24;
      
      protected var _window:class_3151;
      
      protected var var_1443:FurniModel;
      
      private var var_271:int;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_142:Boolean;
      
      private var _selected:Boolean;
      
      private var var_774:int;
      
      private var var_921:IStuffData;
      
      private var var_609:Number;
      
      private var var_2008:int = 0;
      
      private var var_2001:BitmapData;
      
      private var var_3233:int;
      
      private var var_2504:Boolean;
      
      private var var_4183:Boolean;
      
      private var _icon:BitmapData;
      
      private var var_2043:class_3127;
      
      private var _hasUnseenItems:Boolean;
      
      private var var_2103:Boolean;
      
      private var var_3422:String = "center";
      
      private var var_1420:Boolean = false;
      
      private var _name:String = "";
      
      private var _description:String = "";
      
      private var var_2824:int = -1;
      
      private var var_2398:int = -1;
      
      public function GroupItem(param1:FurniModel, param2:int, param3:int, param4:IRoomEngine, param5:IStuffData, param6:Number, param7:BitmapData, param8:Boolean, param9:String)
      {
         super();
         var_1443 = param1;
         var_271 = param2;
         _roomEngine = param4;
         _items = new class_24();
         var_774 = param3;
         var_921 = param5;
         var_609 = param6;
         var_3422 = param9;
         _icon = param7;
         var_4183 = param8;
         switch(var_774 - 2)
         {
            case 0:
               _name = var_1443.controller.localization.getLocalization("inventory.furni.item.wallpaper.name");
               _description = var_1443.controller.localization.getLocalization("inventory.furni.item.wallpaper.desc");
               break;
            case 1:
               _name = var_1443.controller.localization.getLocalization("inventory.furni.item.floor.name");
               _description = var_1443.controller.localization.getLocalization("inventory.furni.item.floor.desc");
               break;
            case 2:
               _name = var_1443.controller.localization.getLocalization("inventory.furni.item.landscape.name");
               _description = var_1443.controller.localization.getLocalization("inventory.furni.item.landscape.desc");
         }
         var_1443.soundManager.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
      }
      
      public function get isImageInited() : Boolean
      {
         return var_1420 && var_2504;
      }
      
      public function get isImageFinished() : Boolean
      {
         return var_2008 == -1;
      }
      
      public function get window() : class_3151
      {
         if(!var_1420)
         {
            initWindow();
         }
         if(_window == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return _window;
      }
      
      public function get isLocked() : Boolean
      {
         return var_142;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_142 = param1;
      }
      
      public function get isSelected() : Boolean
      {
         return _selected;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         if(_selected != param1)
         {
            _selected = param1;
            updateSelectionVisual();
         }
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_2001;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_2001 = param1;
      }
      
      public function get iconCallbackId() : int
      {
         return var_2008;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_2008 = param1;
      }
      
      public function get previewCallbackId() : int
      {
         return var_3233;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_3233 = param1;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get stuffData() : IStuffData
      {
         return var_921;
      }
      
      public function get extra() : Number
      {
         return var_609;
      }
      
      public function get hasUnseenItems() : Boolean
      {
         return _hasUnseenItems;
      }
      
      public function set hasUnseenItems(param1:Boolean) : void
      {
         if(_hasUnseenItems != param1)
         {
            _hasUnseenItems = param1;
            updateBackgroundVisual();
         }
      }
      
      public function get alignment() : String
      {
         return var_3422;
      }
      
      public function get isWallItem() : Boolean
      {
         var _loc1_:FurnitureItem = getAt(0);
         return !!_loc1_ ? _loc1_.isWallItem : false;
      }
      
      public function get flatId() : int
      {
         var _loc1_:FurnitureItem = getAt(0);
         return !!_loc1_ ? _loc1_.flatId : -1;
      }
      
      public function get isGroupable() : Boolean
      {
         var _loc1_:FurnitureItem = getAt(0);
         return !!_loc1_ ? _loc1_.groupable : true;
      }
      
      public function get isRented() : Boolean
      {
         var _loc1_:FurnitureItem = getAt(0);
         return !!_loc1_ ? _loc1_.isRented : false;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function dispose() : void
      {
         if(false)
         {
            if(var_1443.soundManager.events != null)
            {
               var_1443.soundManager.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
            }
         }
         var_1443 = null;
         var_2043 = null;
         _roomEngine = null;
         if(_items)
         {
            _items.dispose();
            _items = null;
         }
         var_921 = null;
         if(_window)
         {
            _window.dispose();
         }
      }
      
      public function removeIntervalProcedure() : void
      {
         if(_window)
         {
            _window.procedure = null;
         }
      }
      
      public function initImage(param1:Boolean = true) : void
      {
         var _loc2_:class_3266 = null;
         if(var_2001 != null)
         {
            return;
         }
         if(var_2504)
         {
            return;
         }
         if(isWallItem)
         {
            _loc2_ = _roomEngine.getWallItemIcon(var_271,this,var_921.getLegacyString());
         }
         else
         {
            _loc2_ = _roomEngine.getFurnitureIcon(var_271,this,String(var_609),var_921);
         }
         if(_loc2_.id > 0)
         {
            if(param1)
            {
               setLoadingImage(_loc2_.data);
            }
            var_2008 = _loc2_.id;
         }
         else
         {
            setFinalImage(_loc2_.data);
            var_2008 = -1;
         }
         var_2504 = true;
      }
      
      public function push(param1:FurnitureItem, param2:Boolean = false) : void
      {
         var _loc3_:FurnitureItem = _items.getValue(param1.id);
         if(_loc3_ == null)
         {
            _items.add(param1.id,param1);
         }
         else
         {
            _loc3_.locked = false;
         }
         updateItemCountVisual();
         updateSelectionVisual();
         if(_name == null || false)
         {
            _name = getFurniItemName();
         }
         if(_description == null || false)
         {
            _description = getFurniItemDesc();
         }
         if(param2 != _hasUnseenItems)
         {
            _hasUnseenItems = param2;
            updateBackgroundVisual();
         }
      }
      
      public function unshift(param1:FurnitureItem) : void
      {
         var _loc2_:FurnitureItem = _items.getValue(param1.id);
         if(_loc2_ == null)
         {
            _items.unshift(param1.id,param1);
         }
         else
         {
            _loc2_.locked = false;
         }
         updateAllThumbDataVisuals();
      }
      
      public function pop() : FurnitureItem
      {
         var _loc1_:FurnitureItem = null;
         if(false)
         {
            _loc1_ = _items.getWithIndex(-1) as FurnitureItem;
            _items.remove(_loc1_.id);
         }
         updateAllThumbDataVisuals();
         return _loc1_;
      }
      
      public function peek() : FurnitureItem
      {
         var _loc1_:FurnitureItem = null;
         if(false)
         {
            _loc1_ = _items.getWithIndex(-1) as FurnitureItem;
            updateAllThumbDataVisuals();
         }
         return _loc1_;
      }
      
      public function getAt(param1:int) : FurnitureItem
      {
         return _items.getWithIndex(param1);
      }
      
      public function getItemsForTrade(param1:int) : Vector.<class_3172>
      {
         var _loc5_:int = 0;
         var _loc2_:FurnitureItem = null;
         var _loc3_:Vector.<class_3172> = new Vector.<class_3172>();
         var _loc6_:class_3172;
         if((_loc6_ = getOneForTrade()) == null)
         {
            return _loc3_;
         }
         var _loc4_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _items.length)
         {
            if(_loc4_ >= param1)
            {
               break;
            }
            _loc2_ = _items.getWithIndex(_loc5_);
            if(!_loc2_.locked && _loc2_.tradeable && _loc2_.type == _loc6_.type)
            {
               _loc4_++;
               _loc3_.push(_loc2_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function getOneForTrade() : FurnitureItem
      {
         var _loc2_:FurnitureItem = null;
         var _loc3_:int = 0;
         var _loc1_:FurnitureItem = null;
         if(var_2398 >= 0 && var_2398 < _items.length)
         {
            _loc2_ = _items.getWithIndex(var_2398);
            if(!_loc2_.locked && _loc2_.tradeable)
            {
               return _loc2_;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc3_);
            if(!_loc1_.locked && _loc1_.tradeable)
            {
               return _loc1_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getOneForRecycle() : FurnitureItem
      {
         var _loc2_:int = 0;
         var _loc1_:FurnitureItem = null;
         _loc2_ = 0;
         while(_loc2_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc2_);
            if(!_loc1_.locked && _loc1_.recyclable)
            {
               addLockTo(_loc1_.id);
               return _loc1_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getOneForSelling() : FurnitureItem
      {
         var _loc2_:int = 0;
         var _loc1_:FurnitureItem = null;
         _loc2_ = 0;
         while(_loc2_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc2_);
            if(!_loc1_.locked && _loc1_.sellable)
            {
               return _loc1_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getFurniIds() : Array
      {
         var _loc2_:* = [];
         for each(var _loc1_ in _items)
         {
            _loc2_.push(_loc1_.id);
         }
         return _loc2_;
      }
      
      public function getNonRentedFurnitureIds() : Array
      {
         var _loc2_:* = [];
         for each(var _loc1_ in _items)
         {
            if(!_loc1_.isRented)
            {
               _loc2_.push(_loc1_.id);
            }
         }
         return _loc2_;
      }
      
      public function addLockTo(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:FurnitureItem = null;
         _loc3_ = 0;
         while(_loc3_ < _items.length)
         {
            _loc2_ = _items.getWithIndex(_loc3_);
            if(_loc2_.id == param1)
            {
               _loc2_.locked = true;
               updateItemCountVisual();
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function updateLocks(param1:Array) : void
      {
         var _loc5_:Boolean = false;
         var _loc2_:FurnitureItem = null;
         var _loc4_:* = false;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc2_ = _items.getWithIndex(_loc3_);
            _loc4_ = param1.indexOf(_loc2_.ref) >= 0;
            if(_loc2_.locked != _loc4_)
            {
               _loc2_.locked = _loc4_;
               _loc5_ = true;
            }
            _loc3_--;
         }
         if(_loc5_)
         {
            updateItemCountVisual();
         }
      }
      
      public function removeLockFrom(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:FurnitureItem = null;
         _loc3_ = 0;
         while(_loc3_ < _items.length)
         {
            _loc2_ = _items.getWithIndex(_loc3_);
            if(_loc2_.id == param1)
            {
               _loc2_.locked = false;
               updateItemCountVisual();
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function removeAllLocks() : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:int = 0;
         var _loc1_:FurnitureItem = null;
         _loc2_ = -1;
         while(_loc2_ >= 0)
         {
            _loc1_ = _items.getWithIndex(_loc2_);
            if(_loc1_.locked)
            {
               _loc1_.locked = false;
               _loc3_ = true;
            }
            _loc2_--;
         }
         if(_loc3_)
         {
            updateItemCountVisual();
         }
      }
      
      public function getTotalCount() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:FurnitureItem = null;
         if(category == 5)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            while(_loc3_ < _items.length)
            {
               _loc1_ = _items.getWithIndex(_loc3_) as FurnitureItem;
               _loc2_ += int(_loc1_.stuffData.getLegacyString());
               _loc3_++;
            }
            return _loc2_;
         }
         return _items.length;
      }
      
      public function getRecyclableCount() : int
      {
         var _loc3_:int = 0;
         var _loc1_:FurnitureItem = null;
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc3_) as FurnitureItem;
            if(_loc1_.recyclable && !_loc1_.locked)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getTradeableCount() : int
      {
         var _loc3_:int = 0;
         var _loc1_:FurnitureItem = null;
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc3_) as FurnitureItem;
            if(_loc1_.tradeable && !_loc1_.locked)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function remove(param1:int) : FurnitureItem
      {
         var _loc2_:FurnitureItem = _items.getValue(param1);
         if(_loc2_)
         {
            _items.remove(param1);
            updateAllThumbDataVisuals();
            return _loc2_;
         }
         return null;
      }
      
      public function getItem(param1:int) : FurnitureItem
      {
         return _items.getValue(param1);
      }
      
      public function replaceItem(param1:int, param2:FurnitureItem) : void
      {
         _items.add(param1,param2);
         updateAllThumbDataVisuals();
      }
      
      public function getMinimumItemsToShowCounter() : int
      {
         return 2;
      }
      
      public function getUnlockedCount() : int
      {
         var _loc1_:FurnitureItem = null;
         var _loc3_:int = 0;
         if(category == 5)
         {
            return getTotalCount();
         }
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _items.length)
         {
            _loc1_ = _items.getWithIndex(_loc3_);
            if(!_loc1_.locked)
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function updateAllThumbDataVisuals() : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         updateItemImageVisual();
         updateBackgroundVisual();
         updateItemCountVisual();
         updateSelectionVisual();
         updateRentStateVisual();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_2008 != param1)
         {
            return;
         }
         var_2001 = param2;
         updateItemImageVisual();
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function setFinalImage(param1:BitmapData) : void
      {
         var_2001 = param1;
         var_2504 = true;
         var_2008 = -1;
         updateItemImageVisual();
      }
      
      private function setLoadingImage(param1:BitmapData) : void
      {
         var_2001 = param1;
         var_2504 = true;
         updateItemImageVisual();
      }
      
      private function updateRentStateVisual() : void
      {
         if(_window == null || false)
         {
            return;
         }
         var _loc2_:FurnitureItem = getAt(0);
         var _loc1_:IStaticBitmapWrapperWindow = _window.findChildByName("rent_state") as IStaticBitmapWrapperWindow;
         if(!_loc2_ || !isRented)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = _loc2_.secondsToExpiration >= 0 && _loc2_.hasRentPeriodStarted;
         var _loc3_:int = var_1443.controller.getInteger("purchase.rent.warning_duration_seconds",172800);
         _loc1_.assetUri = _loc2_.secondsToExpiration < _loc3_ ? "inventory_thumb_rent_ending" : "inventory_thumb_rent_started";
      }
      
      private function updateItemCountVisual() : void
      {
         var _loc4_:ITextWindow = null;
         if(!_window)
         {
            return;
         }
         var _loc5_:int;
         var _loc1_:* = (_loc5_ = getUnlockedCount()) >= getMinimumItemsToShowCounter();
         var _loc3_:class_3127 = _window.findChildByName("number_container");
         _loc3_.visible = _loc1_;
         if(_loc1_)
         {
            (_loc4_ = _window.findChildByName("number") as ITextWindow).text = String(_loc5_);
         }
         var _loc2_:class_3282 = _window.findChildByName("bitmap") as class_3282;
         if(_loc5_ <= 0)
         {
            _loc2_.blend = 0.2;
         }
         else
         {
            _loc2_.blend = 1;
         }
      }
      
      private function updateBackgroundVisual() : void
      {
         if(!_window)
         {
            return;
         }
         if(!var_2043)
         {
            var_2043 = _window.findChildByTag("BG_COLOR");
         }
         var_2043.color = _hasUnseenItems ? 10275685 : 13421772;
      }
      
      private function updateSelectionVisual() : void
      {
         if(!_window)
         {
            return;
         }
         _window.findChildByName("outline").visible = isSelected;
      }
      
      private function updateItemImageVisual() : void
      {
         var _loc2_:ILimitedItemGridOverlayWidget = null;
         var _loc4_:class_3217 = null;
         var _loc5_:class_3217 = null;
         var _loc1_:IRarityItemGridOverlayWidget = null;
         if(!_window)
         {
            return;
         }
         if(false)
         {
            _loc4_ = class_3217(_window.findChildByName("unique_item_overlay_container"));
            _loc2_ = ILimitedItemGridOverlayWidget(_loc4_.widget);
            _loc4_.visible = true;
            _loc2_.serialNumber = stuffData.uniqueSerialNumber;
            _loc2_.animated = true;
            _window.findChildByName("unique_item_background_bitmap").visible = true;
         }
         else if(true)
         {
            _loc5_ = class_3217(_window.findChildByName("rarity_item_overlay_container"));
            _loc1_ = IRarityItemGridOverlayWidget(_loc5_.widget);
            _loc1_.rarityLevel = stuffData.rarityLevel;
            _loc5_.visible = true;
         }
         var _loc3_:class_3282 = _window.findChildByName("bitmap") as class_3282;
         if(_loc3_)
         {
            _loc3_.bitmap = var_2001;
         }
      }
      
      private function itemEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:Boolean = false;
         switch(param1.type)
         {
            case "WME_UP":
               var_2103 = false;
               var_1443.cancelFurniInMover();
               break;
            case "WME_DOWN":
               var_1443.removeSelections();
               isSelected = true;
               var_2103 = true;
               var_1443.updateActionView();
               var_1443.categorySelection = this;
               break;
            case "WME_OUT":
               if(!var_2103 || false)
               {
                  return;
               }
               _loc3_ = var_1443.requestSelectedFurniPlacement(true);
               if(_loc3_)
               {
                  var_2103 = false;
                  break;
               }
               break;
            case "WME_CLICK":
               var_2103 = false;
               break;
            case "WME_DOUBLE_CLICK":
               var_1443.requestCurrentActionOnSelection();
               var_2103 = false;
         }
      }
      
      private function initWindow() : void
      {
         createWindow();
         if(_icon != null)
         {
            setFinalImage(_icon);
         }
         else if(!var_4183)
         {
            initImage();
         }
         _window.procedure = itemEventProc;
         _window.name = _roomEngine.getFurnitureType(type) + "." + category;
         if(stuffData && stuffData.getLegacyString() != "")
         {
            _window.name += ".s" + stuffData;
         }
         if(!isNaN(extra))
         {
            _window.name += ".e" + extra;
         }
         updateBackgroundVisual();
         updateItemCountVisual();
         updateItemImageVisual();
         updateSelectionVisual();
         var_1420 = true;
      }
      
      protected function createWindow() : void
      {
         _window = var_1443.createItemWindow("inventory_thumb_xml");
      }
      
      private function getFurniItemName() : String
      {
         var _loc2_:String = null;
         var _loc3_:ISongInfo = null;
         var _loc1_:FurnitureItem = peek();
         if(_loc1_ == null)
         {
            return "";
         }
         switch(var_774 - 6)
         {
            case 0:
               _loc2_ = "poster_" + _loc1_.stuffData.getLegacyString() + "_name";
               break;
            case 2:
               _loc3_ = var_1443.soundManager.musicController.getSongInfo(_loc1_.extra);
               if(_loc3_ != null)
               {
                  return _loc3_.name;
               }
               getSongInfo(_loc1_);
               return "";
               break;
            default:
               if(isWallItem)
               {
                  _loc2_ = "wallItem.name." + _loc1_.type;
                  break;
               }
               _loc2_ = "roomItem.name." + _loc1_.type;
               break;
         }
         return var_1443.controller.localization.getLocalization(_loc2_);
      }
      
      private function getFurniItemDesc() : String
      {
         var _loc2_:String = null;
         var _loc3_:ISongInfo = null;
         var _loc1_:FurnitureItem = peek();
         if(_loc1_ == null)
         {
            return "";
         }
         switch(var_774 - 6)
         {
            case 0:
               _loc2_ = "poster_" + _loc1_.stuffData.getLegacyString() + "_desc";
               break;
            case 2:
               _loc3_ = var_1443.soundManager.musicController.getSongInfo(_loc1_.extra);
               if(_loc3_ != null)
               {
                  return _loc3_.creator;
               }
               getSongInfo(_loc1_);
               return "";
               break;
            default:
               if(isWallItem)
               {
                  _loc2_ = "wallItem.desc." + _loc1_.type;
                  break;
               }
               _loc2_ = "roomItem.desc." + _loc1_.type;
               break;
         }
         return var_1443.controller.localization.getLocalization(_loc2_);
      }
      
      private function getSongInfo(param1:FurnitureItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ISongInfo = null;
         if(param1 == null)
         {
            return;
         }
         var_2824 = -1;
         if(param1 != null)
         {
            if(param1.category == 8)
            {
               _loc2_ = param1.extra;
               _loc3_ = var_1443.soundManager.musicController.getSongInfo(_loc2_);
               if(_loc3_ == null)
               {
                  var_1443.soundManager.musicController.requestSongInfoWithoutSamples(_loc2_);
                  var_2824 = _loc2_;
               }
            }
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         if(param1.id == var_2824)
         {
            var_2824 = -1;
            _name = getFurniItemName();
            _description = getFurniItemDesc();
            if(var_1443.getSelectedItem() == this)
            {
               var_1443.updateActionView();
            }
         }
      }
      
      public function get selectedItemIndex() : int
      {
         return var_2398;
      }
      
      public function set selectedItemIndex(param1:int) : void
      {
         if(param1 >= _items.length)
         {
            param1 = 0;
         }
         var_2398 = param1;
      }
   }
}
