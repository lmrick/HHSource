package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1068;
   
   [SecureSWF(rename="true")]
   public class class_595 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_595(param1:Function)
      {
         super(param1,class_1068);
      }
      
      public function getParser() : class_1068
      {
         return var_15 as class_1068;
      }
   }
}
