package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   
   public class HumanStartsToMakeASnowballEvent extends class_3346
   {
       
      
      private var var_2480:HumanGameObject;
      
      public function HumanStartsToMakeASnowballEvent(param1:HumanGameObject)
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
         var_2480.startMakingSnowball();
      }
      
      public function get human() : HumanGameObject
      {
         return var_2480;
      }
   }
}
