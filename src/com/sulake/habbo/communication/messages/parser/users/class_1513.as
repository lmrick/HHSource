package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_5.class_1124;
   
   [SecureSWF(rename="true")]
   public class class_1513 implements IMessageParser
   {
       
      
      private var var_45:class_1124;
      
      public function class_1513()
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
         var_45 = new class_1124(param1);
         return true;
      }
      
      public function get data() : class_1124
      {
         return var_45;
      }
   }
}
