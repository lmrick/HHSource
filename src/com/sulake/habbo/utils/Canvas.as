package com.sulake.habbo.utils
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class Canvas extends BitmapData
   {
       
      
      public function Canvas(param1:int, param2:int, param3:Boolean = true, param4:uint = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      private static function sortByVerticalPosition(param1:Point, param2:Point) : int
      {
         if(param1.y > param2.y)
         {
            return 1;
         }
         if(param1.y < param2.y)
         {
            return -1;
         }
         return 0;
      }
      
      private static function sampleLeftWallTexture(param1:BitmapData, param2:Point, param3:int, param4:int, param5:uint) : uint
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = 0;
         if(param1)
         {
            _loc6_ = param3 - param2.x;
            _loc7_ = param4 - param2.y;
            _loc8_ = _loc6_ % param1.width;
            _loc9_ = (_loc7_ + _loc6_ / 2) % param1.height;
            _loc10_ = param1.getPixel32(_loc8_,_loc9_);
            return colorize(_loc10_,param5);
         }
         return param5;
      }
      
      private static function sampleRightWallTexture(param1:BitmapData, param2:Point, param3:int, param4:int, param5:uint) : uint
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = 0;
         if(param1)
         {
            _loc6_ = param3 - param2.x;
            _loc7_ = param4 - param2.y;
            _loc8_ = _loc6_ % param1.width;
            _loc9_ = (_loc7_ - _loc6_ / 2) % param1.height;
            _loc10_ = param1.getPixel32(_loc8_,_loc9_);
            return colorize(_loc10_,param5);
         }
         return param5;
      }
      
      private static function sampleFloorTexture(param1:BitmapData, param2:Point, param3:int, param4:int, param5:uint) : uint
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = 0;
         if(param1)
         {
            _loc6_ = param3 - param2.x;
            _loc8_ = ((_loc7_ = param4 - param2.y) + _loc6_ / 2) % param1.width;
            _loc9_ = (_loc7_ - _loc6_ / 2) % param1.height;
            _loc10_ = param1.getPixel32(_loc8_,_loc9_);
            return colorize(_loc10_,param5);
         }
         return param5;
      }
      
      public static function colorize(param1:uint, param2:uint) : uint
      {
         if(param2 == 4294967295)
         {
            return param1;
         }
         var _loc3_:uint = uint(param2 >> 16 & 255);
         var _loc5_:uint = uint(param2 >> 8 & 255);
         var _loc4_:uint = uint(param2 & 255);
         _loc3_ = (param1 >> 16 & 255) * _loc3_ / 255;
         _loc5_ = (param1 >> 8 & 255) * _loc5_ / 255;
         _loc4_ = (param1 & 255) * _loc4_ / 255;
         return (param1 && true) | _loc3_ << 16 | _loc5_ << 8 | _loc4_;
      }
      
      public static function averageColor(param1:BitmapData) : uint
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         if(param1 == null)
         {
            return 16777215;
         }
         var _loc2_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc3_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param1.width)
         {
            _loc7_ = 0;
            while(_loc7_ < param1.height)
            {
               if(((_loc8_ = param1.getPixel32(_loc6_,_loc7_)) >> 24 & 255) > 0)
               {
                  _loc2_ += _loc8_ >> 16 & 255;
                  _loc4_ += _loc8_ >> 8 & 255;
                  _loc5_ += _loc8_ & 255;
                  _loc3_++;
               }
               _loc7_++;
            }
            _loc6_++;
         }
         if(_loc3_ == 0)
         {
            return 16777215;
         }
         _loc2_ /= _loc3_;
         _loc4_ /= _loc3_;
         _loc5_ /= _loc3_;
         return _loc2_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public function drawQuad(param1:Vector.<Point>, param2:BitmapData, param3:uint = 4294967295) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Function = null;
         if(param1.length != 4)
         {
            return;
         }
         if(param1[1].x == param1[3].x)
         {
            _loc4_ = param1[3];
            if(param1[0].y < param1[1].y)
            {
               _loc5_ = sampleLeftWallTexture;
            }
            else
            {
               _loc5_ = sampleRightWallTexture;
            }
         }
         else
         {
            _loc4_ = param1[3];
            _loc5_ = sampleFloorTexture;
         }
         fillTriangle(param1.slice(0,3),param2,_loc4_,_loc5_,param3);
         fillTriangle(param1.slice(1,4),param2,_loc4_,_loc5_,param3);
      }
      
      public function fillTriangle(param1:Vector.<Point>, param2:BitmapData, param3:Point, param4:Function, param5:uint) : void
      {
         if(param1.length != 3)
         {
            return;
         }
         var _loc12_:Vector.<Point>;
         (_loc12_ = param1.concat()).sort(sortByVerticalPosition);
         var _loc6_:Point = new Point(_loc12_[1].x - _loc12_[0].x,_loc12_[1].y - _loc12_[0].y);
         var _loc7_:Point = new Point(_loc12_[2].x - _loc12_[0].x,_loc12_[2].y - _loc12_[0].y);
         var _loc8_:Point = new Point(_loc12_[2].x - _loc12_[1].x,_loc12_[2].y - _loc12_[1].y);
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(_loc6_.y != 0 && _loc7_.y != 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc6_.y)
            {
               _loc10_ = _loc12_[0].x + _loc6_.x / _loc6_.y * _loc9_;
               _loc11_ = _loc12_[0].x + _loc7_.x / _loc7_.y * _loc9_;
               drawHorizontalLine(_loc10_,_loc11_,_loc12_[0].y + _loc9_,param2,param3,param4,param5);
               _loc9_++;
            }
         }
         if(_loc7_.y != 0 && _loc8_.y != 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc8_.y)
            {
               _loc10_ = _loc12_[1].x + _loc8_.x / _loc8_.y * _loc9_;
               _loc11_ = _loc12_[0].x + _loc7_.x / _loc7_.y * (_loc6_.y + _loc9_);
               drawHorizontalLine(_loc10_,_loc11_,_loc12_[1].y + _loc9_,param2,param3,param4,param5);
               _loc9_++;
            }
         }
      }
      
      private function drawHorizontalLine(param1:int, param2:int, param3:int, param4:BitmapData, param5:Point, param6:Function, param7:uint) : void
      {
         var _loc8_:* = 0;
         if(param1 < param2)
         {
            _loc8_ = param1;
            while(_loc8_ < param2)
            {
               setPixel(_loc8_,param3,param6(param4,param5,_loc8_,param3,param7));
               _loc8_++;
            }
         }
         else
         {
            _loc8_ = param2;
            while(_loc8_ < param1)
            {
               setPixel(_loc8_,param3,param6(param4,param5,_loc8_,param3,param7));
               _loc8_++;
            }
         }
      }
   }
}
