package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamScoreData;
   
   [SecureSWF(rename="true")]
   public class class_1161 implements IMessageParser
   {
       
      
      private var var_359:int;
      
      private var _teams:Array;
      
      private var var_1335:Array;
      
      private var var_714:Game2SnowWarGameStats;
      
      private var var_1115:Game2GameResult;
      
      public function class_1161()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_359 = -1;
         _teams = [];
         var_1335 = [];
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_359 = param1.readInteger();
         var_1115 = new Game2GameResult(param1);
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _teams.push(new Game2TeamScoreData(param1));
            _loc3_++;
         }
         var_714 = new Game2SnowWarGameStats(param1);
         return true;
      }
      
      public function get timeToNextState() : int
      {
         return var_359;
      }
      
      public function get teams() : Array
      {
         return _teams;
      }
      
      public function get teamScores() : Array
      {
         return var_1335;
      }
      
      public function get gameResult() : Game2GameResult
      {
         return var_1115;
      }
      
      public function get generalStats() : Game2SnowWarGameStats
      {
         return var_714;
      }
   }
}
