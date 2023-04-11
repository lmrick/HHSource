package com.sulake.habbo.game.snowwar.gameobjects
{
   import com.sulake.core.runtime.exceptions.Exception;
   import com.sulake.habbo.game.snowwar.Tile;
   import com.sulake.habbo.game.snowwar.class_3328;
   import package_185.SnowballPileGameObjectData;
   
   public class SnowballPileGameObject extends SnowballGivingGameObject
   {
      
      private static const BOUNDING_DATA_PER_SNOWBALL:int = 100;
       
      
      private var var_3404:Array;
      
      private var _maxSnowballs:int;
      
      public function SnowballPileGameObject(param1:SnowballPileGameObjectData, param2:class_3328)
      {
         super(param1.id,param1.snowballCount,param2.getTileAt(Tile.convertToTileX(param1.locationX3D),Tile.convertToTileY(param1.locationY3D)),param1.fuseObjectId);
         _maxSnowballs = param1.maxSnowballs;
         if(var_1568 > 0)
         {
            param2.addGameObjectToTile(this);
         }
         var_3404 = [var_1568 * 100];
      }
      
      override public function get numberOfVariables() : int
      {
         return 7;
      }
      
      override public function getVariable(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 3;
            case 1:
               return var_1785;
            case 2:
               return var_1498.location.x;
            case 3:
               return var_1498.location.y;
            case 4:
               return _maxSnowballs;
            case 5:
               return var_1568;
            case 6:
               return var_3232;
            default:
               throw new Exception("No such variable:" + param1);
         }
      }
      
      override public function get boundingData() : Array
      {
         return var_3404;
      }
      
      override protected function onSnowballPickup() : void
      {
         var_3404 = [var_1568 * 100];
         if(var_1568 <= 0)
         {
            var_1498.removeGameObject();
         }
      }
      
      public function get maxSnowballs() : int
      {
         return _maxSnowballs;
      }
   }
}
