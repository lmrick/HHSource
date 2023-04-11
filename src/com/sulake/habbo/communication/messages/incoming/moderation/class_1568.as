package package_50
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1568
   {
       
      
      private var var_1097:int;
      
      private var var_864:int;
      
      private var var_1145:int;
      
      private var var_1003:int;
      
      private var var_505:package_50.class_1644;
      
      public function class_1568(param1:IMessageDataWrapper)
      {
         super();
         var_1097 = param1.readInteger();
         var_864 = param1.readInteger();
         var_1145 = param1.readInteger();
         var_1003 = param1.readInteger();
         var_505 = new package_50.class_1644(param1);
      }
      
      public function get callId() : int
      {
         return var_1097;
      }
      
      public function get callerUserId() : int
      {
         return var_864;
      }
      
      public function get reportedUserId() : int
      {
         return var_1145;
      }
      
      public function get chatRecordId() : int
      {
         return var_1003;
      }
      
      public function get chatRecord() : package_50.class_1644
      {
         return var_505;
      }
   }
}
