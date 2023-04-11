package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1504;
   
   [SecureSWF(rename="true")]
   public class class_743 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_743(param1:Function)
      {
         super(param1,class_1504);
      }
      
      public function get baseRoomId() : int
      {
         return class_1504(var_15).baseRoomId;
      }
      
      public function get groupId() : int
      {
         return class_1504(var_15).groupId;
      }
   }
}
