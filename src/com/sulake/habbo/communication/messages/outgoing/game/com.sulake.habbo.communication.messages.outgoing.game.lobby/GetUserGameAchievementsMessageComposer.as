package package_30
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetUserGameAchievementsMessageComposer implements IMessageComposer
   {
       
      
      private var var_512:int;
      
      public function GetUserGameAchievementsMessageComposer(param1:int)
      {
         super();
         var_512 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_512];
      }
      
      public function dispose() : void
      {
      }
   }
}
