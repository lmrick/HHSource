package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1165;
   
   [SecureSWF(rename="true")]
   public class class_387 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_387(param1:Function)
      {
         super(param1,class_1165);
      }
      
      public function userId() : int
      {
         return class_1165(var_15).userId;
      }
      
      public function furniCount() : int
      {
         return class_1165(var_15).furniCount;
      }
   }
}
