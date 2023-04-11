package package_110
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_148.class_1364;
   
   [SecureSWF(rename="true")]
   public class class_704 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_704(param1:Function)
      {
         super(param1,class_1364);
      }
      
      public function getParser() : class_1364
      {
         return var_15 as class_1364;
      }
   }
}
