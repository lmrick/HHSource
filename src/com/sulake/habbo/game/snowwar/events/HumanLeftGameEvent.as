package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   
   public class HumanLeftGameEvent extends class_3346
   {
       
      
      private var var_2480:HumanGameObject;
      
      public function HumanLeftGameEvent(param1:HumanGameObject)
      {
         super();
         var_2480 = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2480 = null;
      }
      
      override public function apply(param1:class_3327) : void
      {
         param1.putGameObjectOnDeleteList(var_2480);
         var_2480.onRemove();
      }
   }
}
