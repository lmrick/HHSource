package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2AccountGameStatusMessageParser;
   
   public class Game2AccountGameStatusMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2AccountGameStatusMessageEvent(param1:Function)
      {
         super(param1,Game2AccountGameStatusMessageParser);
      }
      
      public function getParser() : Game2AccountGameStatusMessageParser
      {
         return this.var_15 as Game2AccountGameStatusMessageParser;
      }
   }
}
