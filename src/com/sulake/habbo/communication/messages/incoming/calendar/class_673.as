package package_113
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_121.class_1407;
   
   [SecureSWF(rename="true")]
   public class class_673 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_673(param1:Function)
      {
         super(param1,class_1407);
      }
      
      public function getParser() : class_1407
      {
         return var_15 as class_1407;
      }
   }
}
