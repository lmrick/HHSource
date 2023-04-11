package package_67
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_175.class_1357;
   
   [SecureSWF(rename="true")]
   public class class_561 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_561(param1:Function)
      {
         super(param1,class_1357);
      }
      
      public function getParser() : class_1357
      {
         return var_15 as class_1357;
      }
   }
}
