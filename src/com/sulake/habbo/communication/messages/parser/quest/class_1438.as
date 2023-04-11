package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1438 implements IMessageParser
   {
       
      
      private var var_1028:Boolean;
      
      public function class_1438()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1028 = param1.readBoolean();
         return true;
      }
      
      public function get expired() : Boolean
      {
         return var_1028;
      }
   }
}
