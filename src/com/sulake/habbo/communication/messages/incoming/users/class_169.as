package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1236;
   
   [SecureSWF(rename="true")]
   public class class_169 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_169(param1:Function)
      {
         super(param1,class_1236);
      }
      
      public function getParser() : class_1236
      {
         return class_1236(var_15);
      }
   }
}
