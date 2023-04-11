package package_38
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_171.class_1309;
   
   [SecureSWF(rename="true")]
   public class class_748 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_748(param1:Function)
      {
         super(param1,class_1309);
      }
      
      public function getParser() : class_1309
      {
         return var_15 as class_1309;
      }
   }
}
