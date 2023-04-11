package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1628
   {
       
      
      private var var_1174:int;
      
      private var var_842:String;
      
      private var var_915:Number;
      
      private var var_1026:int;
      
      private var var_1282:int;
      
      private var var_874:int;
      
      private var var_936:int;
      
      private var var_978:int;
      
      private var var_913:int;
      
      public function class_1628(param1:IMessageDataWrapper = null)
      {
         super();
         var_1174 = param1.readInteger();
         var_842 = param1.readString();
         var_915 = param1.readDouble();
         var_1026 = param1.readInteger();
         var_1282 = param1.readInteger();
         var_874 = param1.readInteger();
         var_936 = param1.readInteger();
         var_978 = param1.readInteger();
         var_913 = param1.readInteger();
      }
      
      public function get currentHcStreak() : int
      {
         return var_1174;
      }
      
      public function get firstSubscriptionDate() : String
      {
         return var_842;
      }
      
      public function get kickbackPercentage() : Number
      {
         return var_915;
      }
      
      public function get totalCreditsMissed() : int
      {
         return var_1026;
      }
      
      public function get totalCreditsRewarded() : int
      {
         return var_1282;
      }
      
      public function get totalCreditsSpent() : int
      {
         return var_874;
      }
      
      public function get creditRewardForStreakBonus() : int
      {
         return var_936;
      }
      
      public function get creditRewardForMonthlySpent() : int
      {
         return var_978;
      }
      
      public function get timeUntilPayday() : int
      {
         return var_913;
      }
   }
}
