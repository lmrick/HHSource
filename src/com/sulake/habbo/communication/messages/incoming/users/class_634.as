package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1398;
   
   [SecureSWF(rename="true")]
   public class class_634 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_634(param1:Function)
      {
         super(param1,class_1398);
      }
      
      public function get ignoredUsers() : Array
      {
         return (var_15 as class_1398).ignoredUsers;
      }
   }
}
