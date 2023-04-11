package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.core.utils.class_24;
   import package_130.class_1166;
   
   [SecureSWF(rename="true")]
   public class class_420 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_420(param1:Function)
      {
         super(param1,class_1166);
      }
      
      public function get userId() : int
      {
         return (var_15 as class_1166).userId;
      }
      
      public function get relationshipStatusMap() : class_24
      {
         return (var_15 as class_1166).relationshipStatusMap;
      }
   }
}
