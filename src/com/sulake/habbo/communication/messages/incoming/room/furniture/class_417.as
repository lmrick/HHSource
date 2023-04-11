package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1298;
   
   [SecureSWF(rename="true")]
   public class class_417 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_417(param1:Function)
      {
         super(param1,class_1298);
      }
      
      public function getParser() : class_1298
      {
         return var_15 as class_1298;
      }
   }
}
