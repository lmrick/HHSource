package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1194;
   
   [SecureSWF(rename="true")]
   public class class_821 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_821(param1:Function)
      {
         super(param1,class_1194);
      }
      
      public function getParser() : class_1194
      {
         return this.var_15 as class_1194;
      }
   }
}
