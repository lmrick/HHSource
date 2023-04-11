package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_11.class_1630;
   
   [SecureSWF(rename="true")]
   public class class_1269 implements IMessageParser
   {
       
      
      private var var_45:class_1630;
      
      public function class_1269()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_45 = new class_1630(param1);
         return true;
      }
      
      public function get data() : class_1630
      {
         return var_45;
      }
   }
}
