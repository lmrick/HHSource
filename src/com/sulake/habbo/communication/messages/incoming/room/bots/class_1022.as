package package_38
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_171.class_1371;
   
   [SecureSWF(rename="true")]
   public class class_1022 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1022(param1:Function)
      {
         super(param1,class_1371);
      }
      
      public function getParser() : class_1371
      {
         return var_15 as class_1371;
      }
   }
}
