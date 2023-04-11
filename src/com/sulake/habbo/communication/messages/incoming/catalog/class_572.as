package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1288;
   
   [SecureSWF(rename="true")]
   public class class_572 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_572(param1:Function)
      {
         super(param1,class_1288);
      }
      
      public function getParser() : class_1288
      {
         return this.var_15 as class_1288;
      }
   }
}
