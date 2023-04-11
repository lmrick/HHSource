package package_182
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData;
   
   [SecureSWF(rename="true")]
   public class class_1455 implements IMessageParser
   {
       
      
      private var _status:GameStatusData;
      
      public function class_1455()
      {
         super();
      }
      
      public function get status() : GameStatusData
      {
         return _status;
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _status = new GameStatusData(param1);
         return true;
      }
   }
}
