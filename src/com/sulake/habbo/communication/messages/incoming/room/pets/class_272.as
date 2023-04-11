package package_14
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_144.class_1121;
   
   [SecureSWF(rename="true")]
   public class class_272 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_272(param1:Function)
      {
         super(param1,class_1121);
      }
      
      public function getParser() : class_1121
      {
         return var_15 as class_1121;
      }
   }
}
