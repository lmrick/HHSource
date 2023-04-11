package com.sulake.habbo.ui.widget.furniture.backgroundcolor
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BackgroundColorWidgetSlider
   {
      
      private static const name_3:int = 0;
      
      private static const name_5:int = 255;
       
      
      private var var_1429:com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorFurniWidget;
      
      private var var_1929:class_3151;
      
      private var var_190:String;
      
      private var var_2352:BitmapData;
      
      private var _sliderButton:BitmapData;
      
      private var _referenceWidth:int;
      
      private var var_3874:int;
      
      public function BackgroundColorWidgetSlider(param1:com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorFurniWidget, param2:String, param3:class_3151, param4:int = 0)
      {
         var _loc5_:BitmapDataAsset = null;
         super();
         var_1429 = param1;
         var_190 = param2;
         var_1929 = param3;
         _loc5_ = BitmapDataAsset(param1.assets.getAssetByName("dimmer_slider_base"));
         var_2352 = BitmapData(_loc5_.content);
         _loc5_ = BitmapDataAsset(param1.assets.getAssetByName("dimmer_slider_button"));
         _sliderButton = BitmapData(_loc5_.content);
         displaySlider();
         setValue(param4);
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         var_1929 = null;
         var_2352 = null;
         _sliderButton = null;
      }
      
      public function setValue(param1:int) : void
      {
         if(var_1929 == null)
         {
            return;
         }
         var _loc2_:class_3127 = var_1929.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getSliderPosition(param1:int) : int
      {
         return int(_referenceWidth * ((param1 - 0) / 255));
      }
      
      private function getValue(param1:Number) : int
      {
         return int(param1 / _referenceWidth * 255) + 0;
      }
      
      private function buttonProcedure(param1:class_3134, param2:class_3127) : void
      {
         var_1429.setParameterCallback(var_190,getValue(param2.x));
      }
      
      private function displaySlider() : void
      {
         var _loc2_:class_3151 = null;
         var _loc1_:class_3282 = null;
         if(var_1929 == null)
         {
            return;
         }
         _loc1_ = var_1929.findChildByName("slider_base") as class_3282;
         if(_loc1_ != null && var_2352 != null)
         {
            _loc1_.bitmap = new BitmapData(var_2352.width,var_2352.height,true,16777215);
            _loc1_.bitmap.copyPixels(var_2352,var_2352.rect,new Point(0,0),null,null,true);
         }
         _loc2_ = var_1929.findChildByName("slider_movement_area") as class_3151;
         if(_loc2_ != null)
         {
            _loc1_ = _loc2_.findChildByName("slider_button") as class_3282;
            if(_loc1_ != null && _sliderButton != null)
            {
               _loc1_.bitmap = new BitmapData(_sliderButton.width,_sliderButton.height,true,16777215);
               _loc1_.bitmap.copyPixels(_sliderButton,_sliderButton.rect,new Point(0,0),null,null,true);
               _loc1_.procedure = buttonProcedure;
               _referenceWidth = _loc2_.width - _loc1_.width;
            }
         }
      }
   }
}
