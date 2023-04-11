package package_83
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1647
   {
       
      
      private var var_1049:int;
      
      private var var_1095:String;
      
      private var var_1055:int;
      
      private var var_716:String;
      
      private var var_972:Boolean;
      
      private var _localizedName:String;
      
      public function class_1647(param1:IMessageDataWrapper)
      {
         super();
         var_1049 = param1.readInteger();
         var_1095 = param1.readString();
         var_1055 = param1.readInteger();
         var_716 = param1.readString();
         var_972 = param1.readBoolean();
         _localizedName = param1.readString();
      }
      
      public function get communityGoalId() : int
      {
         return var_1049;
      }
      
      public function get communityGoalCode() : String
      {
         return var_1095;
      }
      
      public function get userRank() : int
      {
         return var_1055;
      }
      
      public function get rewardCode() : String
      {
         return var_716;
      }
      
      public function get badge() : Boolean
      {
         return var_972;
      }
      
      public function get localizedName() : String
      {
         return _localizedName;
      }
   }
}
