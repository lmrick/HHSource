package package_56
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_158.class_1195;
   
   [SecureSWF(rename="true")]
   public class class_445 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_445(param1:Function)
      {
         super(param1,class_1195);
      }
      
      public function getParser() : class_1195
      {
         return var_15 as class_1195;
      }
   }
}
