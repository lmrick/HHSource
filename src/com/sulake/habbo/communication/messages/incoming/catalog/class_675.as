package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1463;
   
   [SecureSWF(rename="true")]
   public class class_675 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_675(param1:Function)
      {
         super(param1,class_1463);
      }
      
      public function get offer() : class_1409
      {
         return class_1463(parser).offerData;
      }
      
      public function get pageId() : int
      {
         return class_1463(parser).pageId;
      }
   }
}
