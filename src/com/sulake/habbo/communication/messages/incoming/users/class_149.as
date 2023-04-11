package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1189;
   
   [SecureSWF(rename="true")]
   public class class_149 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_149(param1:Function)
      {
         super(param1,class_1189);
      }
      
      public function get groupId() : int
      {
         return class_1189(var_15).groupId;
      }
   }
}
