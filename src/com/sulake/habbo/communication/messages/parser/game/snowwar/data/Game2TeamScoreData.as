package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Game2TeamScoreData
   {
       
      
      private var var_522:int;
      
      private var var_635:int;
      
      private var _players:Array;
      
      public function Game2TeamScoreData(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         super();
         var_635 = param1.readInteger();
         var_522 = param1.readInteger();
         _players = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _players.push(new Game2TeamPlayerData(var_635,param1));
            _loc3_++;
         }
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function get teamReference() : int
      {
         return var_635;
      }
      
      public function get players() : Array
      {
         return _players;
      }
   }
}
