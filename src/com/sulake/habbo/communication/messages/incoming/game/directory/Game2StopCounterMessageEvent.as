package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2InArenaQueueMessageParser;
   import package_140.Game2StopCounterMessageParser;
   
   public class Game2StopCounterMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2StopCounterMessageEvent(param1:Function)
      {
         super(param1,Game2StopCounterMessageParser);
      }
      
      public function getParser() : Game2InArenaQueueMessageParser
      {
         return this.var_15 as Game2InArenaQueueMessageParser;
      }
   }
}
