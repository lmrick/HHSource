package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2GameCancelledMessageParser;
   
   public class Game2GameCancelledMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2GameCancelledMessageEvent(param1:Function)
      {
         super(param1,Game2GameCancelledMessageParser);
      }
      
      public function getParser() : Game2GameCancelledMessageParser
      {
         return this.var_15 as Game2GameCancelledMessageParser;
      }
   }
}
