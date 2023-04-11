package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1192;
   
   [SecureSWF(rename="true")]
   public class class_201 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_201(param1:Function)
      {
         super(param1,class_1192);
      }
      
      public function getParser() : class_1192
      {
         return var_15 as class_1192;
      }
   }
}
