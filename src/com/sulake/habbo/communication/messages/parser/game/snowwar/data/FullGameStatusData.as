package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FullGameStatusData
   {
       
      
      private var var_982:int;
      
      private var var_957:int;
      
      private var var_652:com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData;
      
      private var _numberOfTeams:int;
      
      private var var_1041:com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData;
      
      public function FullGameStatusData(param1:IMessageDataWrapper)
      {
         super();
         parse(param1);
      }
      
      public function get remainingTimeSeconds() : int
      {
         return var_982;
      }
      
      public function get durationInSeconds() : int
      {
         return var_957;
      }
      
      public function get gameObjects() : com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData
      {
         return var_652;
      }
      
      public function get numberOfTeams() : int
      {
         return _numberOfTeams;
      }
      
      public function get gameStatus() : com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData
      {
         return var_1041;
      }
      
      public function parse(param1:IMessageDataWrapper) : void
      {
         param1.readInteger();
         var_982 = param1.readInteger();
         var_957 = param1.readInteger();
         var_652 = new com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData(param1);
         param1.readInteger();
         _numberOfTeams = param1.readInteger();
         var_1041 = new com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData(param1);
      }
   }
}
