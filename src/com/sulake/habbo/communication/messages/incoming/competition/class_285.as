package package_73
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_129.class_1105;
   
   [SecureSWF(rename="true")]
   public class class_285 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_285(param1:Function)
      {
         super(param1,class_1105);
      }
      
      public function getParser() : class_1105
      {
         return var_15 as class_1105;
      }
   }
}
