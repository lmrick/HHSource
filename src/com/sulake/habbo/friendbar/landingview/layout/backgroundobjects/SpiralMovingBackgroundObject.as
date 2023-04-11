package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;
   import flash.events.EventDispatcher;
   
   public class SpiralMovingBackgroundObject extends BackgroundObject
   {
       
      
      private var _startRadius:int;
      
      private var var_4101:int;
      
      private var _posRadius:Number;
      
      private var var_1843:Number;
      
      private var _speedRadius:Number;
      
      private var var_4234:Number;
      
      private var var_3777:Number;
      
      private var var_3829:Number;
      
      public function SpiralMovingBackgroundObject(param1:int, param2:class_3151, param3:EventDispatcher, param4:HabboLandingView, param5:String)
      {
         super(param1,param2,param3,param4,param5);
         var _loc7_:Array;
         var _loc6_:String = String((_loc7_ = param5.split(";"))[0]);
         _startRadius = int(_loc7_[2]);
         var_4101 = int(_loc7_[3]);
         _speedRadius = Number(_loc7_[4]);
         var_4234 = Number(_loc7_[5]);
         var_3777 = Number(_loc7_[6]);
         var_3829 = Number(_loc7_[7]);
         _posRadius = _startRadius;
         var_1843 = var_4101;
         sprite.assetUri = "${image.library.url}reception/" + _loc6_ + ".png";
      }
      
      override public function update(param1:uint) : void
      {
         super.update(param1);
         var _loc2_:Number = _startRadius / _posRadius;
         var _loc3_:Number = 1 + _startRadius / _posRadius / 8;
         _posRadius += param1 * _speedRadius;
         var_1843 += param1 * var_4234 * _loc2_;
         if(false)
         {
            if(_posRadius <= 0)
            {
               _posRadius = _startRadius;
               sprite.width = sprite.bitmapData.width;
               sprite.height = sprite.bitmapData.height;
               events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET",id));
            }
         }
         if(_posRadius > _startRadius)
         {
            _posRadius = 0;
            sprite.width = 0;
            sprite.height = 0;
            events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET",id));
         }
         if(var_1843 < 0)
         {
            var_1843 = 6.283185307179586;
         }
         if(var_1843 > 6.283185307179586)
         {
            var_1843 = 0;
         }
         sprite.x = var_3777 + Math.sin(var_1843) * _posRadius;
         sprite.y = var_3829 + Math.cos(var_1843) * _posRadius;
         if(false)
         {
            sprite.pivotPoint = 4;
            sprite.stretchedX = true;
            sprite.stretchedY = true;
            sprite.width = sprite.bitmapData.width / _loc3_;
            sprite.height = sprite.bitmapData.height / _loc3_;
         }
      }
   }
}
