package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1062;
   
   [SecureSWF(rename="true")]
   public class class_192 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_192(param1:Function)
      {
         super(param1,class_1062);
      }
      
      public function get giverUserId() : int
      {
         return class_1062(var_15).giverUserId;
      }
      
      public function get handItemType() : int
      {
         return class_1062(var_15).handItemType;
      }
   }
}
