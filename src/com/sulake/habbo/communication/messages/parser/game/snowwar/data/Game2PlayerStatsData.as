package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Game2PlayerStatsData
   {
       
      
      private var var_522:int;
      
      private var var_923:int;
      
      private var var_1172:int;
      
      private var var_1237:int;
      
      private var var_1105:int;
      
      private var var_1263:int;
      
      private var var_717:int;
      
      private var var_808:int;
      
      private var var_922:int;
      
      private var var_1270:int;
      
      public function Game2PlayerStatsData(param1:IMessageDataWrapper)
      {
         super();
         var_522 = param1.readInteger();
         var_923 = param1.readInteger();
         var_1172 = param1.readInteger();
         var_1237 = param1.readInteger();
         var_1105 = param1.readInteger();
         var_1263 = param1.readInteger();
         var_717 = param1.readInteger();
         var_808 = param1.readInteger();
         var_922 = param1.readInteger();
         var_1270 = param1.readInteger();
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function get kills() : int
      {
         return var_923;
      }
      
      public function get deaths() : int
      {
         return var_1172;
      }
      
      public function get snowballHits() : int
      {
         return var_1237;
      }
      
      public function get snowballHitsTaken() : int
      {
         return var_1105;
      }
      
      public function get snowballsThrown() : int
      {
         return var_1263;
      }
      
      public function get snowballsCreated() : int
      {
         return var_717;
      }
      
      public function get snowballsFromMachine() : int
      {
         return var_808;
      }
      
      public function get friendlyHits() : int
      {
         return var_922;
      }
      
      public function get friendlyKills() : int
      {
         return var_1270;
      }
   }
}
