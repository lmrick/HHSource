package package_95
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_179.class_1395;
   
   [SecureSWF(rename="true")]
   public class class_386 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_386(param1:Function)
      {
         super(param1,class_1395);
      }
      
      public function getParser() : class_1395
      {
         return var_15 as class_1395;
      }
   }
}
