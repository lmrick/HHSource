package package_41
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_134.class_1150;
   
   [SecureSWF(rename="true")]
   public class class_581 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_581(param1:Function)
      {
         super(param1,class_1150);
      }
      
      public function getParser() : class_1150
      {
         return var_15 as class_1150;
      }
   }
}
