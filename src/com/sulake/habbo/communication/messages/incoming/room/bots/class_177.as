package package_38
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_171.class_1401;
   
   [SecureSWF(rename="true")]
   public class class_177 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_177(param1:Function)
      {
         super(param1,class_1401);
      }
      
      public function getParser() : class_1401
      {
         return var_15 as class_1401;
      }
   }
}
