package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1410;
   
   [SecureSWF(rename="true")]
   public class class_756 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_756(param1:Function)
      {
         super(param1,class_1410);
      }
      
      public function getParser() : class_1410
      {
         return var_15 as class_1410;
      }
   }
}
