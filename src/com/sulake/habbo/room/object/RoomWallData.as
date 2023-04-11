package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.geom.Point;
   
   public class RoomWallData
   {
      
      public static var WALL_DIRECTION_VECTORS:Array = [];
      
      public static var WALL_NORMAL_VECTORS:Array = [];
      
      {
         WALL_DIRECTION_VECTORS.push(new Vector3d(1,0,0));
         WALL_DIRECTION_VECTORS.push(new Vector3d(0,1,0));
         WALL_DIRECTION_VECTORS.push(new Vector3d(-1,0,0));
         WALL_DIRECTION_VECTORS.push(new Vector3d(0,-1,0));
         WALL_NORMAL_VECTORS.push(new Vector3d(0,1,0));
         WALL_NORMAL_VECTORS.push(new Vector3d(-1,0,0));
         WALL_NORMAL_VECTORS.push(new Vector3d(0,-1,0));
         WALL_NORMAL_VECTORS.push(new Vector3d(1,0,0));
      }
      
      private var _corners:Array;
      
      private var var_179:Array;
      
      private var _directions:Array;
      
      private var var_115:Array;
      
      private var var_387:Array;
      
      private var _borders:Array;
      
      private var _hideWalls:Array;
      
      private var var_366:Array;
      
      private var var_528:Array;
      
      private var var_1406:Boolean = false;
      
      private var var_158:int = 0;
      
      public function RoomWallData()
      {
         _corners = [];
         var_179 = [];
         _directions = [];
         var_115 = [];
         var_387 = [];
         _borders = [];
         _hideWalls = [];
         var_366 = [];
         var_528 = [];
         super();
      }
      
      public function addWall(param1:Point, param2:int, param3:int, param4:Boolean, param5:Boolean) : void
      {
         if(var_1406 || checkIsNotDuplicate(param1,param2,param3,param4,param5))
         {
            _corners.push(param1);
            _directions.push(param2);
            var_115.push(param3);
            _borders.push(param4);
            var_387.push(param5);
            _hideWalls.push(false);
            var_366.push(false);
            var_528.push(false);
            var_158++;
         }
      }
      
      private function checkIsNotDuplicate(param1:Point, param2:int, param3:int, param4:Boolean, param5:Boolean) : Boolean
      {
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < var_158)
         {
            if(_corners[_loc6_].x == param1.x && _corners[_loc6_].y == param1.y && _directions[_loc6_] == param2 && var_115[_loc6_] == param3 && _borders[_loc6_] == param4 && var_387[_loc6_] == param5)
            {
               return false;
            }
            _loc6_++;
         }
         return true;
      }
      
      public function get count() : int
      {
         return var_158;
      }
      
      public function getCorner(param1:int) : Point
      {
         return _corners[param1];
      }
      
      public function getEndPoint(param1:int) : Point
      {
         calculateWallEndPoints();
         return var_179[param1];
      }
      
      public function getLength(param1:int) : int
      {
         return var_115[param1];
      }
      
      public function getDirection(param1:int) : int
      {
         return _directions[param1];
      }
      
      public function getBorder(param1:int) : Boolean
      {
         return _borders[param1];
      }
      
      public function getHideWall(param1:int) : Boolean
      {
         return _hideWalls[param1];
      }
      
      public function getLeftTurn(param1:int) : Boolean
      {
         return var_387[param1];
      }
      
      public function getManuallyLeftCut(param1:int) : Boolean
      {
         return var_366[param1];
      }
      
      public function getManuallyRightCut(param1:int) : Boolean
      {
         return var_528[param1];
      }
      
      public function setHideWall(param1:int, param2:Boolean) : void
      {
         _hideWalls[param1] = param2;
      }
      
      public function setLength(param1:int, param2:int) : void
      {
         if(param2 < var_115[param1])
         {
            var_115[param1] = param2;
            var_528[param1] = true;
         }
      }
      
      public function moveCorner(param1:int, param2:int) : void
      {
         var _loc3_:IVector3d = null;
         if(param2 > 0 && param2 < var_115[param1])
         {
            _loc3_ = WALL_DIRECTION_VECTORS[getDirection(param1)];
            _corners[param1] = _corners[param1].add(new Point(param2 * _loc3_.x,param2 * _loc3_.y));
            var _loc4_:* = param1;
            var _loc5_:* = 0 - param2;
            var_115[_loc4_] = _loc5_;
            var_366[param1] = true;
         }
      }
      
      private function calculateWallEndPoints() : void
      {
         var _loc5_:int = 0;
         var _loc3_:Point = null;
         var _loc1_:Point = null;
         var _loc2_:IVector3d = null;
         var _loc4_:int = 0;
         if(var_179.length != count)
         {
            var_179 = [];
            _loc5_ = 0;
            while(_loc5_ < count)
            {
               _loc3_ = getCorner(_loc5_);
               _loc1_ = new Point(_loc3_.x,_loc3_.y);
               _loc2_ = RoomWallData.WALL_DIRECTION_VECTORS[getDirection(_loc5_)];
               _loc4_ = getLength(_loc5_);
               _loc1_.x += _loc2_.x * _loc4_;
               _loc1_.y += _loc2_.y * _loc4_;
               var_179.push(_loc1_);
               _loc5_++;
            }
         }
      }
   }
}
