package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.class_1118;
   
   [SecureSWF(rename="true")]
   public class class_407 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_407(param1:Function)
      {
         super(param1,class_1118);
      }
      
      public function getParser() : class_1118
      {
         return this.var_15 as class_1118;
      }
   }
}
