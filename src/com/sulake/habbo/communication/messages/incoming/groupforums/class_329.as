package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1464;
   
   [SecureSWF(rename="true")]
   public class class_329 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_329(param1:Function)
      {
         super(param1,class_1464);
      }
      
      public function getParser() : class_1464
      {
         return class_1464(this.var_15);
      }
   }
}
