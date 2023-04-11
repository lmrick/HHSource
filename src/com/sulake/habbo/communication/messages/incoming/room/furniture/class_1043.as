package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1415;
   
   [SecureSWF(rename="true")]
   public class class_1043 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1043(param1:Function)
      {
         super(param1,class_1415);
      }
      
      public function getParser() : class_1415
      {
         return var_15 as class_1415;
      }
   }
}
