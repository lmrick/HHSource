package package_102
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_172.class_1314;
   
   [SecureSWF(rename="true")]
   public class class_724 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_724(param1:Function)
      {
         super(param1,class_1314);
      }
      
      public function getParser() : class_1314
      {
         return var_15 as class_1314;
      }
   }
}
