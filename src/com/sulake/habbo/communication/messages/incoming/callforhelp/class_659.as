package package_36
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_165.class_1148;
   
   [SecureSWF(rename="true")]
   public class class_659 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_659(param1:Function)
      {
         super(param1,class_1148);
      }
      
      public function getParser() : class_1148
      {
         return var_15 as class_1148;
      }
   }
}
