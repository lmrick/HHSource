package package_177
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1354 implements IMessageParser
   {
       
      
      private var var_683:Boolean;
      
      public function class_1354()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_683 = param1.readBoolean();
         return true;
      }
      
      public function get acknowledged() : Boolean
      {
         return var_683;
      }
   }
}
