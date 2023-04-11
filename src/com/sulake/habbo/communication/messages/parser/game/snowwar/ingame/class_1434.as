package package_182
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData;
   
   [SecureSWF(rename="true")]
   public class class_1434 implements IMessageParser
   {
       
      
      private var var_1304:FullGameStatusData;
      
      public function class_1434()
      {
         super();
      }
      
      public function get fullStatus() : FullGameStatusData
      {
         return var_1304;
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1304 = new FullGameStatusData(param1);
         return true;
      }
   }
}
