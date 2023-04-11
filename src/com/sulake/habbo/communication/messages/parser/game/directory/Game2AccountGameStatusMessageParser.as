package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class Game2AccountGameStatusMessageParser implements IMessageParser
   {
       
      
      private var var_512:int;
      
      private var var_607:int;
      
      private var var_926:int;
      
      public function Game2AccountGameStatusMessageParser()
      {
         super();
      }
      
      public function get gameTypeId() : int
      {
         return var_512;
      }
      
      public function get freeGamesLeft() : int
      {
         return var_607;
      }
      
      public function get gamesPlayedTotal() : int
      {
         return var_926;
      }
      
      public function get hasUnlimitedGames() : Boolean
      {
         return var_607 == -1;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_512 = param1.readInteger();
         var_607 = param1.readInteger();
         var_926 = param1.readInteger();
         return true;
      }
   }
}
