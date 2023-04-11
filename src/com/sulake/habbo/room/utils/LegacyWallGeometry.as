package com.sulake.habbo.room.utils
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;

   public class LegacyWallGeometry implements class_13
   {
      
      private static const const_669:String = "l";
      
      private static const DIRECTION_RIGHT:String = "r";
       
      
      private var var_311:Boolean = false;
      
      private var var_757:int = 64;
      
      private var var_132:Array;
      
      private var _width:int = 0;
      
      private var var_47:int = 0;
      
      private var _floorHeight:int = 0;
      
      public function LegacyWallGeometry()
      {
         var_132 = [];
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get scale() : int
      {
         return var_757;
      }
      
      public function set scale(param1:int) : void
      {
         var_757 = param1;
      }
      
      public function dispose() : void
      {
         reset();
         var_311 = true;
      }
      
      public function initialize(param1:int, param2:int, param3:int) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(param1 <= _width && param2 <= var_47)
         {
            _width = param1;
            var_47 = param2;
            _floorHeight = param3;
            return;
         }
         reset();
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            _loc4_ = [];
            var_132.push(_loc4_);
            _loc5_ = 0;
            while(_loc5_ < param1)
            {
               _loc4_.push(0);
               _loc5_++;
            }
            _loc6_++;
         }
         _width = param1;
         var_47 = param2;
         _floorHeight = param3;
      }
      
      private function reset() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = null;
         if(var_132 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_132.length)
            {
               _loc1_ = var_132[_loc2_] as Array;
               _loc2_++;
            }
            var_132 = [];
         }
      }
      
      public function setTileHeight(param1:int, param2:int, param3:Number) : Boolean
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return false;
         }
         var _loc4_:Array;
         if((_loc4_ = var_132[param2] as Array) != null)
         {
            _loc4_[param1] = param3;
            return true;
         }
         return false;
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return 0;
         }
         var _loc3_:Array = var_132[param2] as Array;
         if(_loc3_ != null)
         {
            return _loc3_[param1] as Number;
         }
         return 0;
      }
      
      public function getLocation(param1:int, param2:int, param3:int, param4:int, param5:String) : IVector3d
      {
         var _loc11_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         if(param1 == 0 && param2 == 0)
         {
            param1 = _width;
            param2 = var_47;
            _loc11_ = Math.round(scale / 10);
            if(param5 == "r")
            {
               _loc8_ = _width - 1;
               while(_loc8_ >= 0)
               {
                  _loc10_ = 1;
                  while(_loc10_ < var_47)
                  {
                     if(getTileHeight(_loc8_,_loc10_) <= _floorHeight)
                     {
                        if(_loc10_ - 1 < param2)
                        {
                           param1 = _loc8_;
                           param2 = _loc10_ - 1;
                           break;
                        }
                        break;
                     }
                     _loc10_++;
                  }
                  _loc8_--;
               }
               param4 += scale / 4 - _loc11_ / 2;
               param3 += scale / 2;
            }
            else
            {
               _loc10_ = var_47 - 1;
               while(_loc10_ >= 0)
               {
                  _loc8_ = 1;
                  while(_loc8_ < _width)
                  {
                     if(getTileHeight(_loc8_,_loc10_) <= _floorHeight)
                     {
                        if(_loc8_ - 1 < param1)
                        {
                           param1 = _loc8_ - 1;
                           param2 = _loc10_;
                           break;
                        }
                        break;
                     }
                     _loc8_++;
                  }
                  _loc10_--;
               }
               param4 += scale / 4 - _loc11_ / 2;
               param3 -= _loc11_;
            }
         }
         var _loc7_:Number = param1;
         var _loc9_:Number = param2;
         var _loc12_:Number = getTileHeight(param1,param2);
         if(param5 == "r")
         {
            _loc7_ += param3 / (var_757 / 2) - 0.5;
            _loc9_ += 0.5;
            _loc12_ -= (param4 - param3 / 2) / (var_757 / 2);
         }
         else
         {
            _loc9_ += (var_757 / 2 - param3) / (var_757 / 2) - 0.5;
            _loc7_ += 0.5;
            _loc12_ -= (param4 - (var_757 / 2 - param3) / 2) / (var_757 / 2);
         }
         return new Vector3d(_loc7_,_loc9_,_loc12_);
      }
      
      public function getLocationOldFormat(param1:Number, param2:Number, param3:String) : IVector3d
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc5_:Number = 0;
         var _loc4_:Number = 0;
         _loc5_ = (_loc7_ = Math.ceil(param1)) - param1;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc12_:int = 0;
         var _loc11_:int = 0;
         var _loc13_:Number = 0;
         _loc6_ = 0;
         while(_loc6_ < _width)
         {
            if(_loc7_ >= 0 && _loc7_ < var_47)
            {
               if(getTileHeight(_loc6_,_loc7_) <= _floorHeight)
               {
                  _loc8_ = _loc6_ - 1;
                  _loc9_ = _loc7_;
                  _loc4_ = _loc6_;
                  param3 = "l";
                  break;
               }
               if(getTileHeight(_loc6_,_loc7_ + 1) <= _floorHeight)
               {
                  _loc8_ = _loc6_;
                  _loc4_ = (_loc9_ = _loc7_) - param1;
                  param3 = "r";
                  break;
               }
            }
            _loc7_++;
            _loc6_++;
         }
         _loc12_ = scale / 2 * _loc5_;
         var _loc10_:Number = (_loc10_ = -_loc4_ * scale / 2) + -param2 * 18 / 32 * scale / 2;
         _loc11_ = (_loc13_ = getTileHeight(_loc8_,_loc9_)) * scale / 2 + _loc10_;
         if(param3 == "r")
         {
            _loc11_ += _loc5_ * scale / 4;
         }
         else
         {
            _loc11_ += (1 - _loc5_) * scale / 4;
         }
         return getLocation(_loc8_,_loc9_,_loc12_,_loc11_,param3);
      }
      
      public function getOldLocation(param1:IVector3d, param2:Number) : Array
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc7_:Number = 0;
         var _loc5_:Number = 0;
         var _loc8_:String = "";
         var _loc6_:Number = 0;
         if(param2 == 90)
         {
            _loc3_ = Math.floor(param1.x - 0.5);
            _loc4_ = Math.floor(param1.y + 0.5);
            _loc6_ = getTileHeight(_loc3_,_loc4_);
            _loc7_ = var_757 / 2 - (param1.y - _loc4_ + 0.5) * (var_757 / 2);
            _loc5_ = (_loc6_ - param1.z) * (var_757 / 2) + (var_757 / 2 - _loc7_) / 2;
            _loc8_ = "l";
         }
         else
         {
            if(param2 != 180)
            {
               return null;
            }
            _loc3_ = Math.floor(param1.x + 0.5);
            _loc4_ = Math.floor(param1.y - 0.5);
            _loc6_ = getTileHeight(_loc3_,_loc4_);
            _loc7_ = (param1.x + 0.5 - _loc3_) * (var_757 / 2);
            _loc5_ = (_loc6_ - param1.z) * (var_757 / 2) + _loc7_ / 2;
            _loc8_ = "r";
         }
         return [_loc3_,_loc4_,_loc7_,_loc5_,_loc8_];
      }
      
      public function getOldLocationString(param1:IVector3d, param2:Number) : String
      {
         var _loc3_:Array = getOldLocation(param1,param2);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc9_:int = int(_loc3_[2]);
         var _loc6_:int = int(_loc3_[3]);
         var _loc8_:String = String(_loc3_[4]);
         return ":w=" + _loc4_ + "," + _loc5_ + " l=" + _loc9_ + "," + _loc6_ + " " + _loc8_;
      }
      
      public function getDirection(param1:String) : Number
      {
         if(param1 == "r")
         {
            return 180;
         }
         return 90;
      }
      
      public function getFloorAltitude(param1:int, param2:int) : Number
      {
         var _loc4_:int;
         var _loc3_:int = (_loc4_ = getTileHeight(param1,param2)) + 1;
         return _loc4_ + (int(getTileHeight(param1 - 1,param2 - 1)) == _loc3_ || int(getTileHeight(param1,param2 - 1)) == _loc3_ || int(getTileHeight(param1 + 1,param2 - 1)) == _loc3_ || int(getTileHeight(param1 - 1,param2)) == _loc3_ || int(getTileHeight(param1 + 1,param2)) == _loc3_ || int(getTileHeight(param1 - 1,param2 + 1)) == _loc3_ || int(getTileHeight(param1,param2 + 1)) == _loc3_ || int(getTileHeight(param1 + 1,param2 + 1)) == _loc3_ ? 0.5 : 0);
      }
      
      public function isRoomTile(param1:int, param2:int) : Boolean
      {
         return param1 >= 0 && param1 < _width && param2 >= 0 && param2 < var_47 && var_132[param2][param1] >= 0;
      }
   }
}
