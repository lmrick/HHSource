package package_5
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1126
   {
      
      public static const TYPE_REGULAR:int = 0;
      
      public static const TYPE_EXCLUSIVE:int = 1;
      
      public static const const_317:int = 2;
      
      public static const TYPE_LARGE:int = 3;
      
      public static const const_150:int = 4;
      
      public static const const_167:int = 0;
      
      public static const const_236:int = 1;
      
      public static const const_159:int = 2;
       
      
      private var _groupId:int;
      
      private var var_623:Boolean;
      
      private var var_271:int;
      
      private var _groupName:String;
      
      private var _description:String;
      
      private var var_331:String;
      
      private var var_354:int = -1;
      
      private var _roomName:String = "";
      
      private var _status:int;
      
      private var var_838:int;
      
      private var var_799:Boolean;
      
      private var var_1033:String;
      
      private var var_360:Boolean;
      
      private var _isAdmin:Boolean;
      
      private var _ownerName:String;
      
      private var var_1300:Boolean;
      
      private var var_1286:Boolean;
      
      private var var_688:Boolean;
      
      private var var_823:int;
      
      public function class_1126(param1:IMessageDataWrapper)
      {
         super();
         _groupId = param1.readInteger();
         var_623 = param1.readBoolean();
         var_271 = param1.readInteger();
         _groupName = param1.readString();
         _description = param1.readString();
         var_331 = param1.readString();
         var_354 = param1.readInteger();
         _roomName = param1.readString();
         _status = param1.readInteger();
         var_838 = param1.readInteger();
         var_799 = param1.readBoolean();
         var_1033 = param1.readString();
         var_360 = param1.readBoolean();
         _isAdmin = param1.readBoolean();
         _ownerName = param1.readString();
         var_1300 = param1.readBoolean();
         var_688 = param1.readBoolean();
         var_823 = param1.readInteger();
         var_1286 = param1.readBoolean();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get isGuild() : Boolean
      {
         return var_623;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get badgeCode() : String
      {
         return var_331;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get totalMembers() : int
      {
         return var_838;
      }
      
      public function get favourite() : Boolean
      {
         return var_799;
      }
      
      public function get creationDate() : String
      {
         return var_1033;
      }
      
      public function get isOwner() : Boolean
      {
         return var_360;
      }
      
      public function get isAdmin() : Boolean
      {
         return _isAdmin;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get openDetails() : Boolean
      {
         return var_1300;
      }
      
      public function get membersCanDecorate() : Boolean
      {
         return var_688;
      }
      
      public function get pendingMemberCount() : int
      {
         return var_823;
      }
      
      public function get hasBoard() : Boolean
      {
         return var_1286;
      }
      
      public function get joiningAllowed() : Boolean
      {
         return _status == 0 && (var_271 == 0 || var_271 == 4);
      }
      
      public function get requestMembershipAllowed() : Boolean
      {
         return _status == 0 && var_271 == 1;
      }
      
      public function get leaveAllowed() : Boolean
      {
         return var_623 && !var_360 && _status == 1;
      }
   }
}
