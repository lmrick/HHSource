package com.sulake.habbo.ui.widget.memenu.soundsettings
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSoundSettingsSlider
   {
       
      
      private var var_3308:com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsItem;
      
      private var var_1929:class_3151;
      
      private var var_2352:BitmapData;
      
      private var _sliderButton:BitmapData;
      
      private var _referenceWidth:int;
      
      private var name_3:Number = 0;
      
      private var name_5:Number = 1;
      
      public function MeMenuSoundSettingsSlider(param1:com.sulake.habbo.ui.widget.memenu.soundsettings.MeMenuSoundSettingsItem, param2:class_3151, param3:class_21, param4:Number = 0, param5:Number = 1)
      {
         super();
         var_3308 = param1;
         var_1929 = param2;
         name_3 = param4;
         name_5 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      public function dispose() : void
      {
         var_3308 = null;
         var_1929 = null;
         var_2352 = null;
         _sliderButton = null;
      }
      
      public function setValue(param1:Number) : void
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
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(_referenceWidth * ((param1 - name_3) / (name_5 - name_3)));
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / _referenceWidth * (name_5 - name_3) + name_3;
      }
      
      private function buttonProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_RELOCATED")
         {
            return;
         }
         var_3308.saveVolume(getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc3_:class_3151 = null;
         var _loc1_:class_3151 = null;
         var _loc2_:class_3282 = null;
         if(var_1929 == null)
         {
            return;
         }
         _loc2_ = var_1929.findChildByName("slider_base") as class_3282;
         if(_loc2_ != null && var_2352 != null)
         {
            _loc2_.bitmap = new BitmapData(var_2352.width,var_2352.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_2352,var_2352.rect,new Point(0,0),null,null,true);
         }
         _loc3_ = var_1929.findChildByName("slider_movement_area") as class_3151;
         if(_loc3_ != null)
         {
            _loc1_ = _loc3_.findChildByName("slider_button") as class_3151;
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.findChildByName("slider_bitmap") as class_3282;
               if(_loc2_ != null && _sliderButton != null)
               {
                  _loc2_.bitmap = new BitmapData(_sliderButton.width,_sliderButton.height,true,16777215);
                  _loc2_.bitmap.copyPixels(_sliderButton,_sliderButton.rect,new Point(0,0),null,null,true);
                  _loc1_.procedure = buttonProcedure;
                  _referenceWidth = _loc3_.width - _loc2_.width;
               }
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
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_2352 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         _sliderButton = BitmapData(_loc2_.content);
      }
   }
}
