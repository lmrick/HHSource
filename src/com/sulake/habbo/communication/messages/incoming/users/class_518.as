package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1343;
   
   [SecureSWF(rename="true")]
   public class class_518 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_518(param1:Function)
      {
         super(param1,class_1343);
      }
      
      public function get result() : int
      {
         return (var_15 as class_1343).result;
      }
      
      public function get name() : String
      {
         return (var_15 as class_1343).name;
      }
   }
}
