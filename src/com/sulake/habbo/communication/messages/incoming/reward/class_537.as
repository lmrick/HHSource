package package_97
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_167.class_1196;
   
   [SecureSWF(rename="true")]
   public class class_537 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_537(param1:Function)
      {
         super(param1,class_1196);
      }
      
      public function getParser() : class_1196
      {
         return var_15 as class_1196;
      }
   }
}
