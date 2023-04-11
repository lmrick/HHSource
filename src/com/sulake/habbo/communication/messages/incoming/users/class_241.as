package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1132;
   
   [SecureSWF(rename="true")]
   public class class_241 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_241(param1:Function)
      {
         super(param1,class_1132);
      }
      
      public function get groupId() : int
      {
         return class_1132(var_15).groupId;
      }
   }
}
