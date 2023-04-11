package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1136;
   
   [SecureSWF(rename="true")]
   public class class_227 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_227(param1:Function)
      {
         super(param1,class_1136);
      }
      
      public function get reason() : int
      {
         return class_1136(var_15).reason;
      }
   }
}
