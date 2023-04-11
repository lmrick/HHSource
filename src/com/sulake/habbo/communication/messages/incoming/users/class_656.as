package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1268;
   
   [SecureSWF(rename="true")]
   public class class_656 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_656(param1:Function)
      {
         super(param1,class_1268);
      }
      
      public function getParser() : class_1268
      {
         return var_15 as class_1268;
      }
   }
}
