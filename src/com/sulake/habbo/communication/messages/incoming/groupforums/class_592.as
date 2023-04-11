package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1160;
   
   [SecureSWF(rename="true")]
   public class class_592 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_592(param1:Function)
      {
         super(param1,class_1160);
      }
      
      public function getParser() : class_1160
      {
         return this.var_15 as class_1160;
      }
   }
}
