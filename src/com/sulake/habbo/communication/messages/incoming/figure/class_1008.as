package package_95
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_179.class_1383;
   
   [SecureSWF(rename="true")]
   public class class_1008 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_1008(param1:Function)
      {
         super(param1,class_1383);
      }
      
      public function getParser() : class_1383
      {
         return var_15 as class_1383;
      }
   }
}
