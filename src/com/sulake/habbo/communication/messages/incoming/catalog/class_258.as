package package_8
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_128.class_1285;
   
   [SecureSWF(rename="true")]
   public class class_258 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_258(param1:Function)
      {
         super(param1,class_1285);
      }
      
      public function getParser() : class_1285
      {
         return this.var_15 as class_1285;
      }
      
      public function get root() : class_1291
      {
         return getParser().root;
      }
      
      public function get newAdditionsAvailable() : Boolean
      {
         return getParser().newAdditionsAvailable;
      }
      
      public function get catalogType() : String
      {
         return getParser().catalogType;
      }
   }
}
