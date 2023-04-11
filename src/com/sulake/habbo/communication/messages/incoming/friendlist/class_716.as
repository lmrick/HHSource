package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1468;
   
   [SecureSWF(rename="true")]
   public class class_716 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_716(param1:Function)
      {
         super(param1,class_1468);
      }
      
      public function getParser() : class_1468
      {
         return var_15 as class_1468;
      }
   }
}
