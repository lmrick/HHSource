package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class GameLobbyPlayerData
   {
      
      public static var var_1388:Function = comparePlayersByTotalScore;
      
      public static var var_1370:Function = comparePlayersBySkillLevel;
       
      
      private var var_339:int;
      
      private var _name:String;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var var_905:int;
      
      private var var_851:int;
      
      private var var_1180:int;
      
      private var var_925:int;
      
      public function GameLobbyPlayerData(param1:IMessageDataWrapper)
      {
         super();
         var_339 = param1.readInteger();
         _name = param1.readString();
         var_427 = param1.readString();
         var_122 = param1.readString();
         var_905 = param1.readInteger();
         var_851 = param1.readInteger();
         var_1180 = param1.readInteger();
         var_925 = param1.readInteger();
      }
      
      private static function comparePlayersByTotalScore(param1:GameLobbyPlayerData, param2:GameLobbyPlayerData) : Number
      {
         var _loc3_:int = param1.totalScore;
         var _loc4_:int = param2.totalScore;
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         if(_loc3_ == _loc4_)
         {
            return 0;
         }
         return -1;
      }
      
      private static function comparePlayersBySkillLevel(param1:GameLobbyPlayerData, param2:GameLobbyPlayerData) : Number
      {
         var _loc4_:int = param1.skillLevel;
         var _loc3_:int = param2.skillLevel;
         if(_loc4_ < _loc3_)
         {
            return 1;
         }
         if(_loc4_ == _loc3_)
         {
            return 0;
         }
         return -1;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get teamId() : int
      {
         return var_905;
      }
      
      public function get skillLevel() : int
      {
         return var_851;
      }
      
      public function get totalScore() : int
      {
         return var_1180;
      }
      
      public function get scoreToNextLevel() : int
      {
         return var_925;
      }
   }
}
