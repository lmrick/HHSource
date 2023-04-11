package com.sulake.habbo.game.snowwar.gameobjects
{
   import com.sulake.core.runtime.exceptions.Exception;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.Tile;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.class_3328;
   import com.sulake.habbo.game.snowwar.utils.Direction360;
   import com.sulake.habbo.game.snowwar.utils.Direction8;
   import com.sulake.habbo.game.snowwar.utils.Location3D;
   import com.sulake.habbo.game.snowwar.utils.class_3458;
   import com.sulake.habbo.game.snowwar.utils.class_3464;
   import package_185.SnowballGameObjectData;
   
   public class SnowBallGameObject extends SnowWarGameObject
   {
      
      public static const TRAJECTORY_QUICK_THROW:int = 0;
      
      public static const TRAJECTORY_SHORT_LOB:int = 1;
      
      public static const TRAJECTORY_LONG_LOB:int = 2;
      
      public static const TRAJECTORY_DEFAULT_THROW:int = 3;
      
      public static const THROW_VELOCITY:int = 2000;
      
      public static const INITIAL_HEIGHT:int = 3000;
      
      public static const const_1020:Number = 0.0007072135785007072;
      
      public static const SHORT_LOB_TIME_TO_TARGET_COEF:Number = 0.000559;
      
      public static const QUICK_THROW_MAX_RANGE:int = 20000;
      
      public static const SHORT_LOB_MAX_RANGE:int = 60000;
      
      public static const LONG_LOB_MAX_RANGE:int = 100000;
      
      public static const DEFAULT_THROW_TO_LOB_CUTOFF_RANGE:int = 42000;
      
      public static const const_1149:int = 10;
      
      public static const SHORT_LOB_HEIGHT_SCALING_FACTOR:int = 25;
      
      public static const const_1082:int = 50;
      
      public static var BOUNDING_DATA:Array = [400];
      
      public static const const_978:int = 3;
      
      public static const GRAVITY:int = 15;
       
      
      private var _location3D:Location3D;
      
      private var _movementDirection360:Direction360;
      
      private var var_810:int;
      
      private var var_1867:int;
      
      private var var_1560:int;
      
      private var var_2351:com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
      
      private var _parabolaOffset:int;
      
      public function SnowBallGameObject(param1:int)
      {
         _location3D = new Location3D(0,0,0);
         _movementDirection360 = new Direction360(0);
         super(param1,false);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _location3D.dispose();
         _location3D = null;
         _movementDirection360.dispose();
         _movementDirection360 = null;
         var_810 = 0;
         var_1867 = 0;
         var_1560 = 0;
         var_2351 = null;
         _parabolaOffset = 0;
      }
      
      public function initializeFromData(param1:SnowballGameObjectData, param2:com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject) : void
      {
         _location3D.changeLocation(param1.locationX3D,param1.locationY3D,param1.locationZ3D);
         _movementDirection360.setIntValue(param1.movementDirection360);
         var_810 = param1.trajectory;
         var_1867 = param1.planarVelocity;
         var_1560 = param1.timeToLive;
         var_2351 = param2;
         _parabolaOffset = param1.parabolaOffset;
         _active = true;
      }
      
      public function initialize(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject) : void
      {
         var _loc10_:int = 0;
         _active = true;
         _location3D.changeLocation(param1,param2,param3);
         var_810 = param4;
         var _loc8_:int = param5 - param1;
         var _loc9_:int = param6 - param2;
         _loc8_ = class_3464.javaDiv(_loc8_ / 200);
         _loc9_ = class_3464.javaDiv(_loc9_ / 200);
         _movementDirection360.setIntValue(Direction360.getAngleFromComponents(_loc8_,_loc9_));
         _loc10_ = class_3458.fast_sqrt(_loc8_ * _loc8_ + _loc9_ * _loc9_) * 200;
         initializeTrajectory(param4,_loc10_);
         if(var_810 == 0)
         {
            var_1560 = 10;
            var_1867 = 2000;
         }
         else if(var_810 == 1)
         {
            var_1560 = (_loc10_ = Math.min(_loc10_,60000)) * 0.000559;
            var_1867 = var_1560 == 0 ? 0 : class_3464.javaDiv(_loc10_ / var_1560);
         }
         else if(var_810 == 2)
         {
            var_1560 = (_loc10_ = Math.min(_loc10_,100000)) * 0.0007072135785007072;
            var_1867 = var_1560 == 0 ? 0 : class_3464.javaDiv(_loc10_ / var_1560);
         }
         _parabolaOffset = class_3464.javaDiv(var_1560 / 2);
         var_2351 = param7;
         if(false)
         {
            HabboGamesCom.log("Snowball created, id=" + var_1785 + " ttl:" + var_1560 + " deltaX:" + _loc8_ + " deltaY:" + _loc9_ + " deltaX/200:" + class_3464.javaDiv(_loc8_ / 200) + " deltaY/200:" + class_3464.javaDiv(_loc9_ / 200) + " deltax^2+deltay^2:" + (_loc8_ * _loc8_ + _loc9_ * _loc9_) + " sqrt(deltax^2+deltay^2):" + class_3458.fast_sqrt(_loc8_ * _loc8_ + _loc9_ * _loc9_) + " sqrt(deltax^2+deltay^2)*200:" + class_3458.fast_sqrt(_loc8_ * _loc8_ + _loc9_ * _loc9_) * 200);
         }
      }
      
      private function initializeTrajectory(param1:int, param2:int) : void
      {
         if(param1 == 3)
         {
            if(param2 <= 42000)
            {
               var_810 = 0;
            }
            else if(param2 <= 60000)
            {
               var_810 = 1;
            }
            else
            {
               var_810 = 2;
            }
         }
         else
         {
            var_810 = param1;
         }
      }
      
      override public function get numberOfVariables() : int
      {
         return 11;
      }
      
      override public function getVariable(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 1;
            case 1:
               return var_1785;
            case 2:
               return _location3D.x;
            case 3:
               return _location3D.y;
            case 4:
               return _location3D.z;
            case 5:
               return _movementDirection360.intValue();
            case 6:
               return var_810;
            case 7:
               return var_1560;
            case 8:
               return var_2351 == null ? -1 : var_2351.gameObjectId;
            case 9:
               return _parabolaOffset;
            case 10:
               return var_1867;
            default:
               throw new Exception("No such variable:" + param1);
         }
      }
      
      override public function get direction360() : Direction360
      {
         return _movementDirection360;
      }
      
      override public function get boundingType() : int
      {
         return 2;
      }
      
      override public function get boundingData() : Array
      {
         return BOUNDING_DATA;
      }
      
      override public function get location3D() : Location3D
      {
         return _location3D;
      }
      
      override public function subturn(param1:class_3327) : void
      {
         var _loc3_:class_3328 = param1 as class_3328;
         if(!_active)
         {
            return;
         }
         var_1560--;
         if(var_810 == 0)
         {
            updatePosition(10,true);
         }
         else if(var_810 == 1)
         {
            updatePosition(25,false);
         }
         else
         {
            updatePosition(50,false);
         }
         var _loc5_:int = Tile.convertToTileX(_location3D.x);
         var _loc6_:int = Tile.convertToTileY(_location3D.y);
         var _loc4_:Tile = _loc3_.getTileAt(_loc5_,_loc6_);
         var _loc2_:Boolean = testCollisions(_loc3_,_loc4_);
         if(!_loc2_)
         {
            _loc2_ = _loc3_.testCollisionWithGround(this);
            if(_loc2_)
            {
               SnowWarEngine.playSound("HBSTG_snowwar_miss");
            }
         }
         if(_loc2_)
         {
            _loc3_.putGameObjectOnDeleteList(this);
         }
         if(false)
         {
            HabboGamesCom.log("Snowball " + var_1785 + " tileX:" + _loc5_ + " tileY:" + _loc6_ + " collision:" + _loc2_);
         }
      }
      
      private function testCollisions(param1:class_3328, param2:Tile) : Boolean
      {
         var _loc4_:Direction8 = null;
         var _loc3_:Boolean = false;
         if(param2)
         {
            _loc3_ = testCollision(param1,param2);
            if(!_loc3_)
            {
               _loc4_ = _movementDirection360.direction8Value();
               _loc3_ = testCollision(param1,param2.getTileInDirection(_loc4_));
               if(!_loc3_)
               {
                  _loc3_ = testCollision(param1,param2.getTileInDirection(_loc4_.rotateDirection45Degrees(false)));
                  if(!_loc3_)
                  {
                     _loc3_ = testCollision(param1,param2.getTileInDirection(_loc4_.rotateDirection45Degrees(true)));
                  }
               }
            }
         }
         return _loc3_;
      }
      
      private function testCollision(param1:class_3328, param2:Tile) : Boolean
      {
         var _loc3_:SnowWarGameObject = null;
         if(param2)
         {
            _loc3_ = param2.gameObject;
            if(_loc3_)
            {
               if(false)
               {
                  HabboGamesCom.log("Snowball " + var_1785 + " testing collision with " + _loc3_.gameObjectId);
               }
               if(_loc3_.testSnowBallCollision(this))
               {
                  _loc3_.onSnowBallHit(param1,this);
                  return true;
               }
            }
         }
         return false;
      }
      
      private function updatePosition(param1:int, param2:Boolean) : void
      {
         var _loc6_:int = _location3D.x + class_3464.javaDiv(_movementDirection360.getBaseVectorXComponent() * var_1867 / 255);
         var _loc5_:int = _location3D.y + class_3464.javaDiv(_movementDirection360.getBaseVectorYComponent() * var_1867 / 255);
         var _loc3_:int = var_1560 - _parabolaOffset;
         var _loc4_:int = (_parabolaOffset * _parabolaOffset - _loc3_ * _loc3_) * param1 + 3000;
         if(param2)
         {
            _loc4_ = Math.min(_loc4_,3000);
         }
         _location3D.changeLocation(_loc6_,_loc5_,_loc4_);
      }
      
      override public function onSnowBallHit(param1:class_3328, param2:SnowBallGameObject) : void
      {
      }
      
      public function toString() : String
      {
         return " location=(undefined,undefined,undefined) dir=" + _movementDirection360 + " paraOffs=" + _parabolaOffset + " ttl=" + var_1560;
      }
      
      public function get throwingHuman() : com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject
      {
         return var_2351;
      }
   }
}
