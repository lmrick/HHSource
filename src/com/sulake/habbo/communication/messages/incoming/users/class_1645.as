package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1645
   {
       
      
      private var var_918:int;
      
      private var var_734:int;
      
      private var var_796:int;
      
      private var var_1082:String;
      
      private var var_704:String;
      
      public function class_1645(param1:IMessageDataWrapper)
      {
         super();
         var_918 = param1.readInteger();
         var_734 = param1.readInteger();
         var_796 = param1.readInteger();
         var_1082 = param1.readString();
         var_704 = param1.readString();
      }
      
      public function get relationshipStatusType() : int
      {
         return var_918;
      }
      
      public function get friendCount() : int
      {
         return var_734;
      }
      
      public function get randomFriendId() : int
      {
         return var_796;
      }
      
      public function get randomFriendName() : String
      {
         return var_1082;
      }
      
      public function get randomFriendFigure() : String
      {
         return var_704;
      }
   }
}
