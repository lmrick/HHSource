package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1244;
   
   [SecureSWF(rename="true")]
   public class class_726 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_726(param1:Function)
      {
         super(param1,class_1244);
      }
      
      public function getParser() : class_1244
      {
         return this.var_15 as class_1244;
      }
   }
}
