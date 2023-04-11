package package_66
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_173.class_1413;
   
   [SecureSWF(rename="true")]
   public class class_842 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_842(param1:Function)
      {
         super(param1,class_1413);
      }
      
      public function getParser() : class_1413
      {
         return this.var_15 as class_1413;
      }
   }
}
