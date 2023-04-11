package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1115;
   
   [SecureSWF(rename="true")]
   public class class_693 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_693(param1:Function)
      {
         super(param1,class_1115);
      }
      
      public function getParser() : class_1115
      {
         return this.var_15 as class_1115;
      }
   }
}
