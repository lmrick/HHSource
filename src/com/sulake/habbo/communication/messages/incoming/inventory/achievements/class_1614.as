package package_101
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1614
   {
      
      public static const const_155:int = -1;
      
      public static const const_206:int = 0;
      
      public static const const_168:int = 1;
      
      public static const const_355:int = 2;
       
      
      private var var_442:int;
      
      private var var_262:int;
      
      private var var_484:String;
      
      private var var_443:int;
      
      private var var_633:int;
      
      private var var_855:int;
      
      private var var_760:int;
      
      private var var_395:int;
      
      private var var_674:Boolean;
      
      private var var_774:String;
      
      private var var_941:String;
      
      private var var_1143:int;
      
      private var var_1130:int;
      
      private var var_159:int;
      
      public function class_1614(param1:IMessageDataWrapper)
      {
         super();
         var_442 = param1.readInteger();
         var_262 = param1.readInteger();
         var_484 = param1.readString();
         var_443 = param1.readInteger();
         var_633 = Math.max(1,param1.readInteger());
         var_855 = param1.readInteger();
         var_760 = param1.readInteger();
         var_395 = param1.readInteger();
         var_674 = param1.readBoolean();
         var_774 = param1.readString();
         var_941 = param1.readString();
         var_1143 = param1.readInteger();
         var_1130 = param1.readInteger();
         var_159 = param1.readShort();
      }
      
      public function get achievementId() : int
      {
         return var_442;
      }
      
      public function get badgeId() : String
      {
         return var_484;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get scoreAtStartOfLevel() : int
      {
         return var_443;
      }
      
      public function get scoreLimit() : int
      {
         return var_633 - var_443;
      }
      
      public function get levelRewardPoints() : int
      {
         return var_855;
      }
      
      public function get levelRewardPointType() : int
      {
         return var_760;
      }
      
      public function get currentPoints() : int
      {
         return var_395 - var_443;
      }
      
      public function get finalLevel() : Boolean
      {
         return var_674;
      }
      
      public function get category() : String
      {
         return var_774;
      }
      
      public function get subCategory() : String
      {
         return var_941;
      }
      
      public function get levelCount() : int
      {
         return var_1143;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return var_262 > 1 || var_674;
      }
      
      public function setMaxProgress() : void
      {
         var_395 = var_633;
      }
      
      public function get displayMethod() : int
      {
         return var_1130;
      }
   }
}
