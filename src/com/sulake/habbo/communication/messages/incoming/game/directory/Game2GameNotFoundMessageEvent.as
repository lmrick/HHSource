package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2GameNotFoundMessageParser;
   
   public class Game2GameNotFoundMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2GameNotFoundMessageEvent(param1:Function)
      {
         super(param1,Game2GameNotFoundMessageParser);
      }
      
      public function getParser() : Game2GameNotFoundMessageParser
      {
         return this.var_15 as Game2GameNotFoundMessageParser;
      }
   }
}
