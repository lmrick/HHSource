package package_79
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_143.class_1078;
   
   [SecureSWF(rename="true")]
   public class class_556 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_556(param1:Function)
      {
         super(param1,class_1078);
      }
      
      public function getParser() : class_1078
      {
         return this.var_15 as class_1078;
      }
   }
}
