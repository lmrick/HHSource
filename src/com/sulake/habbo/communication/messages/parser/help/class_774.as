package package_4
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.help.class_1378;
   
   [SecureSWF(rename="true")]
   public class class_774 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_774(param1:Function)
      {
         super(param1,class_1378);
      }
      
      public function getParser() : class_1378
      {
         return var_15 as class_1378;
      }
   }
}
