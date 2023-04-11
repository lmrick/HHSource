package package_143
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_79.class_1593;
   
   [SecureSWF(rename="true")]
   public class class_1078 implements IMessageParser
   {
       
      
      private var var_402:class_1593;
      
      public function class_1078()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_402 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_402 = new class_1593(param1);
         return true;
      }
      
      public function get def() : class_1593
      {
         return var_402;
      }
   }
}
