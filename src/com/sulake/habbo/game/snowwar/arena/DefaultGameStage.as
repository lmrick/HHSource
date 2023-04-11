package com.sulake.habbo.game.snowwar.arena
{
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;
   
   public class DefaultGameStage implements class_3326
   {
       
      
      protected var var_1488:com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
      
      protected var var_1141:GameLevelData;
      
      private var var_311:Boolean = false;
      
      public function DefaultGameStage()
      {
         super();
      }
      
      public function dispose() : void
      {
         var_311 = true;
         var_1488 = null;
         var_1141 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function initialize(param1:com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena, param2:GameLevelData) : void
      {
         var_1488 = param1;
         var_1141 = param2;
      }
      
      public function get gameArena() : com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena
      {
         return var_1488;
      }
      
      public function get gameLevelData() : GameLevelData
      {
         return var_1141;
      }
      
      public function get roomType() : String
      {
         return "";
      }
   }
}
