package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1090;
   
   [SecureSWF(rename="true")]
   public class class_935 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_935(param1:Function)
      {
         super(param1,class_1090);
      }
      
      public function get data() : class_1481
      {
         return class_1090(var_15).data;
      }
   }
}
