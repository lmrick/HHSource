package com.sulake.habbo.ui.widget.camera
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class CameraFxStrengthSlider
   {
       
      
      private var var_1430:com.sulake.habbo.ui.widget.camera.CameraPhotoLab;
      
      private var var_1929:class_3151;
      
      private var var_2352:BitmapData;
      
      private var _sliderButton:BitmapData;
      
      private var _activeBaseArea:class_3282;
      
      private var _sliderBaseWidth:int;
      
      private var _referenceWidth:int;
      
      private var var_3874:int = 0;
      
      public function CameraFxStrengthSlider(param1:com.sulake.habbo.ui.widget.camera.CameraPhotoLab, param2:class_3151, param3:class_21)
      {
         super();
         var_1430 = param1;
         var_1929 = param2;
         storeAssets(param3);
         displaySlider();
      }
      
      public function dispose() : void
      {
         var_1430 = null;
         var_1929 = null;
         var_2352 = null;
         _sliderButton = null;
      }
      
      public function disable() : void
      {
         var_1929.visible = false;
      }
      
      public function enable() : void
      {
         var_1929.visible = true;
      }
      
      public function getScale() : int
      {
         return _referenceWidth;
      }
      
      public function setValue(param1:int) : void
      {
         var _loc2_:class_3127 = null;
         if(var_1929 != null)
         {
            _loc2_ = var_1929.findChildByName("slider_button");
            if(_loc2_ != null)
            {
               _loc2_.x = param1;
            }
         }
      }
      
      private function buttonProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_RELOCATED")
         {
            if(_activeBaseArea)
            {
               _activeBaseArea.width = param2.x / _referenceWidth * _sliderBaseWidth;
            }
         }
         else if(param1.type == "WME_UP" || param1.type == "WME_UP_OUTSIDE")
         {
            var_1430.setSelectedFxValue(param2.x);
         }
      }
      
      private function shaftProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(param1.type == "WME_DOWN" && param2.name == "shaft_click_area")
         {
            _loc3_ = WindowMouseEvent(param1).localX - var_3874;
            setValue(_loc3_);
            var_1430.setSelectedFxValue(_loc3_);
         }
      }
      
      private function displaySlider() : void
      {
         var _loc3_:class_3151 = null;
         var _loc2_:class_3282 = null;
         if(var_1929 == null)
         {
            return;
         }
         var _loc1_:IRegionWindow = var_1929.findChildByName("shaft_click_area") as IRegionWindow;
         if(_loc1_)
         {
            _loc1_.procedure = shaftProcedure;
         }
         _loc2_ = var_1929.findChildByName("slider_base") as class_3282;
         if(_loc2_ != null && var_2352 != null)
         {
            _sliderBaseWidth = _loc2_.width;
            _loc2_.bitmap = new BitmapData(var_2352.width,var_2352.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_2352,var_2352.rect,new Point(0,0),null,null,true);
            _activeBaseArea = _loc2_;
         }
         _loc3_ = var_1929.findChildByName("slider_movement_area") as class_3151;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.findChildByName("slider_button") as class_3282;
            if(_loc2_ != null && _sliderButton != null)
            {
               _loc2_.bitmap = new BitmapData(_sliderButton.width,_sliderButton.height,true,16777215);
               _loc2_.bitmap.copyPixels(_sliderButton,_sliderButton.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               _referenceWidth = _loc3_.width - _loc2_.width;
               var_3874 = (_sliderBaseWidth - _referenceWidth) / 2;
            }
         }
      }
      
      private function storeAssets(param1:class_21) : void
      {
         var _loc2_:BitmapDataAsset = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("camera_fx_slider_bottom_active"));
         var_2352 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("camera_fx_slider_button"));
         _sliderButton = BitmapData(_loc2_.content);
      }
   }
}
