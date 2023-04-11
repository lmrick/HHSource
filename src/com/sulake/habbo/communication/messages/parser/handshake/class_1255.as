package package_133
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1255 implements IMessageParser
   {
       
      
      private var var_1126:String;
      
      private var var_1220:Boolean = false;
      
      public function class_1255()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1126 = param1.readString();
         if(param1.bytesAvailable)
         {
            var_1220 = param1.readBoolean();
         }
         return true;
      }
      
      public function get encryptedPublicKey() : String
      {
         return var_1126;
      }
      
      public function get serverClientEncryption() : Boolean
      {
         return var_1220;
      }
   }
}
