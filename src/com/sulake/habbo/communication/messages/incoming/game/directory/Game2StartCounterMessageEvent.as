package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2StartCounterMessageParser;
   
   public class Game2StartCounterMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2StartCounterMessageEvent(param1:Function)
      {
         super(param1,Game2StartCounterMessageParser);
      }
      
      public function getParser() : Game2StartCounterMessageParser
      {
         return this.var_15 as Game2StartCounterMessageParser;
      }
   }
}
