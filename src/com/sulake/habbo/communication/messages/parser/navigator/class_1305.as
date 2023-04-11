package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_11.class_1639;
   
   [SecureSWF(rename="true")]
   public class class_1305 implements IMessageParser
   {
       
      
      private var var_45:class_1639;
      
      public function class_1305()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1639(param1);
         return true;
      }
      
      public function get data() : class_1639
      {
         return var_45;
      }
   }
}
