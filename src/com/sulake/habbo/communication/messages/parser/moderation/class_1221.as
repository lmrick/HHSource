package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1221 implements IMessageParser
   {
       
      
      private var var_357:String;
      
      public function class_1221()
      {
         super();
      }
      
      public function get message() : String
      {
         return var_357;
      }
      
      public function flush() : Boolean
      {
         var_357 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_357 = param1.readString();
         return true;
      }
   }
}
