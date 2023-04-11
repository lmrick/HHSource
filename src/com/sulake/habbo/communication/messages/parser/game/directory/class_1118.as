package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
   
   [SecureSWF(rename="true")]
   public class class_1118 implements IMessageParser
   {
       
      
      private var var_836:GameLobbyPlayerData;
      
      private var var_813:Boolean;
      
      public function class_1118()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_836 = new GameLobbyPlayerData(param1);
         var_813 = param1.readBoolean();
         return true;
      }
      
      public function get user() : GameLobbyPlayerData
      {
         return var_836;
      }
      
      public function get wasTeamSwitched() : Boolean
      {
         return var_813;
      }
   }
}
