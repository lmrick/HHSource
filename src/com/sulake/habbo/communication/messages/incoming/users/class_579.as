package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.core.utils.class_24;
   import package_130.class_1403;
   
   [SecureSWF(rename="true")]
   public class class_579 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_579(param1:Function)
      {
         super(param1,class_1403);
      }
      
      public function get badges() : class_24
      {
         return (var_15 as class_1403).badges;
      }
   }
}
