package package_44
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import package_151.class_1509;
   
   [SecureSWF(rename="true")]
   public class class_195 extends MessageEvent implements IMessageEvent
   {
       
      
      public function class_195(param1:Function)
      {
         super(param1,class_1509);
      }
      
      private function getParser() : class_1509
      {
         return this.var_15 as class_1509;
      }
      
      public function get figure() : String
      {
         return (var_15 as class_1509).figure;
      }
      
      public function get gender() : String
      {
         return (var_15 as class_1509).gender;
      }
   }
}
