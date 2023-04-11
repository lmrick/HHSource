package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1169;
   
   [SecureSWF(rename="true")]
   public class class_539 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_539(param1:Function)
      {
         super(param1,class_1169);
      }
      
      public function getParser() : class_1169
      {
         return this.var_15 as class_1169;
      }
   }
}
