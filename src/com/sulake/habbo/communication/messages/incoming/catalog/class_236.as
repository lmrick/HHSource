package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1145;
   
   [SecureSWF(rename="true")]
   public class class_236 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_236(param1:Function)
      {
         super(param1,class_1145);
      }
      
      public function get productName() : String
      {
         return (var_15 as class_1145).productName;
      }
      
      public function get productDescription() : String
      {
         return (var_15 as class_1145).productDescription;
      }
   }
}
