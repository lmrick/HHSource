package com.sulake.habbo.game.snowwar.gameobjects
{
   import com.sulake.core.runtime.exceptions.Exception;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.Tile;
   import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.class_3328;
   import com.sulake.habbo.game.snowwar.class_3369;
   import com.sulake.habbo.game.snowwar.utils.Direction360;
   import com.sulake.habbo.game.snowwar.utils.Direction8;
   import com.sulake.habbo.game.snowwar.utils.Location3D;
   import com.sulake.habbo.game.snowwar.utils.class_3464;
   import package_185.HumanGameObjectData;
   
   public class HumanGameObject extends SnowWarGameObject
   {
      
      public static const const_785:int = 534;
      
      public static const INITIAL_SNOWBALL_COUNT:int = 5;
      
      public static const MAXIMUM_SNOWBALL_COUNT:int = 5;
      
      public static const INITIAL_HIT_POINTS:int = 5;
      
      public static const SNOWBALL_CREATE_TIME:int = 20;
      
      public static const STUN_TIME:int = 100;
      
      public static const INVINCIBLE_AFTER_STUN_TIME:int = 60;
      
      public static const ACTIVITY_STATE_NORMAL:int = 0;
      
      public static const ACTIVITY_STATE_MAKING_SNOWBALL:int = 1;
      
      public static const ACTIVITY_STATE_STUNNED:int = 2;
      
      public static const ACTIVITY_STATE_INVINCIBLE_AFTER_STUN:int = 3;
      
      public static const SNOWBALL_THROW_INTERVAL:int = 5;
      
      public static const BOUNDING_DATA:Array = [1600];
      
      public static const PLAYER_HEIGHT:int = 5000;
      
      private static const SCORE_ON_KNOCK_DOWN:int = 5;
      
      private static const SCORE_ON_HIT:int = 1;
       
      
      private var var_1498:Tile;
      
      private var var_1450:Tile;
      
      private var var_1277:Boolean;
      
      private var _currentLocation:Location3D;
      
      private var var_1608:Location3D;
      
      private var _bodyDirection:Direction8;
      
      private var _hitPoints:int;
      
      private var var_1568:int;
      
      protected var var_3696:int;
      
      private var var_1619:int;
      
      private var var_1481:int;
      
      private var var_522:int;
      
      private var var_2175:int;
      
      private var var_2137:int;
      
      private var _name:String;
      
      private var _mission:String;
      
      private var var_427:String;
      
      private var var_133:String;
      
      private var var_339:int;
      
      private var var_4021:int = 0;
      
      private var var_1451:SnowWarEngine;
      
      private var var_2738:class_24;
      
      public function HumanGameObject(param1:class_3328, param2:HumanGameObjectData, param3:Boolean, param4:SnowWarEngine)
      {
         _currentLocation = new Location3D(0,0,0);
         var_1608 = new Location3D(0,0,0);
         _bodyDirection = Direction8.SE;
         super(param2.id,param3);
         var_133 = param2.sex;
         _name = param2.name;
         _mission = param2.mission;
         var_427 = param2.figure;
         var_2175 = param2.team;
         var_339 = param2.userId;
         var_1481 = param2.activityState;
         var_1619 = param2.activityTimer;
         _currentLocation.change2DLocation(param2.currentLocationX,param2.currentLocationY);
         _bodyDirection = Direction8.getDirection8(param2.bodyDirection);
         _hitPoints = param2.hitPoints;
         var_1608.change2DLocation(param2.moveTargetX,param2.moveTargetY);
         var_1568 = param2.snowBallCount;
         var_522 = param2.score;
         var_1498 = param1.getTileAt(param2.currentTileX,param2.currentTileY);
         var_1498.addGameObject(this);
         var _loc5_:Tile;
         if((_loc5_ = param1.getTileAt(param2.nextTileX,param2.nextTileY)) != var_1498)
         {
            var_1450 = _loc5_;
            var_1450.addGameObject(this);
            var_1498.removeOccupyingHuman();
            var_1277 = true;
         }
         var_1451 = param4;
         var_2738 = new class_24();
      }
      
      public function get visualizationMode() : int
      {
         return var_4021;
      }
      
      public function set visualizationMode(param1:int) : void
      {
         var_4021 = param1;
      }
      
      public function get invincible() : Boolean
      {
         return var_1481 == 3;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_133 = "";
         _name = "";
         _mission = "";
         var_427 = "";
         var_2175 = 0;
         var_339 = 0;
         _currentLocation = null;
         _bodyDirection = null;
         var_1608 = null;
         var_1568 = 0;
         var_522 = 0;
         var_1277 = false;
         var_1451 = null;
         var_2738 = null;
      }
      
      override public function get numberOfVariables() : int
      {
         return 19;
      }
      
      override public function getVariable(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 5;
            case 1:
               return var_1785;
            case 2:
               return _currentLocation.x;
            case 3:
               return _currentLocation.y;
            case 4:
               return var_1498.fuseLocation[0];
            case 5:
               return var_1498.fuseLocation[1];
            case 6:
               return _bodyDirection.intValue();
            case 7:
               return _hitPoints;
            case 8:
               return var_1568;
            case 9:
               return var_3696;
            case 10:
               return var_1619;
            case 11:
               return var_1481;
            case 12:
               return var_1450 != null ? var_1450.fuseLocation[0] : var_1498.fuseLocation[0];
            case 13:
               return var_1450 != null ? var_1450.fuseLocation[1] : var_1498.fuseLocation[1];
            case 14:
               return var_1608.x;
            case 15:
               return var_1608.y;
            case 16:
               return var_522;
            case 17:
               return var_2175;
            case 18:
               return var_339;
            default:
               throw new Exception("No such variable:" + param1);
         }
      }
      
      public function reinitGhost(param1:HumanGameObject) : void
      {
         _currentLocation.change2DLocation(param1._currentLocation.x,param1._currentLocation.y);
         var_1498 = param1.var_1498;
         _bodyDirection = param1._bodyDirection;
         _hitPoints = param1._hitPoints;
         var_1568 = param1.var_1568;
         var_3696 = param1.var_3696;
         var_1619 = param1.var_1619;
         var_1481 = param1.var_1481;
         var_1450 = param1.var_1450;
         var_1608.change2DLocation(param1.var_1608.x,param1.var_1608.y);
         var_522 = param1.var_522;
         var_2175 = param1.var_2175;
         var_339 = param1.var_339;
      }
      
      public function isInGhostDistance(param1:int, param2:Location3D) : Boolean
      {
         var _loc3_:Location3D = var_2738[param1];
         if(_loc3_)
         {
            return _loc3_.isInDistance(param2,Tile.TILE_ONEANDHALFWIDTH);
         }
         return false;
      }
      
      public function addGhostLocation(param1:int) : void
      {
         var _loc2_:Location3D = new Location3D(0,0,0);
         _loc2_.change2DLocation(_currentLocation.x,_currentLocation.y);
         var_2738[param1] = _loc2_;
      }
      
      public function removeGhostLocation(param1:int) : void
      {
         var_2738.remove(param1);
      }
      
      public function setBodyDirection(param1:Direction8) : void
      {
         _bodyDirection = param1;
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
         return _currentLocation;
      }
      
      override public function get direction360() : Direction360
      {
         return null;
      }
      
      override public function onRemove() : void
      {
         if(var_1498 && var_1498.occupyingHuman == this)
         {
            var_1498.removeOccupyingHuman();
         }
         if(var_1450 && var_1450.occupyingHuman == this)
         {
            var_1450.removeOccupyingHuman();
         }
         var_1277 = false;
      }
      
      public function activityTimerTriggered() : void
      {
         if(var_1481 == 2)
         {
            _hitPoints = 5;
            var_1481 = 3;
            var_1619 = 60;
            return;
         }
         if(var_1481 == 1)
         {
            var_1568++;
         }
         var_1481 = 0;
         var_1451.stopWaitingForSnowball(gameObjectId);
      }
      
      override public function subturn(param1:class_3327) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Direction8 = null;
         var _loc4_:class_3328 = param1 as class_3328;
         if(var_1619 > 0)
         {
            if(var_1619 == 1)
            {
               activityTimerTriggered();
            }
            var_1619--;
         }
         if(var_2137 > 0)
         {
            var_2137--;
         }
         if(false)
         {
            HabboGamesCom.log(gameObjectId + " currentTile:" + var_1498 + " nextTile:" + var_1450);
         }
         if(canMove() && var_1498 != null)
         {
            if(var_1450 != null)
            {
               if(false)
               {
                  HabboGamesCom.log(gameObjectId + " Moving towards next tile:" + var_1450 + " _currentLocation:" + _currentLocation);
               }
               moveTowardsNextTile();
            }
            else if(!var_1498.locationIsInTileRange(var_1608))
            {
               _loc2_ = Direction360.getAngleFromComponents(0 - var_1498.location.x,0 - var_1498.location.y);
               _loc3_ = Direction360.direction360ValueToDirection8(_loc2_);
               var_1450 = var_1498.getTileInDirection(_loc3_);
               if(var_1450 == null || !var_1450.canMoveTo(this))
               {
                  if(var_1450 != null && !var_1450.canMoveTo(this))
                  {
                     if(var_1608.equals(var_1450.location))
                     {
                        var_1450 = null;
                        stopMovement();
                        return;
                     }
                  }
                  _loc3_ = _loc3_.rotateDirection(-1);
                  var_1450 = var_1498.getTileInDirection(_loc3_);
                  if(var_1450 == null || !var_1450.canMoveTo(this))
                  {
                     _loc3_ = _loc3_.rotateDirection(2);
                     var_1450 = var_1498.getTileInDirection(_loc3_);
                     if(var_1450 != null && !var_1450.canMoveTo(this))
                     {
                        var_1450 = null;
                     }
                  }
               }
               if(var_1450 != null)
               {
                  if(!isGhost)
                  {
                     var_1498.removeOccupyingHuman();
                     var_1450.addGameObject(this);
                  }
                  setBodyDirection(_loc3_);
                  moveTowardsNextTile();
               }
               else
               {
                  var_1277 = false;
               }
               if(false)
               {
                  HabboGamesCom.log(gameObjectId + " Starting to move to next tile in direction360:" + _loc2_ + ", nextTile is now " + var_1450 + "_currentLocationn:" + _currentLocation + ", moveTarget:" + var_1608);
               }
            }
            else
            {
               var_1277 = false;
            }
         }
         else
         {
            var_1277 = false;
         }
      }
      
      private function moveTowardsNextTile() : void
      {
         if(false)
         {
            HabboGamesCom.log(gameObjectId + " [MoveTowardsNextTile], currentX: " + _currentLocation.x + " currentY: " + _currentLocation.y);
         }
         var _loc5_:int = var_1450.location.x;
         var _loc1_:* = 0;
         var _loc2_:int = _loc1_ - _loc5_;
         if(_loc2_ != 0)
         {
            if(_loc2_ < 0)
            {
               if(_loc2_ > -534)
               {
                  _loc1_ = _loc5_;
               }
               else
               {
                  _loc1_ += 534;
               }
            }
            else if(_loc2_ < 534)
            {
               _loc1_ = _loc5_;
            }
            else
            {
               _loc1_ -= 534;
            }
         }
         var _loc3_:int = var_1450.location.y;
         var _loc4_:int;
         var _loc6_:*;
         if((_loc4_ = (_loc6_ = 0) - _loc3_) != 0)
         {
            if(_loc4_ < 0)
            {
               if(_loc4_ > -534)
               {
                  _loc6_ = _loc3_;
               }
               else
               {
                  _loc6_ += 534;
               }
            }
            else if(_loc4_ < 534)
            {
               _loc6_ = _loc3_;
            }
            else
            {
               _loc6_ -= 534;
            }
         }
         if(false)
         {
            HabboGamesCom.log(gameObjectId + " [MoveTowardsNextTile], nextX: " + _loc1_ + " nextY: " + _loc6_);
         }
         _currentLocation.change2DLocation(_loc1_,_loc6_);
         if(_currentLocation.distanceTo(var_1450.location) < class_3464.javaDiv(267))
         {
            var_1498 = var_1450;
            var_1450 = null;
         }
         var_1277 = true;
      }
      
      public function changeMoveTarget(param1:int, param2:int) : void
      {
         if(var_1481 == 1)
         {
            var_1481 = 0;
            var_1619 = 0;
            var_1451.stopWaitingForSnowball(gameObjectId);
         }
         if(var_1481 == 0 || var_1481 == 3)
         {
            var_1608.change2DLocation(param1,param2);
         }
      }
      
      public function get currentLocation() : Location3D
      {
         return _currentLocation;
      }
      
      public function playerIsHitBySnowball(param1:class_3328, param2:HumanGameObject, param3:int) : void
      {
         if(var_3428)
         {
            return;
         }
         if(var_2175 == param2.team)
         {
            return;
         }
         if(_hitPoints > 0)
         {
            if(_hitPoints == 1)
            {
               playerFallsDown(param3);
               param2.onKnockDownHuman(param1,this);
               SnowWarEngine.playSound("HBSTG_snowwar_hit3");
            }
            _hitPoints--;
            var_1451.registerHit(this,param2);
         }
      }
      
      public function onHitHuman(param1:class_3328, param2:HumanGameObject) : void
      {
         if(!param2.isGhost && (team != param2.team || Boolean(class_3369(param1.gameArena.getExtension()).isDeathMatch())))
         {
            addScore(param1.gameArena,1);
         }
      }
      
      public function onKnockDownHuman(param1:class_3328, param2:HumanGameObject) : void
      {
         if(!param2.isGhost && (team != param2.team || Boolean(class_3369(param1.gameArena.getExtension()).isDeathMatch())))
         {
            addScore(param1.gameArena,5);
         }
      }
      
      public function addScore(param1:SynchronizedGameArena, param2:int) : void
      {
         var_522 += param2;
         param1.addTeamScore(team,param2);
      }
      
      public function playerFallsDown(param1:int) : void
      {
         var_1481 = 2;
         var_1619 = 100;
         setBodyDirection(Direction360.direction360ValueToDirection8(param1).oppositeDirection());
         stopMovement();
         var_1451.stopWaitingForSnowball(gameObjectId);
      }
      
      public function stopMovement() : void
      {
         if(var_1450 == null)
         {
            var_1608.changeLocationToLocation(var_1498.location);
            _currentLocation.changeLocationToLocation(var_1498.location);
         }
         else
         {
            var_1498 = var_1450;
            _currentLocation.changeLocationToLocation(var_1450.location);
            var_1608.changeLocationToLocation(var_1450.location);
            var_1450 = null;
         }
         var_1277 = false;
         if(false)
         {
            HabboGamesCom.log("Stopped. dir:" + _bodyDirection + "_currentTilee:" + var_1498 + "_nextTilee:" + var_1450 + "_currentLocationn:" + _currentLocation + "_moveTargett:" + var_1608);
         }
      }
      
      public function getBodyDirection() : int
      {
         return _bodyDirection.intValue();
      }
      
      public function canThrowSnowballs() : Boolean
      {
         return var_1568 > 0 && var_2137 < 1 && (var_1481 == 0 || var_1481 == 3);
      }
      
      public function startThrowTimer() : void
      {
         var_2137 = 5;
      }
      
      public function throwSnowball(param1:int, param2:int) : Boolean
      {
         if(var_1568 < 1)
         {
            return false;
         }
         stopMovement();
         var _loc4_:int = Direction360.getAngleFromComponents(param1 - 0,param2 - 0);
         var _loc3_:int = Direction360.direction360ValueToDirection8(_loc4_).intValue();
         setBodyDirection(Direction8.getDirection8(_loc3_));
         if(false)
         {
            HabboGamesCom.log("Turning to:" + _loc3_ + " 360 value:" + _loc4_ + " target:" + param1 + "," + param2 + " location:" + _currentLocation.x + "," + _currentLocation.y);
         }
         var_1568--;
         return true;
      }
      
      public function canMove() : Boolean
      {
         return var_1481 == 0 || var_1481 == 3;
      }
      
      public function canMakeSnowballs() : Boolean
      {
         return (var_1481 == 0 || var_1481 == 3) && (var_1568 < 5 || isGhost);
      }
      
      public function startMakingSnowball() : void
      {
         if(canMakeSnowballs())
         {
            var_1481 = 1;
            var_1619 = 20;
            stopMovement();
         }
      }
      
      public function getRemainingSnowballCapacity() : int
      {
         return 5 - var_1568;
      }
      
      public function addSnowballs(param1:int) : void
      {
         var_1568 += param1;
      }
      
      public function isStunned() : Boolean
      {
         return var_1481 == 2;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get mission() : String
      {
         return _mission;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get sex() : String
      {
         return var_133;
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function get team() : int
      {
         return var_2175;
      }
      
      public function get snowballs() : int
      {
         return var_1568;
      }
      
      public function get hitPoints() : int
      {
         return _hitPoints;
      }
      
      public function get posture() : String
      {
         if(var_2137 > 0)
         {
            return "swthrow";
         }
         switch(var_1481 - 1)
         {
            case 0:
               return "swpick";
            case 1:
               return "swdieback";
            default:
               if(var_1277)
               {
                  return "swrun";
               }
               return "std";
         }
      }
      
      public function get action() : String
      {
         switch(var_1481 - 3)
         {
            case 0:
               return "figure_dance";
            default:
               return "figure_dance";
         }
      }
      
      public function get parameter() : int
      {
         if(var_2137 > 1)
         {
            return 1;
         }
         if(var_2137 == 1)
         {
            return 0;
         }
         switch(var_1481 - 3)
         {
            case 0:
               return 1;
            default:
               return 0;
         }
      }
      
      override public function testSnowBallCollision(param1:SnowBallGameObject) : Boolean
      {
         if(!var_3428 && var_1481 != 2 && var_1481 != 3 && param1.throwingHuman != this && super.testSnowBallCollision(param1))
         {
            return true;
         }
         return false;
      }
      
      override public function onSnowBallHit(param1:class_3328, param2:SnowBallGameObject) : void
      {
         var _loc3_:HumanGameObject = param2.throwingHuman;
         playerIsHitBySnowball(param1,_loc3_,param2.direction360.intValue());
         _loc3_.onHitHuman(param1,this);
         SnowWarEngine.playSound("HBSTG_snowwar_hit1");
      }
      
      override public function get collisionHeight() : int
      {
         return 5000;
      }
      
      public function toString() : String
      {
         return " ref:" + var_1785 + "_name:" + _name;
      }
   }
}
