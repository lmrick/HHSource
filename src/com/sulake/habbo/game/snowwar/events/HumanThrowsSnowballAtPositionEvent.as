package com.sulake.habbo.game.snowwar.events
{
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   
   public class HumanThrowsSnowballAtPositionEvent extends class_3346
   {
       
      
      private var var_2480:HumanGameObject;
      
      private var var_839:int;
      
      private var var_739:int;
      
      private var var_810:int;
      
      public function HumanThrowsSnowballAtPositionEvent(param1:HumanGameObject, param2:int, param3:int, param4:int)
      {
         super();
         this.var_2480 = param1;
         this.var_839 = param2;
         this.var_739 = param3;
         this.var_810 = param4;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2480 = null;
      }
      
      override public function apply(param1:class_3327) : void
      {
         human.throwSnowball(targetX,targetY);
         human.startThrowTimer();
         SnowWarEngine.playSound("HBSTG_snowwar_throw");
      }
      
      public function get human() : HumanGameObject
      {
         return var_2480;
      }
      
      public function get targetX() : int
      {
         return var_839;
      }
      
      public function get targetY() : int
      {
         return var_739;
      }
      
      public function get trajectory() : int
      {
         return var_810;
      }
   }
}
