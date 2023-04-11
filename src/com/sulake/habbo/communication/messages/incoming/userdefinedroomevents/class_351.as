package package_79
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_143.class_1497;
   
   [SecureSWF(rename="true")]
   public class class_351 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_351(param1:Function)
      {
         super(param1,class_1497);
      }
      
      public function getParser() : class_1497
      {
         return this.var_15 as class_1497;
      }
   }
}
