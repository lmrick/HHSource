package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1219 implements IMessageParser
   {
       
      
      private var _expiryTime:int;
      
      public function class_1219()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _expiryTime = param1.readInteger();
         return true;
      }
      
      public function get expiryTime() : int
      {
         return _expiryTime;
      }
   }
}
