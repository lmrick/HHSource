package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Game2SnowWarGameStats
   {
       
      
      private var var_1292:int;
      
      private var var_1123:int;
      
      public function Game2SnowWarGameStats(param1:IMessageDataWrapper)
      {
         super();
         var_1292 = param1.readInteger();
         var_1123 = param1.readInteger();
      }
      
      public function get playerWithMostKills() : int
      {
         return var_1292;
      }
      
      public function get playerWithMostHits() : int
      {
         return var_1123;
      }
   }
}
