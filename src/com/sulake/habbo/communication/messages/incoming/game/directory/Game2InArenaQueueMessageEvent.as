package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2InArenaQueueMessageParser;
   
   public class Game2InArenaQueueMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2InArenaQueueMessageEvent(param1:Function)
      {
         super(param1,Game2InArenaQueueMessageParser);
      }
      
      public function getParser() : Game2InArenaQueueMessageParser
      {
         return this.var_15 as Game2InArenaQueueMessageParser;
      }
   }
}
