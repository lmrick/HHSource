package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1125;
   
   [SecureSWF(rename="true")]
   public class class_307 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_307(param1:Function)
      {
         super(param1,class_1125);
      }
      
      public function get data() : class_1174
      {
         return class_1125(var_15).data;
      }
      
      public function get guildId() : int
      {
         return class_1125(var_15).guildId;
      }
   }
}
