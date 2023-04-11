package package_83
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_139.class_1493;
   
   [SecureSWF(rename="true")]
   public class class_335 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_335(param1:Function)
      {
         super(param1,class_1493);
      }
      
      public function getParser() : class_1493
      {
         return var_15 as class_1493;
      }
   }
}
