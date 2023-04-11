package package_65
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_127.class_1054;
   
   [SecureSWF(rename="true")]
   public class class_414 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_414(param1:Function)
      {
         super(param1,class_1054);
      }
      
      public function getParser() : class_1054
      {
         return var_15 as class_1054;
      }
   }
}
