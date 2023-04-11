package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1529;
   
   [SecureSWF(rename="true")]
   public class class_617 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_617(param1:Function)
      {
         super(param1,class_1529);
      }
      
      public function getParser() : class_1529
      {
         return this.var_15 as class_1529;
      }
   }
}
