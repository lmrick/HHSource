package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1435;
   
   [SecureSWF(rename="true")]
   public class class_455 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_455(param1:Function)
      {
         super(param1,class_1435);
      }
      
      public function getParser() : class_1435
      {
         return var_15 as class_1435;
      }
   }
}
