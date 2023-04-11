package package_107
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_168.class_1324;
   
   [SecureSWF(rename="true")]
   public class class_797 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_797(param1:Function)
      {
         super(param1,class_1324);
      }
      
      public function getParser() : class_1324
      {
         return var_15 as class_1324;
      }
   }
}
