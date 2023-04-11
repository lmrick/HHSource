package package_100
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_122.class_1049;
   
   [SecureSWF(rename="true")]
   public class class_443 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_443(param1:Function)
      {
         super(param1,class_1049);
      }
      
      public function getParser() : class_1049
      {
         return var_15 as class_1049;
      }
   }
}
