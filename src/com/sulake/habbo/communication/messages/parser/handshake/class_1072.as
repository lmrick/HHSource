package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1072 implements IMessageParser
   {
       
      
      private var var_1338:Boolean;
      
      public function class_1072()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1338 = param1.readBoolean();
         return true;
      }
      
      public function get isFirstLoginOfDay() : Boolean
      {
         return var_1338;
      }
   }
}
