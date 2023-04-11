package package_50
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_137.class_1153;
   
   [SecureSWF(rename="true")]
   public class class_651 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_651(param1:Function)
      {
         super(param1,class_1153);
      }
      
      public function getParser() : class_1153
      {
         return parser as class_1153;
      }
   }
}
