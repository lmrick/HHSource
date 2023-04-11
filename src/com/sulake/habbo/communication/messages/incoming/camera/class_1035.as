package package_82
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_145.class_1081;
   
   [SecureSWF(rename="true")]
   public class class_1035 extends MessageEvent
   {
       
      
      public function class_1035(param1:Function)
      {
         super(param1,class_1081);
      }
      
      public function getParser() : class_1081
      {
         return this.var_15 as class_1081;
      }
   }
}
