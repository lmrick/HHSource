package package_107
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_168.class_1380;
   
   [SecureSWF(rename="true")]
   public class class_589 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_589(param1:Function)
      {
         super(param1,class_1380);
      }
      
      public function getParser() : class_1380
      {
         return var_15 as class_1380;
      }
   }
}
