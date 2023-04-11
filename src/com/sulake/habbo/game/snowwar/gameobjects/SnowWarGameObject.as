package com.sulake.habbo.game.snowwar.gameobjects
{
   import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameObject;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.class_3328;
   import com.sulake.habbo.game.snowwar.utils.CollisionDetection;
   import com.sulake.habbo.game.snowwar.utils.Direction360;
   import com.sulake.habbo.game.snowwar.utils.Location3D;
   import com.sulake.habbo.game.snowwar.utils.class_3379;
   
   public class SnowWarGameObject implements ISynchronizedGameObject, class_3379
   {
       
      
      protected var _active:Boolean = false;
      
      protected var var_1785:int = -1;
      
      protected var var_3428:Boolean = false;
      
      private var var_311:Boolean = false;
      
      public function SnowWarGameObject(param1:int, param2:Boolean)
      {
         super();
         var_1785 = param2 ? -param1 : param1;
         var_3428 = param2;
      }
      
      public function dispose() : void
      {
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get isActive() : Boolean
      {
         return _active;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      public function get numberOfVariables() : int
      {
         return -1;
      }
      
      public function getVariable(param1:int) : int
      {
         return -1;
      }
      
      public function get gameObjectId() : int
      {
         return var_1785;
      }
      
      public function set gameObjectId(param1:int) : void
      {
         var_1785 = param1;
      }
      
      public function subturn(param1:class_3327) : void
      {
      }
      
      public function get boundingType() : int
      {
         return 0;
      }
      
      public function get boundingData() : Array
      {
         return null;
      }
      
      public function get location3D() : Location3D
      {
         return null;
      }
      
      public function get direction360() : Direction360
      {
         return null;
      }
      
      public function get isGhost() : Boolean
      {
         return var_3428;
      }
      
      public function get ghostObjectId() : int
      {
         return -(var_1785 + 1);
      }
      
      public function onRemove() : void
      {
      }
      
      public function get collisionHeight() : int
      {
         return boundingData[0];
      }
      
      public function testSnowBallCollision(param1:SnowBallGameObject) : Boolean
      {
         return param1.location3D.z < collisionHeight && CollisionDetection.testForObjectToObjectCollision(this,param1);
      }
      
      public function onSnowBallHit(param1:class_3328, param2:SnowBallGameObject) : void
      {
      }
   }
}
