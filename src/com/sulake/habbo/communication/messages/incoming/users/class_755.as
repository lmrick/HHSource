package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1465;
   
   [SecureSWF(rename="true")]
   public class class_755 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_755(param1:Function)
      {
         super(param1,class_1465);
      }
      
      public function get userId() : int
      {
         return (var_15 as class_1465).userId;
      }
      
      public function get respectTotal() : int
      {
         return (var_15 as class_1465).respectTotal;
      }
   }
}
