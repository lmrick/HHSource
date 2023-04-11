package package_65
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_127.class_1388;
   
   [SecureSWF(rename="true")]
   public class class_1011 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1011(param1:Function)
      {
         super(param1,class_1388);
      }
      
      public function getParser() : class_1388
      {
         return var_15 as class_1388;
      }
   }
}
