package package_17
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_154.class_1429;
   
   [SecureSWF(rename="true")]
   public class class_734 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_734(param1:Function)
      {
         super(param1,class_1429);
      }
      
      public function getParser() : class_1429
      {
         return var_15 as class_1429;
      }
   }
}
