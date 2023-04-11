package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1276;
   
   [SecureSWF(rename="true")]
   public class class_993 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_993(param1:Function)
      {
         super(param1,class_1276);
      }
      
      public function getParser() : class_1276
      {
         return this.var_15 as class_1276;
      }
   }
}
