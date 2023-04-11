package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1512;
   
   [SecureSWF(rename="true")]
   public class class_221 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_221(param1:Function)
      {
         super(param1,class_1512);
      }
      
      public function get data() : class_1138
      {
         return class_1512(var_15).data;
      }
   }
}
