package package_120
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_181.class_1425;
   
   [SecureSWF(rename="true")]
   public class class_1037 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1037(param1:Function)
      {
         super(param1,class_1425);
      }
      
      public function getParser() : class_1425
      {
         return var_15 as class_1425;
      }
   }
}
