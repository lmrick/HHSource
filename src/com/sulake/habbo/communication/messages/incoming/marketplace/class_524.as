package package_65
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_127.class_1235;
   
   [SecureSWF(rename="true")]
   public class class_524 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_524(param1:Function)
      {
         super(param1,class_1235);
      }
      
      public function getParser() : class_1235
      {
         return var_15 as class_1235;
      }
   }
}
