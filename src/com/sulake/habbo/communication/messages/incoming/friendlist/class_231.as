package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1208;
   
   [SecureSWF(rename="true")]
   public class class_231 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_231(param1:Function)
      {
         super(param1,class_1208);
      }
      
      public function getParser() : class_1208
      {
         return this.var_15 as class_1208;
      }
   }
}
