package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1513;
   
   [SecureSWF(rename="true")]
   public class class_260 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_260(param1:Function)
      {
         super(param1,class_1513);
      }
      
      public function get data() : class_1124
      {
         return class_1513(var_15).data;
      }
   }
}
