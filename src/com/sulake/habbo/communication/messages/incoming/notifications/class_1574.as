package package_28
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1574
   {
       
      
      private var var_271:int;
      
      private var var_262:int;
      
      private var var_590:int;
      
      private var var_855:int;
      
      private var var_760:int;
      
      private var var_1064:int;
      
      private var var_484:int;
      
      private var var_331:String = "";
      
      private var var_1216:String = "";
      
      private var var_897:int;
      
      private var var_774:String;
      
      private var var_1045:Boolean;
      
      public function class_1574(param1:IMessageDataWrapper)
      {
         super();
         var_271 = param1.readInteger();
         var_262 = param1.readInteger();
         var_484 = param1.readInteger();
         var_331 = param1.readString();
         var_590 = param1.readInteger();
         var_855 = param1.readInteger();
         var_760 = param1.readInteger();
         var_1064 = param1.readInteger();
         var_897 = param1.readInteger();
         var_1216 = param1.readString();
         var_774 = param1.readString();
         var_1045 = param1.readBoolean();
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get points() : int
      {
         return var_590;
      }
      
      public function get levelRewardPoints() : int
      {
         return var_855;
      }
      
      public function get levelRewardPointType() : int
      {
         return var_760;
      }
      
      public function get bonusPoints() : int
      {
         return var_1064;
      }
      
      public function get badgeId() : int
      {
         return var_484;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get removedBadgeCode() : String
      {
         return var_1216;
      }
      
      public function get achievementID() : int
      {
         return var_897;
      }
      
      public function get category() : String
      {
         return var_774;
      }
      
      public function get showDialogToUser() : Boolean
      {
         return var_1045;
      }
   }
}
