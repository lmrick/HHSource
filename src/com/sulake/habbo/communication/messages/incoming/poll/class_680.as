package package_56
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_158.class_1282;
   
   [SecureSWF(rename="true")]
   public class class_680 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_680(param1:Function)
      {
         super(param1,class_1282);
      }
      
      public function getParser() : class_1282
      {
         return var_15 as class_1282;
      }
   }
}
