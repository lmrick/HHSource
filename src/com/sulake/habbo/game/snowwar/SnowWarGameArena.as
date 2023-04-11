package com.sulake.habbo.game.snowwar
{
   import com.sulake.habbo.game.snowwar.arena.IGameArenaExtension;
   import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
   import com.sulake.habbo.game.snowwar.arena.class_3326;
   
   public class SnowWarGameArena implements IGameArenaExtension
   {
       
      
      private var var_1488:SynchronizedGameArena;
      
      private var var_311:Boolean = false;
      
      public function SnowWarGameArena()
      {
         super();
      }
      
      public function dispose() : void
      {
         var_311 = true;
         var_1488 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function set gameArena(param1:SynchronizedGameArena) : void
      {
         var_1488 = param1;
      }
      
      public function getPulseInterval() : int
      {
         return 50;
      }
      
      public function getNumberOfSubTurns() : int
      {
         return 3;
      }
      
      public function createGameStage() : class_3326
      {
         return new class_3328();
      }
      
      public function pulse() : void
      {
      }
      
      public function isDeathMatch() : Boolean
      {
         return false;
      }
   }
}
