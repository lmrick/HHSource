package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
   
   [SecureSWF(rename="true")]
   public class class_1507 implements IMessageParser
   {
       
      
      private var var_171:Game2PlayerData;
      
      public function class_1507()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(var_171)
         {
            var_171.dispose();
            var_171 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_171 = new Game2PlayerData();
         var_171.parse(param1);
         return true;
      }
      
      public function get player() : Game2PlayerData
      {
         return var_171;
      }
   }
}
