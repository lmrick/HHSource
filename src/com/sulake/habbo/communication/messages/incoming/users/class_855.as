package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1527;
   
   [SecureSWF(rename="true")]
   public class class_855 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_855(param1:Function)
      {
         super(param1,class_1527);
      }
      
      public function getParser() : class_1527
      {
         return class_1527(var_15);
      }
   }
}
