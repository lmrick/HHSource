package package_149
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1657
   {
      
      public static const const_388:String = "ACH_HabboWayGraduate1";
      
      public static const const_127:String = "ACH_GuideGroupMember1";
      
      public static const const_276:String = "ACH_SafetyQuizGraduate1";
      
      public static const const_354:String = "ACH_EmailVerification1";
      
      public static const ROOM_ENTRY_1:String = "ACH_RoomEntry1";
      
      public static const ROOM_ENTRY_2:String = "ACH_RoomEntry2";
      
      public static const const_259:String = "ACH_AvatarLooks1";
      
      public static const const_98:String = "ACH_GuideAdvertisementReader1";
       
      
      private var var_442:int;
      
      private var var_409:int;
      
      private var var_331:String;
      
      private var var_159:int;
      
      private var var_1245:int;
      
      private var var_1180:int;
      
      public function class_1657(param1:IMessageDataWrapper)
      {
         super();
         var_442 = param1.readInteger();
         var_409 = param1.readInteger();
         var_331 = param1.readString();
         var_159 = param1.readInteger();
         var_1245 = param1.readInteger();
         var_1180 = param1.readInteger();
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get achievementId() : int
      {
         return var_442;
      }
      
      public function get requiredLevel() : int
      {
         return var_409;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get currentScore() : int
      {
         return var_1245;
      }
      
      public function get totalScore() : int
      {
         return var_1180;
      }
      
      public function hasProgressDisplay() : Boolean
      {
         switch(badgeCode)
         {
            case "ACH_HabboWayGraduate1":
            case "ACH_SafetyQuizGraduate1":
            case "ACH_EmailVerification1":
            case "ACH_AvatarLooks1":
               break;
            default:
               return true;
         }
         return false;
      }
   }
}
