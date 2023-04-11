package package_4
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.help.class_1372;
   
   [SecureSWF(rename="true")]
   public class class_604 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_604(param1:Function)
      {
         super(param1,class_1372);
      }
      
      public function getParser() : class_1372
      {
         return var_15 as class_1372;
      }
   }
}
