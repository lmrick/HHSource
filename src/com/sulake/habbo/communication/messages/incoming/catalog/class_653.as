package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1226;
   
   [SecureSWF(rename="true")]
   public class class_653 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_653(param1:Function)
      {
         super(param1,class_1226);
      }
      
      public function get errorCode() : String
      {
         return (var_15 as class_1226).errorCode;
      }
   }
}
