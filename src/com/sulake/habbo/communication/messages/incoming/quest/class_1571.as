package package_83
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1571 implements class_13
   {
       
      
      private var var_994:Boolean;
      
      private var var_1160:int;
      
      private var var_1230:int;
      
      private var var_1134:int;
      
      private var var_934:int;
      
      private var var_742:int;
      
      private var var_1152:int;
      
      private var var_822:String;
      
      private var var_937:int;
      
      private var var_204:Array;
      
      public function class_1571(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var_204 = [];
         super();
         var_994 = param1.readBoolean();
         var_1160 = param1.readInteger();
         var_1230 = param1.readInteger();
         var_1134 = param1.readInteger();
         var_934 = param1.readInteger();
         var_742 = param1.readInteger();
         var_1152 = param1.readInteger();
         var_822 = param1.readString();
         var_937 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_204.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         var_204 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_204 == null;
      }
      
      public function get hasGoalExpired() : Boolean
      {
         return var_994;
      }
      
      public function get personalContributionScore() : int
      {
         return var_1160;
      }
      
      public function get personalContributionRank() : int
      {
         return var_1230;
      }
      
      public function get communityTotalScore() : int
      {
         return var_1134;
      }
      
      public function get communityHighestAchievedLevel() : int
      {
         return var_934;
      }
      
      public function get scoreRemainingUntilNextLevel() : int
      {
         return var_742;
      }
      
      public function get percentCompletionTowardsNextLevel() : int
      {
         return var_1152;
      }
      
      public function get timeRemainingInSeconds() : int
      {
         return var_937;
      }
      
      public function get rewardUserLimits() : Array
      {
         return var_204;
      }
      
      public function get goalCode() : String
      {
         return var_822;
      }
   }
}
