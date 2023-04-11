package package_60
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_170.class_1251;
   
   [SecureSWF(rename="true")]
   public class class_226 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_226(param1:Function)
      {
         super(param1,class_1251);
      }
      
      public function getParser() : class_1251
      {
         return this.var_15 as class_1251;
      }
   }
}
