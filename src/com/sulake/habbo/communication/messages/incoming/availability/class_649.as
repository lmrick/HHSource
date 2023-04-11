package package_42
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_161.class_1177;
   
   [SecureSWF(rename="true")]
   public class class_649 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_649(param1:Function)
      {
         super(param1,class_1177);
      }
      
      public function getParser() : class_1177
      {
         return var_15 as class_1177;
      }
   }
}
