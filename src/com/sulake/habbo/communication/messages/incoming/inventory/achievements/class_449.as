package package_101
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_176.class_1428;
   
   [SecureSWF(rename="true")]
   public class class_449 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_449(param1:Function)
      {
         super(param1,class_1428);
      }
      
      public function getParser() : class_1428
      {
         return var_15 as class_1428;
      }
   }
}
