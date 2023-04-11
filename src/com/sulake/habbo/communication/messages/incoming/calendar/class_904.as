package package_113
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_121.class_1048;
   
   [SecureSWF(rename="true")]
   public class class_904 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_904(param1:Function)
      {
         super(param1,class_1048);
      }
      
      public function getParser() : class_1048
      {
         return var_15 as class_1048;
      }
   }
}
