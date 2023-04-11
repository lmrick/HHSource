package package_93
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_146.class_1296;
   
   [SecureSWF(rename="true")]
   public class class_626 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_626(param1:Function)
      {
         super(param1,class_1296);
      }
      
      public function getParser() : class_1296
      {
         return this.var_15 as class_1296;
      }
   }
}
