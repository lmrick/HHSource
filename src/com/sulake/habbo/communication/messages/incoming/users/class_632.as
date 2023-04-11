package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1113;
   
   [SecureSWF(rename="true")]
   public class class_632 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_632(param1:Function)
      {
         super(param1,class_1113);
      }
      
      public function get reason() : int
      {
         return class_1113(var_15).reason;
      }
      
      public function get guildId() : int
      {
         return class_1113(var_15).guildId;
      }
   }
}
