package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1492;
   
   [SecureSWF(rename="true")]
   public class class_526 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_526(param1:Function)
      {
         super(param1,class_1492);
      }
      
      public function getParser() : class_1492
      {
         return var_15 as class_1492;
      }
   }
}
