package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1335;
   
   [SecureSWF(rename="true")]
   public class class_810 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_810(param1:Function)
      {
         super(param1,class_1335);
      }
      
      public function getParser() : class_1335
      {
         return var_15 as class_1335;
      }
   }
}
