package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1332;
   
   [SecureSWF(rename="true")]
   public class class_958 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_958(param1:Function)
      {
         super(param1,class_1332);
      }
      
      public function getParser() : class_1332
      {
         return var_15 as class_1332;
      }
   }
}
