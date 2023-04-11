package package_164
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_78.class_1622;
   
   [SecureSWF(rename="true")]
   public class class_1143 implements IMessageParser
   {
       
      
      private var var_569:class_1622;
      
      public function class_1143()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_569 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_569 = new class_1622(param1);
         return true;
      }
      
      public function get chatSettings() : class_1622
      {
         return var_569;
      }
   }
}
