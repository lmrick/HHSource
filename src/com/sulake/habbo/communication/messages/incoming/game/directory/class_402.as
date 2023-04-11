package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.class_1430;
   
   [SecureSWF(rename="true")]
   public class class_402 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_402(param1:Function)
      {
         super(param1,class_1430);
      }
      
      public function getParser() : class_1430
      {
         return this.var_15 as class_1430;
      }
   }
}
