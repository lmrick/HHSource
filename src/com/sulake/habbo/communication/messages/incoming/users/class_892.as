package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1376;
   
   [SecureSWF(rename="true")]
   public class class_892 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_892(param1:Function)
      {
         super(param1,class_1376);
      }
      
      public function get link() : String
      {
         return (var_15 as class_1376).link;
      }
   }
}
