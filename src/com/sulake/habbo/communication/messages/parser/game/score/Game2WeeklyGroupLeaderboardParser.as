package package_157
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Game2WeeklyGroupLeaderboardParser extends Game2LeaderboardParser
   {
       
      
      private var var_364:int;
      
      private var var_447:int;
      
      private var _maxOffset:int;
      
      private var var_393:int;
      
      private var var_361:int;
      
      private var var_336:int;
      
      public function Game2WeeklyGroupLeaderboardParser()
      {
         super();
      }
      
      public function get year() : int
      {
         return var_364;
      }
      
      public function get week() : int
      {
         return var_447;
      }
      
      public function get maxOffset() : int
      {
         return _maxOffset;
      }
      
      public function get currentOffset() : int
      {
         return var_393;
      }
      
      public function get minutesUntilReset() : int
      {
         return var_361;
      }
      
      public function get favouriteGroupId() : int
      {
         return var_336;
      }
      
      override public function flush() : Boolean
      {
         var_364 = -1;
         var_447 = -1;
         _maxOffset = -1;
         var_393 = -1;
         var_361 = -1;
         var_336 = -1;
         return super.flush();
      }
      
      override public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_364 = param1.readInteger();
         var_447 = param1.readInteger();
         _maxOffset = param1.readInteger();
         var_393 = param1.readInteger();
         var_361 = param1.readInteger();
         super.parse(param1);
         var_336 = param1.readInteger();
         return true;
      }
   }
}
