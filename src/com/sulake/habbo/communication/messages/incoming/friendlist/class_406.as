package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1099;
   
   [SecureSWF(rename="true")]
   public class class_406 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_406(param1:Function)
      {
         super(param1,class_1099);
      }
      
      public function getParser() : class_1099
      {
         return this.var_15 as class_1099;
      }
   }
}
