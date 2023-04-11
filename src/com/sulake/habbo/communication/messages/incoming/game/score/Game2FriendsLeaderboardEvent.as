package package_51
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_157.Game2LeaderboardParser;
   
   public class Game2FriendsLeaderboardEvent extends MessageEvent
   {
       
      
      public function Game2FriendsLeaderboardEvent(param1:Function)
      {
         super(param1,Game2LeaderboardParser);
      }
      
      public function getParser() : Game2LeaderboardParser
      {
         return this.var_15 as Game2LeaderboardParser;
      }
   }
}
