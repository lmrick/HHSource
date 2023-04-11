package package_123
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1164 implements IMessageParser
   {
       
      
      private var _roomBeforeGame:int;
      
      public function class_1164()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomBeforeGame = param1.readInteger();
         return true;
      }
      
      public function get roomBeforeGame() : int
      {
         return _roomBeforeGame;
      }
   }
}
