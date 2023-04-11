package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1348;
   
   [SecureSWF(rename="true")]
   public class class_544 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_544(param1:Function)
      {
         super(param1,class_1348);
      }
      
      public function getParser() : class_1348
      {
         return this.var_15 as class_1348;
      }
   }
}
