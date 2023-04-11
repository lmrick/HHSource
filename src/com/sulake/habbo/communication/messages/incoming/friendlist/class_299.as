package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1206;
   
   [SecureSWF(rename="true")]
   public class class_299 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_299(param1:Function)
      {
         super(param1,class_1206);
      }
      
      public function getParser() : class_1206
      {
         return var_15 as class_1206;
      }
   }
}
