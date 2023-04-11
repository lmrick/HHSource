package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1066;
   
   [SecureSWF(rename="true")]
   public class class_783 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_783(param1:Function)
      {
         super(param1,class_1066);
      }
      
      public function get reason() : int
      {
         return class_1066(var_15).reason;
      }
   }
}
