package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1083;
   
   [SecureSWF(rename="true")]
   public class class_614 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_614(param1:Function)
      {
         super(param1,class_1083);
      }
      
      public function getParser() : class_1083
      {
         return var_15 as class_1083;
      }
   }
}
