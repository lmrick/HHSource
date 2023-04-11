package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_5.class_1138;
   
   [SecureSWF(rename="true")]
   public class class_1512 implements IMessageParser
   {
       
      
      private var var_45:class_1138;
      
      public function class_1512()
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
         var_45 = new class_1138(param1);
         return true;
      }
      
      public function get data() : class_1138
      {
         return var_45;
      }
   }
}
