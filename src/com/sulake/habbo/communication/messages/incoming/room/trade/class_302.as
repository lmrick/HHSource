package package_16
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_125.class_1411;
   
   [SecureSWF(rename="true")]
   public class class_302 extends MessageEvent
   {
       
      
      public function class_302(param1:Function, param2:Class)
      {
         super(param1,param2);
      }
      
      public function get userID() : int
      {
         return getParser().userID;
      }
      
      public function get userAccepts() : Boolean
      {
         return getParser().userAccepts;
      }
      
      public function getParser() : class_1411
      {
         return var_15 as class_1411;
      }
   }
}
