package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1460 implements IMessageParser
   {
       
      
      private var var_560:Boolean;
      
      public function class_1460()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_560 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_560 = param1.readBoolean();
         return true;
      }
      
      public function get enabled() : Boolean
      {
         return var_560;
      }
   }
}
