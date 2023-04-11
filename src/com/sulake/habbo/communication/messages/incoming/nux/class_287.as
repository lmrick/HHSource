package package_74
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_162.class_1402;
   
   [SecureSWF(rename="true")]
   public class class_287 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_287(param1:Function)
      {
         super(param1,class_1402);
      }
      
      public function getParser() : class_1402
      {
         return var_15 as class_1402;
      }
   }
}
