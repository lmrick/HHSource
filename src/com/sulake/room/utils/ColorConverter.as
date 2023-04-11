package com.sulake.room.utils
{
   public class ColorConverter
   {
       
      
      public function ColorConverter()
      {
         super();
      }
      
      public static function rgbToHSL(param1:int) : int
      {
         var _loc10_:Number = (param1 >> 16 & 255) / 255;
         var _loc6_:Number = (param1 >> 8 & 255) / 255;
         var _loc4_:Number = (param1 & 255) / 255;
         var _loc5_:Number = Math.max(_loc10_,_loc6_,_loc4_);
         var _loc11_:Number = Math.min(_loc10_,_loc6_,_loc4_);
         var _loc2_:Number = _loc5_ - _loc11_;
         var _loc14_:Number = 0;
         var _loc13_:Number = 0;
         var _loc9_:Number = 0;
         if(_loc2_ == 0)
         {
            _loc14_ = 0;
         }
         else if(_loc5_ == _loc10_)
         {
            if(_loc6_ > _loc4_)
            {
               _loc14_ = 60 * (_loc6_ - _loc4_) / _loc2_;
            }
            else
            {
               _loc14_ = 60 * (_loc6_ - _loc4_) / _loc2_ + 360;
            }
         }
         else if(_loc5_ == _loc6_)
         {
            _loc14_ = 60 * (_loc4_ - _loc10_) / _loc2_ + 120;
         }
         else if(_loc5_ == _loc4_)
         {
            _loc14_ = 60 * (_loc10_ - _loc6_) / _loc2_ + 240;
         }
         _loc13_ = 0.5 * (_loc5_ + _loc11_);
         if(_loc2_ == 0)
         {
            _loc9_ = 0;
         }
         else if(_loc13_ <= 0.5)
         {
            _loc9_ = _loc2_ / _loc13_ * 0.5;
         }
         else
         {
            _loc9_ = _loc2_ / (1 - _loc13_) * 0.5;
         }
         var _loc7_:int = Math.round(_loc14_ / 360 * 255);
         var _loc12_:int = Math.round(_loc9_ * 255);
         var _loc8_:int = Math.round(_loc13_ * 255);
         return (_loc7_ << 16) + (_loc12_ << 8) + _loc8_;
      }
      
      public static function hslToRGB(param1:int) : int
      {
         var _loc12_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc16_:* = NaN;
         var _loc8_:Number = NaN;
         var _loc5_:Number = (param1 >> 16 & 255) / 255;
         var _loc14_:Number = (param1 >> 8 & 255) / 255;
         var _loc7_:Number = (param1 & 255) / 255;
         var _loc10_:* = 0;
         var _loc3_:* = 0;
         var _loc15_:* = 0;
         if(_loc14_ > 0)
         {
            _loc12_ = 0;
            _loc11_ = 0;
            if(_loc7_ < 0.5)
            {
               _loc12_ = _loc7_ * (1 + _loc14_);
            }
            else
            {
               _loc12_ = _loc7_ + _loc14_ - _loc7_ * _loc14_;
            }
            _loc11_ = 2 * _loc7_ - _loc12_;
            _loc6_ = _loc5_ + 0.3333333333333333;
            _loc16_ = _loc5_;
            _loc8_ = _loc5_ - 0.3333333333333333;
            if(_loc6_ < 0)
            {
               _loc6_ += 1;
            }
            else if(_loc6_ > 1)
            {
               _loc6_ -= 1;
            }
            if(_loc16_ < 0)
            {
               _loc16_ += 1;
            }
            else if(_loc16_ > 1)
            {
               _loc16_ -= 1;
            }
            if(_loc8_ < 0)
            {
               _loc8_ += 1;
            }
            else if(_loc8_ > 1)
            {
               _loc8_ -= 1;
            }
            if(_loc6_ * 6 < 1)
            {
               _loc10_ = _loc11_ + (_loc12_ - _loc11_) * 6 * _loc6_;
            }
            else if(_loc6_ * 2 < 1)
            {
               _loc10_ = _loc12_;
            }
            else if(_loc6_ * 3 < 2)
            {
               _loc10_ = _loc11_ + (_loc12_ - _loc11_) * 6 * (0.6666666666666666 - _loc6_);
            }
            else
            {
               _loc10_ = _loc11_;
            }
            if(_loc16_ * 6 < 1)
            {
               _loc3_ = _loc11_ + (_loc12_ - _loc11_) * 6 * _loc16_;
            }
            else if(_loc16_ * 2 < 1)
            {
               _loc3_ = _loc12_;
            }
            else if(_loc16_ * 3 < 2)
            {
               _loc3_ = _loc11_ + (_loc12_ - _loc11_) * 6 * (0.6666666666666666 - _loc16_);
            }
            else
            {
               _loc3_ = _loc11_;
            }
            if(_loc8_ * 6 < 1)
            {
               _loc15_ = _loc11_ + (_loc12_ - _loc11_) * 6 * _loc8_;
            }
            else if(_loc8_ * 2 < 1)
            {
               _loc15_ = _loc12_;
            }
            else if(_loc8_ * 3 < 2)
            {
               _loc15_ = _loc11_ + (_loc12_ - _loc11_) * 6 * (0.6666666666666666 - _loc8_);
            }
            else
            {
               _loc15_ = _loc11_;
            }
         }
         else
         {
            _loc10_ = _loc7_;
            _loc3_ = _loc7_;
            _loc15_ = _loc7_;
         }
         var _loc13_:int = Math.round(_loc10_ * 255);
         var _loc4_:int = Math.round(_loc3_ * 255);
         var _loc2_:int = Math.round(_loc15_ * 255);
         return (_loc13_ << 16) + (_loc4_ << 8) + _loc2_;
      }
      
      public static function rgb2xyz(param1:int) : IVector3d
      {
         var _loc2_:Number = (param1 >> 16 & 255) / 255;
         var _loc4_:Number = (param1 >> 8 & 255) / 255;
         var _loc3_:Number = (param1 >> 0 & 255) / 255;
         if(_loc2_ > 0.04045)
         {
            _loc2_ = Math.pow((_loc2_ + 0.055) / 1.055,2.4);
         }
         else
         {
            _loc2_ /= 12.92;
         }
         if(_loc4_ > 0.04045)
         {
            _loc4_ = Math.pow((_loc4_ + 0.055) / 1.055,2.4);
         }
         else
         {
            _loc4_ /= 12.92;
         }
         if(_loc3_ > 0.04045)
         {
            _loc3_ = Math.pow((_loc3_ + 0.055) / 1.055,2.4);
         }
         else
         {
            _loc3_ /= 12.92;
         }
         _loc2_ *= 100;
         _loc4_ *= 100;
         _loc3_ *= 100;
         return new Vector3d(_loc2_ * 0.4124 + _loc4_ * 0.3576 + _loc3_ * 0.1805,_loc2_ * 0.2126 + _loc4_ * 0.7152 + _loc3_ * 0.0722,_loc2_ * 0.0193 + _loc4_ * 0.1192 + _loc3_ * 0.9505);
      }
      
      public static function xyz2CieLab(param1:IVector3d) : IVector3d
      {
         var _loc2_:Number = param1.x / 95.047;
         var _loc3_:Number = param1.y / 100;
         var _loc4_:Number = param1.z / 108.883;
         if(_loc2_ > 0.008856)
         {
            _loc2_ = Math.pow(_loc2_,0.3333333333333333);
         }
         else
         {
            _loc2_ = 7.787 * _loc2_ + 0.13793103448275862;
         }
         if(_loc3_ > 0.008856)
         {
            _loc3_ = Math.pow(_loc3_,0.3333333333333333);
         }
         else
         {
            _loc3_ = 7.787 * _loc3_ + 0.13793103448275862;
         }
         if(_loc4_ > 0.008856)
         {
            _loc4_ = Math.pow(_loc4_,0.3333333333333333);
         }
         else
         {
            _loc4_ = 7.787 * _loc4_ + 0.13793103448275862;
         }
         return new Vector3d(116 * _loc3_ - 16,500 * (_loc2_ - _loc3_),200 * (_loc3_ - _loc4_));
      }
      
      public static function rgb2CieLab(param1:int) : IVector3d
      {
         return ColorConverter.xyz2CieLab(ColorConverter.rgb2xyz(param1));
      }
   }
}
