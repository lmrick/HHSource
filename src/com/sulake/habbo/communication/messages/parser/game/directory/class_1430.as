package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
   
   [SecureSWF(rename="true")]
   public class class_1430 implements IMessageParser
   {
       
      
      private var var_491:GameLobbyData;
      
      public function class_1430()
      {
         super();
      }
      
      public function get lobbyData() : GameLobbyData
      {
         return var_491;
      }
      
      public function flush() : Boolean
      {
         var_491 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_491 = new GameLobbyData(param1);
         return true;
      }
   }
}
