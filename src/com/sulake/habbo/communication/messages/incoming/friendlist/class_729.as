package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1498;
   
   [SecureSWF(rename="true")]
   public class class_729 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_729(param1:Function)
      {
         super(param1,class_1498);
      }
      
      public function getParser() : class_1498
      {
         return this.var_15 as class_1498;
      }
   }
}
