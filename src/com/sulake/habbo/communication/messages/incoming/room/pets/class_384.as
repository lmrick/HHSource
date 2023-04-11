package package_14
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_144.class_1470;
   
   [SecureSWF(rename="true")]
   public class class_384 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_384(param1:Function)
      {
         super(param1,class_1470);
      }
      
      public function getParser() : class_1470
      {
         return var_15 as class_1470;
      }
   }
}
