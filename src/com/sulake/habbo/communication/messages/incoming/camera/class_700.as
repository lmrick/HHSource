package package_82
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_145.class_1339;
   
   [SecureSWF(rename="true")]
   public class class_700 extends MessageEvent
   {
       
      
      public function class_700(param1:Function)
      {
         super(param1,class_1339);
      }
      
      public function getParser() : class_1339
      {
         return this.var_15 as class_1339;
      }
   }
}
