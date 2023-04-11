package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1157;
   
   [SecureSWF(rename="true")]
   public class class_564 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_564(param1:Function)
      {
         super(param1,class_1157);
      }
      
      public function get guilds() : Array
      {
         return class_1157(var_15).guilds;
      }
   }
}
