package package_99
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_156.class_1119;
   
   [SecureSWF(rename="true")]
   public class class_439 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_439(param1:Function)
      {
         super(param1,class_1119);
      }
      
      public function getParser() : class_1119
      {
         return this.var_15 as class_1119;
      }
   }
}
