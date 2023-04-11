package package_25
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_136.class_1300;
   
   [SecureSWF(rename="true")]
   public class class_864 extends MessageEvent
   {
       
      
      public function class_864(param1:Function)
      {
         super(param1,class_1300);
      }
      
      public function getParser() : class_1300
      {
         return parser as class_1300;
      }
   }
}
