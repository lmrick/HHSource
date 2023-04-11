package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1526;
   
   [SecureSWF(rename="true")]
   public class class_448 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_448(param1:Function)
      {
         super(param1,class_1526);
      }
      
      public function get amount() : int
      {
         return (var_15 as class_1526).amount;
      }
      
      public function get change() : int
      {
         return (var_15 as class_1526).change;
      }
      
      public function get type() : int
      {
         return (var_15 as class_1526).type;
      }
   }
}
