package com.sulake.habbo.roomevents.userdefinedroomevents.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3258;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class SliderWindowController extends EventDispatcherWrapper
   {
       
      
      private var var_2567:Number = 0;
      
      private var var_1929:class_3151;
      
      private var var_2225:Boolean = false;
      
      private var var_2352:BitmapData;
      
      private var _sliderButton:BitmapData;
      
      private var _referenceWidth:int;
      
      private var name_3:Number = 0;
      
      private var name_5:Number = 1;
      
      private var var_2316:Number = 0;
      
      public function SliderWindowController(param1:HabboUserDefinedRoomEvents, param2:class_3151, param3:class_21, param4:Number = 0, param5:Number = 1, param6:Number = 0)
      {
         super();
         var_1929 = class_3151(param1.getXmlWindow("ude_slider"));
         param2.addChild(var_1929);
         name_3 = param4;
         name_5 = param5;
         var_2316 = param6;
         var_2567 = 0;
         storeAssets(param3);
         displaySlider();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_1929 = null;
         var_2352 = null;
         _sliderButton = null;
      }
      
      public function setValue(param1:Number, param2:Boolean = true, param3:Boolean = true) : void
      {
         param1 = Math.max(name_3,param1);
         param1 = Math.min(name_5,param1);
         var_2567 = param1;
         if(param2)
         {
            updateSliderPosition();
         }
         if(param3)
         {
            dispatchEvent(new Event("change"));
         }
      }
      
      public function getValue() : Number
      {
         return var_2567;
      }
      
      public function set min(param1:Number) : void
      {
         name_3 = param1;
      }
      
      public function set max(param1:Number) : void
      {
         name_5 = param1;
      }
      
      private function updateSliderPosition() : void
      {
         if(var_1929 == null)
         {
            return;
         }
         var _loc1_:class_3127 = var_1929.findChildByName("slider_button");
         if(_loc1_ != null)
         {
            _loc1_.x = getSliderPosition(var_2567);
         }
         _loc1_.parent.invalidate();
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(_referenceWidth * ((param1 - name_3) / (name_5 - name_3)));
      }
      
      private function getValueAtPosition(param1:Number) : Number
      {
         return param1 / _referenceWidth * (name_5 - name_3) + name_3;
      }
      
      private function sliderProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1.type == "WME_DOWN")
         {
            var_2225 = true;
         }
         if(var_2225)
         {
            if(param1.type == "WME_UP" || param1.type == "WME_UP_OUTSIDE")
            {
               var_2225 = false;
            }
         }
         if(!var_2225 || param1.type != "WE_RELOCATED")
         {
            return;
         }
         if(var_2316 != 0)
         {
            _loc4_ = getValueAtPosition(param2.x);
            _loc3_ = Math.round(_loc4_ / var_2316) * var_2316;
            setValue(_loc3_,false);
         }
      }
      
      private function sliderButtonRightProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:Number = NaN;
         if(param1.type == "WME_CLICK")
         {
            var_2225 = false;
            if(var_2316 != 0)
            {
               _loc3_ = var_2567 + var_2316;
               setValue(_loc3_);
            }
         }
      }
      
      private function sliderButtonLeftProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:Number = NaN;
         if(param1.type == "WME_CLICK")
         {
            var_2225 = false;
            if(var_2316 != 0)
            {
               _loc3_ = var_2567 - var_2316;
               setValue(_loc3_);
            }
         }
      }
      
      private function displaySlider() : void
      {
         var _loc1_:class_3151 = null;
         var _loc3_:class_3282 = null;
         var _loc4_:class_3258 = null;
         var _loc2_:class_3258 = null;
         if(var_1929 == null)
         {
            return;
         }
         _loc3_ = var_1929.findChildByName("slider_base") as class_3282;
         if(_loc3_ != null && var_2352 != null)
         {
            _loc3_.bitmap = new BitmapData(var_2352.width,var_2352.height,true,16777215);
            _loc3_.bitmap.copyPixels(var_2352,var_2352.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = var_1929.findChildByName("slider_movement_area") as class_3151;
         if(_loc1_ != null)
         {
            _loc3_ = _loc1_.findChildByName("slider_button") as class_3282;
            if(_loc3_ != null && _sliderButton != null)
            {
               _loc3_.bitmap = new BitmapData(_sliderButton.width,_sliderButton.height,true,16777215);
               _loc3_.bitmap.copyPixels(_sliderButton,_sliderButton.rect,new Point(0,0),null,null,true);
               _loc3_.procedure = sliderProcedure;
               _referenceWidth = _loc1_.width - _loc3_.width;
            }
         }
         _loc2_ = var_1929.findChildByName("slider_button_left") as class_3258;
         if(_loc2_)
         {
            _loc2_.procedure = sliderButtonLeftProcedure;
         }
         if(_loc4_ = var_1929.findChildByName("slider_button_right") as class_3258)
         {
            _loc4_.procedure = sliderButtonRightProcedure;
         }
      }
      
      private function storeAssets(param1:class_21) : void
      {
         var _loc2_:BitmapDataAsset = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("slider_bg_png"));
         var_2352 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("slider_obj_png"));
         _sliderButton = BitmapData(_loc2_.content);
      }
   }
}
