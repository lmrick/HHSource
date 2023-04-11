package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1469 implements IMessageParser
   {
       
      
      private var var_231:String;
      
      public function class_1469()
      {
         super();
         var_231 = "";
      }
      
      public function flush() : Boolean
      {
         var_231 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_231 = param1.readString();
         return true;
      }
      
      public function get machineID() : String
      {
         return var_231;
      }
   }
}
