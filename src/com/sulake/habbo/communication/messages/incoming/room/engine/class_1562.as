package package_17
{
   [SecureSWF(rename="true")]
   public class class_1562
   {
      
      public static const const_340:String = "M";
      
      public static const const_307:String = "F";
       
      
      private var var_783:int = 0;
      
      private var var_29:Number = 0;
      
      private var var_28:Number = 0;
      
      private var var_30:Number = 0;
      
      private var var_386:int = 0;
      
      private var _name:String = "";
      
      private var var_876:int = 0;
      
      private var var_133:String = "";
      
      private var var_427:String = "";
      
      private var var_1025:String = "";
      
      private var _achievementScore:int;
      
      private var var_761:int = 0;
      
      private var var_956:String = "";
      
      private var _groupStatus:int = 0;
      
      private var _groupName:String = "";
      
      private var var_529:String = "";
      
      private var var_684:int = 0;
      
      private var _ownerName:String;
      
      private var var_784:int;
      
      private var var_1132:Boolean;
      
      private var var_1018:Boolean;
      
      private var var_883:Boolean;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var _hasBreedingPermission:Boolean;
      
      private var var_821:int = 0;
      
      private var var_1081:String = "";
      
      private var _botSkills:Array;
      
      private var var_1227:Boolean;
      
      private var var_25:Boolean = false;
      
      public function class_1562(param1:int)
      {
         super();
         var_783 = param1;
      }
      
      public function setReadOnly() : void
      {
         var_25 = true;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get x() : Number
      {
         return var_29;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_25)
         {
            var_29 = param1;
         }
      }
      
      public function get y() : Number
      {
         return var_28;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_25)
         {
            var_28 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_25)
         {
            var_30 = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_386;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_25)
         {
            var_386 = param1;
         }
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_25)
         {
            _name = param1;
         }
      }
      
      public function get userType() : int
      {
         return var_876;
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_25)
         {
            var_876 = param1;
         }
      }
      
      public function get sex() : String
      {
         return var_133;
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_25)
         {
            var_133 = param1;
         }
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_25)
         {
            var_427 = param1;
         }
      }
      
      public function get custom() : String
      {
         return var_1025;
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_25)
         {
            var_1025 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return _achievementScore;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!var_25)
         {
            _achievementScore = param1;
         }
      }
      
      public function get webID() : int
      {
         return var_761;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_25)
         {
            var_761 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return var_956;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_25)
         {
            var_956 = param1;
         }
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function set groupName(param1:String) : void
      {
         if(!var_25)
         {
            _groupName = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return _groupStatus;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_25)
         {
            _groupStatus = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_529;
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_25)
         {
            var_529 = param1;
         }
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function set ownerId(param1:int) : void
      {
         if(!var_25)
         {
            var_684 = param1;
         }
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set ownerName(param1:String) : void
      {
         if(!var_25)
         {
            _ownerName = param1;
         }
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
      }
      
      public function set rarityLevel(param1:int) : void
      {
         if(!var_25)
         {
            var_784 = param1;
         }
      }
      
      public function get hasSaddle() : Boolean
      {
         return var_1132;
      }
      
      public function set hasSaddle(param1:Boolean) : void
      {
         if(!var_25)
         {
            var_1132 = param1;
         }
      }
      
      public function get isRiding() : Boolean
      {
         return var_1018;
      }
      
      public function set isRiding(param1:Boolean) : void
      {
         if(!var_25)
         {
            var_1018 = param1;
         }
      }
      
      public function get canBreed() : Boolean
      {
         return var_883;
      }
      
      public function set canBreed(param1:Boolean) : void
      {
         if(!var_25)
         {
            var_883 = param1;
         }
      }
      
      public function get canHarvest() : Boolean
      {
         return var_712;
      }
      
      public function set canHarvest(param1:Boolean) : void
      {
         if(!var_25)
         {
            var_712 = param1;
         }
      }
      
      public function get canRevive() : Boolean
      {
         return var_878;
      }
      
      public function set canRevive(param1:Boolean) : void
      {
         if(!var_25)
         {
            var_878 = param1;
         }
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
      
      public function set hasBreedingPermission(param1:Boolean) : void
      {
         if(!var_25)
         {
            _hasBreedingPermission = param1;
         }
      }
      
      public function get petLevel() : int
      {
         return var_821;
      }
      
      public function set petLevel(param1:int) : void
      {
         if(!var_25)
         {
            var_821 = param1;
         }
      }
      
      public function get petPosture() : String
      {
         return var_1081;
      }
      
      public function set petPosture(param1:String) : void
      {
         if(!var_25)
         {
            var_1081 = param1;
         }
      }
      
      public function get botSkills() : Array
      {
         return _botSkills;
      }
      
      public function set botSkills(param1:Array) : void
      {
         _botSkills = param1;
      }
      
      public function get isModerator() : Boolean
      {
         return var_1227;
      }
      
      public function set isModerator(param1:Boolean) : void
      {
         if(!var_25)
         {
            var_1227 = param1;
         }
      }
   }
}
