package package_67
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_175.class_1382;
   
   [SecureSWF(rename="true")]
   public class class_557 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_557(param1:Function)
      {
         super(param1,class_1382);
      }
      
      public function getParser() : class_1382
      {
         return var_15 as class_1382;
      }
   }
}
