package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1491;
   
   [SecureSWF(rename="true")]
   public class class_1016 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1016(param1:Function)
      {
         super(param1,class_1491);
      }
      
      public function getParser() : class_1491
      {
         return this.var_15 as class_1491;
      }
   }
}
