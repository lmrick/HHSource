package package_55
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_166.class_1510;
   
   [SecureSWF(rename="true")]
   public class class_426 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_426(param1:Function)
      {
         super(param1,class_1510);
      }
      
      public function getParser() : class_1510
      {
         return this.var_15 as class_1510;
      }
   }
}
