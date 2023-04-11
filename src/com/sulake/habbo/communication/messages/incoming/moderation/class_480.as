package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1204;
   
   [SecureSWF(rename="true")]
   public class class_480 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_480(param1:Function)
      {
         super(param1,class_1204);
      }
      
      public function getParser() : class_1204
      {
         return var_15 as class_1204;
      }
   }
}
