package com.sulake.habbo.ui.widget.furniture.backgroundcolor
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.FurnitureBackgroundColorWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.utils.ColorConverter;
   import flash.display.BitmapData;
   import package_13.class_560;
   import package_21.class_780;
   
   public class BackgroundColorFurniWidget extends RoomWidgetBase
   {
      
      private static const PARAMETER_HUE:String = "hue";
      
      private static const PARAMETER_SATURATION:String = "saturation";
      
      private static const PARAMETER_LIGHTNESS:String = "lightness";
       
      
      private var _window:class_3281;
      
      private var var_490:int;
      
      private var _sliders:Vector.<com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider>;
      
      private var var_829:int;
      
      private var _saturation:int;
      
      private var var_1054:int;
      
      public function BackgroundColorFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         _sliders = new Vector.<com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider>();
         super(param1,param2,param3,param4);
         this.handler.widget = this;
      }
      
      public function get handler() : FurnitureBackgroundColorWidgetHandler
      {
         return var_1453 as FurnitureBackgroundColorWidgetHandler;
      }
      
      override public function dispose() : void
      {
         destroyWindow();
         super.dispose();
      }
      
      public function open(param1:int, param2:int, param3:int, param4:int) : void
      {
         var_490 = param1;
         var_829 = Math.max(param2,0);
         _saturation = Math.max(param3,0);
         var_1054 = Math.max(param4,0);
         createWindow();
      }
      
      public function setParameterCallback(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case "hue":
               var_829 = param2;
               break;
            case "saturation":
               _saturation = param2;
               break;
            case "lightness":
               var_1054 = param2;
         }
         renderColorPreview();
      }
      
      private function createWindow() : void
      {
         if(!_window)
         {
            _window = class_3281(windowManager.buildFromXML(assets.getAssetByName("background_color_ui_xml").content as XML));
            _window.procedure = windowProcedure;
            _window.center();
            _sliders.push(new com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider(this,"hue",class_3151(_window.findChildByName("hue_container")),var_829));
            _sliders.push(new com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider(this,"saturation",class_3151(_window.findChildByName("saturation_container")),_saturation));
            _sliders.push(new com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider(this,"lightness",class_3151(_window.findChildByName("lightness_container")),var_1054));
         }
      }
      
      private function destroyWindow() : void
      {
         for each(var _loc1_ in _sliders)
         {
            _loc1_.dispose();
         }
         _sliders = new Vector.<com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorWidgetSlider>();
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function renderColorPreview() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc3_:class_3282 = class_3282(_window.findChildByName("color_preview_bitmap"));
         var _loc2_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,false);
         var _loc1_:uint = uint(ColorConverter.hslToRGB(((var_829 & 255) << 16) + ((_saturation & 255) << 8) + (var_1054 & 255)));
         _loc2_.fillRect(_loc2_.rect,_loc1_);
         _loc3_.bitmap = _loc2_;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param2 != null && param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "apply_button":
                  handler.container.connection.send(new class_780(var_490,var_829,_saturation,var_1054));
                  break;
               case "on_off_button":
                  handler.container.connection.send(new class_560(var_490));
                  break;
               case "header_button_close":
                  destroyWindow();
            }
         }
      }
   }
}
