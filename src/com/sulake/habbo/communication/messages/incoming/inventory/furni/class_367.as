package package_55
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_166.class_1399;
   
   [SecureSWF(rename="true")]
   public class class_367 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_367(param1:Function)
      {
         super(param1,class_1399);
      }
      
      public function getParser() : class_1399
      {
         return this.var_15 as class_1399;
      }
   }
}
