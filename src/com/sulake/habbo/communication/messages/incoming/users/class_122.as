package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1370;
   
   [SecureSWF(rename="true")]
   public class class_122 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_122(param1:Function)
      {
         super(param1,class_1370);
      }
      
      public function get data() : class_1218
      {
         return class_1370(var_15).data;
      }
   }
}
