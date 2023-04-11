package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1384;
   
   [SecureSWF(rename="true")]
   public class class_584 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_584(param1:Function)
      {
         super(param1,class_1384);
      }
      
      public function getParser() : class_1384
      {
         return this.var_15 as class_1384;
      }
   }
}
