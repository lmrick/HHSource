package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class Game2UserBlockedMessageParser implements IMessageParser
   {
       
      
      private var var_456:int;
      
      public function Game2UserBlockedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_456 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_456 = param1.readInteger();
         return true;
      }
      
      public function get playerBlockLength() : int
      {
         return var_456;
      }
   }
}
