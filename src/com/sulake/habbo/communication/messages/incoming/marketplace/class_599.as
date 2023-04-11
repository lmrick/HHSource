package package_65
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_127.class_1267;
   
   [SecureSWF(rename="true")]
   public class class_599 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_599(param1:Function)
      {
         super(param1,class_1267);
      }
      
      public function getParser() : class_1267
      {
         return var_15 as class_1267;
      }
   }
}
