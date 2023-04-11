package com.sulake.habbo.groups.badge
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.groups.*;
   import com.sulake.habbo.groups.events.HabboGroupsEditorData;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_5.class_1550;
   
   public class BadgeEditorCtrl implements class_13
   {
       
      
      private var var_437:HabboGroupsManager;
      
      private var _window:class_3151;
      
      private var var_3449:class_3151;
      
      private var var_2135:Array;
      
      private var var_1927:com.sulake.habbo.groups.badge.BadgeSelectPartCtrl;
      
      private var _disposed:Boolean = false;
      
      private var _layers:Vector.<com.sulake.habbo.groups.badge.BadgeLayerCtrl>;
      
      private var var_1953:com.sulake.habbo.groups.badge.BadgeLayerOptions;
      
      private var var_1698:class_3151;
      
      private var var_2892:IItemGridWindow;
      
      private var var_1965:class_3151;
      
      private var var_1725:Vector.<class_3282>;
      
      public function BadgeEditorCtrl(param1:HabboGroupsManager)
      {
         super();
         var_437 = param1;
         var_437.events.addEventListener("HGE_EDIT_INFO",onHabboGroupsEditorData);
         var_1927 = new com.sulake.habbo.groups.badge.BadgeSelectPartCtrl(var_437,this);
         _layers = new Vector.<com.sulake.habbo.groups.badge.BadgeLayerCtrl>();
         _layers.push(new com.sulake.habbo.groups.badge.BadgeLayerCtrl(var_437,this,0));
         _layers.push(new com.sulake.habbo.groups.badge.BadgeLayerCtrl(var_437,this,1));
         _layers.push(new com.sulake.habbo.groups.badge.BadgeLayerCtrl(var_437,this,2));
         _layers.push(new com.sulake.habbo.groups.badge.BadgeLayerCtrl(var_437,this,3));
         _layers.push(new com.sulake.habbo.groups.badge.BadgeLayerCtrl(var_437,this,4));
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get partEditContainer() : class_3151
      {
         return var_1965;
      }
      
      public function get partSelectContainer() : class_3151
      {
         return var_1698;
      }
      
      public function get partSelectGrid() : IItemGridWindow
      {
         return var_2892;
      }
      
      public function get currentLayerOptions() : com.sulake.habbo.groups.badge.BadgeLayerOptions
      {
         return var_1953;
      }
      
      public function get badgeSelectPartCtrl() : com.sulake.habbo.groups.badge.BadgeSelectPartCtrl
      {
         return var_1927;
      }
      
      public function get isIntialized() : Boolean
      {
         return _window != null && var_2135 != null;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_layers)
            {
               for each(var _loc1_ in _layers)
               {
                  _loc1_.dispose();
               }
               _layers = null;
            }
            if(var_1927)
            {
               var_1927.dispose();
               var_1927 = null;
            }
            if(var_1698)
            {
               var_1698.dispose();
               var_1698 = null;
            }
            if(var_2892)
            {
               var_2892.dispose();
               var_2892 = null;
            }
            if(var_1965)
            {
               var_1965.dispose();
               var_1965 = null;
            }
            if(var_1725)
            {
               for each(var _loc2_ in var_1725)
               {
                  _loc2_.dispose();
               }
               var_1725 = null;
            }
            if(_window)
            {
               _window.dispose();
               _window = null;
            }
            var_2135 = null;
            var_1953 = null;
            _window = null;
            var_437 = null;
            _disposed = true;
         }
      }
      
      public function onHabboGroupsEditorData(param1:HabboGroupsEditorData) : void
      {
         var_1927.loadData();
         createWindow(null,null);
      }
      
      public function createWindow(param1:class_3151, param2:Array) : void
      {
         var _loc3_:int = 0;
         if(_window != null || _disposed)
         {
            return;
         }
         if(param1 != null)
         {
            var_3449 = param1;
         }
         if(param2 != null)
         {
            var_2135 = param2;
         }
         if(var_3449 == null || var_2135 == null || var_437 == null || true)
         {
            return;
         }
         _window = var_437.getXmlWindow("badge_editor") as class_3151;
         var _loc4_:class_3151 = _window.findChildByName("guild_badge") as class_3151;
         var_1725 = new Vector.<class_3282>();
         var_1725.push(_loc4_.findChildByName("layer_0") as class_3282);
         var_1725.push(_loc4_.findChildByName("layer_1") as class_3282);
         var_1725.push(_loc4_.findChildByName("layer_2") as class_3282);
         var_1725.push(_loc4_.findChildByName("layer_3") as class_3282);
         var_1725.push(_loc4_.findChildByName("layer_4") as class_3282);
         var_1965 = _window.findChildByName("part_edit") as class_3151;
         var_1698 = _window.findChildByName("part_select") as class_3151;
         var_1698.visible = false;
         var_2892 = var_1698.findChildByName("part_select_grid") as IItemGridWindow;
         _loc3_ = 0;
         while(_loc3_ < _layers.length)
         {
            _layers[_loc3_].createWindow();
            _loc3_++;
         }
         resetLayerOptions(var_2135);
         var_3449.addChild(_window);
      }
      
      public function resetLayerOptions(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(!this.isIntialized)
         {
            return;
         }
         if(false)
         {
            var_1698.visible = false;
            var_1965.visible = true;
         }
         var_2135 = param1;
         var_1953 = null;
         var_1965.visible = true;
         var_1698.visible = false;
         var_1927.loadData();
         _loc2_ = 0;
         while(_loc2_ < _layers.length)
         {
            _layers[_loc2_].setLayerOptions(createLayerOption(_loc2_));
            _layers[_loc2_].updateSelectedPart();
            _loc2_++;
         }
      }
      
      private function createLayerOption(param1:int) : com.sulake.habbo.groups.badge.BadgeLayerOptions
      {
         var _loc3_:int = 0;
         var _loc2_:class_1550 = var_2135[param1] as class_1550;
         var _loc4_:com.sulake.habbo.groups.badge.BadgeLayerOptions;
         (_loc4_ = new com.sulake.habbo.groups.badge.BadgeLayerOptions()).layerIndex = param1;
         _loc4_.colorIndex = 0;
         _loc4_.setGrid(_loc2_.position);
         _loc3_ = 0;
         while(_loc3_ < var_437.guildEditorData.badgeColors.length)
         {
            if(var_437.guildEditorData.badgeColors[_loc3_].id == _loc2_.colorId)
            {
               _loc4_.colorIndex = _loc3_;
               break;
            }
            _loc3_++;
         }
         if(param1 == com.sulake.habbo.groups.badge.BadgeLayerCtrl.BASE_LAYER_INDEX)
         {
            _loc3_ = 0;
            while(true)
            {
               if(_loc3_ < var_437.guildEditorData.baseParts.length)
               {
                  if(var_437.guildEditorData.baseParts[_loc3_].id != _loc2_.partId)
                  {
                     continue;
                  }
                  _loc4_.partIndex = _loc3_;
               }
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < var_437.guildEditorData.layerParts.length)
            {
               if(var_437.guildEditorData.layerParts[_loc3_].id == _loc2_.partId)
               {
                  _loc4_.partIndex = _loc3_;
                  break;
               }
               _loc3_++;
            }
         }
         return _loc4_;
      }
      
      public function onPartSelected(param1:com.sulake.habbo.groups.badge.BadgeSelectPartCtrl) : void
      {
         var_1953.partIndex = param1.getSelectedPartIndex();
         _layers[var_1953.layerIndex].setLayerOptions(currentLayerOptions);
         var_1965.visible = true;
         var_1698.visible = false;
      }
      
      public function onPartHover(param1:com.sulake.habbo.groups.badge.BadgeSelectPartCtrl) : void
      {
         updatePreviewImage(param1.layerOptions);
      }
      
      public function onPartChanged(param1:com.sulake.habbo.groups.badge.BadgeLayerCtrl) : void
      {
         updatePreviewImage(param1.layerOptions);
      }
      
      public function updatePreviewImage(param1:com.sulake.habbo.groups.badge.BadgeLayerOptions) : void
      {
         var _loc2_:BitmapData = var_1927.getPartItemImage(param1);
         if(_loc2_ != null)
         {
            var_1725[param1.layerIndex].bitmap = _loc2_.clone();
            var_1725[param1.layerIndex].visible = true;
         }
         else
         {
            var_1725[param1.layerIndex].visible = false;
         }
      }
      
      public function onShowSelectPart(param1:com.sulake.habbo.groups.badge.BadgeLayerCtrl) : void
      {
         var _loc2_:com.sulake.habbo.groups.badge.BadgeLayerOptions = var_1953;
         var_1953 = param1.layerOptions.clone();
         if(!param1.layerOptions.equalVisuals(_loc2_))
         {
            var_1927.updateGrid();
         }
         else
         {
            var_1927.layerOptions = var_1953.clone();
         }
         var_1965.visible = false;
         var_1698.visible = true;
      }
      
      public function onViewChange() : void
      {
         if(isIntialized && false)
         {
            updatePreviewImage(var_1953);
            var_1965.visible = true;
            var_1698.visible = false;
         }
      }
      
      public function getBadgeSettings() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = [];
         for each(var _loc4_ in _layers)
         {
            _loc2_ = getLayerPartId(_loc4_.layerOptions);
            if(_loc2_ >= 0)
            {
               _loc3_ = getLayerColorId(_loc4_.layerOptions);
               if(_loc3_ >= 0)
               {
                  _loc1_.push(_loc2_);
                  _loc1_.push(_loc3_);
                  _loc1_.push(_loc4_.layerOptions.position);
               }
            }
         }
         return _loc1_;
      }
      
      public function get primaryColorIndex() : int
      {
         if(_layers == null)
         {
            return 0;
         }
         var _loc1_:int = 0;
         for each(var _loc2_ in _layers)
         {
            if(!(getLayerPartId(_loc2_.layerOptions) < 0 || getLayerColorId(_loc2_.layerOptions) < 0))
            {
               _loc1_ = _loc2_.layerOptions.colorIndex;
            }
         }
         return _loc1_;
      }
      
      public function get secondaryColorIndex() : int
      {
         if(_layers != null)
         {
            return _layers[0].layerOptions.colorIndex;
         }
         return 0;
      }
      
      public function getBadgeBitmap() : BitmapData
      {
         var _loc1_:BitmapData = new BitmapData(BadgeEditorPartItem.IMAGE_WIDTH,BadgeEditorPartItem.IMAGE_HEIGHT,true,15329761);
         for each(var _loc2_ in var_1725)
         {
            if(_loc2_.visible)
            {
               _loc1_.copyPixels(_loc2_.bitmap,_loc1_.rect,new Point(),null,null,true);
            }
         }
         return _loc1_;
      }
      
      private function getLayerPartId(param1:com.sulake.habbo.groups.badge.BadgeLayerOptions) : int
      {
         if(param1.partIndex < 0)
         {
            return -1;
         }
         if(param1.layerIndex == com.sulake.habbo.groups.badge.BadgeLayerCtrl.BASE_LAYER_INDEX)
         {
            if(param1.partIndex >= var_437.guildEditorData.baseParts.length)
            {
               return -1;
            }
            return var_437.guildEditorData.baseParts[param1.partIndex].id;
         }
         if(param1.partIndex >= var_437.guildEditorData.layerParts.length)
         {
            return -1;
         }
         return var_437.guildEditorData.layerParts[param1.partIndex].id;
      }
      
      private function getLayerColorId(param1:com.sulake.habbo.groups.badge.BadgeLayerOptions) : int
      {
         if(param1.colorIndex < 0 || param1.colorIndex >= var_437.guildEditorData.badgeColors.length)
         {
            return -1;
         }
         return var_437.guildEditorData.badgeColors[param1.colorIndex].id;
      }
   }
}
