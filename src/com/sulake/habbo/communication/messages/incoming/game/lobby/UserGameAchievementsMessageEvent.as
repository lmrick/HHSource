package package_66
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_173.UserGameAchievementsMessageParser;
   
   public class UserGameAchievementsMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function UserGameAchievementsMessageEvent(param1:Function)
      {
         super(param1,UserGameAchievementsMessageParser);
      }
      
      public function getParser() : UserGameAchievementsMessageParser
      {
         return this.var_15 as UserGameAchievementsMessageParser;
      }
   }
}
