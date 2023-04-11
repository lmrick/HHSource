package package_16
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_125.class_1052;
   
   [SecureSWF(rename="true")]
   public class class_503 extends MessageEvent
   {
       
      
      public function class_503(param1:Function, param2:Class)
      {
         super(param1,param2);
      }
      
      public function get userID() : int
      {
         return getParser().userID;
      }
      
      public function getParser() : class_1052
      {
         return var_15 as class_1052;
      }
   }
}
