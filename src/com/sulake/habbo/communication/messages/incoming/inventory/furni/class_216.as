package package_55
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_166.class_1447;
   
   [SecureSWF(rename="true")]
   public class class_216 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_216(param1:Function)
      {
         super(param1,class_1447);
      }
      
      public function getParser() : class_1447
      {
         return this.var_15 as class_1447;
      }
   }
}
