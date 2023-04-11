package package_54
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_123.class_1474;
   
   [SecureSWF(rename="true")]
   public class class_263 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_263(param1:Function)
      {
         super(param1,class_1474);
      }
      
      public function getParser() : class_1474
      {
         return this.var_15 as class_1474;
      }
   }
}
