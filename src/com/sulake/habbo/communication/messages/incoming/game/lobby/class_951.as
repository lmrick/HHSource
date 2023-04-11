package package_66
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_173.class_1473;
   
   [SecureSWF(rename="true")]
   public class class_951 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_951(param1:Function)
      {
         super(param1,class_1473);
      }
      
      public function getParser() : class_1473
      {
         return this.var_15 as class_1473;
      }
   }
}
