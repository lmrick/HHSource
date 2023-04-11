package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1248;
   
   [SecureSWF(rename="true")]
   public class class_671 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_671(param1:Function)
      {
         super(param1,class_1248);
      }
      
      public function getParser() : class_1248
      {
         return var_15 as class_1248;
      }
   }
}
