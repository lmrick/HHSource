package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_83.class_1605;
   
   [SecureSWF(rename="true")]
   public class class_1155 implements IMessageParser
   {
       
      
      private var var_363:class_1605;
      
      public function class_1155()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_363 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_363 = new class_1605(param1);
         return true;
      }
      
      public function get quest() : class_1605
      {
         return var_363;
      }
   }
}
