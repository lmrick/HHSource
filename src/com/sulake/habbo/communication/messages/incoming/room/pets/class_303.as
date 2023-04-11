package package_14
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_144.class_1350;
   
   [SecureSWF(rename="true")]
   public class class_303 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_303(param1:Function)
      {
         super(param1,class_1350);
      }
      
      public function getParser() : class_1350
      {
         return var_15 as class_1350;
      }
   }
}
