package com.sulake.habbo.room.object
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.class_1667;
   import flash.geom.Point;
   
   public class RoomPlaneParser
   {
      
      private static const FLOOR_THICKNESS:Number = 0.25;
      
      private static const WALL_THICKNESS:Number = 0.25;
      
      private static const MAX_WALL_ADDITIONAL_HEIGHT:Number = 20;
      
      public static const const_312:int = -110;
      
      public static const const_396:int = -100;
       
      
      private var var_39:Array;
      
      private var var_63:Array;
      
      private var _width:int = 0;
      
      private var var_47:int = 0;
      
      private var var_61:int = 0;
      
      private var var_60:int = 0;
      
      private var var_59:int = 0;
      
      private var var_64:int = 0;
      
      private var var_37:Array;
      
      private var var_317:Number = 0;
      
      private var var_267:Number = 1;
      
      private var var_187:Number = 1;
      
      private var var_131:int = -1;
      
      private var _floorHeight:Number = 0;
      
      private var var_65:class_24 = null;
      
      private var var_72:Array;
      
      public function RoomPlaneParser()
      {
         var_39 = [];
         var_63 = [];
         var_37 = [];
         var_72 = [];
         super();
         var_317 = 3.6;
         var_267 = 1;
         var_187 = 1;
         var_65 = new class_24();
      }
      
      private static function getFloorHeight(param1:Array) : Number
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Array = null;
         var _loc8_:int = int(param1.length);
         if(_loc8_ == 0)
         {
            return 0;
         }
         var _loc7_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            _loc2_ = param1[_loc5_] as Array;
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if((_loc6_ = Number(_loc2_[_loc4_])) > _loc7_)
               {
                  _loc7_ = _loc6_;
               }
               _loc4_++;
            }
            _loc5_++;
         }
         return _loc7_;
      }
      
      private static function findEntranceTile(param1:Array) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = null;
         var _loc6_:int;
         if((_loc6_ = int(param1.length)) == 0)
         {
            return null;
         }
         var _loc5_:* = [];
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc2_ = param1[_loc4_] as Array;
            if(_loc2_ == null || _loc2_.length == 0)
            {
               return null;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(Number(_loc2_[_loc3_]) >= 0)
               {
                  _loc5_.push(_loc3_);
                  break;
               }
               _loc3_++;
            }
            if(_loc5_.length < _loc4_ + 1)
            {
               _loc5_.push(_loc2_.length + 1);
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ < _loc5_.length - 1)
         {
            if(int(_loc5_[_loc4_]) <= int(_loc5_[_loc4_ - 1]) - 1 && int(_loc5_[_loc4_]) <= int(_loc5_[_loc4_ + 1]) - 1)
            {
               return new Point(int(_loc5_[_loc4_]),_loc4_);
            }
            _loc4_++;
         }
         return null;
      }
      
      private static function expandFloorTiles(param1:Vector.<Vector.<int>>) : Vector.<Vector.<int>>
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc17_:int = 0;
         var _loc14_:int = 0;
         var _loc9_:int = 0;
         var _loc15_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:uint = param1.length;
         var _loc16_:uint = param1[0].length;
         var _loc7_:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(_loc5_ * 4);
         _loc13_ = 0;
         while(_loc13_ < _loc5_ * 4)
         {
            _loc7_[_loc13_] = new Vector.<int>(_loc16_ * 4);
            _loc13_++;
         }
         var _loc8_:int = 0;
         _loc13_ = 0;
         while(_loc13_ < _loc5_)
         {
            _loc6_ = 0;
            _loc12_ = 0;
            while(_loc12_ < _loc16_)
            {
               if((_loc11_ = param1[_loc13_][_loc12_]) < 0 || _loc11_ <= 255)
               {
                  _loc4_ = 0;
                  while(_loc4_ < 4)
                  {
                     _loc3_ = 0;
                     while(_loc3_ < 4)
                     {
                        _loc7_[_loc8_ + _loc4_][_loc6_ + _loc3_] = _loc11_ < 0 ? _loc11_ : _loc11_ * 4;
                        _loc3_++;
                     }
                     _loc4_++;
                  }
               }
               else
               {
                  _loc14_ = (_loc17_ = (_loc11_ & 255) * 4) + (_loc11_ >> 11 & 1) * 3;
                  _loc9_ = _loc17_ + (_loc11_ >> 10 & 1) * 3;
                  _loc15_ = _loc17_ + (_loc11_ >> 9 & 1) * 3;
                  _loc10_ = _loc17_ + (_loc11_ >> 8 & 1) * 3;
                  _loc3_ = 0;
                  while(_loc3_ < 3)
                  {
                     _loc2_ = _loc3_ + 1;
                     _loc7_[_loc8_][_loc6_ + _loc3_] = (_loc14_ * (3 - _loc3_) + _loc9_ * _loc3_) / 3;
                     _loc7_[_loc8_ + 3][_loc6_ + _loc2_] = (_loc15_ * (3 - _loc2_) + _loc10_ * _loc2_) / 3;
                     _loc7_[_loc8_ + _loc2_][_loc6_] = (_loc14_ * (3 - _loc2_) + _loc15_ * _loc2_) / 3;
                     _loc7_[_loc8_ + _loc3_][_loc6_ + 3] = (_loc9_ * (3 - _loc3_) + _loc10_ * _loc3_) / 3;
                     _loc3_++;
                  }
                  _loc7_[_loc8_ + 1][_loc6_ + 1] = _loc14_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                  _loc7_[_loc8_ + 1][_loc6_ + 2] = _loc9_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                  _loc7_[_loc8_ + 2][_loc6_ + 1] = _loc15_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                  _loc7_[_loc8_ + 2][_loc6_ + 2] = _loc10_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
               }
               _loc6_ += 4;
               _loc12_++;
            }
            _loc8_ += 4;
            _loc13_++;
         }
         return _loc7_;
      }
      
      private static function addTileTypes(param1:Vector.<Vector.<int>>) : void
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc17_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc13_:* = 0;
         var _loc10_:uint = param1.length - 1;
         var _loc16_:uint = param1[0].length - 1;
         _loc15_ = 1;
         while(_loc15_ < _loc10_)
         {
            _loc14_ = 1;
            while(_loc14_ < _loc16_)
            {
               if((_loc17_ = param1[_loc15_][_loc14_]) >= 0)
               {
                  _loc4_ = param1[_loc15_ - 1][_loc14_ - 1] & 255;
                  _loc5_ = param1[_loc15_ - 1][_loc14_] & 255;
                  _loc6_ = param1[_loc15_ - 1][_loc14_ + 1] & 255;
                  _loc7_ = param1[_loc15_][_loc14_ - 1] & 255;
                  _loc8_ = param1[_loc15_][_loc14_ + 1] & 255;
                  _loc9_ = param1[_loc15_ + 1][_loc14_ - 1] & 255;
                  _loc11_ = param1[_loc15_ + 1][_loc14_] & 255;
                  _loc12_ = param1[_loc15_ + 1][_loc14_ + 1] & 255;
                  _loc3_ = _loc17_ + 1;
                  _loc2_ = _loc17_ - 1;
                  _loc13_ = (_loc4_ == _loc3_ || _loc5_ == _loc3_ || _loc7_ == _loc3_ ? 8 : 0) | (_loc6_ == _loc3_ || _loc5_ == _loc3_ || _loc8_ == _loc3_ ? 4 : 0) | (_loc9_ == _loc3_ || _loc11_ == _loc3_ || _loc7_ == _loc3_ ? 2 : 0) | (_loc12_ == _loc3_ || _loc11_ == _loc3_ || _loc8_ == _loc3_ ? 1 : 0);
                  if(((_loc4_ == _loc3_ || _loc5_ == _loc3_ || _loc7_ == _loc3_ ? 8 : 0) | (_loc6_ == _loc3_ || _loc5_ == _loc3_ || _loc8_ == _loc3_ ? 4 : 0) | (_loc9_ == _loc3_ || _loc11_ == _loc3_ || _loc7_ == _loc3_ ? 2 : 0) | (_loc12_ == _loc3_ || _loc11_ == _loc3_ || _loc8_ == _loc3_ ? 1 : 0)) == 15)
                  {
                     _loc13_ = 0;
                  }
                  param1[_loc15_][_loc14_] = _loc17_ | _loc13_ << 8;
               }
               _loc14_++;
            }
            _loc15_++;
         }
      }
      
      private static function unpadHeightMap(param1:Vector.<Vector.<int>>) : void
      {
         param1.shift();
         param1.pop();
         for each(var _loc2_ in param1)
         {
            _loc2_.shift();
            _loc2_.pop();
         }
      }
      
      private static function padHeightMap(param1:Vector.<Vector.<int>>) : void
      {
         var _loc2_:Vector.<int> = new Vector.<int>(0);
         var _loc3_:Vector.<int> = new Vector.<int>(0);
         for each(var _loc5_ in param1)
         {
            _loc5_.push(-110);
            _loc5_.unshift(-110);
         }
         for each(var _loc4_ in param1[0])
         {
            _loc2_.push(-110);
            _loc3_.push(-110);
         }
         param1.push(_loc3_);
         param1.unshift(_loc2_);
      }
      
      public function get minX() : int
      {
         return var_61;
      }
      
      public function get maxX() : int
      {
         return var_60;
      }
      
      public function get minY() : int
      {
         return var_59;
      }
      
      public function get maxY() : int
      {
         return var_64;
      }
      
      public function get tileMapWidth() : int
      {
         return _width;
      }
      
      public function get tileMapHeight() : int
      {
         return var_47;
      }
      
      public function get planeCount() : int
      {
         return var_37.length;
      }
      
      public function get floorHeight() : Number
      {
         if(var_131 != -1)
         {
            return var_131;
         }
         return _floorHeight;
      }
      
      public function get wallHeight() : Number
      {
         if(var_131 != -1)
         {
            return var_131 + 3.6;
         }
         return var_317;
      }
      
      public function set wallHeight(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         var_317 = param1;
      }
      
      public function get wallThicknessMultiplier() : Number
      {
         return var_267;
      }
      
      public function set wallThicknessMultiplier(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         var_267 = param1;
      }
      
      public function get floorThicknessMultiplier() : Number
      {
         return var_187;
      }
      
      public function set floorThicknessMultiplier(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         var_187 = param1;
      }
      
      public function dispose() : void
      {
         var_37 = null;
         var_39 = null;
         var_63 = null;
         var_72 = null;
         if(var_65 != null)
         {
            var_65.dispose();
            var_65 = null;
         }
      }
      
      public function reset() : void
      {
         var_37 = [];
         var_39 = [];
         var_63 = [];
         var_39 = [];
         var_63 = [];
         _width = 0;
         var_47 = 0;
         var_61 = 0;
         var_60 = 0;
         var_59 = 0;
         var_64 = 0;
         _floorHeight = 0;
         var_72 = [];
      }
      
      public function initializeTileMap(param1:int, param2:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         var_39 = [];
         var_63 = [];
         var_72 = [];
         _loc4_ = 0;
         while(_loc4_ < param2)
         {
            _loc7_ = [];
            _loc3_ = [];
            _loc5_ = [];
            _loc6_ = 0;
            while(_loc6_ < param1)
            {
               _loc7_[_loc6_] = -110;
               _loc3_[_loc6_] = -110;
               _loc5_[_loc6_] = false;
               _loc6_++;
            }
            var_39.push(_loc7_);
            var_63.push(_loc3_);
            var_72.push(_loc5_);
            _loc4_++;
         }
         _width = param1;
         var_47 = param2;
         var_61 = _width;
         var_60 = -1;
         var_59 = var_47;
         var_64 = -1;
         return true;
      }
      
      public function setTileHeight(param1:int, param2:int, param3:Number) : Boolean
      {
         var _loc8_:Array = null;
         var _loc5_:Boolean = false;
         var _loc7_:int = 0;
         var _loc4_:Boolean = false;
         var _loc6_:int = 0;
         if(param1 >= 0 && param1 < _width && param2 >= 0 && param2 < var_47)
         {
            (_loc8_ = var_39[param2] as Array)[param1] = param3;
            if(param3 >= 0)
            {
               if(param1 < var_61)
               {
                  var_61 = param1;
               }
               if(param1 > var_60)
               {
                  var_60 = param1;
               }
               if(param2 < var_59)
               {
                  var_59 = param2;
               }
               if(param2 > var_64)
               {
                  var_64 = param2;
               }
            }
            else
            {
               if(param1 == var_61 || param1 == var_60)
               {
                  _loc5_ = false;
                  _loc7_ = var_59;
                  while(_loc7_ < var_64)
                  {
                     if(getTileHeightInternal(param1,_loc7_) >= 0)
                     {
                        _loc5_ = true;
                        break;
                     }
                     _loc7_++;
                  }
                  if(!_loc5_)
                  {
                     if(param1 == var_61)
                     {
                        var_61++;
                     }
                     if(param1 == var_60)
                     {
                        var_60--;
                     }
                  }
               }
               if(param2 == var_59 || param2 == var_64)
               {
                  _loc4_ = false;
                  _loc6_ = var_61;
                  while(_loc6_ < var_60)
                  {
                     if(getTileHeight(_loc6_,param2) >= 0)
                     {
                        _loc4_ = true;
                        break;
                     }
                     _loc6_++;
                  }
                  if(!_loc4_)
                  {
                     if(param2 == var_59)
                     {
                        var_59++;
                     }
                     if(param2 == var_64)
                     {
                        var_64--;
                     }
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return -110;
         }
         var _loc3_:Array = var_39[param2] as Array;
         return Math.abs(_loc3_[param1] as Number);
      }
      
      private function getTileHeightOriginal(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return -110;
         }
         if(var_72[param2][param1])
         {
            return -100;
         }
         var _loc3_:Array = var_63[param2] as Array;
         return _loc3_[param1] as Number;
      }
      
      private function getTileHeightInternal(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return -110;
         }
         var _loc3_:Array = var_39[param2] as Array;
         return _loc3_[param1] as Number;
      }
      
      public function initializeFromTileData(param1:int = -1) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var_131 = param1;
         _loc3_ = 0;
         while(_loc3_ < var_47)
         {
            _loc2_ = 0;
            while(_loc2_ < _width)
            {
               var_63[_loc3_][_loc2_] = var_39[_loc3_][_loc2_];
               _loc2_++;
            }
            _loc3_++;
         }
         var _loc4_:Point = findEntranceTile(var_39);
         _loc3_ = 0;
         while(_loc3_ < var_47)
         {
            _loc2_ = 0;
            while(_loc2_ < _width)
            {
               if(var_72[_loc3_][_loc2_])
               {
                  setTileHeight(_loc2_,_loc3_,-100);
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return initialize(_loc4_);
      }
      
      private function initialize(param1:Point) : Boolean
      {
         var _loc5_:int = 0;
         if(param1 != null)
         {
            _loc5_ = getTileHeight(param1.x,param1.y);
            setTileHeight(param1.x,param1.y,-110);
         }
         _floorHeight = getFloorHeight(var_39);
         createWallPlanes();
         var _loc3_:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(0);
         for each(var _loc4_ in var_39)
         {
            _loc3_.push(Vector.<int>(_loc4_));
         }
         padHeightMap(_loc3_);
         addTileTypes(_loc3_);
         unpadHeightMap(_loc3_);
         var _loc2_:Vector.<Vector.<int>> = expandFloorTiles(_loc3_);
         extractPlanes(_loc2_);
         if(param1 != null)
         {
            setTileHeight(param1.x,param1.y,_loc5_);
            addFloor(new Vector3d(param1.x + 0.5,param1.y + 0.5,_loc5_),new Vector3d(-1,0,0),new Vector3d(0,-1,0),false,false,false,false);
         }
         return true;
      }
      
      private function generateWallData(param1:Point, param2:Boolean) : RoomWallData
      {
         var _loc3_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc12_:* = 0;
         var _loc11_:Point = null;
         var _loc8_:int = 0;
         var _loc4_:RoomWallData = new RoomWallData();
         var _loc5_:Array = [extractTopWall,extractRightWall,extractBottomWall,extractLeftWall];
         var _loc6_:int = 0;
         var _loc10_:* = new Point(param1.x,param1.y);
         var _loc7_:int = 0;
         while(_loc7_++ < 1000)
         {
            _loc3_ = false;
            _loc9_ = false;
            _loc12_ = _loc6_;
            if(_loc10_.x < minX || _loc10_.x > maxX || _loc10_.y < minY || _loc10_.y > maxY)
            {
               _loc3_ = true;
            }
            if((_loc11_ = _loc5_[_loc6_](_loc10_,param2)) == null)
            {
               return null;
            }
            _loc8_ = Math.abs(_loc11_.x - _loc10_.x) + Math.abs(_loc11_.y - _loc10_.y);
            if(_loc10_.x == _loc11_.x || _loc10_.y == _loc11_.y)
            {
               _loc6_ = (_loc6_ - 1 + _loc5_.length) % _loc5_.length;
               _loc8_ += 1;
               _loc9_ = true;
            }
            else
            {
               _loc6_ = (_loc6_ + 1) % _loc5_.length;
               _loc8_ -= 1;
            }
            _loc4_.addWall(_loc10_,_loc12_,_loc8_,_loc3_,_loc9_);
            if(_loc11_.x == param1.x && _loc11_.y == param1.y && (_loc11_.x != _loc10_.x || _loc11_.y != _loc10_.y))
            {
               break;
            }
            _loc10_ = _loc11_;
         }
         if(_loc4_.count == 0)
         {
            return null;
         }
         return _loc4_;
      }
      
      private function hidePeninsulaWallChains(param1:RoomWallData) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc8_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:* = 0;
         var _loc5_:int = 0;
         var _loc4_:int = param1.count;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc5_;
            _loc3_ = _loc5_;
            _loc8_ = 0;
            _loc6_ = false;
            while(!param1.getBorder(_loc5_) && _loc5_ < _loc4_)
            {
               if(param1.getLeftTurn(_loc5_))
               {
                  _loc8_++;
               }
               else if(_loc8_ > 0)
               {
                  _loc8_--;
               }
               if(_loc8_ > 1)
               {
                  _loc6_ = true;
               }
               _loc3_ = _loc5_;
               _loc5_++;
            }
            if(_loc6_)
            {
               _loc7_ = _loc2_;
               while(_loc7_ <= _loc3_)
               {
                  param1.setHideWall(_loc7_,true);
                  _loc7_++;
               }
            }
            _loc5_++;
         }
      }
      
      private function updateWallsNextToHoles(param1:RoomWallData) : void
      {
         var _loc8_:int = 0;
         var _loc4_:Point = null;
         var _loc10_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:IVector3d = null;
         var _loc3_:IVector3d = null;
         var _loc2_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:int = param1.count;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            if(!param1.getHideWall(_loc8_))
            {
               _loc4_ = param1.getCorner(_loc8_);
               _loc10_ = param1.getDirection(_loc8_);
               _loc7_ = param1.getLength(_loc8_);
               _loc5_ = RoomWallData.WALL_DIRECTION_VECTORS[_loc10_];
               _loc3_ = RoomWallData.WALL_NORMAL_VECTORS[_loc10_];
               _loc2_ = 0;
               _loc9_ = 0;
               while(_loc9_ < _loc7_)
               {
                  if(getTileHeightInternal(_loc4_.x + _loc9_ * _loc5_.x - _loc3_.x,_loc4_.y + _loc9_ * _loc5_.y - _loc3_.y) == -100)
                  {
                     if(_loc9_ > 0 && _loc2_ == 0)
                     {
                        param1.setLength(_loc8_,_loc9_);
                        break;
                     }
                     _loc2_++;
                  }
                  else if(_loc2_ > 0)
                  {
                     param1.moveCorner(_loc8_,_loc2_);
                     break;
                  }
                  _loc9_++;
               }
               if(_loc2_ == _loc7_)
               {
                  param1.setHideWall(_loc8_,true);
               }
            }
            _loc8_++;
         }
      }
      
      private function resolveOriginalWallIndex(param1:Point, param2:Point, param3:RoomWallData) : int
      {
         var _loc7_:int = 0;
         var _loc14_:Point = null;
         var _loc10_:Point = null;
         var _loc11_:int = 0;
         var _loc8_:int = 0;
         var _loc15_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:int = Math.min(param1.y,param2.y);
         var _loc4_:int = Math.max(param1.y,param2.y);
         var _loc13_:int = Math.min(param1.x,param2.x);
         var _loc5_:int = Math.max(param1.x,param2.x);
         var _loc6_:int = param3.count;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc14_ = param3.getCorner(_loc7_);
            _loc10_ = param3.getEndPoint(_loc7_);
            if(param1.x == param2.x)
            {
               if(_loc14_.x == param1.x && _loc10_.x == param1.x)
               {
                  _loc11_ = Math.min(_loc14_.y,_loc10_.y);
                  _loc8_ = Math.max(_loc14_.y,_loc10_.y);
                  if(_loc11_ <= _loc12_ && _loc4_ <= _loc8_)
                  {
                     return _loc7_;
                  }
               }
            }
            else if(param1.y == param2.y)
            {
               if(_loc14_.y == param1.y && _loc10_.y == param1.y)
               {
                  _loc15_ = Math.min(_loc14_.x,_loc10_.x);
                  _loc9_ = Math.max(_loc14_.x,_loc10_.x);
                  if(_loc15_ <= _loc13_ && _loc5_ <= _loc9_)
                  {
                     return _loc7_;
                  }
               }
            }
            _loc7_++;
         }
         return -1;
      }
      
      private function hideOriginallyHiddenWalls(param1:RoomWallData, param2:RoomWallData) : void
      {
         var _loc8_:int = 0;
         var _loc6_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:IVector3d = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:int = param1.count;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            if(!param1.getHideWall(_loc8_))
            {
               _loc6_ = param1.getCorner(_loc8_);
               _loc3_ = new Point(_loc6_.x,_loc6_.y);
               _loc4_ = RoomWallData.WALL_DIRECTION_VECTORS[param1.getDirection(_loc8_)];
               _loc7_ = param1.getLength(_loc8_);
               _loc3_.x += _loc4_.x * _loc7_;
               _loc3_.y += _loc4_.y * _loc7_;
               if((_loc9_ = resolveOriginalWallIndex(_loc6_,_loc3_,param2)) >= 0)
               {
                  if(param2.getHideWall(_loc9_))
                  {
                     param1.setHideWall(_loc8_,true);
                  }
               }
               else
               {
                  param1.setHideWall(_loc8_,true);
               }
            }
            _loc8_++;
         }
      }
      
      private function checkWallHiding(param1:RoomWallData, param2:RoomWallData) : void
      {
         hidePeninsulaWallChains(param2);
         updateWallsNextToHoles(param1);
         hideOriginallyHiddenWalls(param1,param2);
      }
      
      private function addWalls(param1:RoomWallData, param2:RoomWallData) : void
      {
         var _loc25_:int = 0;
         var _loc14_:int = 0;
         var _loc17_:int = 0;
         var _loc10_:Point = null;
         var _loc13_:int = 0;
         var _loc16_:int = 0;
         var _loc11_:IVector3d = null;
         var _loc6_:IVector3d = null;
         var _loc20_:* = NaN;
         var _loc18_:int = 0;
         var _loc27_:Number = NaN;
         var _loc24_:* = NaN;
         var _loc3_:Vector3d = null;
         var _loc4_:Number = NaN;
         var _loc9_:Vector3d = null;
         var _loc19_:Vector3d = null;
         var _loc12_:int = 0;
         var _loc8_:Vector3d = null;
         var _loc21_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc26_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc22_:Boolean = false;
         var _loc15_:int = param1.count;
         var _loc23_:int = param2.count;
         _loc17_ = 0;
         while(_loc17_ < _loc15_)
         {
            if(!param1.getHideWall(_loc17_))
            {
               _loc10_ = param1.getCorner(_loc17_);
               _loc13_ = param1.getDirection(_loc17_);
               _loc16_ = param1.getLength(_loc17_);
               _loc11_ = RoomWallData.WALL_DIRECTION_VECTORS[_loc13_];
               _loc6_ = RoomWallData.WALL_NORMAL_VECTORS[_loc13_];
               _loc20_ = -1;
               _loc18_ = 0;
               while(_loc18_ < _loc16_)
               {
                  if((_loc27_ = getTileHeightInternal(_loc10_.x + _loc18_ * _loc11_.x + _loc6_.x,_loc10_.y + _loc18_ * _loc11_.y + _loc6_.y)) >= 0 && (_loc27_ < _loc20_ || _loc20_ < 0))
                  {
                     _loc20_ = _loc27_;
                  }
                  _loc18_++;
               }
               _loc24_ = _loc20_;
               _loc3_ = new Vector3d(_loc10_.x,_loc10_.y,_loc24_);
               _loc3_ = Vector3d.sum(_loc3_,Vector3d.product(_loc6_,0.5));
               _loc3_ = Vector3d.sum(_loc3_,Vector3d.product(_loc11_,-0.5));
               _loc4_ = wallHeight + Math.min(20,floorHeight) - _loc20_;
               _loc9_ = Vector3d.product(_loc11_,-_loc16_);
               _loc19_ = new Vector3d(0,0,_loc4_);
               _loc3_ = Vector3d.dif(_loc3_,_loc9_);
               if((_loc12_ = resolveOriginalWallIndex(_loc10_,param1.getEndPoint(_loc17_),param2)) >= 0)
               {
                  _loc25_ = param2.getDirection((_loc12_ + 1) % _loc23_);
                  _loc14_ = param2.getDirection((_loc12_ - 1 + _loc23_) % _loc23_);
               }
               else
               {
                  _loc25_ = param1.getDirection((_loc17_ + 1) % _loc15_);
                  _loc14_ = param1.getDirection((_loc17_ - 1 + _loc15_) % _loc15_);
               }
               _loc8_ = null;
               if((_loc25_ - _loc13_ + 4) % 4 == 3)
               {
                  _loc8_ = RoomWallData.WALL_NORMAL_VECTORS[_loc25_];
               }
               else if((_loc13_ - _loc14_ + 4) % 4 == 3)
               {
                  _loc8_ = RoomWallData.WALL_NORMAL_VECTORS[_loc14_];
               }
               _loc21_ = param1.getLeftTurn(_loc17_);
               _loc7_ = param1.getLeftTurn((_loc17_ - 1 + _loc15_) % _loc15_);
               _loc26_ = param1.getHideWall((_loc17_ + 1) % _loc15_);
               _loc5_ = param1.getManuallyLeftCut(_loc17_);
               _loc22_ = param1.getManuallyRightCut(_loc17_);
               addWall(_loc3_,_loc9_,_loc19_,_loc8_,!_loc7_ || _loc5_,!_loc21_ || _loc22_,!_loc26_);
            }
            _loc17_++;
         }
      }
      
      private function createWallPlanes() : Boolean
      {
         var _loc3_:int = 0;
         var _loc11_:int = 0;
         var _loc6_:Array;
         if((_loc6_ = var_39) == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:Array = null;
         var _loc14_:int = int(_loc6_.length);
         var _loc8_:int = 0;
         if(_loc14_ == 0)
         {
            return false;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc14_)
         {
            _loc1_ = _loc6_[_loc4_] as Array;
            if(_loc1_ == null || _loc1_.length == 0)
            {
               return false;
            }
            if(_loc8_ > 0)
            {
               _loc8_ = Math.min(_loc8_,_loc1_.length);
            }
            else
            {
               _loc8_ = int(_loc1_.length);
            }
            _loc4_++;
         }
         var _loc13_:Number = Math.min(20,var_131 != -1 ? var_131 : getFloorHeight(_loc6_));
         var _loc9_:int = minX;
         var _loc10_:int = minY;
         _loc10_ = minY;
         while(_loc10_ <= maxY)
         {
            if(getTileHeightInternal(_loc9_,_loc10_) > -100)
            {
               _loc10_--;
               break;
            }
            _loc10_++;
         }
         if(_loc10_ > maxY)
         {
            return false;
         }
         var _loc2_:Point = new Point(_loc9_,_loc10_);
         var _loc7_:RoomWallData = generateWallData(_loc2_,true);
         var _loc12_:RoomWallData = generateWallData(_loc2_,false);
         if(_loc7_ != null)
         {
            _loc3_ = _loc7_.count;
            _loc11_ = _loc12_.count;
            checkWallHiding(_loc7_,_loc12_);
            addWalls(_loc7_,_loc12_);
         }
         _loc5_ = 0;
         while(_loc5_ < tileMapHeight)
         {
            _loc4_ = 0;
            while(_loc4_ < tileMapWidth)
            {
               if(getTileHeightInternal(_loc4_,_loc5_) < 0)
               {
                  setTileHeight(_loc4_,_loc5_,-(_loc13_ + wallHeight));
               }
               _loc4_++;
            }
            _loc5_++;
         }
         return true;
      }
      
      private function extractTopWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = -100;
         if(!param2)
         {
            _loc4_ = -110;
         }
         while(_loc3_ < 1000)
         {
            if(getTileHeightInternal(param1.x + _loc3_,param1.y) > _loc4_)
            {
               return new Point(param1.x + _loc3_ - 1,param1.y);
            }
            if(getTileHeightInternal(param1.x + _loc3_,param1.y + 1) <= _loc4_)
            {
               return new Point(param1.x + _loc3_,param1.y + 1);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function extractRightWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = -100;
         if(!param2)
         {
            _loc4_ = -110;
         }
         while(_loc3_ < 1000)
         {
            if(getTileHeightInternal(param1.x,param1.y + _loc3_) > _loc4_)
            {
               return new Point(param1.x,param1.y + (_loc3_ - 1));
            }
            if(getTileHeightInternal(param1.x - 1,param1.y + _loc3_) <= _loc4_)
            {
               return new Point(param1.x - 1,param1.y + _loc3_);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function extractBottomWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = -100;
         if(!param2)
         {
            _loc4_ = -110;
         }
         while(_loc3_ < 1000)
         {
            if(getTileHeightInternal(param1.x - _loc3_,param1.y) > _loc4_)
            {
               return new Point(param1.x - (_loc3_ - 1),param1.y);
            }
            if(getTileHeightInternal(param1.x - _loc3_,param1.y - 1) <= _loc4_)
            {
               return new Point(param1.x - _loc3_,param1.y - 1);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function extractLeftWall(param1:Point, param2:Boolean) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = 1;
         var _loc4_:int = -100;
         if(!param2)
         {
            _loc4_ = -110;
         }
         while(_loc3_ < 1000)
         {
            if(getTileHeightInternal(param1.x,param1.y - _loc3_) > _loc4_)
            {
               return new Point(param1.x,param1.y - (_loc3_ - 1));
            }
            if(getTileHeightInternal(param1.x + 1,param1.y - _loc3_) <= _loc4_)
            {
               return new Point(param1.x + 1,param1.y - _loc3_);
            }
            _loc3_++;
         }
         return null;
      }
      
      private function addWall(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Boolean, param6:Boolean, param7:Boolean) : void
      {
         var _loc12_:Vector3d = null;
         addPlane(2,param1,param2,param3,[param4]);
         addPlane(3,param1,param2,param3,[param4]);
         var _loc10_:Number = 0.25 * var_267;
         var _loc8_:Number = 0.25 * var_187;
         var _loc11_:Vector3d = Vector3d.crossProduct(param2,param3);
         var _loc9_:Vector3d = Vector3d.product(_loc11_,1 / _loc11_.length * -_loc10_);
         addPlane(2,Vector3d.sum(param1,param3),param2,_loc9_,[_loc11_,param4]);
         if(param5)
         {
            addPlane(2,Vector3d.sum(Vector3d.sum(param1,param2),param3),Vector3d.product(param3,-(param3.length + _loc8_) / param3.length),_loc9_,[_loc11_,param4]);
         }
         if(param6)
         {
            addPlane(2,Vector3d.sum(param1,Vector3d.product(param3,-_loc8_ / param3.length)),Vector3d.product(param3,(param3.length + _loc8_) / param3.length),_loc9_,[_loc11_,param4]);
            if(param7)
            {
               _loc12_ = Vector3d.product(param2,_loc10_ / param2.length);
               addPlane(2,Vector3d.sum(Vector3d.sum(param1,param3),Vector3d.product(_loc12_,-1)),_loc12_,_loc9_,[_loc11_,param2,param4]);
            }
         }
      }
      
      private function addFloor(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : void
      {
         var _loc10_:Number = NaN;
         var _loc9_:Vector3d = null;
         var _loc8_:Vector3d = null;
         var _loc11_:RoomPlaneData;
         if((_loc11_ = addPlane(1,param1,param2,param3)) != null)
         {
            _loc10_ = 0.25 * var_187;
            _loc9_ = new Vector3d(0,0,_loc10_);
            _loc8_ = Vector3d.dif(param1,_loc9_);
            if(param6)
            {
               addPlane(1,_loc8_,param2,_loc9_);
            }
            if(param7)
            {
               addPlane(1,Vector3d.sum(_loc8_,Vector3d.sum(param2,param3)),Vector3d.product(param2,-1),_loc9_);
            }
            if(param4)
            {
               addPlane(1,Vector3d.sum(_loc8_,param3),Vector3d.product(param3,-1),_loc9_);
            }
            if(param5)
            {
               addPlane(1,Vector3d.sum(_loc8_,param2),param3,_loc9_);
            }
         }
      }
      
      public function initializeFromXML(param1:XML) : Boolean
      {
         var _loc4_:int = 0;
         var _loc13_:XML = null;
         var _loc12_:XMLList = null;
         var _loc3_:int = 0;
         var _loc10_:XML = null;
         var _loc16_:Number = NaN;
         var _loc6_:XML = null;
         var _loc8_:XMLList = null;
         var _loc5_:int = 0;
         var _loc7_:XML = null;
         if(param1 == null)
         {
            return false;
         }
         reset();
         resetFloorHoles();
         if(!class_1667.checkRequiredAttributes(param1.tileMap[0],["width","height","wallHeight"]))
         {
            return false;
         }
         var _loc9_:int = parseInt(param1.tileMap.@width);
         var _loc15_:int = parseInt(param1.tileMap.@height);
         var _loc14_:Number = parseFloat(param1.tileMap.@wallHeight);
         var _loc2_:int = parseInt(param1.tileMap.@fixedWallsHeight);
         initializeTileMap(_loc9_,_loc15_);
         var _loc11_:XMLList = param1.tileMap.tileRow;
         _loc4_ = 0;
         while(_loc4_ < _loc11_.length())
         {
            _loc12_ = (_loc13_ = _loc11_[_loc4_]).tile;
            _loc3_ = 0;
            while(_loc3_ < _loc12_.length())
            {
               _loc10_ = _loc12_[_loc3_];
               _loc16_ = parseFloat(_loc10_.@height);
               setTileHeight(_loc3_,_loc4_,_loc16_);
               _loc3_++;
            }
            _loc4_++;
         }
         if(param1.holeMap.length() > 0)
         {
            _loc8_ = (_loc6_ = param1.holeMap[0]).hole;
            _loc5_ = 0;
            while(_loc5_ < _loc8_.length())
            {
               _loc7_ = _loc8_[_loc5_];
               if(class_1667.checkRequiredAttributes(_loc7_,["id","x","y","width","height"]))
               {
                  addFloorHole(_loc7_.@id,_loc7_.@x,_loc7_.@y,_loc7_.@width,_loc7_.@height);
               }
               _loc5_++;
            }
            initializeHoleMap();
         }
         this.wallHeight = _loc14_;
         initializeFromTileData(_loc2_);
         return true;
      }
      
      private function addPlane(param1:int, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Array = null) : RoomPlaneData
      {
         if(param3.length == 0 || param4.length == 0)
         {
            return null;
         }
         var _loc6_:RoomPlaneData = new RoomPlaneData(param1,param2,param3,param4,param5);
         var_37.push(_loc6_);
         return _loc6_;
      }
      
      public function getXML() : XML
      {
         var _loc5_:int = 0;
         var _loc1_:XML = null;
         var _loc12_:Array = null;
         var _loc3_:int = 0;
         var _loc14_:Number = NaN;
         var _loc4_:XML = null;
         var _loc7_:int = 0;
         var _loc8_:RoomFloorHole = null;
         var _loc13_:int = 0;
         var _loc2_:XML = null;
         var _loc9_:XML = <tileMap width={_width} height={var_47} wallHeight={var_317} fixedWallsHeight={var_131}/>
			;
         _loc5_ = 0;
         while(_loc5_ < var_47)
         {
            _loc1_ = <tileRow/>
				;
            _loc12_ = var_63[_loc5_];
            _loc3_ = 0;
            while(_loc3_ < _width)
            {
               _loc14_ = Number(_loc12_[_loc3_]);
               _loc4_ = <tile height={_loc14_}/>
					;
               _loc1_.appendChild(_loc4_);
               _loc3_++;
            }
            _loc9_.appendChild(_loc1_);
            _loc5_++;
         }
         var _loc11_:XML = <holeMap/>
			;
         _loc7_ = 0;
         while(_loc7_ < var_65.length)
         {
            if((_loc8_ = var_65.getWithIndex(_loc7_)) != null)
            {
               _loc13_ = var_65.getKey(_loc7_);
               _loc2_ = <hole id={_loc13_} x={_loc8_.x} y={_loc8_.y} width={_loc8_.width} height={_loc8_.height}/>
					;
               _loc11_.appendChild(_loc2_);
            }
            _loc7_++;
         }
         var _loc10_:XML;
         (_loc10_ = <roomData/>
			).appendChild(_loc9_);
         _loc10_.appendChild(_loc11_);
         var _loc6_:XML = <dimensions minX={minX} maxX={maxX} minY={minY} maxY={maxY} />
			;
         _loc10_.appendChild(_loc6_);
         return _loc10_;
      }
      
      public function getPlaneLocation(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.loc;
         }
         return null;
      }
      
      public function getPlaneNormal(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.normal;
         }
         return null;
      }
      
      public function getPlaneLeftSide(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.leftSide;
         }
         return null;
      }
      
      public function getPlaneRightSide(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.rightSide;
         }
         return null;
      }
      
      public function getPlaneNormalDirection(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.normalDirection;
         }
         return null;
      }
      
      public function getPlaneSecondaryNormals(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 < 0 || param1 >= planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _loc2_.secondaryNormalCount)
            {
               _loc3_.push(_loc2_.getSecondaryNormal(_loc4_));
               _loc4_++;
            }
            return _loc3_;
         }
         return null;
      }
      
      public function getPlaneType(param1:int) : int
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return 0;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.type;
         }
         return 0;
      }
      
      public function getPlaneMaskCount(param1:int) : int
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return 0;
         }
         var _loc2_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.maskCount;
         }
         return 0;
      }
      
      public function getPlaneMaskLeftSideLoc(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskLeftSideLoc(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskRightSideLoc(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskRightSideLoc(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskLeftSideLength(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskLeftSideLength(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskRightSideLength(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = var_37[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskRightSideLength(param2);
         }
         return -1;
      }
      
      public function addFloorHole(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         removeFloorHole(param1);
         var _loc6_:RoomFloorHole = new RoomFloorHole(param2,param3,param4,param5);
         var_65.add(param1,_loc6_);
      }
      
      public function removeFloorHole(param1:int) : void
      {
         var_65.remove(param1);
      }
      
      public function resetFloorHoles() : void
      {
         var_65.reset();
      }
      
      private function initializeHoleMap() : void
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc8_:Array = null;
         var _loc7_:int = 0;
         var _loc1_:RoomFloorHole = null;
         var _loc3_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < var_47)
         {
            _loc8_ = var_72[_loc6_];
            _loc5_ = 0;
            while(_loc5_ < _width)
            {
               _loc8_[_loc5_] = false;
               _loc5_++;
            }
            _loc6_++;
         }
         _loc7_ = 0;
         while(_loc7_ < var_65.length)
         {
            _loc1_ = var_65.getWithIndex(_loc7_);
            if(_loc1_ != null)
            {
               _loc3_ = _loc1_.x;
               _loc9_ = _loc1_.x + _loc1_.width - 1;
               _loc2_ = _loc1_.y;
               _loc4_ = _loc1_.y + _loc1_.height - 1;
               _loc3_ = int(_loc3_ < 0 ? 0 : _loc3_);
               _loc9_ = int(_loc9_ >= _width ? _width - 1 : _loc9_);
               _loc2_ = int(_loc2_ < 0 ? 0 : _loc2_);
               _loc4_ = int(_loc4_ >= var_47 ? var_47 - 1 : _loc4_);
               _loc6_ = _loc2_;
               while(_loc6_ <= _loc4_)
               {
                  _loc8_ = var_72[_loc6_];
                  _loc5_ = _loc3_;
                  while(_loc5_ <= _loc9_)
                  {
                     _loc8_[_loc5_] = true;
                     _loc5_++;
                  }
                  _loc6_++;
               }
            }
            _loc7_++;
         }
      }
      
      private function extractPlanes(param1:Vector.<Vector.<int>>) : void
      {
         var _loc3_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc6_:int = 0;
         var _loc12_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc20_:* = false;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc13_:Boolean = false;
         var _loc7_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc5_:uint = param1.length;
         var _loc19_:uint = param1[0].length;
         var _loc2_:Vector.<Vector.<Boolean>> = new Vector.<Vector.<Boolean>>(_loc5_);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_[_loc3_] = new Vector.<Boolean>(_loc19_);
            _loc3_++;
         }
         _loc17_ = 0;
         while(_loc17_ < _loc5_)
         {
            _loc18_ = 0;
            while(_loc18_ < _loc19_)
            {
               if(!((_loc6_ = param1[_loc17_][_loc18_]) < 0 || _loc2_[_loc17_][_loc18_]))
               {
                  _loc9_ = _loc18_ == 0 || param1[_loc17_][_loc18_ - 1] != _loc6_;
                  _loc4_ = _loc17_ == 0 || param1[_loc17_ - 1][_loc18_] != _loc6_;
                  _loc12_ = _loc18_ + 1;
                  while(_loc12_ < _loc19_)
                  {
                     if(param1[_loc17_][_loc12_] != _loc6_ || _loc2_[_loc17_][_loc12_] || _loc17_ > 0 && param1[_loc17_ - 1][_loc12_] == _loc6_ == _loc4_)
                     {
                        break;
                     }
                     _loc12_++;
                  }
                  _loc14_ = _loc12_ == _loc19_ || param1[_loc17_][_loc12_] != _loc6_;
                  _loc13_ = false;
                  _loc8_ = _loc17_ + 1;
                  while(_loc8_ < _loc5_ && !_loc13_)
                  {
                     _loc20_ = param1[_loc8_][_loc18_] != _loc6_;
                     _loc13_ = param1[_loc8_][_loc18_] != _loc6_ || _loc18_ > 0 && param1[_loc8_][_loc18_ - 1] == _loc6_ == _loc9_ || _loc12_ < _loc19_ && param1[_loc8_][_loc12_] == _loc6_ == _loc14_;
                     _loc15_ = _loc18_;
                     while(_loc15_ < _loc12_)
                     {
                        if(param1[_loc8_][_loc15_] == _loc6_ == _loc20_)
                        {
                           _loc13_ = true;
                           _loc12_ = _loc15_;
                           break;
                        }
                        _loc15_++;
                     }
                     if(_loc13_)
                     {
                        break;
                     }
                     _loc8_++;
                  }
                  if(!_loc20_)
                  {
                     _loc20_ = _loc8_ == _loc5_;
                  }
                  _loc14_ = _loc12_ == _loc19_ || param1[_loc17_][_loc12_] != _loc6_;
                  _loc16_ = _loc17_;
                  while(_loc16_ < _loc8_)
                  {
                     _loc15_ = _loc18_;
                     while(_loc15_ < _loc12_)
                     {
                        _loc2_[_loc16_][_loc15_] = true;
                        _loc15_++;
                     }
                     _loc16_++;
                  }
                  _loc7_ = _loc18_ / 4 - 0.5;
                  _loc10_ = _loc17_ / 4 - 0.5;
                  _loc11_ = (_loc12_ - _loc18_) / 4;
                  _loc21_ = (_loc8_ - _loc17_) / 4;
                  addFloor(new Vector3d(_loc7_ + _loc11_,_loc10_ + _loc21_,_loc6_ / 4),new Vector3d(-_loc11_,0,0),new Vector3d(0,-_loc21_,0),_loc14_,_loc9_,_loc20_,_loc4_);
               }
               _loc18_++;
            }
            _loc17_++;
         }
      }
   }
}
