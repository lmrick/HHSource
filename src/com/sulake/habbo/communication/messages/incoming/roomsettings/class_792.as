package package_78
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_126.class_1211;
   
   [SecureSWF(rename="true")]
   public class class_792 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_792(param1:Function)
      {
         super(param1,class_1211);
      }
      
      public function getParser() : class_1211
      {
         return this.var_15 as class_1211;
      }
   }
}
