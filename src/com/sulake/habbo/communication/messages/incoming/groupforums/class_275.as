package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1417;
   
   [SecureSWF(rename="true")]
   public class class_275 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_275(param1:Function)
      {
         super(param1,class_1417);
      }
      
      public function getParser() : class_1417
      {
         return this.var_15 as class_1417;
      }
   }
}
