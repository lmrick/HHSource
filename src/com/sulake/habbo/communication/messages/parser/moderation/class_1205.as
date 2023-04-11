package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_50.class_1561;
   
   [SecureSWF(rename="true")]
   public class class_1205 implements IMessageParser
   {
       
      
      private var var_45:class_1561;
      
      public function class_1205()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1561(param1);
         return true;
      }
      
      public function get data() : class_1561
      {
         return var_45;
      }
   }
}
