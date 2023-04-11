package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class GameLobbyData
   {
       
      
      private var var_814:int;
      
      private var _levelName:String;
      
      private var var_378:int;
      
      private var var_530:int;
      
      private var _numberOfTeams:int;
      
      private var var_1098:int;
      
      private var var_1144:String;
      
      private var var_1195:int;
      
      private var _players:Array;
      
      public function GameLobbyData(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         _players = [];
         super();
         var_814 = param1.readInteger();
         _levelName = param1.readString();
         var_378 = param1.readInteger();
         var_530 = param1.readInteger();
         _numberOfTeams = param1.readInteger();
         var_1098 = param1.readInteger();
         var_1144 = param1.readString();
         var_1195 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _players.push(new GameLobbyPlayerData(param1));
            _loc3_++;
         }
      }
      
      public function get gameId() : int
      {
         return var_814;
      }
      
      public function get gameType() : int
      {
         return var_378;
      }
      
      public function get fieldType() : int
      {
         return var_530;
      }
      
      public function get numberOfTeams() : int
      {
         return _numberOfTeams;
      }
      
      public function get maximumPlayers() : int
      {
         return var_1098;
      }
      
      public function get owningPlayerName() : String
      {
         return var_1144;
      }
      
      public function get levelEntryId() : int
      {
         return var_1195;
      }
      
      public function get players() : Array
      {
         return _players;
      }
   }
}
