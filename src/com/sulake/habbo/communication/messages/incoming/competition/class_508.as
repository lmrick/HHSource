package package_73
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_129.class_1307;
   
   [SecureSWF(rename="true")]
   public class class_508 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_508(param1:Function)
      {
         super(param1,class_1307);
      }
      
      public function getParser() : class_1307
      {
         return var_15 as class_1307;
      }
   }
}
