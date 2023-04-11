package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_11.class_1573;
   
   [SecureSWF(rename="true")]
   public class class_1087 implements IMessageParser
   {
       
      
      private var var_45:class_1573;
      
      public function class_1087()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_45 = new class_1573(param1);
         return true;
      }
      
      public function get data() : class_1573
      {
         return var_45;
      }
   }
}
