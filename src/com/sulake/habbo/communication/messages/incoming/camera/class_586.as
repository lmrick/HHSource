package package_82
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_145.class_1202;
   
   [SecureSWF(rename="true")]
   public class class_586 extends MessageEvent
   {
       
      
      public function class_586(param1:Function)
      {
         super(param1,class_1202);
      }
      
      public function getParser() : class_1202
      {
         return this.var_15 as class_1202;
      }
   }
}
