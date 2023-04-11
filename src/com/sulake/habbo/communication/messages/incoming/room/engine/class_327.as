package package_17
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_154.class_1198;
   
   [SecureSWF(rename="true")]
   public class class_327 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_327(param1:Function)
      {
         super(param1,class_1198);
      }
      
      public function get id() : int
      {
         return (var_15 as class_1198).id;
      }
      
      public function get figure() : String
      {
         return (var_15 as class_1198).figure;
      }
      
      public function get sex() : String
      {
         return (var_15 as class_1198).sex;
      }
      
      public function get customInfo() : String
      {
         return (var_15 as class_1198).customInfo;
      }
      
      public function get achievementScore() : int
      {
         return (var_15 as class_1198).achievementScore;
      }
   }
}
