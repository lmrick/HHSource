package package_65
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_127.class_1502;
   
   [SecureSWF(rename="true")]
   public class class_886 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_886(param1:Function)
      {
         super(param1,class_1502);
      }
      
      public function getParser() : class_1502
      {
         return var_15 as class_1502;
      }
   }
}
