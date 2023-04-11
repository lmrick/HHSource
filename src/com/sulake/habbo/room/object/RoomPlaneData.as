package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomPlaneData
   {
      
      public static const PLANE_UNDEFINED:int = 0;
      
      public static const PLANE_FLOOR:int = 1;
      
      public static const PLANE_WALL:int = 2;
      
      public static const PLANE_LANDSCAPE:int = 3;
      
      public static const PLANE_BILLBOARD:int = 4;
       
      
      private var var_271:int = 0;
      
      private var var_537:Vector3d = null;
      
      private var var_669:Vector3d = null;
      
      private var var_589:Vector3d = null;
      
      private var _normal:Vector3d = null;
      
      private var _normalDirection:Vector3d = null;
      
      private var _secondaryNormals:Array;
      
      private var var_494:Array;
      
      public function RoomPlaneData(param1:int, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Array)
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:IVector3d = null;
         var _loc8_:Vector3d = null;
         _secondaryNormals = [];
         var_494 = [];
         super();
         var_537 = new Vector3d();
         var_537.assign(param2);
         var_669 = new Vector3d();
         var_669.assign(param3);
         var_589 = new Vector3d();
         var_589.assign(param4);
         var_271 = param1;
         if(param3 != null && param4 != null)
         {
            _normal = Vector3d.crossProduct(param3,param4);
            _loc6_ = 0;
            _loc7_ = 0;
            _loc9_ = 0;
            _loc12_ = 0;
            _loc13_ = 0;
            if(true || true)
            {
               _loc12_ = 0;
               _loc13_ = 0;
               if((_loc6_ = 360 + Math.atan2(_loc13_,_loc12_) / 3.141592653589793 * 180) >= 360)
               {
                  _loc6_ -= 360;
               }
               _loc12_ = Math.sqrt(0 * 0 + 0 * 0);
               _loc13_ = 0;
               if((_loc7_ = 360 + Math.atan2(_loc13_,_loc12_) / 3.141592653589793 * 180) >= 360)
               {
                  _loc7_ -= 360;
               }
            }
            else if(false)
            {
               _loc7_ = 90;
            }
            else
            {
               _loc7_ = 270;
            }
            _normalDirection = new Vector3d(_loc6_,_loc7_,_loc9_);
         }
         if(param5 != null && param5.length > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < param5.length)
            {
               if((_loc11_ = param5[_loc10_]) != null && _loc11_.length > 0)
               {
                  (_loc8_ = new Vector3d()).assign(_loc11_);
                  _loc8_.mul(1 / _loc8_.length);
                  _secondaryNormals.push(_loc8_);
               }
               _loc10_++;
            }
         }
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get loc() : IVector3d
      {
         return var_537;
      }
      
      public function get leftSide() : IVector3d
      {
         return var_669;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_589;
      }
      
      public function get normal() : IVector3d
      {
         return _normal;
      }
      
      public function get normalDirection() : IVector3d
      {
         return _normalDirection;
      }
      
      public function get secondaryNormalCount() : int
      {
         return _secondaryNormals.length;
      }
      
      public function get maskCount() : int
      {
         return var_494.length;
      }
      
      public function getSecondaryNormal(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= secondaryNormalCount)
         {
            return null;
         }
         var _loc2_:Vector3d = new Vector3d();
         _loc2_.assign(_secondaryNormals[param1] as IVector3d);
         return _loc2_;
      }
      
      public function addMask(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:RoomPlaneMaskData = new RoomPlaneMaskData(param1,param2,param3,param4);
         var_494.push(_loc5_);
      }
      
      private function getMask(param1:int) : RoomPlaneMaskData
      {
         if(param1 < 0 || param1 >= maskCount)
         {
            return null;
         }
         return var_494[param1];
      }
      
      public function getMaskLeftSideLoc(param1:int) : Number
      {
         var _loc2_:RoomPlaneMaskData = getMask(param1);
         if(_loc2_ != null)
         {
            return _loc2_.leftSideLoc;
         }
         return -1;
      }
      
      public function getMaskRightSideLoc(param1:int) : Number
      {
         var _loc2_:RoomPlaneMaskData = getMask(param1);
         if(_loc2_ != null)
         {
            return _loc2_.rightSideLoc;
         }
         return -1;
      }
      
      public function getMaskLeftSideLength(param1:int) : Number
      {
         var _loc2_:RoomPlaneMaskData = getMask(param1);
         if(_loc2_ != null)
         {
            return _loc2_.leftSideLength;
         }
         return -1;
      }
      
      public function getMaskRightSideLength(param1:int) : Number
      {
         var _loc2_:RoomPlaneMaskData = getMask(param1);
         if(_loc2_ != null)
         {
            return _loc2_.rightSideLength;
         }
         return -1;
      }
   }
}
