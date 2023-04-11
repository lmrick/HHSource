package package_92
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_149.class_1120;
   
   [SecureSWF(rename="true")]
   public class class_533 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_533(param1:Function)
      {
         super(param1,class_1120);
      }
      
      public function getParser() : class_1120
      {
         return var_15 as class_1120;
      }
   }
}
