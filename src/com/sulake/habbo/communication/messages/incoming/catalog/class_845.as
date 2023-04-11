package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1486;
   
   [SecureSWF(rename="true")]
   public class class_845 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_845(param1:Function)
      {
         super(param1,class_1486);
      }
      
      public function getParser() : class_1486
      {
         return this.var_15 as class_1486;
      }
   }
}
