package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1322;
   
   [SecureSWF(rename="true")]
   public class class_131 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_131(param1:Function)
      {
         super(param1,class_1322);
      }
      
      public function get userId() : int
      {
         return class_1322(var_15).userId;
      }
   }
}
