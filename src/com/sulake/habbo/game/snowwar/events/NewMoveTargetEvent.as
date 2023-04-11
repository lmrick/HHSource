package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   
   public class NewMoveTargetEvent extends class_3346
   {
       
      
      private var _humanGameObject:HumanGameObject;
      
      private var var_29:int;
      
      private var var_28:int;
      
      public function NewMoveTargetEvent(param1:HumanGameObject, param2:int, param3:int)
      {
         super();
         this._humanGameObject = param1;
         this.var_29 = param2;
         this.var_28 = param3;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _humanGameObject = null;
      }
      
      override public function apply(param1:class_3327) : void
      {
         _humanGameObject.changeMoveTarget(var_29,var_28);
      }
      
      public function get humanGameObject() : HumanGameObject
      {
         return _humanGameObject;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
   }
}
