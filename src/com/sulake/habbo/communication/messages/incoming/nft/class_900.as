package package_63
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_163.class_1142;
   
   [SecureSWF(rename="true")]
   public class class_900 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_900(param1:Function)
      {
         super(param1,class_1142);
      }
      
      public function getParser() : class_1142
      {
         return var_15 as class_1142;
      }
   }
}
