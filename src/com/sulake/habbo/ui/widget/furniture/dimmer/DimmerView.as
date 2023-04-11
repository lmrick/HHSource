package com.sulake.habbo.ui.widget.furniture.dimmer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class DimmerView
   {
      
      private static const const_782:Number = 100;
      
      private static const const_693:Number = 100;
       
      
      private var _window:class_3151;
      
      private var _tabContext:ITabContextWindow;
      
      private var _windowXML:XML;
      
      private var var_1429:com.sulake.habbo.ui.widget.furniture.dimmer.DimmerFurniWidget;
      
      private var var_1866:com.sulake.habbo.ui.widget.furniture.dimmer.DimmerViewColorGrid;
      
      private var var_1934:com.sulake.habbo.ui.widget.furniture.dimmer.DimmerViewAlphaSlider;
      
      private var var_3110:int;
      
      private var var_2018:int;
      
      private var var_4128:int;
      
      public function DimmerView(param1:com.sulake.habbo.ui.widget.furniture.dimmer.DimmerFurniWidget)
      {
         super();
         var_1429 = param1;
      }
      
      public function get selectedBrightness() : int
      {
         return var_3110;
      }
      
      public function get selectedColorIndex() : int
      {
         return var_2018;
      }
      
      public function get selectedType() : int
      {
         return var_4128;
      }
      
      public function dispose() : void
      {
         hideInterface();
         var_1429 = null;
      }
      
      public function showInterface() : void
      {
         if(_window == null)
         {
            createWindow();
         }
         selectPreset(var_1429.selectedPresetIndex);
         update();
      }
      
      public function update() : void
      {
         var _loc2_:String = null;
         if(_window == null || var_1429 == null)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc3_:class_3127 = _window.findChildByName("on_off_button");
         if(_loc3_ != null)
         {
            _loc2_ = _loc1_ ? "${widget.dimmer.button.off}" : "${widget.dimmer.button.on}";
            _loc3_.caption = _loc2_;
         }
         _loc3_ = _window.findChildByName("tabbedview");
         if(_loc3_ != null)
         {
            _loc3_.visible = _loc1_;
         }
         _loc3_ = _window.findChildByName("apply_button");
         if(_loc3_ != null)
         {
            _loc1_ ? _loc3_.enable() : _loc3_.disable();
         }
         _loc3_ = _window.findChildByName("off_border");
         if(_loc3_)
         {
            _loc3_.visible = !_loc1_;
         }
      }
      
      public function hideInterface() : void
      {
         if(var_1429 != null)
         {
            var_1429.removePreview();
         }
         if(var_1866 != null)
         {
            var_1866.dispose();
            var_1866 = null;
         }
         if(var_1934 != null)
         {
            var_1934.dispose();
            var_1934 = null;
         }
         _tabContext = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function createWindow() : void
      {
         var _loc4_:class_3127 = null;
         var _loc5_:class_3127 = null;
         var _loc6_:int = 0;
         var _loc1_:ITabButtonWindow = null;
         var _loc3_:BitmapData = null;
         if(var_1429 == null || true || windowXML == null)
         {
            return;
         }
         _window = var_1429.windowManager.createWindow("dimmerui_container","",4,0,131073,new Rectangle(100,100,2,2),null,0) as class_3151;
         _window.buildFromXML(windowXML);
         if((_loc4_ = _window.findChildByTag("close")) != null)
         {
            _loc4_.procedure = onWindowClose;
         }
         if((_loc4_ = _window.findChildByName("color_grid_container")) != null)
         {
            if((_loc5_ = (_loc4_ as class_3151).findChildByName("color_grid")) != null)
            {
               var_1866 = new com.sulake.habbo.ui.widget.furniture.dimmer.DimmerViewColorGrid(this,_loc5_ as IItemGridWindow,var_1429.windowManager,var_1429.assets);
            }
         }
         if((_loc4_ = _window.findChildByName("brightness_container")) != null)
         {
            var_1934 = new com.sulake.habbo.ui.widget.furniture.dimmer.DimmerViewAlphaSlider(this,_loc4_ as class_3151,var_1429.assets);
         }
         _tabContext = ITabContextWindow(_window.findChildByName("tab_context"));
         selectTab(var_1429.selectedPresetIndex);
         _loc6_ = 0;
         while(_loc6_ < _tabContext.numTabItems)
         {
            _loc1_ = _tabContext.getTabItemAt(_loc6_);
            _loc1_.setParamFlag(1,true);
            _loc1_.procedure = onTabClick;
            _loc6_++;
         }
         if((_loc4_ = _window.findChildByName("type_checkbox")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onMouseEvent);
         }
         if((_loc4_ = _window.findChildByName("apply_button")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onMouseEvent);
         }
         if((_loc4_ = _window.findChildByName("on_off_button")) != null)
         {
            _loc4_.addEventListener("WME_CLICK",onMouseEvent);
         }
         var _loc2_:class_3282 = _window.findChildByName("off_image") as class_3282;
         var _loc7_:BitmapDataAsset = var_1429.assets.getAssetByName("dimmer_info") as BitmapDataAsset;
         if(_loc2_ != null && _loc7_ != null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height);
            _loc3_ = _loc7_.content as BitmapData;
            if(_loc3_ != null)
            {
               _loc2_.bitmap.copyPixels(_loc3_,_loc3_.rect,new Point(0,0));
            }
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc3_:class_3176 = null;
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc4_:String;
         switch(_loc4_ = _loc2_.name)
         {
            case "type_checkbox":
               _loc3_ = param1.target as class_3176;
               if(_loc3_ == null)
               {
                  return;
               }
               if(_loc3_.isSelected)
               {
                  selectedType = 2;
               }
               else
               {
                  selectedType = 1;
               }
               var_1429.previewCurrentSetting();
               break;
            case "apply_button":
               var_1429.storeCurrentSetting(true);
               break;
            case "cancel":
            case "close":
               hideInterface();
               break;
            case "on_off_button":
               var_1429.changeRoomDimmerState();
         }
      }
      
      private function onTabClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_SELECTED")
         {
            return;
         }
         var_1429.storeCurrentSetting(false);
         var _loc3_:int = param2.id;
         selectPreset(_loc3_);
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         hideInterface();
      }
      
      private function selectPreset(param1:int) : void
      {
         if(var_1429 == null || true || param1 < 0 || param1 >= var_1429.presets.length)
         {
            return;
         }
         var_1429.selectedPresetIndex = param1;
         var _loc2_:DimmerFurniWidgetPresetItem = var_1429.presets[param1];
         if(_loc2_ == null)
         {
            return;
         }
         selectTab(param1);
         var_3110 = _loc2_.light;
         if(var_1934 != null)
         {
            var_1934.setValue(var_3110);
         }
         var_2018 = colors.indexOf(_loc2_.color);
         if(var_1866 != null)
         {
            var_1866.setSelectedColorIndex(var_2018);
         }
         selectedType = _loc2_.type;
         var_1429.previewCurrentSetting();
      }
      
      private function selectTab(param1:int) : void
      {
         if(_tabContext == null)
         {
            return;
         }
         var _loc2_:class_3127 = _tabContext.getTabItemAt(param1);
         if(_loc2_ != null)
         {
            _tabContext.selector.setSelected(_loc2_ as ISelectableWindow);
         }
      }
      
      private function getSelectedTabIndex() : int
      {
         if(_tabContext == null)
         {
            return -1;
         }
         var _loc1_:ISelectableWindow = _tabContext.selector.getSelected();
         return _tabContext.selector.getSelectableIndex(_loc1_);
      }
      
      private function get windowXML() : XML
      {
         if(_windowXML != null)
         {
            return _windowXML;
         }
         if(var_1429 == null || true || var_1429.assets.getAssetByName("dimmer_ui") == null)
         {
            return null;
         }
         var _loc1_:XmlAsset = XmlAsset(var_1429.assets.getAssetByName("dimmer_ui"));
         _windowXML = XML(_loc1_.content);
         return _windowXML;
      }
      
      public function get colors() : Array
      {
         if(var_1429 == null)
         {
            return null;
         }
         return var_1429.colors;
      }
      
      public function set selectedType(param1:int) : void
      {
         if(param1 != 1 && param1 != 2)
         {
            return;
         }
         var_4128 = param1;
         var _loc2_:class_3176 = _window.findChildByName("type_checkbox") as class_3176;
         if(_loc2_ != null)
         {
            if(param1 == 2)
            {
               _loc2_.select();
            }
            else
            {
               _loc2_.unselect();
            }
         }
         if(var_1934 != null)
         {
            var_1934.min = var_1429.minLights[param1 - 1];
         }
      }
      
      public function set selectedColorIndex(param1:int) : void
      {
         var_2018 = param1;
         if(var_1866 != null)
         {
            var_1866.setSelectedColorIndex(param1);
         }
         var_1429.previewCurrentSetting();
      }
      
      public function set selectedBrightness(param1:int) : void
      {
         var_3110 = param1;
         if(var_1934 != null)
         {
            var_1934.setValue(param1);
         }
         var_1429.previewCurrentSetting();
      }
   }
}
