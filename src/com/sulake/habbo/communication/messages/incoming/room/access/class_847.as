package package_10
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_150.class_1134;
   
   [SecureSWF(rename="true")]
   public class class_847 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_847(param1:Function)
      {
         super(param1,class_1134);
      }
      
      public function getParser() : class_1134
      {
         return var_15 as class_1134;
      }
   }
}
