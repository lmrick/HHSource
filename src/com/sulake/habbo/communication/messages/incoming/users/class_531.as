package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1245;
   
   [SecureSWF(rename="true")]
   public class class_531 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_531(param1:Function)
      {
         super(param1,class_1245);
      }
      
      public function getParser() : class_1245
      {
         return var_15 as class_1245;
      }
   }
}
