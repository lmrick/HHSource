package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1249;
   
   [SecureSWF(rename="true")]
   public class class_902 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_902(param1:Function)
      {
         super(param1,class_1249);
      }
      
      public function getParser() : class_1249
      {
         return var_15 as class_1249;
      }
   }
}
