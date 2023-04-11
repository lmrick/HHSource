package package_42
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_161.class_1137;
   
   [SecureSWF(rename="true")]
   public class class_1024 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1024(param1:Function)
      {
         super(param1,class_1137);
      }
      
      public function getParser() : class_1137
      {
         return var_15 as class_1137;
      }
   }
}
