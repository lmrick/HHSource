package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ColourGridCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _colours:Array;
      
      private var _colourGrid:IItemGridWindow;
      
      private var _colourChooserLayout:XML;
      
      private var var_2166:BitmapData;
      
      private var var_2456:BitmapData;
      
      private var _colourChosen:BitmapData;
      
      private var var_1749:class_3151;
      
      public function ColourGridCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(true)
         {
            _colourGrid.destroyGridItems();
            _colourGrid.dispose();
         }
         _colourGrid = null;
         _colourChooserLayout = null;
         var_1749 = null;
         events.removeEventListener("COLOUR_ARRAY",onAvailableColours);
         events.removeEventListener("MULTI_COLOUR_ARRAY",onAvailableMultiColours);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("colourGridWidget");
         var _loc2_:* = _window.tags.indexOf("FIXED") > -1;
         if(!_loc2_)
         {
            _window.getChildAt(0).width = _window.width;
            _window.getChildAt(0).height = _window.height;
         }
         _colourGrid = _window.findChildByName("colourGrid") as IItemGridWindow;
         _colourGrid.width = window.width;
         _colourGrid.height = window.height;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("color_chooser_cell") as XmlAsset;
         _colourChooserLayout = _loc1_.content as XML;
         events.addEventListener("COLOUR_ARRAY",onAvailableColours);
         events.addEventListener("MULTI_COLOUR_ARRAY",onAvailableMultiColours);
         return true;
      }
      
      private function onAvailableColours(param1:CatalogWidgetColoursEvent) : void
      {
         _colours = [];
         for each(var _loc4_ in param1.colours)
         {
            _colours.push([_loc4_]);
         }
         var _loc5_:BitmapDataAsset;
         var_2166 = (_loc5_ = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset).content as BitmapData;
         var _loc3_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         var_2456 = _loc3_.content as BitmapData;
         var _loc2_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         _colourChosen = _loc2_.content as BitmapData;
         populateColourGrid();
         select(_colourGrid.getGridItemAt(param1.index) as class_3151);
      }
      
      private function onAvailableMultiColours(param1:CatalogWidgetMultiColoursEvent) : void
      {
         _colours = [];
         for each(var _loc4_ in param1.colours)
         {
            _colours.push(_loc4_.slice());
         }
         var _loc5_:BitmapDataAsset;
         var_2166 = (_loc5_ = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset).content as BitmapData;
         var _loc3_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         var_2456 = _loc3_.content as BitmapData;
         var _loc2_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         _colourChosen = _loc2_.content as BitmapData;
         populateColourGrid();
         select(_colourGrid.getGridItemAt(0) as class_3151);
      }
      
      private function select(param1:class_3151) : void
      {
         var _loc2_:class_3127 = null;
         class_14.log("[ColourGridCatalogWidget] Select: " + param1);
         if(var_1749 != null)
         {
            _loc2_ = var_1749.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         var_1749 = param1;
         if(var_1749 != null)
         {
            _loc2_ = var_1749.getChildByName("chosen");
         }
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      private function populateColourGrid() : void
      {
         var _loc4_:class_3151 = null;
         var _loc7_:class_3282 = null;
         var _loc12_:class_3282 = null;
         var _loc9_:* = 0;
         var _loc2_:* = 0;
         var _loc1_:* = 0;
         var _loc5_:BitmapData = null;
         var _loc3_:BitmapData = null;
         var _loc10_:int = 0;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc8_:class_3282 = null;
         class_14.log("[ColourGridCatalogWidget] Display colors: undefined");
         _colourGrid.destroyGridItems();
         var_1749 = null;
         for each(var _loc13_ in _colours)
         {
            if(_loc13_.length > 0)
            {
               (_loc4_ = page.viewer.catalog.windowManager.buildFromXML(_colourChooserLayout) as class_3151).addEventListener("WME_CLICK",onClick);
               _loc4_.background = true;
               _loc4_.color = 4294967295;
               _loc4_.width = var_2166.width;
               _loc4_.height = var_2166.height;
               _colourGrid.addGridItem(_loc4_);
               if((_loc7_ = _loc4_.findChildByTag("BG_BORDER") as class_3282) != null)
               {
                  _loc7_.bitmap = new BitmapData(var_2166.width,var_2166.height,true,0);
                  _loc7_.bitmap.copyPixels(var_2166,var_2166.rect,new Point(0,0));
               }
               if((_loc12_ = _loc4_.findChildByTag("COLOR_IMAGE") as class_3282) != null)
               {
                  _loc12_.bitmap = new BitmapData(var_2456.width,var_2456.height,true,0);
                  _loc9_ = 255;
                  _loc2_ = 255;
                  _loc1_ = 255;
                  _loc5_ = null;
                  _loc3_ = null;
                  if((_loc10_ = int(_loc13_[0])) >= 0)
                  {
                     _loc9_ = uint(_loc10_ >> 16 & 255);
                     _loc2_ = uint(_loc10_ >> 8 & 255);
                     _loc1_ = uint(_loc10_ >> 0 & 255);
                  }
                  _loc5_ = var_2456.clone();
                  _loc5_.colorTransform(_loc5_.rect,new ColorTransform(_loc9_ / 255,_loc2_ / 255,_loc1_ / 255));
                  if(_loc13_.length > 1)
                  {
                     if((_loc6_ = int(_loc13_[1])) >= 0)
                     {
                        _loc9_ = uint(_loc6_ >> 16 & 255);
                        _loc2_ = uint(_loc6_ >> 8 & 255);
                        _loc1_ = uint(_loc6_ >> 0 & 255);
                     }
                     _loc3_ = var_2456.clone();
                     _loc3_.colorTransform(_loc3_.rect,new ColorTransform(_loc9_ / 255,_loc2_ / 255,_loc1_ / 255));
                  }
                  _loc12_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
                  _loc5_.dispose();
                  if(_loc3_ != null)
                  {
                     _loc11_ = _loc3_.width / 2;
                     _loc12_.bitmap.copyPixels(_loc3_,new Rectangle(_loc11_,0,_loc3_.width - _loc11_,_loc3_.height),new Point(_loc3_.width / 2,0));
                     _loc3_.dispose();
                  }
               }
               if((_loc8_ = _loc4_.findChildByTag("COLOR_CHOSEN") as class_3282) != null)
               {
                  _loc8_.bitmap = new BitmapData(_colourChosen.width,_colourChosen.height,true,16777215);
                  _loc8_.bitmap.copyPixels(_colourChosen,_colourChosen.rect,new Point(0,0),null,null,true);
                  _loc8_.visible = false;
               }
            }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         select(param1.target as class_3151);
         var _loc2_:int = _colourGrid.getGridItemIndex(param1.target as class_3127);
         events.dispatchEvent(new CatalogWidgetColourIndexEvent(_loc2_));
      }
   }
}
