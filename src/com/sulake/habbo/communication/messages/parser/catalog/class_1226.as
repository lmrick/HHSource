package package_128
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1226 implements IMessageParser
   {
       
      
      private var var_413:String = "";
      
      public function class_1226()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_413 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_413 = param1.readString();
         return true;
      }
      
      public function get errorCode() : String
      {
         return var_413;
      }
   }
}
