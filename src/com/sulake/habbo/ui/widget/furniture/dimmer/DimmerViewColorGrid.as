package com.sulake.habbo.ui.widget.furniture.dimmer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public class DimmerViewColorGrid
   {
       
      
      private var var_2016:IItemGridWindow;
      
      private var var_1430:com.sulake.habbo.ui.widget.furniture.dimmer.DimmerView;
      
      private var _colorCellXML:XML;
      
      private var _colorCellFrame:BitmapData;
      
      private var _colorCellButton:BitmapData;
      
      private var var_2594:BitmapData;
      
      private var var_1749:class_3151;
      
      public function DimmerViewColorGrid(param1:com.sulake.habbo.ui.widget.furniture.dimmer.DimmerView, param2:IItemGridWindow, param3:class_1684, param4:class_21)
      {
         super();
         var_1430 = param1;
         var_2016 = param2;
         storeAssets(param4);
         populate(param3);
      }
      
      public function dispose() : void
      {
         var_1430 = null;
         var_2016 = null;
         _colorCellXML = null;
         _colorCellFrame = null;
         _colorCellButton = null;
         var_2594 = null;
      }
      
      public function setSelectedColorIndex(param1:int) : void
      {
         if(var_2016 == null)
         {
            return;
         }
         if(param1 < 0 || param1 >= var_2016.numGridItems)
         {
            return;
         }
         select(var_2016.getGridItemAt(param1) as class_3151);
      }
      
      private function populate(param1:class_1684) : void
      {
         if(var_1430 == null || var_2016 == null)
         {
            return;
         }
         populateColourGrid(param1);
      }
      
      private function select(param1:class_3151) : void
      {
         var _loc2_:class_3127 = null;
         if(var_1749 != null)
         {
            _loc2_ = var_1749.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         var_1749 = param1;
         _loc2_ = var_1749.getChildByName("chosen");
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      private function populateColourGrid(param1:class_1684) : void
      {
         var _loc4_:class_3151 = null;
         var _loc8_:class_3282 = null;
         var _loc14_:class_3282 = null;
         var _loc11_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc7_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc13_:ColorTransform = null;
         var _loc6_:BitmapData = null;
         var _loc9_:class_3282 = null;
         var_2016.destroyGridItems();
         var_1749 = null;
         for each(var _loc10_ in colors)
         {
            (_loc4_ = param1.buildFromXML(_colorCellXML) as class_3151).addEventListener("WME_CLICK",onClick);
            _loc4_.background = true;
            _loc4_.color = 4294967295;
            _loc4_.width = _colorCellFrame.width;
            _loc4_.height = _colorCellFrame.height;
            var_2016.addGridItem(_loc4_);
            if((_loc8_ = _loc4_.findChildByTag("BG_BORDER") as class_3282) != null)
            {
               _loc8_.bitmap = new BitmapData(_colorCellFrame.width,_colorCellFrame.height,true,0);
               _loc8_.bitmap.copyPixels(_colorCellFrame,_colorCellFrame.rect,new Point(0,0));
            }
            if((_loc14_ = _loc4_.findChildByTag("COLOR_IMAGE") as class_3282) != null)
            {
               _loc14_.bitmap = new BitmapData(_colorCellButton.width,_colorCellButton.height,true,0);
               _loc11_ = uint(_loc10_ >> 16 & 255);
               _loc3_ = uint(_loc10_ >> 8 & 255);
               _loc2_ = uint(_loc10_ >> 0 & 255);
               _loc7_ = _loc11_ / 255 * 1;
               _loc12_ = _loc3_ / 255 * 1;
               _loc5_ = _loc2_ / 255 * 1;
               _loc13_ = new ColorTransform(_loc7_,_loc12_,_loc5_);
               _loc6_ = _colorCellButton.clone();
               _loc6_.colorTransform(_loc6_.rect,_loc13_);
               _loc14_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(0,0));
            }
            if((_loc9_ = _loc4_.findChildByTag("COLOR_CHOSEN") as class_3282) != null)
            {
               _loc9_.bitmap = new BitmapData(var_2594.width,var_2594.height,true,16777215);
               _loc9_.bitmap.copyPixels(var_2594,var_2594.rect,new Point(0,0),null,null,true);
               _loc9_.visible = false;
            }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = var_2016.getGridItemIndex(param1.target as class_3127);
         setSelectedColorIndex(_loc2_);
         var_1430.selectedColorIndex = _loc2_;
      }
      
      private function storeAssets(param1:class_21) : void
      {
         var _loc2_:XmlAsset = null;
         var _loc3_:BitmapDataAsset = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = XmlAsset(param1.getAssetByName("dimmer_color_chooser_cell"));
         _colorCellXML = XML(_loc2_.content);
         _loc3_ = BitmapDataAsset(param1.getAssetByName("dimmer_color_frame"));
         _colorCellFrame = BitmapData(_loc3_.content);
         _loc3_ = BitmapDataAsset(param1.getAssetByName("dimmer_color_button"));
         _colorCellButton = BitmapData(_loc3_.content);
         _loc3_ = BitmapDataAsset(param1.getAssetByName("dimmer_color_selected"));
         var_2594 = BitmapData(_loc3_.content);
      }
      
      private function get colors() : Array
      {
         if(var_1430 == null)
         {
            return [];
         }
         return var_1430.colors;
      }
   }
}
