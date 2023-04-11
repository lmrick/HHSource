package package_139
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1096 implements IMessageParser
   {
       
      
      private var var_450:String;
      
      public function class_1096()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_450 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_450 = param1.readString();
         return true;
      }
      
      public function get imageUri() : String
      {
         return var_450;
      }
   }
}
