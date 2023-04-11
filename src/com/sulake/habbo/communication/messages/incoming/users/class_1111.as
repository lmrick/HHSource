package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1111 implements class_1110
   {
       
      
      private var var_603:Array;
      
      private var var_360:Boolean;
      
      private var _groupId:int;
      
      private var _groupName:String;
      
      private var var_772:String;
      
      private var var_708:int;
      
      private var var_911:int;
      
      private var var_1051:int;
      
      private var var_142:Boolean;
      
      private var var_90:String;
      
      private var var_1154:int;
      
      private var var_1234:int;
      
      private var var_655:Array;
      
      private var var_331:String;
      
      private var var_1254:int;
      
      public function class_1111(param1:IMessageDataWrapper)
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         super();
         var_603 = [];
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_603.push(new class_1570(param1.readInteger(),param1.readString(),param1.readBoolean()));
            _loc3_++;
         }
         var_360 = param1.readBoolean();
         _groupId = param1.readInteger();
         _groupName = param1.readString();
         var_772 = param1.readString();
         var_708 = param1.readInteger();
         var_911 = param1.readInteger();
         var_1051 = param1.readInteger();
         var_1154 = param1.readInteger();
         var_1234 = param1.readInteger();
         var_142 = param1.readBoolean();
         var_90 = param1.readString();
         var_655 = [];
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_655.push(new class_1550(param1));
            _loc3_++;
         }
         var_331 = param1.readString();
         var_1254 = param1.readInteger();
      }
      
      public function get ownedRooms() : Array
      {
         return var_603;
      }
      
      public function get exists() : Boolean
      {
         return true;
      }
      
      public function get isOwner() : Boolean
      {
         return var_360;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function get groupDesc() : String
      {
         return var_772;
      }
      
      public function get baseRoomId() : int
      {
         return var_708;
      }
      
      public function get primaryColorId() : int
      {
         return var_911;
      }
      
      public function get secondaryColorId() : int
      {
         return var_1051;
      }
      
      public function get badgeSettings() : Array
      {
         return var_655;
      }
      
      public function get locked() : Boolean
      {
         return var_142;
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function get guildType() : int
      {
         return var_1154;
      }
      
      public function get guildRightsLevel() : int
      {
         return var_1234;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get membershipCount() : int
      {
         return var_1254;
      }
   }
}
