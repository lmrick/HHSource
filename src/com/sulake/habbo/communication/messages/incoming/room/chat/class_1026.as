package package_39
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_164.class_1351;
   
   [SecureSWF(rename="true")]
   public class class_1026 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1026(param1:Function)
      {
         super(param1,class_1351);
      }
      
      public function get secondsRemaining() : int
      {
         return class_1351(var_15).secondsRemaining;
      }
   }
}
