package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;
   
   [SecureSWF(rename="true")]
   public class class_1437 implements IMessageParser
   {
       
      
      private var var_378:int;
      
      private var var_530:int;
      
      private var _numberOfTeams:int;
      
      private var _players:Array;
      
      private var var_1141:GameLevelData;
      
      public function class_1437()
      {
         super();
         _players = [];
      }
      
      public function flush() : Boolean
      {
         var_378 = -1;
         var_530 = -1;
         _numberOfTeams = -1;
         for each(var _loc1_ in _players)
         {
            _loc1_.dispose();
         }
         _players = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Game2PlayerData = null;
         var_378 = param1.readInteger();
         var_530 = param1.readInteger();
         _numberOfTeams = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = new Game2PlayerData()).parse(param1);
            _players.push(_loc4_);
            _loc3_++;
         }
         var_1141 = new GameLevelData(param1);
         return true;
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
      
      public function get players() : Array
      {
         return _players;
      }
      
      public function get gameLevel() : GameLevelData
      {
         return var_1141;
      }
   }
}
