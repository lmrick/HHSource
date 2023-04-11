package package_51
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_157.class_1375;
   
   public class WeeklyGameRewardEvent extends MessageEvent
   {
       
      
      public function WeeklyGameRewardEvent(param1:Function)
      {
         super(param1,class_1375);
      }
      
      public function getParser() : class_1375
      {
         return this.var_15 as class_1375;
      }
   }
}
