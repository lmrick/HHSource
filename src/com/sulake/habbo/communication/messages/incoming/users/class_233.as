package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1443;
   
   [SecureSWF(rename="true")]
   public class class_233 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_233(param1:Function)
      {
         super(param1,class_1443);
      }
      
      public function get data() : class_1111
      {
         return class_1443(var_15).data;
      }
   }
}
