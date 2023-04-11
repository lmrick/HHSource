package com.sulake.habbo.game.snowwar.gameobjects
{
   import com.sulake.core.runtime.exceptions.Exception;
   import com.sulake.habbo.game.snowwar.Tile;
   import com.sulake.habbo.game.snowwar.class_3328;
   import com.sulake.habbo.game.snowwar.utils.Direction8;
   import package_185.SnowballMachineGameObjectData;
   
   public class SnowballMachineGameObject extends SnowballGivingGameObject
   {
      
      public static var BOUNDING_DATA:Array = [1200];
       
      
      private var _maxSnowballs:int;
      
      private var _currentDirection:Direction8;
      
      public function SnowballMachineGameObject(param1:SnowballMachineGameObjectData, param2:class_3328)
      {
         super(param1.id,param1.snowballCount,param2.getTileAt(Tile.convertToTileX(param1.locationX3D),Tile.convertToTileY(param1.locationY3D)),param1.fuseObjectId);
         _maxSnowballs = param1.maxSnowballs;
         _currentDirection = Direction8.getDirection8(param1.direction);
         param2.addGameObjectToTile(this);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _currentDirection = null;
      }
      
      override public function get numberOfVariables() : int
      {
         return 8;
      }
      
      override public function getVariable(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 4;
            case 1:
               return var_1785;
            case 2:
               return var_1498.location.x;
            case 3:
               return var_1498.location.y;
            case 4:
               return _currentDirection.intValue();
            case 5:
               return _maxSnowballs;
            case 6:
               return var_1568;
            case 7:
               return var_3232;
            default:
               throw new Exception("No such variable:" + param1);
         }
      }
      
      override public function get boundingData() : Array
      {
         return BOUNDING_DATA;
      }
      
      public function createSnowball() : void
      {
         if(var_1568 < _maxSnowballs)
         {
            var_1568++;
         }
      }
   }
}
