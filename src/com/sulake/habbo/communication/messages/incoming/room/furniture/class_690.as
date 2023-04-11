package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1511;
   
   [SecureSWF(rename="true")]
   public class class_690 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_690(param1:Function)
      {
         super(param1,class_1511);
      }
      
      public function getParser() : class_1511
      {
         return var_15 as class_1511;
      }
   }
}
