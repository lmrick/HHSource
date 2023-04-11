package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1159;
   
   [SecureSWF(rename="true")]
   public class class_798 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_798(param1:Function)
      {
         super(param1,class_1159);
      }
      
      public function getParser() : class_1159
      {
         return var_15 as class_1159;
      }
   }
}
