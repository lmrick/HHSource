package package_42
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_161.class_1479;
   
   [SecureSWF(rename="true")]
   public class class_186 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_186(param1:Function)
      {
         super(param1,class_1479);
      }
      
      public function getParser() : class_1479
      {
         return var_15 as class_1479;
      }
   }
}
