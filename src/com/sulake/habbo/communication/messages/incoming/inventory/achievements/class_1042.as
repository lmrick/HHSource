package package_101
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_176.class_1342;
   
   [SecureSWF(rename="true")]
   public class class_1042 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1042(param1:Function)
      {
         super(param1,class_1342);
      }
      
      public function getParser() : class_1342
      {
         return var_15 as class_1342;
      }
   }
}
