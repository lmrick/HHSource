package package_126
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1292 implements IMessageParser
   {
       
      
      private var var_1056:Boolean;
      
      public function class_1292()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1056 = param1.readBoolean();
         return true;
      }
      
      public function get allMuted() : Boolean
      {
         return var_1056;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
