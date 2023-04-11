package package_54
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_123.class_1164;
   
   [SecureSWF(rename="true")]
   public class class_703 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_703(param1:Function)
      {
         super(param1,class_1164);
      }
      
      public function getParser() : class_1164
      {
         return this.var_15 as class_1164;
      }
   }
}
