package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1346;
   
   [SecureSWF(rename="true")]
   public class class_261 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_261(param1:Function)
      {
         super(param1,class_1346);
      }
      
      public function get messageText() : String
      {
         return (var_15 as class_1346).messageText;
      }
      
      public function getParser() : class_1346
      {
         return var_15 as class_1346;
      }
   }
}
