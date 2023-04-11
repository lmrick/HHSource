package package_140
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class Game2InArenaQueueMessageParser implements IMessageParser
   {
       
      
      private var _position:int;
      
      public function Game2InArenaQueueMessageParser()
      {
         super();
      }
      
      public function get position() : int
      {
         return _position;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _position = param1.readInteger();
         return true;
      }
   }
}
