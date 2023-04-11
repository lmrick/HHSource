package package_25
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1277;
   
   [SecureSWF(rename="true")]
   public class class_158 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_158(param1:Function)
      {
         super(param1,class_1277);
      }
      
      public function getParser() : class_1277
      {
         return var_15 as class_1277;
      }
   }
}
