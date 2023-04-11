package package_54
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_123.class_1242;
   
   [SecureSWF(rename="true")]
   public class class_594 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_594(param1:Function)
      {
         super(param1,class_1242);
      }
      
      public function getParser() : class_1242
      {
         return this.var_15 as class_1242;
      }
   }
}
