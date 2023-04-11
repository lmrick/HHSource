package package_145
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1213 implements IMessageParser
   {
       
      
      private var var_90:String;
      
      public function class_1213()
      {
         super();
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function flush() : Boolean
      {
         var_90 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_90 = param1.readString();
         return true;
      }
   }
}
