package package_127
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1426 implements IMessageParser
   {
       
      
      private var _offerId:int;
      
      private var var_297:Boolean;
      
      public function class_1426()
      {
         super();
      }
      
      public function get success() : Boolean
      {
         return var_297;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _offerId = param1.readInteger();
         var_297 = param1.readBoolean();
         return true;
      }
   }
}
