package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1205;
   
   [SecureSWF(rename="true")]
   public class class_962 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_962(param1:Function)
      {
         super(param1,class_1205);
      }
      
      public function getParser() : class_1205
      {
         return var_15 as class_1205;
      }
   }
}
