package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1214;
   
   [SecureSWF(rename="true")]
   public class class_311 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_311(param1:Function)
      {
         super(param1,class_1214);
      }
      
      public function getParser() : class_1214
      {
         return this.var_15 as class_1214;
      }
   }
}
