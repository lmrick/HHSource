package package_36
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_165.class_1506;
   
   [SecureSWF(rename="true")]
   public class class_608 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_608(param1:Function)
      {
         super(param1,class_1506);
      }
      
      public function getParser() : class_1506
      {
         return var_15 as class_1506;
      }
   }
}
