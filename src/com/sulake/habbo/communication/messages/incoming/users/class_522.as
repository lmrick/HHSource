package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1059;
   
   [SecureSWF(rename="true")]
   public class class_522 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_522(param1:Function)
      {
         super(param1,class_1059);
      }
      
      public function getParser() : class_1059
      {
         return var_15 as class_1059;
      }
   }
}
