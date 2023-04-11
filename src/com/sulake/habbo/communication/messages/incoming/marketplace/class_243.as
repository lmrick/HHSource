package package_65
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_127.class_1355;
   
   [SecureSWF(rename="true")]
   public class class_243 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_243(param1:Function)
      {
         super(param1,class_1355);
      }
      
      public function getParser() : class_1355
      {
         return var_15 as class_1355;
      }
   }
}
