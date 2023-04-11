package package_93
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_146.class_1191;
   
   [SecureSWF(rename="true")]
   public class class_1004 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1004(param1:Function)
      {
         super(param1,class_1191);
      }
      
      public function getParser() : class_1191
      {
         return this.var_15 as class_1191;
      }
   }
}
