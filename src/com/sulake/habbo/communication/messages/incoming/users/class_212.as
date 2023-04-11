package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1485;
   
   [SecureSWF(rename="true")]
   public class class_212 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_212(param1:Function)
      {
         super(param1,class_1485);
      }
      
      public function getParser() : class_1485
      {
         return var_15 as class_1485;
      }
   }
}
