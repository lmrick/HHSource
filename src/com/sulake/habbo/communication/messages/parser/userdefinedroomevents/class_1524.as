package package_143
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1524 implements IMessageParser
   {
       
      
      private var var_1089:String;
      
      public function class_1524()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1089 = param1.readString();
         return true;
      }
      
      public function get info() : String
      {
         return var_1089;
      }
   }
}
