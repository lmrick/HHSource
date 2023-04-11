package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1313;
   
   [SecureSWF(rename="true")]
   public class class_603 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_603(param1:Function)
      {
         super(param1,class_1313);
      }
      
      public function getParser() : class_1313
      {
         return var_15 as class_1313;
      }
   }
}
