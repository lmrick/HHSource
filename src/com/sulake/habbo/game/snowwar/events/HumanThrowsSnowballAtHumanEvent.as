package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   
   public class HumanThrowsSnowballAtHumanEvent extends class_3346
   {
       
      
      private var var_2480:HumanGameObject;
      
      private var var_2659:HumanGameObject;
      
      private var var_810:int;
      
      public function HumanThrowsSnowballAtHumanEvent(param1:HumanGameObject, param2:HumanGameObject, param3:int)
      {
         super();
         var_2480 = param1;
         var_2659 = param2;
         var_810 = param3;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2480 = null;
         var_2659 = null;
         var_810 = 0;
      }
      
      override public function apply(param1:class_3327) : void
      {
         human.throwSnowball(var_2659.currentLocation.x,var_2659.currentLocation.y);
         human.startThrowTimer();
         SnowWarEngine.playSound("HBSTG_snowwar_throw");
      }
      
      public function get human() : HumanGameObject
      {
         return var_2480;
      }
      
      public function get targetHuman() : HumanGameObject
      {
         return var_2659;
      }
      
      public function get trajectory() : int
      {
         return var_810;
      }
   }
}
