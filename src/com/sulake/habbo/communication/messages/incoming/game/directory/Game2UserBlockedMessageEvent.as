package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.Game2UserBlockedMessageParser;
   
   public class Game2UserBlockedMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function Game2UserBlockedMessageEvent(param1:Function)
      {
         super(param1,Game2UserBlockedMessageParser);
      }
      
      public function getParser() : Game2UserBlockedMessageParser
      {
         return this.var_15 as Game2UserBlockedMessageParser;
      }
   }
}
