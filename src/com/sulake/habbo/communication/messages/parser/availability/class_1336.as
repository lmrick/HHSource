package package_161
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1336 implements IMessageParser
   {
       
      
      private var _isOpen:Boolean;
      
      private var var_465:int;
      
      public function class_1336()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      public function get minutesUntilChange() : int
      {
         return var_465;
      }
      
      public function flush() : Boolean
      {
         _isOpen = false;
         var_465 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _isOpen = param1.readInteger() > 0;
         var_465 = param1.readInteger();
         return true;
      }
   }
}
