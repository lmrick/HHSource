package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1445;
   
   [SecureSWF(rename="true")]
   public class class_191 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_191(param1:Function)
      {
         super(param1,class_1445);
      }
      
      public function getParser() : class_1445
      {
         return this.var_15 as class_1445;
      }
   }
}
