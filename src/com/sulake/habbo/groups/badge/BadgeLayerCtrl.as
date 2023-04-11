package com.sulake.habbo.groups.badge
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.groups.ColorGridCtrl;
   import com.sulake.habbo.groups.HabboGroupsManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BadgeLayerCtrl
   {
      
      public static var BASE_LAYER_INDEX:int = 0;
      
      public static var PARENT_CONTAINER_NAME:String = "part_edit_list";
       
      
      private var var_437:HabboGroupsManager;
      
      private var var_1618:com.sulake.habbo.groups.badge.BadgeEditorCtrl;
      
      private var var_2677:int = 0;
      
      private var var_1598:com.sulake.habbo.groups.badge.BadgeLayerOptions;
      
      private var var_1914:class_3151;
      
      private var var_2401:ColorGridCtrl;
      
      private var _disposed:Boolean = false;
      
      private var var_4104:BitmapData;
      
      private var var_2449:class_3282;
      
      private var _partSelectButton:class_3140;
      
      private var var_3033:class_3151;
      
      private var var_2359:class_3282;
      
      private var var_2742:class_3282;
      
      public function BadgeLayerCtrl(param1:HabboGroupsManager, param2:com.sulake.habbo.groups.badge.BadgeEditorCtrl, param3:int)
      {
         super();
         var_437 = param1;
         var_1618 = param2;
         var_2677 = param3;
         var_1598 = new com.sulake.habbo.groups.badge.BadgeLayerOptions();
         var_1598.layerIndex = param3;
         var_4104 = var_437.getButtonImage("badge_part_add");
      }
      
      public function createWindow() : void
      {
         if(var_1914 != null)
         {
            return;
         }
         var _loc1_:IItemListWindow = var_1618.partEditContainer.findChildByName(PARENT_CONTAINER_NAME) as IItemListWindow;
         var_1914 = var_437.getXmlWindow("badge_layer") as class_3151;
         var _loc2_:class_3151 = var_1914.findChildByName("preview_container") as class_3151;
         var_2449 = _loc2_.findChildByName("part_preview") as class_3282;
         var_2449.bitmap = var_437.getButtonImage("badge_part_add");
         _partSelectButton = _loc2_.findChildByName("part_button") as class_3140;
         _partSelectButton.procedure = onPartPreviewButtonClick;
         var_3033 = var_1914.findChildByName("position_container") as class_3151;
         var_2359 = var_3033.findChildByName("position_picker") as class_3282;
         var_2359.bitmap = var_437.getButtonImage("position_picker");
         var_2742 = var_3033.findChildByName("position_grid") as class_3282;
         var_2742.bitmap = var_437.getButtonImage("position_grid");
         if(var_2677 == 0)
         {
            var_2742.visible = false;
            var_2359.visible = false;
         }
         else
         {
            var_2742.procedure = onPositionGridClick;
         }
         var_2401 = new ColorGridCtrl(var_437,onColorSelected);
         var_2401.createAndAttach(var_1914,"color_selector",var_437.guildEditorData.badgeColors);
         if(var_1598.layerIndex == BASE_LAYER_INDEX)
         {
            _loc1_.addListItem(var_1914);
         }
         else
         {
            _loc1_.addListItemAt(var_1914,0);
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_2401)
            {
               var_2401.dispose();
               var_2401 = null;
            }
            if(var_1914)
            {
               var_1914.dispose();
               var_1914 = null;
            }
            var_2449 = null;
            _partSelectButton = null;
            var_3033 = null;
            var_2359 = null;
            var_2742 = null;
            var_437 = null;
            _disposed = true;
         }
      }
      
      public function setLayerOptions(param1:com.sulake.habbo.groups.badge.BadgeLayerOptions) : void
      {
         if(param1.layerIndex != var_1598.layerIndex)
         {
            throw new Error("Tried to set layer option with invalid layerIndex value");
         }
         var _loc2_:Boolean = false;
         var _loc3_:com.sulake.habbo.groups.badge.BadgeLayerOptions = var_1598;
         var_1598 = param1.clone();
         if(!var_1598.isGridEqual(_loc3_))
         {
            updatePositionPicker(false);
            _loc2_ = true;
         }
         if(_loc3_.colorIndex != var_1598.colorIndex)
         {
            var_2401.setSelectedColorIndex(var_1598.colorIndex,false);
            var_1598.colorIndex = var_2401.selectedColorIndex;
            _loc2_ = true;
         }
         if(_loc2_ || _loc3_.partIndex != var_1598.partIndex)
         {
            updateSelectedPart();
         }
      }
      
      public function get layerOptions() : com.sulake.habbo.groups.badge.BadgeLayerOptions
      {
         return var_1598;
      }
      
      public function updateSelectedPart() : void
      {
         var _loc1_:BitmapData = null;
         if(false)
         {
            _loc1_ = var_1618.badgeSelectPartCtrl.getPartItemImage(layerOptions);
         }
         if(_loc1_ == null)
         {
            _loc1_ = var_4104;
         }
         var_2449.bitmap.dispose();
         var_2449.bitmap = new BitmapData(_loc1_.width,_loc1_.height);
         var_2449.bitmap.copyPixels(_loc1_,_loc1_.rect,new Point());
         var_1618.onPartChanged(this);
      }
      
      private function updatePositionPicker(param1:Boolean = true) : void
      {
         var_2359.x = 1;
         var_2359.y = 1;
         if(param1)
         {
            updateSelectedPart();
         }
      }
      
      private function onPositionGridClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK" || !var_2359)
         {
            return;
         }
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         var_1598.gridX = Math.min(2,Math.max(0,Math.floor(_loc3_.localX / 14)));
         var_1598.gridY = Math.min(2,Math.max(0,Math.floor(_loc3_.localY / 14)));
         updatePositionPicker();
      }
      
      private function onPartPreviewButtonClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_1618.onShowSelectPart(this);
      }
      
      public function onColorSelected(param1:ColorGridCtrl) : void
      {
         if(var_1598.colorIndex != param1.selectedColorIndex)
         {
            var_1598.colorIndex = param1.selectedColorIndex;
            updateSelectedPart();
         }
      }
   }
}
