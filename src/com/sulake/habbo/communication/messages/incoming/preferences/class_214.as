package package_53
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_174.class_1327;
   
   [SecureSWF(rename="true")]
   public class class_214 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_214(param1:Function)
      {
         super(param1,class_1327);
      }
      
      public function getParser() : class_1327
      {
         return this.var_15 as class_1327;
      }
   }
}
