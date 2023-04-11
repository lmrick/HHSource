package package_4
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.help.class_1374;
   
   [SecureSWF(rename="true")]
   public class class_171 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_171(param1:Function)
      {
         super(param1,class_1374);
      }
      
      public function getParser() : class_1374
      {
         return var_15 as class_1374;
      }
   }
}
