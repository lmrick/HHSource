package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1454;
   
   [SecureSWF(rename="true")]
   public class class_1003 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1003(param1:Function)
      {
         super(param1,class_1454);
      }
      
      public function getParser() : class_1454
      {
         return var_15 as class_1454;
      }
   }
}
