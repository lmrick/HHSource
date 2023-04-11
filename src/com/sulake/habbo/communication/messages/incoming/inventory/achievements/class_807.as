package package_101
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_176.class_1345;
   
   [SecureSWF(rename="true")]
   public class class_807 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_807(param1:Function)
      {
         super(param1,class_1345);
      }
      
      public function getParser() : class_1345
      {
         return var_15 as class_1345;
      }
   }
}
