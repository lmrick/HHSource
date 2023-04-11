package package_83
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_139.class_1096;
   
   [SecureSWF(rename="true")]
   public class class_523 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_523(param1:Function)
      {
         super(param1,class_1096);
      }
      
      public function getParser() : class_1096
      {
         return var_15 as class_1096;
      }
   }
}
