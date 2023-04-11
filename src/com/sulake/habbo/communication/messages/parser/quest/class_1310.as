package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1567;
   
   [SecureSWF(rename="true")]
   public class class_1310 implements IMessageParser
   {
       
      
      private var var_45:class_1567;
      
      public function class_1310()
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
         var_45 = new class_1567(param1);
         return true;
      }
      
      public function get data() : class_1567
      {
         return var_45;
      }
   }
}
