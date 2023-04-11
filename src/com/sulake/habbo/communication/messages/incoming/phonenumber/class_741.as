package package_102
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_172.class_1338;
   
   [SecureSWF(rename="true")]
   public class class_741 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_741(param1:Function)
      {
         super(param1,class_1338);
      }
      
      public function getParser() : class_1338
      {
         return var_15 as class_1338;
      }
   }
}
