package package_147
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1346 implements IMessageParser
   {
       
      
      private var var_330:String = "";
      
      public function class_1346()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_330 = param1.readString();
         return true;
      }
      
      public function get messageText() : String
      {
         return var_330;
      }
   }
}
