package package_161
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1479 implements IMessageParser
   {
       
      
      private var _isOpen:Boolean;
      
      private var var_449:Boolean;
      
      private var _isAuthenticHabbo:Boolean;
      
      public function class_1479()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_449;
      }
      
      public function get isAuthenticHabbo() : Boolean
      {
         return _isAuthenticHabbo;
      }
      
      public function flush() : Boolean
      {
         _isOpen = false;
         var_449 = false;
         _isAuthenticHabbo = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _isOpen = param1.readBoolean();
         var_449 = param1.readBoolean();
         if(param1.bytesAvailable)
         {
            _isAuthenticHabbo = param1.readBoolean();
         }
         return true;
      }
   }
}
