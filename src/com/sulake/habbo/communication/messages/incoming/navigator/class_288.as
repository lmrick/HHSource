package package_11
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_132.class_1286;
   
   [SecureSWF(rename="true")]
   public class class_288 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_288(param1:Function)
      {
         super(param1,class_1286);
      }
      
      public function getParser() : class_1286
      {
         return this.var_15 as class_1286;
      }
   }
}
