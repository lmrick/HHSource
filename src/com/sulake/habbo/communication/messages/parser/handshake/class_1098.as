package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1098 implements IMessageParser
   {
       
      
      private var var_1109:String;
      
      private var var_720:String;
      
      public function class_1098()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1109 = param1.readString();
         var_720 = param1.readString();
         return true;
      }
      
      public function get encryptedPrime() : String
      {
         return var_1109;
      }
      
      public function get encryptedGenerator() : String
      {
         return var_720;
      }
   }
}
