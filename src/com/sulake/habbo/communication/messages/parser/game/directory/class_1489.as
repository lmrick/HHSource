package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
   
   [SecureSWF(rename="true")]
   public class class_1489 implements IMessageParser
   {
       
      
      private var var_746:GameLobbyData;
      
      public function class_1489()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_746 = new GameLobbyData(param1);
         return true;
      }
      
      public function get gameLobbyData() : GameLobbyData
      {
         return var_746;
      }
   }
}
