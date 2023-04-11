package package_157
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class Game2LeaderboardParser implements IMessageParser
   {
       
      
      private var var_512:int;
      
      private var var_287:Array;
      
      private var var_453:int;
      
      public function Game2LeaderboardParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_512 = -1;
         var_287 = null;
         var_453 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_287 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_287.push(new class_1619(param1));
            _loc3_++;
         }
         var_453 = param1.readInteger();
         var_512 = param1.readInteger();
         return true;
      }
      
      public function get gameTypeId() : int
      {
         return var_512;
      }
      
      public function get leaderboard() : Array
      {
         return var_287;
      }
      
      public function get totalListSize() : int
      {
         return var_453;
      }
   }
}
