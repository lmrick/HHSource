package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1259;
   
   [SecureSWF(rename="true")]
   public class class_800 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_800(param1:Function)
      {
         super(param1,class_1259);
      }
      
      public function get badges() : Array
      {
         return (var_15 as class_1259).badges;
      }
      
      public function get userId() : int
      {
         return (var_15 as class_1259).userId;
      }
   }
}
