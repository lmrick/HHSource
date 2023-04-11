package package_82
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_145.class_1213;
   
   [SecureSWF(rename="true")]
   public class class_333 extends MessageEvent
   {
       
      
      public function class_333(param1:Function)
      {
         super(param1,class_1213);
      }
      
      public function getParser() : class_1213
      {
         return this.var_15 as class_1213;
      }
   }
}
