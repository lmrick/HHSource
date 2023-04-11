package package_28
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_147.class_1279;
   
   [SecureSWF(rename="true")]
   public class class_366 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_366(param1:Function)
      {
         super(param1,class_1279);
      }
      
      public function getParser() : class_1279
      {
         return var_15 as class_1279;
      }
   }
}
