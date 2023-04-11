package package_54
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_123.class_1161;
   
   [SecureSWF(rename="true")]
   public class class_215 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_215(param1:Function)
      {
         super(param1,class_1161);
      }
      
      public function getParser() : class_1161
      {
         return this.var_15 as class_1161;
      }
   }
}
