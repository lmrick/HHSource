package com.sulake.habbo.game.snowwar
{
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FuseObjectData;
   import com.sulake.habbo.game.snowwar.arena.IGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowWarGameObject;
   import com.sulake.habbo.game.snowwar.utils.Direction8;
   import com.sulake.habbo.game.snowwar.utils.Location3D;
   import com.sulake.habbo.game.snowwar.utils.class_3347;
   import com.sulake.habbo.game.snowwar.utils.class_3348;
   import com.sulake.habbo.game.snowwar.utils.class_3464;
   
   public class Tile extends class_3348
   {
      
      public static const TILE_WIDTH:int = 3200;
      
      public static const TILE_HALFWIDTH:int = class_3464.javaDiv(1600);
      
      public static const TILE_ONEANDHALFWIDTH:int = 3200 + TILE_HALFWIDTH;
      
      public static const TILE_DIAMETER:int = int(Math.sqrt(20480000));
       
      
      private var _location:Location3D;
      
      private var var_2789:Array;
      
      private var _gameObject:SnowWarGameObject;
      
      private var _fuseLocation:Array;
      
      private var var_660:Array;
      
      private var var_3439:Boolean;
      
      private var var_47:int;
      
      public function Tile(param1:int, param2:int)
      {
         super();
         var_2789 = [];
         _fuseLocation = [param1,param2,0];
         _location = new Location3D(param1 * 3200,param2 * 3200,0);
         var_660 = [];
      }
      
      public static function convertToTileX(param1:int) : int
      {
         return class_3464.javaDiv((param1 + Tile.TILE_HALFWIDTH) / 3200);
      }
      
      public static function convertToTileY(param1:int) : int
      {
         return class_3464.javaDiv((param1 + Tile.TILE_HALFWIDTH) / 3200);
      }
      
      public static function convertFromTileX(param1:int) : int
      {
         return param1 * 3200;
      }
      
      public static function convertFromTileY(param1:int) : int
      {
         return param1 * 3200;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_location != null)
         {
            _location.dispose();
            _location = null;
         }
         var_2789 = [];
         _gameObject = null;
         _fuseLocation = [];
         var_660 = [];
         var_3439 = false;
      }
      
      public function get fuseObjects() : Array
      {
         return var_660;
      }
      
      public function addFuseObject(param1:FuseObjectData) : void
      {
         fuseObjects.push(param1);
         addToHeight(param1.height);
      }
      
      public function addToHeight(param1:int) : void
      {
         var_47 += param1;
         if(var_47 < 0)
         {
            var_47 = 0;
         }
      }
      
      public function get fuseLocation() : Array
      {
         return _fuseLocation;
      }
      
      public function get location() : Location3D
      {
         return _location;
      }
      
      public function locationIsInTileRange(param1:Location3D) : Boolean
      {
         var _loc2_:int = 0 - param1.x;
         if(_loc2_ < 0)
         {
            _loc2_ = -_loc2_;
         }
         var _loc3_:int = 0 - param1.y;
         if(_loc3_ < 0)
         {
            _loc3_ = -_loc3_;
         }
         return _loc2_ < TILE_HALFWIDTH && _loc3_ < TILE_HALFWIDTH;
      }
      
      public function linkTile(param1:Tile, param2:Direction8) : void
      {
         createLinkToTile(param1,param2);
         param1.createLinkToTile(this,param2.oppositeDirection());
      }
      
      private function createLinkToTile(param1:Tile, param2:Direction8) : void
      {
         var_2789[param2.intValue()] = param1;
      }
      
      public function getTileInDirection(param1:Direction8) : Tile
      {
         return var_2789[param1.intValue()];
      }
      
      public function canMoveTo(param1:IGameObject) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1)
         {
            _loc2_ = occupyingHuman != null && param1.isGhost && occupyingHuman.ghostObjectId == param1.gameObjectId;
         }
         var _loc3_:* = false;
         if(false)
         {
            _loc3_ = !(fuseObjects[0] as FuseObjectData).canStandOn;
         }
         else if(false)
         {
            _loc3_ = true;
         }
         return !_loc3_ && (_gameObject == null || _loc2_) && !var_3439;
      }
      
      public function addGameObject(param1:SnowWarGameObject) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!_gameObject)
         {
            _gameObject = param1;
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function removeGameObject() : SnowWarGameObject
      {
         var _loc1_:SnowWarGameObject = null;
         if(_gameObject)
         {
            _loc1_ = _gameObject;
            _gameObject = null;
         }
         return _loc1_;
      }
      
      public function get gameObject() : SnowWarGameObject
      {
         return _gameObject;
      }
      
      public function get occupyingHuman() : HumanGameObject
      {
         if(_gameObject && _gameObject is HumanGameObject)
         {
            return gameObject as HumanGameObject;
         }
         return null;
      }
      
      public function removeOccupyingHuman() : HumanGameObject
      {
         var _loc1_:HumanGameObject = occupyingHuman;
         if(_loc1_)
         {
            _gameObject = null;
         }
         return _loc1_;
      }
      
      override public function distanceTo(param1:class_3347) : int
      {
         var _loc2_:Tile = param1 as Tile;
         return _location.distanceTo(_loc2_.location);
      }
      
      override public function directionTo(param1:class_3347) : Direction8
      {
         var _loc2_:Tile = param1 as Tile;
         return _location.directionTo(_loc2_.location);
      }
      
      override public function getNodeAt(param1:Direction8) : class_3347
      {
         return var_2789[param1.intValue()];
      }
      
      override public function directionIsBlocked(param1:Direction8, param2:IGameObject) : Boolean
      {
         return canMoveTo(param2);
      }
      
      override public function getPathCost(param1:Direction8, param2:IGameObject) : int
      {
         if(param1.isDiagonal())
         {
            return 3200;
         }
         return TILE_DIAMETER;
      }
      
      public function get height() : int
      {
         return var_47;
      }
      
      public function toString() : String
      {
         return " X:undefined Y:undefined Z:undefined";
      }
      
      public function set blocked(param1:Boolean) : void
      {
         var_3439 = param1;
      }
   }
}
