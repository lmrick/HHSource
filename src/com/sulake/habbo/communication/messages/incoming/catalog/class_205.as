package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1209;
   
   [SecureSWF(rename="true")]
   public class class_205 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_205(param1:Function)
      {
         super(param1,class_1209);
      }
      
      public function getParser() : class_1209
      {
         return this.var_15 as class_1209;
      }
   }
}
