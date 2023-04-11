package package_68
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_178.class_1358;
   
   [SecureSWF(rename="true")]
   public class class_782 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_782(param1:Function)
      {
         super(param1,class_1358);
      }
      
      public function getParser() : class_1358
      {
         return var_15 as class_1358;
      }
   }
}
