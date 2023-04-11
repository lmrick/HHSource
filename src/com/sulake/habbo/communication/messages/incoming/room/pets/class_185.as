package package_41
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_134.class_1404;
   
   [SecureSWF(rename="true")]
   public class class_185 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_185(param1:Function)
      {
         super(param1,class_1404);
      }
      
      public function getParser() : class_1404
      {
         return var_15 as class_1404;
      }
   }
}
