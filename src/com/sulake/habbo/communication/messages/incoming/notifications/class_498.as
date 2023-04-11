package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1412;
   
   [SecureSWF(rename="true")]
   public class class_498 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_498(param1:Function)
      {
         super(param1,class_1412);
      }
      
      public function getParser() : class_1412
      {
         return var_15 as class_1412;
      }
   }
}
