package package_102
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_172.class_1444;
   
   [SecureSWF(rename="true")]
   public class class_462 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_462(param1:Function)
      {
         super(param1,class_1444);
      }
      
      public function getParser() : class_1444
      {
         return var_15 as class_1444;
      }
   }
}
