package package_56
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_158.class_1197;
   
   [SecureSWF(rename="true")]
   public class class_483 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_483(param1:Function)
      {
         super(param1,class_1197);
      }
      
      public function getParser() : class_1197
      {
         return var_15 as class_1197;
      }
   }
}
