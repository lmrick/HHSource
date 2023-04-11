package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1571;
   
   [SecureSWF(rename="true")]
   public class class_1073 implements IMessageParser
   {
       
      
      private var var_45:class_1571;
      
      public function class_1073()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_45 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1571(param1);
         return true;
      }
      
      public function get data() : class_1571
      {
         return var_45;
      }
   }
}
