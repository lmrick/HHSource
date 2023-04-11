package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.class_1489;
   
   [SecureSWF(rename="true")]
   public class class_840 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_840(param1:Function)
      {
         super(param1,class_1489);
      }
      
      public function getParser() : class_1489
      {
         return this.var_15 as class_1489;
      }
   }
}
