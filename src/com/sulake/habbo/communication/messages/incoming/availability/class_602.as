package package_42
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_161.class_1336;
   
   [SecureSWF(rename="true")]
   public class class_602 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_602(param1:Function)
      {
         super(param1,class_1336);
      }
      
      public function getParser() : class_1336
      {
         return var_15 as class_1336;
      }
   }
}
