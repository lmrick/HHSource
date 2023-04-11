package package_130
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1485 implements IMessageParser
   {
      
      public static const const_109:int = 0;
      
      public static const const_284:int = 1;
       
      
      private var _status:int;
      
      public function class_1485()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _status = param1.readInteger();
         return true;
      }
      
      public function get status() : int
      {
         return _status;
      }
   }
}
