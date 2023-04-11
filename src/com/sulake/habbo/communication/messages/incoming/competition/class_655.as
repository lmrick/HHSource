package package_73
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_129.class_1056;
   
   [SecureSWF(rename="true")]
   public class class_655 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_655(param1:Function)
      {
         super(param1,class_1056);
      }
      
      public function getParser() : class_1056
      {
         return var_15 as class_1056;
      }
   }
}
