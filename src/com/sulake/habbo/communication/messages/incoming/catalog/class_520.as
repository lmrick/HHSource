package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1257;
   
   [SecureSWF(rename="true")]
   public class class_520 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_520(param1:Function)
      {
         super(param1,class_1257);
      }
      
      public function getParser() : class_1257
      {
         return this.var_15 as class_1257;
      }
   }
}
