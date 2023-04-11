package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FurniturePlane
   {
       
      
      private var var_3173:int = -1;
      
      private var var_2962:Number = 0;
      
      private var var_3816:Number = 0;
      
      private var var_4162:Number = 0;
      
      private var var_3264:Number = 0;
      
      private var _origin:Vector3d = null;
      
      private var var_537:Vector3d = null;
      
      private var var_669:Vector3d = null;
      
      private var var_589:Vector3d = null;
      
      private var var_2329:Vector3d = null;
      
      private var var_2367:Vector3d = null;
      
      private var _normal:Vector3d = null;
      
      private var var_2160:Boolean = true;
      
      private var _bitmapData:BitmapData = null;
      
      private var var_1660:class_24 = null;
      
      private var _offset:Point = null;
      
      private var _relativeDepth:Number = 0;
      
      private var _color:uint = 0;
      
      private var var_3933:Boolean = false;
      
      private var var_247:String = null;
      
      private var var_1611:Vector3d = null;
      
      private var var_1573:Vector3d = null;
      
      private var var_1535:Vector3d = null;
      
      private var var_1572:Vector3d = null;
      
      private var _width:Number = 0;
      
      private var var_47:Number = 0;
      
      public function FurniturePlane(param1:IVector3d, param2:IVector3d, param3:IVector3d)
      {
         super();
         _origin = new Vector3d();
         var_537 = new Vector3d();
         var_537.assign(param1);
         var_669 = new Vector3d();
         var_669.assign(param2);
         var_589 = new Vector3d();
         var_589.assign(param3);
         var_2329 = new Vector3d();
         var_2329.assign(param2);
         var_2367 = new Vector3d();
         var_2367.assign(param3);
         _normal = Vector3d.crossProduct(var_669,var_589);
         if(false)
         {
            _normal.mul(Infinity);
         }
         _offset = new Point();
         var_1611 = new Vector3d();
         var_1573 = new Vector3d();
         var_1535 = new Vector3d();
         var_1572 = new Vector3d();
         var_1660 = new class_24();
      }
      
      public function get bitmapData() : BitmapData
      {
         if(var_2160)
         {
            if(_bitmapData != null)
            {
               return _bitmapData.clone();
            }
         }
         return null;
      }
      
      public function get visible() : Boolean
      {
         return var_2160;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      public function get relativeDepth() : Number
      {
         return _relativeDepth;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function get leftSide() : IVector3d
      {
         return var_669;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_589;
      }
      
      public function get location() : IVector3d
      {
         return var_537;
      }
      
      public function get normal() : IVector3d
      {
         return _normal;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:BitmapData = null;
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(var_1660 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1660.length)
            {
               _loc1_ = var_1660.getWithIndex(_loc2_) as BitmapData;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_1660.dispose();
            var_1660 = null;
         }
         _origin = null;
         var_537 = null;
         var_669 = null;
         var_589 = null;
         var_2329 = null;
         var_2367 = null;
         _normal = null;
         var_1611 = null;
         var_1573 = null;
         var_1535 = null;
         var_1572 = null;
      }
      
      public function setRotation(param1:Boolean) : void
      {
         if(param1 != var_3933)
         {
            if(!param1)
            {
               var_669.assign(var_2329);
               var_589.assign(var_2367);
            }
            else
            {
               var_669.assign(var_2329);
               var_669.mul(0 / 0);
               var_589.assign(var_2367);
               var_589.mul(0 / 0);
            }
            var_3173 = -1;
            var_2962 -= 1;
            var_3933 = param1;
            resetTextureCache();
         }
      }
      
      private function cacheTexture(param1:String, param2:BitmapData) : Boolean
      {
         var _loc3_:BitmapData = var_1660.remove(param1) as BitmapData;
         if(_loc3_ != null && param2 != _loc3_)
         {
            _loc3_.dispose();
         }
         var_1660.add(param1,param2);
         return true;
      }
      
      private function resetTextureCache() : void
      {
         var _loc2_:int = 0;
         var _loc1_:BitmapData = null;
         if(var_1660 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1660.length)
            {
               _loc1_ = var_1660.getWithIndex(_loc2_) as BitmapData;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_1660.reset();
         }
      }
      
      private function getTextureIdentifier(param1:IRoomGeometry) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return String(param1.scale);
      }
      
      private function needsNewTexture(param1:IRoomGeometry) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = getTextureIdentifier(param1);
         var _loc3_:BitmapData = var_1660.getValue(_loc2_) as BitmapData;
         if(_width > 0 && var_47 > 0)
         {
            if(_loc3_ == null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:IVector3d = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = getTextureIdentifier(param1);
         var _loc5_:BitmapData = null;
         if(needsNewTexture(param1))
         {
            _loc6_ = 0 * param1.scale;
            _loc7_ = 0 * param1.scale;
            if(_loc6_ < 1)
            {
               _loc6_ = 1;
            }
            if(_loc7_ < 1)
            {
               _loc7_ = 1;
            }
            _loc4_ = param1.getCoordinatePosition(_normal);
            if((_loc5_ = var_1660.getValue(_loc3_) as BitmapData) == null)
            {
               if((_loc5_ = new BitmapData(_loc6_,_loc7_,true,4278190080 | _color)) != null)
               {
                  cacheTexture(_loc3_,_loc5_);
               }
            }
         }
         else
         {
            _loc5_ = var_1660.getValue(_loc3_) as BitmapData;
         }
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         return null;
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc6_:IVector3d = null;
         var _loc3_:Number = NaN;
         var _loc4_:IVector3d = null;
         var _loc5_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:BitmapData = null;
         if(param1 == null || var_537 == null && _origin != null || var_669 == null || var_589 == null || _normal == null)
         {
            return false;
         }
         var _loc9_:Boolean = false;
         if(param1.updateId != var_3173)
         {
            var_3173 = param1.updateId;
            if((_loc6_ = param1.direction) != null && (_loc6_.x != var_2962 || _loc6_.y != var_3816 || _loc6_.z != var_4162 || param1.scale != var_3264))
            {
               var_2962 = _loc6_.x;
               var_3816 = _loc6_.y;
               var_4162 = _loc6_.z;
               var_3264 = param1.scale;
               _loc9_ = true;
               _loc3_ = 0;
               _loc3_ = Vector3d.cosAngle(param1.directionAxis,normal);
               if(_loc3_ > -0.001)
               {
                  if(var_2160)
                  {
                     var_2160 = false;
                     return true;
                  }
                  return false;
               }
               updateCorners(param1);
               _loc5_ = Number((_loc4_ = param1.getScreenPosition(_origin)).z);
               _relativeDepth = _loc7_ = Math.max(0 - _loc5_,0 - _loc5_,0 - _loc5_,0 - _loc5_);
               var_2160 = true;
            }
         }
         if(needsNewTexture(param1) || _loc9_)
         {
            if(_bitmapData == null || _width != _bitmapData.width || var_47 != _bitmapData.height)
            {
               if(_bitmapData != null)
               {
                  _bitmapData.dispose();
                  _bitmapData = null;
                  if(_width < 1 || var_47 < 1)
                  {
                     return true;
                  }
               }
               else if(_width < 1 || var_47 < 1)
               {
                  return false;
               }
               _bitmapData = new BitmapData(_width,var_47,true,16777215);
               _bitmapData.lock();
            }
            else
            {
               _bitmapData.lock();
               _bitmapData.fillRect(_bitmapData.rect,16777215);
            }
            if((_loc8_ = getTexture(param1,param2)) != null)
            {
               renderTexture(param1,_loc8_);
            }
            _bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         var_1611.assign(param1.getScreenPosition(var_537));
         var_1573.assign(param1.getScreenPosition(Vector3d.sum(var_537,var_589)));
         var_1535.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(var_537,var_669),var_589)));
         var_1572.assign(param1.getScreenPosition(Vector3d.sum(var_537,var_669)));
         _offset = param1.getScreenPoint(_origin);
         var_1611.x = Math.round(var_1611.x);
         var_1611.y = Math.round(var_1611.y);
         var_1573.x = Math.round(var_1573.x);
         var_1573.y = Math.round(var_1573.y);
         var_1535.x = Math.round(var_1535.x);
         var_1535.y = Math.round(var_1535.y);
         var_1572.x = Math.round(var_1572.x);
         var_1572.y = Math.round(var_1572.y);
         _offset.x = Math.round(_offset.x);
         _offset.y = Math.round(_offset.y);
         var _loc3_:Number = Math.min(var_1611.x,var_1573.x,var_1535.x,var_1572.x);
         var _loc5_:Number = Math.max(var_1611.x,var_1573.x,var_1535.x,var_1572.x);
         var _loc2_:Number = Math.min(var_1611.y,var_1573.y,var_1535.y,var_1572.y);
         var _loc4_:Number = Math.max(var_1611.y,var_1573.y,var_1535.y,var_1572.y);
         _loc5_ -= _loc3_;
         _offset.x = 0 - _loc3_;
         var_1611.x = 0 - _loc3_;
         var_1573.x = 0 - _loc3_;
         var_1535.x = 0 - _loc3_;
         var_1572.x = 0 - _loc3_;
         _loc4_ -= _loc2_;
         _offset.y = 0 - _loc2_;
         var_1611.y = 0 - _loc2_;
         var_1573.y = 0 - _loc2_;
         var_1535.y = 0 - _loc2_;
         var_1572.y = 0 - _loc2_;
         _width = _loc5_;
         var_47 = _loc4_;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(var_1611 == null || var_1573 == null || var_1535 == null || var_1572 == null || param2 == null || _bitmapData == null)
         {
            return;
         }
         var _loc8_:Number = 0 - 0;
         var _loc10_:Number = 0 - 0;
         var _loc4_:Number = 0 - 0;
         var _loc3_:Number = 0 - 0;
         if(Math.abs(_loc4_ - param2.width) <= 1)
         {
            _loc4_ = param2.width;
         }
         if(Math.abs(_loc3_ - param2.width) <= 1)
         {
            _loc3_ = param2.width;
         }
         if(Math.abs(_loc8_ - param2.height) <= 1)
         {
            _loc8_ = param2.height;
         }
         if(Math.abs(_loc10_ - param2.height) <= 1)
         {
            _loc10_ = param2.height;
         }
         var _loc5_:Number = _loc4_ / param2.width;
         var _loc6_:Number = _loc3_ / param2.width;
         var _loc7_:Number = _loc8_ / param2.height;
         var _loc9_:Number = _loc10_ / param2.height;
         var _loc11_:Matrix;
         (_loc11_ = new Matrix()).a = _loc5_;
         _loc11_.b = _loc6_;
         _loc11_.c = _loc7_;
         _loc11_.d = _loc9_;
         _loc11_.translate(var_1535.x,var_1535.y);
         draw(param2,_loc11_);
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc4_:int = 0;
         var _loc7_:* = 0;
         var _loc3_:Number = NaN;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         if(_bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1)
            {
               _loc4_ = 0;
               _loc7_ = 0;
               _loc3_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  param2.ty++;
               }
               _loc5_ = 0;
               while(_loc4_ < param1.width)
               {
                  _loc4_++;
                  _loc3_ += Math.abs(param2.b);
                  if(_loc3_ >= 1)
                  {
                     _bitmapData.copyPixels(param1,new Rectangle(_loc7_ + _loc6_,0,_loc4_ - _loc7_,param1.height),new Point(param2.tx + _loc7_,param2.ty + _loc5_),null,null,true);
                     _loc7_ = _loc4_;
                     if(param2.b > 0)
                     {
                        _loc5_++;
                     }
                     else
                     {
                        _loc5_--;
                     }
                     _loc3_ = 0;
                  }
               }
               if(_loc3_ > 0)
               {
                  _bitmapData.copyPixels(param1,new Rectangle(_loc7_,0,_loc4_ - _loc7_,param1.height),new Point(param2.tx + _loc7_,param2.ty + _loc5_),null,null,true);
               }
               return;
            }
            _bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
   }
}
