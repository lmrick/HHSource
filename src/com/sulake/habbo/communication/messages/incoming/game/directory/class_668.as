package package_75
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_140.class_1190;
   
   [SecureSWF(rename="true")]
   public class class_668 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_668(param1:Function)
      {
         super(param1,class_1190);
      }
      
      public function getParser() : class_1190
      {
         return this.var_15 as class_1190;
      }
   }
}
