package com.sulake.habbo.groups.badge
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.groups.HabboGroupsManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_5.class_1577;
   
   public class BadgeSelectPartCtrl implements class_13
   {
       
      
      private var var_437:HabboGroupsManager;
      
      private var var_1618:com.sulake.habbo.groups.badge.BadgeEditorCtrl;
      
      private var var_1828:Vector.<com.sulake.habbo.groups.badge.BadgeEditorPartItem>;
      
      private var var_1893:Vector.<com.sulake.habbo.groups.badge.BadgeEditorPartItem>;
      
      private var var_1598:com.sulake.habbo.groups.badge.BadgeLayerOptions;
      
      private var var_1525:class_3151;
      
      private var var_2037:class_3282;
      
      private var _disposed:Boolean = false;
      
      public function BadgeSelectPartCtrl(param1:HabboGroupsManager, param2:com.sulake.habbo.groups.badge.BadgeEditorCtrl)
      {
         super();
         var_437 = param1;
         var_1618 = param2;
      }
      
      public function get layerOptions() : com.sulake.habbo.groups.badge.BadgeLayerOptions
      {
         return var_1598;
      }
      
      public function set layerOptions(param1:com.sulake.habbo.groups.badge.BadgeLayerOptions) : void
      {
         var_1598 = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!_disposed)
         {
            if(false && var_1618.partSelectGrid.numGridItems > 0)
            {
               var_1618.partSelectGrid.destroyGridItems();
            }
            if(var_1893)
            {
               for each(_loc1_ in var_1893)
               {
                  _loc1_.dispose();
               }
               var_1893 = null;
            }
            if(var_1828)
            {
               for each(_loc1_ in var_1828)
               {
                  _loc1_.dispose();
               }
               var_1828 = null;
            }
            var_1598 = null;
            var_2037 = null;
            var_1525 = null;
            var_1618 = null;
            var_437 = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getSelectedPartIndex() : int
      {
         var _loc1_:int = -1;
         if(var_1598 != null && false && var_1525 != null)
         {
            _loc1_ = var_1618.partSelectGrid.getGridItemIndex(var_1525);
            if(_loc1_ != -1 && false)
            {
               _loc1_ -= 1;
            }
         }
         return _loc1_;
      }
      
      public function loadData() : void
      {
         var _loc1_:* = null;
         if(var_1893 != null || var_1828 != null)
         {
            return;
         }
         var_1893 = new Vector.<com.sulake.habbo.groups.badge.BadgeEditorPartItem>();
         for each(_loc1_ in var_437.guildEditorData.baseParts)
         {
            var_1893.push(new com.sulake.habbo.groups.badge.BadgeEditorPartItem(var_437,this,var_1893.length,com.sulake.habbo.groups.badge.BadgeEditorPartItem.BASE_PART,_loc1_));
         }
         var_1828 = new Vector.<com.sulake.habbo.groups.badge.BadgeEditorPartItem>();
         var_1828.push(new com.sulake.habbo.groups.badge.BadgeEditorPartItem(var_437,this,-1,com.sulake.habbo.groups.badge.BadgeEditorPartItem.LAYER_PART));
         for each(_loc1_ in var_437.guildEditorData.layerParts)
         {
            var_1828.push(new com.sulake.habbo.groups.badge.BadgeEditorPartItem(var_437,this,-1,com.sulake.habbo.groups.badge.BadgeEditorPartItem.LAYER_PART,_loc1_));
         }
      }
      
      public function updateGrid() : void
      {
         var _loc1_:* = null;
         var_1525 = null;
         var_2037 = null;
         var_1598 = var_1618.currentLayerOptions.clone();
         var_1618.partSelectGrid.destroyGridItems();
         if(true)
         {
            for each(_loc1_ in var_1893)
            {
               var_1618.partSelectGrid.addGridItem(createGridItem(_loc1_));
            }
         }
         else
         {
            for each(_loc1_ in var_1828)
            {
               var_1618.partSelectGrid.addGridItem(createGridItem(_loc1_));
            }
         }
      }
      
      private function createGridItem(param1:com.sulake.habbo.groups.badge.BadgeEditorPartItem) : class_3151
      {
         var _loc2_:class_3151 = var_437.getXmlWindow("badge_part_item") as class_3151;
         _loc2_.procedure = onPartMouseEvent;
         setGridItemImage(_loc2_,param1);
         return _loc2_;
      }
      
      public function onBaseImageLoaded(param1:com.sulake.habbo.groups.badge.BadgeEditorPartItem) : void
      {
         var _loc2_:class_3151 = null;
         if(var_1598 != null && true && Boolean(var_1618.partSelectContainer.visible))
         {
            _loc2_ = var_1618.partSelectGrid.getGridItemAt(param1.partIndex) as class_3151;
            setGridItemImage(_loc2_,param1);
         }
      }
      
      public function onLayerImageLoaded(param1:com.sulake.habbo.groups.badge.BadgeEditorPartItem) : void
      {
         var _loc2_:class_3151 = null;
         if(var_1598 != null && false && Boolean(var_1618.partSelectContainer.visible))
         {
            _loc2_ = var_1618.partSelectGrid.getGridItemAt(param1.partIndex + 1) as class_3151;
            setGridItemImage(_loc2_,param1);
         }
      }
      
      private function setGridItemImage(param1:class_3151, param2:com.sulake.habbo.groups.badge.BadgeEditorPartItem) : void
      {
         var _loc5_:class_3282 = null;
         var _loc4_:BitmapData;
         if((_loc4_ = param2.getComposite(var_1598)) != null)
         {
            (_loc5_ = param1.findChildByName("part") as class_3282).bitmap = new BitmapData(_loc4_.width,_loc4_.height);
            _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point());
         }
         var _loc3_:class_3282 = param1.findChildByName("selected") as class_3282;
         _loc3_.bitmap = var_437.getButtonImage("badge_part_picker");
         if(param2.partIndex == var_1598.partIndex)
         {
            _loc3_.visible = true;
            var_2037 = _loc3_;
         }
         else
         {
            _loc3_.visible = false;
         }
      }
      
      private function onPartMouseEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_3213 = null;
         var _loc4_:class_3151 = null;
         if(param1.type == "WME_OVER")
         {
            if(var_1525 != param2)
            {
               if(var_1525 != null)
               {
                  _loc3_ = var_1525.findChildByName("background") as class_3213;
                  if(_loc3_ != null)
                  {
                     _loc3_.color = 15329761;
                  }
               }
               var_1525 = param2 as class_3151;
               if(var_1525 != null)
               {
                  _loc3_ = var_1525.findChildByName("background") as class_3213;
                  if(_loc3_ != null)
                  {
                     _loc3_.color = 14210761;
                  }
                  var_1598.partIndex = getSelectedPartIndex();
                  var_1618.onPartHover(this);
               }
            }
         }
         if(param1.type == "WME_CLICK")
         {
            if(var_2037 != null)
            {
               var_2037.visible = false;
            }
            if((_loc4_ = param2 as class_3151) != null)
            {
               var_2037 = _loc4_.findChildByName("selected") as class_3282;
               var_2037.visible = true;
            }
            var_1618.onPartSelected(this);
         }
      }
      
      public function getPartItemImage(param1:com.sulake.habbo.groups.badge.BadgeLayerOptions) : BitmapData
      {
         if(param1 == null || param1.partIndex < 0)
         {
            return null;
         }
         if(param1.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX)
         {
            if(var_1893 != null && param1.partIndex < var_1893.length)
            {
               return var_1893[param1.partIndex].getComposite(param1);
            }
         }
         else if(var_1828 != null && param1.partIndex + 1 < var_1828.length)
         {
            return var_1828[param1.partIndex + 1].getComposite(param1);
         }
         return null;
      }
   }
}
