package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1233;
   
   [SecureSWF(rename="true")]
   public class class_697 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_697(param1:Function)
      {
         super(param1,class_1233);
      }
      
      public function getParser() : class_1233
      {
         return this.var_15 as class_1233;
      }
   }
}
