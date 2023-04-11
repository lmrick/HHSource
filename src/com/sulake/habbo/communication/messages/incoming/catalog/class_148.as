package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1074;
   
   [SecureSWF(rename="true")]
   public class class_148 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_148(param1:Function)
      {
         super(param1,class_1074);
      }
      
      public function getParser() : class_1074
      {
         return this.var_15 as class_1074;
      }
   }
}
