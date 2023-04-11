package package_72
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_155.class_1201;
   
   [SecureSWF(rename="true")]
   public class class_291 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_291(param1:Function)
      {
         super(param1,class_1201);
      }
      
      public function getParser() : class_1201
      {
         return this.var_15 as class_1201;
      }
   }
}
