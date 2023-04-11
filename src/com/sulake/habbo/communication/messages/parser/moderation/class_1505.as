package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_50.class_1644;
   
   [SecureSWF(rename="true")]
   public class class_1505 implements IMessageParser
   {
       
      
      private var var_45:class_1644;
      
      public function class_1505()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1644(param1);
         return true;
      }
      
      public function get data() : class_1644
      {
         return var_45;
      }
   }
}
