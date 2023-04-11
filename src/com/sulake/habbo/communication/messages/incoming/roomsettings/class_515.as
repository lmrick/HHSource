package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1420;
   
   [SecureSWF(rename="true")]
   public class class_515 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_515(param1:Function)
      {
         super(param1,class_1420);
      }
      
      public function getParser() : class_1420
      {
         return this.var_15 as class_1420;
      }
   }
}
