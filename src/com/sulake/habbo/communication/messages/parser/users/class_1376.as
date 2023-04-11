package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1376 implements IMessageParser
   {
       
      
      private var var_365:String;
      
      public function class_1376()
      {
         super();
      }
      
      public function get link() : String
      {
         return var_365;
      }
      
      public function flush() : Boolean
      {
         var_365 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_365 = param1.readString();
         return true;
      }
   }
}
