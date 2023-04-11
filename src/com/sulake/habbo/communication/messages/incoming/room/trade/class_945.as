package package_16
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_125.class_1333;
   
   [SecureSWF(rename="true")]
   public class class_945 extends MessageEvent
   {
       
      
      public function class_945(param1:Function, param2:Class)
      {
         super(param1,param2);
      }
      
      public function get userID() : int
      {
         return getParser().userID;
      }
      
      public function get userCanTrade() : Boolean
      {
         return getParser().userCanTrade;
      }
      
      public function get otherUserID() : int
      {
         return getParser().otherUserID;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return getParser().otherUserCanTrade;
      }
      
      public function getParser() : class_1333
      {
         return var_15 as class_1333;
      }
   }
}
