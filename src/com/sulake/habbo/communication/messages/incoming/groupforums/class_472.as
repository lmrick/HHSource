package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1116;
   
   [SecureSWF(rename="true")]
   public class class_472 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_472(param1:Function)
      {
         super(param1,class_1116);
      }
      
      public function getParser() : class_1116
      {
         return this.var_15 as class_1116;
      }
   }
}
