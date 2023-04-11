package com.sulake.habbo.game.snowwar.utils
{
   import com.sulake.habbo.game.snowwar.arena.IGameObject;
   
   public class AbstractAStarNode implements com.sulake.habbo.game.snowwar.utils.class_3347
   {
       
      
      private var _referenceNumber:int = -1;
      
      private var _nodeDirection8:com.sulake.habbo.game.snowwar.utils.Direction8;
      
      private var var_3574:com.sulake.habbo.game.snowwar.utils.class_3347;
      
      private var var_3138:int;
      
      private var var_2982:int;
      
      private var var_311:Boolean = false;
      
      public function AbstractAStarNode()
      {
         super();
      }
      
      public function dispose() : void
      {
         _nodeDirection8 = null;
         var_3574 = null;
         var_3138 = 0;
         var_2982 = 0;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get nodeDirection() : com.sulake.habbo.game.snowwar.utils.Direction8
      {
         return _nodeDirection8;
      }
      
      public function set nodeDirection(param1:com.sulake.habbo.game.snowwar.utils.Direction8) : void
      {
         _nodeDirection8 = param1;
      }
      
      public function get parentNode() : com.sulake.habbo.game.snowwar.utils.class_3347
      {
         return var_3574;
      }
      
      public function set parentNode(param1:com.sulake.habbo.game.snowwar.utils.class_3347) : void
      {
         this.var_3574 = param1;
      }
      
      public function get nodeCostToGoal() : int
      {
         return var_3138;
      }
      
      public function set nodeCostToGoal(param1:int) : void
      {
         this.var_3138 = param1;
      }
      
      public function get nodeCostFromStart() : int
      {
         return var_2982;
      }
      
      public function set nodeCostFromStart(param1:int) : void
      {
         this.var_2982 = param1;
      }
      
      public function compareTo(param1:class_3348) : int
      {
         var _loc3_:int = var_2982 + var_3138;
         var _loc2_:int = param1.var_2982 + param1.var_3138;
         if(_loc3_ < _loc2_)
         {
            return -1;
         }
         if(_loc3_ > _loc2_)
         {
            return 1;
         }
         return 0;
      }
      
      public function distanceTo(param1:com.sulake.habbo.game.snowwar.utils.class_3347) : int
      {
         return 0;
      }
      
      public function directionTo(param1:com.sulake.habbo.game.snowwar.utils.class_3347) : com.sulake.habbo.game.snowwar.utils.Direction8
      {
         return null;
      }
      
      public function getNodeAt(param1:com.sulake.habbo.game.snowwar.utils.Direction8) : com.sulake.habbo.game.snowwar.utils.class_3347
      {
         return null;
      }
      
      public function directionIsBlocked(param1:com.sulake.habbo.game.snowwar.utils.Direction8, param2:IGameObject) : Boolean
      {
         return false;
      }
      
      public function getPathCost(param1:com.sulake.habbo.game.snowwar.utils.Direction8, param2:IGameObject) : int
      {
         return 0;
      }
   }
}
