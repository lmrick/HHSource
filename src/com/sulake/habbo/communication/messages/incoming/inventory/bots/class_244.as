package package_67
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_175.class_1337;
   
   [SecureSWF(rename="true")]
   public class class_244 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_244(param1:Function)
      {
         super(param1,class_1337);
      }
      
      public function getParser() : class_1337
      {
         return var_15 as class_1337;
      }
   }
}
