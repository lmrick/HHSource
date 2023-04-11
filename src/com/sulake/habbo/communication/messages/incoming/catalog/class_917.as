package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1290;
   
   [SecureSWF(rename="true")]
   public class class_917 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_917(param1:Function)
      {
         super(param1,class_1290);
      }
      
      public function getParser() : class_1290
      {
         return this.var_15 as class_1290;
      }
   }
}
