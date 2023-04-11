package package_51
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_157.class_1483;
   
   public class WeeklyGameRewardWinnersEvent extends MessageEvent
   {
       
      
      public function WeeklyGameRewardWinnersEvent(param1:Function)
      {
         super(param1,class_1483);
      }
      
      public function getParser() : class_1483
      {
         return this.var_15 as class_1483;
      }
   }
}
