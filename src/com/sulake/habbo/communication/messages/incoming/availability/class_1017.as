package package_42
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_161.class_1431;
   
   [SecureSWF(rename="true")]
   public class class_1017 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1017(param1:Function)
      {
         super(param1,class_1431);
      }
      
      public function getParser() : class_1431
      {
         return var_15 as class_1431;
      }
   }
}
