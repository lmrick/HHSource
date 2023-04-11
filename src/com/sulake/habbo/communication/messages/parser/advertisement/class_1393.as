package package_124
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1393 implements IMessageParser
   {
       
      
      private var var_471:Boolean;
      
      public function class_1393()
      {
         super();
      }
      
      public function get canShowInterstitial() : Boolean
      {
         return var_471;
      }
      
      public function flush() : Boolean
      {
         var_471 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_471 = param1.readBoolean();
         return true;
      }
   }
}
