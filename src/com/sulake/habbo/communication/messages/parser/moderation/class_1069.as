package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_50.class_1564;
   
   [SecureSWF(rename="true")]
   public class class_1069 implements IMessageParser
   {
       
      
      private var var_45:class_1564;
      
      public function class_1069()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1564(param1);
         return true;
      }
      
      public function get data() : class_1564
      {
         return var_45;
      }
   }
}
