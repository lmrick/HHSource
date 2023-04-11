package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_50.class_1637;
   
   [SecureSWF(rename="true")]
   public class class_1499 implements IMessageParser
   {
       
      
      private var var_45:class_1637;
      
      public function class_1499()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1637(param1);
         return true;
      }
      
      public function get data() : class_1637
      {
         return var_45;
      }
   }
}
