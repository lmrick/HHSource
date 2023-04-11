package package_55
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_166.class_1152;
   
   [SecureSWF(rename="true")]
   public class class_268 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_268(param1:Function)
      {
         super(param1,class_1152);
      }
      
      public function getParser() : class_1152
      {
         return this.var_15 as class_1152;
      }
   }
}
