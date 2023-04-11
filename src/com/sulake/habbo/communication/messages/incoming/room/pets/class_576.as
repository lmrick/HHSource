package package_41
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_134.class_1228;
   
   [SecureSWF(rename="true")]
   public class class_576 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_576(param1:Function)
      {
         super(param1,class_1228);
      }
      
      public function getParser() : class_1228
      {
         return var_15 as class_1228;
      }
   }
}
