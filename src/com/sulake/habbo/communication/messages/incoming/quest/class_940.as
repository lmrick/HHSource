package package_83
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_139.class_1438;
   
   [SecureSWF(rename="true")]
   public class class_940 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_940(param1:Function)
      {
         super(param1,class_1438);
      }
      
      public function getParser() : class_1438
      {
         return var_15 as class_1438;
      }
   }
}
