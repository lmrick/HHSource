package package_24
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_135.class_1418;
   
   [SecureSWF(rename="true")]
   public class class_578 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_578(param1:Function)
      {
         super(param1,class_1418);
      }
      
      public function get success() : Boolean
      {
         return class_1418(var_15).success;
      }
   }
}
