package package_56
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_158.class_1436;
   
   [SecureSWF(rename="true")]
   public class class_271 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_271(param1:Function)
      {
         super(param1,class_1436);
      }
      
      public function getParser() : class_1436
      {
         return var_15 as class_1436;
      }
   }
}
