package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1478;
   
   [SecureSWF(rename="true")]
   public class class_644 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_644(param1:Function)
      {
         super(param1,class_1478);
      }
      
      public function getParser() : class_1478
      {
         return var_15 as class_1478;
      }
   }
}
