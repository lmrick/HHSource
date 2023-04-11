package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1234;
   
   [SecureSWF(rename="true")]
   public class class_230 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_230(param1:Function)
      {
         super(param1,class_1234);
      }
      
      public function getParser() : class_1234
      {
         return this.var_15 as class_1234;
      }
   }
}
