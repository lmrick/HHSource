package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_5.class_1126;
   
   [SecureSWF(rename="true")]
   public class class_1106 implements IMessageParser
   {
       
      
      private var var_45:class_1126;
      
      public function class_1106()
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
         var_45 = new class_1126(param1);
         return true;
      }
      
      public function get data() : class_1126
      {
         return var_45;
      }
   }
}
