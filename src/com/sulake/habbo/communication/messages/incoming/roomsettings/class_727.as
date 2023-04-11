package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1053;
   
   [SecureSWF(rename="true")]
   public class class_727 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_727(param1:Function)
      {
         super(param1,class_1053);
      }
      
      public function getParser() : class_1053
      {
         return this.var_15 as class_1053;
      }
   }
}
