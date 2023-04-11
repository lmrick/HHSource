package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1505;
   
   [SecureSWF(rename="true")]
   public class class_805 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_805(param1:Function)
      {
         super(param1,class_1505);
      }
      
      public function getParser() : class_1505
      {
         return var_15 as class_1505;
      }
   }
}
