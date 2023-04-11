package package_5
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_130.class_1215;
   
   [SecureSWF(rename="true")]
   public class class_206 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_206(param1:Function)
      {
         super(param1,class_1215);
      }
      
      public function getParser() : class_1215
      {
         return var_15 as class_1215;
      }
   }
}
