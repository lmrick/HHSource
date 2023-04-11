package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_28.class_1574;
   
   [SecureSWF(rename="true")]
   public class class_1192 implements IMessageParser
   {
       
      
      private var var_45:class_1574;
      
      public function class_1192()
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
         var_45 = new class_1574(param1);
         return true;
      }
      
      public function get data() : class_1574
      {
         return var_45;
      }
   }
}
