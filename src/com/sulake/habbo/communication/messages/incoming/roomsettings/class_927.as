package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1131;
   
   [SecureSWF(rename="true")]
   public class class_927 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_927(param1:Function)
      {
         super(param1,class_1131);
      }
      
      public function getParser() : class_1131
      {
         return this.var_15 as class_1131;
      }
   }
}
