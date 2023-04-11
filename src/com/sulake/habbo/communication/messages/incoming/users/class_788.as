package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1106;
   
   [SecureSWF(rename="true")]
   public class class_788 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_788(param1:Function)
      {
         super(param1,class_1106);
      }
      
      public function get data() : class_1126
      {
         return class_1106(var_15).data;
      }
   }
}
