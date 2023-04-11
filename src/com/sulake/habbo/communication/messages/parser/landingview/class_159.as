package package_26
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.landingview.class_1367;
   
   [SecureSWF(rename="true")]
   public class class_159 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_159(param1:Function)
      {
         super(param1,class_1367);
      }
      
      public function getParser() : class_1367
      {
         return var_15 as class_1367;
      }
   }
}
