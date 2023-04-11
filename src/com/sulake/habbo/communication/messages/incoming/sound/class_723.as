package package_93
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_146.class_1406;
   
   [SecureSWF(rename="true")]
   public class class_723 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_723(param1:Function)
      {
         super(param1,class_1406);
      }
      
      public function getParser() : class_1406
      {
         return this.var_15 as class_1406;
      }
   }
}
