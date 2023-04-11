package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_8.class_1409;
   
   [SecureSWF(rename="true")]
   public class class_1055 implements IMessageParser
   {
       
      
      private var var_520:class_1409;
      
      public function class_1055()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_520 = new class_1409(param1);
         return true;
      }
      
      public function get offerData() : class_1409
      {
         return var_520;
      }
   }
}
