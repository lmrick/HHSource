package package_135
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1418 implements IMessageParser
   {
       
      
      private var var_297:Boolean;
      
      public function class_1418()
      {
         super();
      }
      
      public function get success() : Boolean
      {
         return var_297;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_297 = param1.readBoolean();
         return true;
      }
   }
}
