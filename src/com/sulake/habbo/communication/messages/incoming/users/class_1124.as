package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1124 implements class_1110
   {
       
      
      private var var_975:int;
      
      private var var_603:Array;
      
      private var var_655:Array;
      
      public function class_1124(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         super();
         var_975 = param1.readInteger();
         var_603 = [];
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_603.push(new class_1570(param1.readInteger(),param1.readString(),param1.readBoolean()));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         var_655 = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_655.push(new class_1550(param1));
            _loc3_++;
         }
      }
      
      public function get costInCredits() : int
      {
         return var_975;
      }
      
      public function get ownedRooms() : Array
      {
         return var_603;
      }
      
      public function get exists() : Boolean
      {
         return false;
      }
      
      public function get isOwner() : Boolean
      {
         return true;
      }
      
      public function get groupId() : int
      {
         return 0;
      }
      
      public function get groupName() : String
      {
         return "";
      }
      
      public function get groupDesc() : String
      {
         return "";
      }
      
      public function get baseRoomId() : int
      {
         return 0;
      }
      
      public function get primaryColorId() : int
      {
         return 0;
      }
      
      public function get secondaryColorId() : int
      {
         return 0;
      }
      
      public function get badgeSettings() : Array
      {
         return var_655;
      }
      
      public function get locked() : Boolean
      {
         return false;
      }
      
      public function get url() : String
      {
         return "";
      }
      
      public function get guildType() : int
      {
         return 0;
      }
      
      public function get guildRightsLevel() : int
      {
         return 0;
      }
      
      public function get badgeCode() : String
      {
         return "";
      }
      
      public function get membershipCount() : int
      {
         return 0;
      }
   }
}
