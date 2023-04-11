package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1292;
   
   [SecureSWF(rename="true")]
   public class class_906 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_906(param1:Function)
      {
         super(param1,class_1292);
      }
      
      public function getParser() : class_1292
      {
         return this.var_15 as class_1292;
      }
   }
}
