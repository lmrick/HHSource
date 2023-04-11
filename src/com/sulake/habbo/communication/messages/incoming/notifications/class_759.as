package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1460;
   
   [SecureSWF(rename="true")]
   public class class_759 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_759(param1:Function)
      {
         super(param1,class_1460);
      }
      
      public function get enabled() : Boolean
      {
         return (var_15 as class_1460).enabled;
      }
   }
}
