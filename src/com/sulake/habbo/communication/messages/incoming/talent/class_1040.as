package package_92
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_149.class_1231;
   
   [SecureSWF(rename="true")]
   public class class_1040 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1040(param1:Function)
      {
         super(param1,class_1231);
      }
      
      public function getParser() : class_1231
      {
         return var_15 as class_1231;
      }
   }
}
