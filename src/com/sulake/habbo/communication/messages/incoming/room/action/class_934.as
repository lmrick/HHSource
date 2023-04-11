package package_12
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_141.class_1521;
   
   [SecureSWF(rename="true")]
   public class class_934 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_934(param1:Function)
      {
         super(param1,class_1521);
      }
      
      public function getParser() : class_1521
      {
         return var_15 as class_1521;
      }
   }
}
