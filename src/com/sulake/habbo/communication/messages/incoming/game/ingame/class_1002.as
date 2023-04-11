package package_85
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_182.class_1434;
   
   [SecureSWF(rename="true")]
   public class class_1002 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1002(param1:Function)
      {
         super(param1,class_1434);
      }
      
      public function getParser() : class_1434
      {
         return this.var_15 as class_1434;
      }
   }
}
