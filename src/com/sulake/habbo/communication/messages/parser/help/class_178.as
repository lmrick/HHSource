package package_4
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.help.class_1183;
   
   [SecureSWF(rename="true")]
   public class class_178 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_178(param1:Function)
      {
         super(param1,class_1183);
      }
      
      public function getParser() : class_1183
      {
         return var_15 as class_1183;
      }
   }
}
