package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1212;
   
   [SecureSWF(rename="true")]
   public class class_976 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_976(param1:Function)
      {
         super(param1,class_1212);
      }
      
      public function getParser() : class_1212
      {
         return this.var_15 as class_1212;
      }
   }
}
