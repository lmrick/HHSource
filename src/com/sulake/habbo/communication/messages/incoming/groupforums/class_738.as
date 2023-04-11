package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1390;
   
   [SecureSWF(rename="true")]
   public class class_738 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_738(param1:Function)
      {
         super(param1,class_1390);
      }
      
      public function getParser() : class_1390
      {
         return this.var_15 as class_1390;
      }
   }
}
