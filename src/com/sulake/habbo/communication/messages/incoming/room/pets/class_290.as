package package_41
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_134.class_1361;
   
   [SecureSWF(rename="true")]
   public class class_290 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_290(param1:Function)
      {
         super(param1,class_1361);
      }
      
      public function getParser() : class_1361
      {
         return var_15 as class_1361;
      }
   }
}
