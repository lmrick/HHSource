package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1225;
   
   [SecureSWF(rename="true")]
   public class class_742 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_742(param1:Function)
      {
         super(param1,class_1225);
      }
      
      public function getParser() : class_1225
      {
         return this.var_15 as class_1225;
      }
   }
}
