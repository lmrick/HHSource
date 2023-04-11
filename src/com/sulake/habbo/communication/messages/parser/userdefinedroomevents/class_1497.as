package package_143
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_79.class_1592;
   
   [SecureSWF(rename="true")]
   public class class_1497 implements IMessageParser
   {
       
      
      private var var_402:class_1592;
      
      public function class_1497()
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
         var_402 = new class_1592(param1);
         return true;
      }
      
      public function get def() : class_1592
      {
         return var_402;
      }
   }
}
