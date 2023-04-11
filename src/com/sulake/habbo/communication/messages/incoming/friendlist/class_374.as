package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1423;
   
   [SecureSWF(rename="true")]
   public class class_374 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_374(param1:Function)
      {
         super(param1,class_1423);
      }
      
      public function getParser() : class_1423
      {
         return this.var_15 as class_1423;
      }
   }
}
