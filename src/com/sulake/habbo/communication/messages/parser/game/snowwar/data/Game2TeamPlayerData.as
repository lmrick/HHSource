package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Game2TeamPlayerData
   {
       
      
      private var var_339:int;
      
      private var _userName:String;
      
      private var var_522:int;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var var_723:com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerStatsData;
      
      private var var_905:int;
      
      private var var_507:Boolean;
      
      public function Game2TeamPlayerData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         var_905 = param1;
         _userName = param2.readString();
         var_339 = param2.readInteger();
         var_427 = param2.readString();
         var_122 = param2.readString();
         var_522 = param2.readInteger();
         var_723 = new com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerStatsData(param2);
         var_507 = false;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get score() : int
      {
         return var_522;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get playerStats() : com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerStatsData
      {
         return var_723;
      }
      
      public function get teamId() : int
      {
         return var_905;
      }
      
      public function get willRejoin() : Boolean
      {
         return var_507;
      }
      
      public function set willRejoin(param1:Boolean) : void
      {
         var_507 = param1;
      }
   }
}
