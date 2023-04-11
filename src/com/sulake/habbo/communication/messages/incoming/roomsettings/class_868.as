package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1341;
   
   [SecureSWF(rename="true")]
   public class class_868 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_868(param1:Function)
      {
         super(param1,class_1341);
      }
      
      public function getParser() : class_1341
      {
         return this.var_15 as class_1341;
      }
   }
}
