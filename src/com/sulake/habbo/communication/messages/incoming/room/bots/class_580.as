package package_38
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_171.class_1353;
   
   [SecureSWF(rename="true")]
   public class class_580 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_580(param1:Function)
      {
         super(param1,class_1353);
      }
      
      public function getParser() : class_1353
      {
         return var_15 as class_1353;
      }
   }
}
