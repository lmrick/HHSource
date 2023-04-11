package package_85
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_182.class_1455;
   
   [SecureSWF(rename="true")]
   public class class_340 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_340(param1:Function)
      {
         super(param1,class_1455);
      }
      
      public function getParser() : class_1455
      {
         return this.var_15 as class_1455;
      }
   }
}
