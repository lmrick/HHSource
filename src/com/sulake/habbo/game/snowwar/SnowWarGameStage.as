package com.sulake.habbo.game.snowwar
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FuseObjectData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;
   import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowWarGameObject;
   import com.sulake.habbo.game.snowwar.utils.Direction360;
   import com.sulake.habbo.game.snowwar.utils.Direction8;
   import com.sulake.habbo.game.snowwar.utils.Location3D;
   import com.sulake.habbo.game.snowwar.utils.class_3379;
   
   public class SnowWarGameStage extends class_3327
   {
      
      public static const SCREEN_CENTER_TILE_X:int = 25;
      
      public static const SCREEN_CENTER_TILE_Y:int = 25;
      
      private static const INFINITE_HEIGHT:int = 100000;
       
      
      private var _tiles:Array;
      
      public function SnowWarGameStage()
      {
         _tiles = [];
         super();
      }
      
      public static function calculateDirectionTowardsCenter(param1:Tile) : Direction8
      {
         return Direction360.direction360ValueToDirection8(Direction360.getAngleFromComponents(25 - param1.fuseLocation[0],25 - param1.fuseLocation[1]));
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Tile = null;
         super.dispose();
         if(_tiles && false)
         {
            _loc3_ = 0;
            while(_loc3_ < _tiles.length)
            {
               _loc1_ = 0;
               while(_loc1_ < (_tiles[0] as Array).length)
               {
                  _loc2_ = _tiles[_loc3_][_loc1_];
                  if(_loc2_)
                  {
                     _loc2_.dispose();
                  }
                  _loc1_++;
               }
               _loc3_++;
            }
         }
         _tiles = [];
      }
      
      override public function initialize(param1:SynchronizedGameArena, param2:GameLevelData) : void
      {
         super.initialize(param1,param2);
         if(var_652 == null)
         {
            var_652 = new class_24();
         }
         linkTiles(param2);
         addFuseObjectsAndHeights(param2.fuseObjects);
      }
      
      private function addFuseObjectsAndHeights(param1:Array) : void
      {
         var _loc2_:Tile = null;
         for each(var _loc3_ in param1)
         {
            _loc2_ = getTileAt(_loc3_.x,_loc3_.y);
            if(_loc2_)
            {
               _loc2_.addFuseObject(_loc3_);
               checkAndAdjustNeighbouringTiles(_loc3_);
            }
         }
      }
      
      private function checkAndAdjustNeighbouringTiles(param1:FuseObjectData) : void
      {
         var _loc5_:Tile = null;
         var _loc2_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = param1.direction;
         var _loc3_:* = param1.xDimension;
         var _loc4_:* = param1.yDimension;
         if(_loc7_ == Direction8.E.intValue() || _loc7_ == Direction8.W.intValue())
         {
            _loc2_ = _loc3_;
            _loc3_ = _loc4_;
            _loc4_ = _loc2_;
         }
         _loc6_ = 1;
         while(_loc6_ < _loc3_)
         {
            if(_loc5_ = getTileAt(param1.x + _loc6_,param1.y))
            {
               _loc5_.addToHeight(param1.height);
               if(!param1.canStandOn)
               {
                  _loc5_.blocked = true;
               }
            }
            _loc6_++;
         }
         _loc6_ = 1;
         while(_loc6_ < _loc4_)
         {
            if(_loc5_ = getTileAt(param1.x,param1.y + _loc6_))
            {
               _loc5_.addToHeight(param1.height);
               if(!param1.canStandOn)
               {
                  _loc5_.blocked = true;
               }
            }
            _loc6_++;
         }
      }
      
      public function addGameObjectToTile(param1:SnowWarGameObject) : void
      {
         var _loc3_:Location3D = param1.location3D;
         var _loc2_:Tile = getTileAt(Tile.convertToTileX(_loc3_.x),Tile.convertToTileY(_loc3_.y));
         if(_loc2_)
         {
            _loc2_.addGameObject(param1);
         }
      }
      
      private function linkTiles(param1:GameLevelData) : void
      {
         var _loc7_:Tile = null;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc11_:Tile = null;
         var _loc6_:Tile = null;
         var _loc2_:Tile = null;
         var _loc3_:Tile = null;
         var _loc5_:Array = parseHeightMap(param1.heightMap,param1.width,param1.height);
         var _loc9_:int = param1.height;
         var _loc4_:int = param1.width;
         _tiles = [];
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            _tiles[_loc10_] = [];
            _loc8_ = 0;
            while(_loc8_ < _loc4_)
            {
               _tiles[_loc10_][_loc8_] = null;
               if(_loc5_[_loc10_][_loc8_] != 100000)
               {
                  _loc7_ = new Tile(_loc8_,_loc10_);
                  _tiles[_loc10_][_loc8_] = _loc7_;
                  if((_loc11_ = getTileAt(_loc8_ + 1,_loc10_ - 1)) != null)
                  {
                     _loc7_.linkTile(_loc11_,Direction8.NE);
                  }
                  if((_loc6_ = getTileAt(_loc8_,_loc10_ - 1)) != null)
                  {
                     _loc7_.linkTile(_loc6_,Direction8.N);
                  }
                  _loc2_ = getTileAt(_loc8_ - 1,_loc10_ - 1);
                  if(_loc2_ != null)
                  {
                     _loc7_.linkTile(_loc2_,Direction8.NW);
                  }
                  _loc3_ = getTileAt(_loc8_ - 1,_loc10_);
                  if(_loc3_ != null)
                  {
                     _loc7_.linkTile(_loc3_,Direction8.W);
                  }
               }
               _loc8_++;
            }
            _loc10_++;
         }
      }
      
      public function getTiles() : Array
      {
         return _tiles;
      }
      
      public function testCollisionWithGround(param1:class_3379) : Boolean
      {
         if(param1.location3D.z < 1)
         {
            return true;
         }
         var _loc3_:int = Tile.convertToTileX(param1.location3D.x);
         var _loc4_:int = Tile.convertToTileY(param1.location3D.y);
         var _loc2_:Tile = getTileAt(_loc3_,_loc4_);
         if(_loc2_)
         {
            return param1.location3D.z < _loc2_.height;
         }
         return false;
      }
      
      public function positionIsWalkable(param1:int, param2:int) : Boolean
      {
         var _loc4_:int = Tile.convertToTileX(param1);
         var _loc5_:int = Tile.convertToTileY(param2);
         var _loc3_:Tile = getTileAt(_loc4_,_loc5_);
         if(_loc3_)
         {
            return _loc3_.canMoveTo(null);
         }
         return false;
      }
      
      public function getTileAt(param1:int, param2:int) : Tile
      {
         if(param1 < 0 || param1 >= _tiles[0].length || param2 < 0 || param2 >= _tiles.length)
         {
            return null;
         }
         return _tiles[param2][param1];
      }
      
      private function parseHeightMap(param1:String, param2:int, param3:int) : Array
      {
         var _loc7_:int = 0;
         var _loc6_:String = null;
         var _loc8_:int = 0;
         var _loc4_:String = null;
         var _loc11_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = param1.split("\r");
         var _loc5_:* = [];
         _loc7_ = 0;
         while(_loc7_ < _loc10_.length)
         {
            _loc6_ = String(_loc10_[_loc7_]);
            _loc5_[_loc7_] = [];
            _loc8_ = _loc6_.length - 1;
            while(_loc8_ >= 0)
            {
               _loc4_ = _loc6_.charAt(_loc8_);
               _loc11_ = parseInt(_loc4_);
               if(!isNaN(parseInt(_loc4_)))
               {
                  _loc5_[_loc7_][_loc8_] = _loc11_;
               }
               else if(_loc4_ == "x")
               {
                  _loc5_[_loc7_][_loc8_] = 100000;
               }
               else
               {
                  _loc5_[_loc7_][_loc8_] = 10 + (_loc4_.charCodeAt(0) - "a".charCodeAt(0));
               }
               if(_loc5_[_loc7_][_loc8_] > _loc9_ && _loc5_[_loc7_][_loc8_] != 100000)
               {
                  _loc9_ = int(_loc5_[_loc7_][_loc8_]);
               }
               _loc8_--;
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      public function resetTiles() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Tile = null;
         if(_tiles && false)
         {
            _loc3_ = 0;
            while(_loc3_ < _tiles.length)
            {
               _loc1_ = 0;
               while(_loc1_ < (_tiles[0] as Array).length)
               {
                  _loc2_ = _tiles[_loc3_][_loc1_];
                  if(_loc2_)
                  {
                     _loc2_.removeGameObject();
                  }
                  _loc1_++;
               }
               _loc3_++;
            }
         }
      }
   }
}
