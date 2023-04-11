package com.sulake.habbo.session
{
   public class UserData implements class_3259
   {
       
      
      private var var_4164:int = -1;
      
      private var _name:String = "";
      
      private var var_271:int = 0;
      
      private var var_133:String = "";
      
      private var var_427:String = "";
      
      private var var_1025:String = "";
      
      private var _achievementScore:int;
      
      private var var_761:int = 0;
      
      private var var_956:String = "";
      
      private var _groupStatus:int = 0;
      
      private var _groupName:String = "";
      
      private var var_684:int = 0;
      
      private var _ownerName:String = "";
      
      private var var_821:int = 0;
      
      private var var_784:int = 0;
      
      private var var_1132:Boolean;
      
      private var var_1018:Boolean;
      
      private var var_883:Boolean;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var _hasBreedingPermission:Boolean;
      
      private var _botSkills:Array;
      
      private var var_3959:Array;
      
      private var var_1227:Boolean;
      
      public function UserData(param1:int)
      {
         super();
         var_4164 = param1;
      }
      
      public function get roomObjectId() : int
      {
         return var_4164;
      }
      
      public function get achievementScore() : int
      {
         return _achievementScore;
      }
      
      public function set achievementScore(param1:int) : void
      {
         _achievementScore = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function set type(param1:int) : void
      {
         var_271 = param1;
      }
      
      public function get sex() : String
      {
         return var_133;
      }
      
      public function set sex(param1:String) : void
      {
         var_133 = param1;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function set figure(param1:String) : void
      {
         var_427 = param1;
      }
      
      public function get custom() : String
      {
         return var_1025;
      }
      
      public function set custom(param1:String) : void
      {
         var_1025 = param1;
      }
      
      public function get webID() : int
      {
         return var_761;
      }
      
      public function set webID(param1:int) : void
      {
         var_761 = param1;
      }
      
      public function get groupID() : String
      {
         return var_956;
      }
      
      public function set groupID(param1:String) : void
      {
         var_956 = param1;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function set groupName(param1:String) : void
      {
         _groupName = param1;
      }
      
      public function get groupStatus() : int
      {
         return _groupStatus;
      }
      
      public function set groupStatus(param1:int) : void
      {
         _groupStatus = param1;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_684 = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
      }
      
      public function set rarityLevel(param1:int) : void
      {
         var_784 = param1;
      }
      
      public function get hasSaddle() : Boolean
      {
         return var_1132;
      }
      
      public function set hasSaddle(param1:Boolean) : void
      {
         var_1132 = param1;
      }
      
      public function get isRiding() : Boolean
      {
         return var_1018;
      }
      
      public function set isRiding(param1:Boolean) : void
      {
         var_1018 = param1;
      }
      
      public function get canBreed() : Boolean
      {
         return var_883;
      }
      
      public function set canBreed(param1:Boolean) : void
      {
         var_883 = param1;
      }
      
      public function get canHarvest() : Boolean
      {
         return var_712;
      }
      
      public function set canHarvest(param1:Boolean) : void
      {
         var_712 = param1;
      }
      
      public function get canRevive() : Boolean
      {
         return var_878;
      }
      
      public function set canRevive(param1:Boolean) : void
      {
         var_878 = param1;
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
      
      public function set hasBreedingPermission(param1:Boolean) : void
      {
         _hasBreedingPermission = param1;
      }
      
      public function get petLevel() : int
      {
         return var_821;
      }
      
      public function set petLevel(param1:int) : void
      {
         var_821 = param1;
      }
      
      public function get botSkills() : Array
      {
         return _botSkills;
      }
      
      public function set botSkills(param1:Array) : void
      {
         _botSkills = param1;
      }
      
      public function get botSkillData() : Array
      {
         return var_3959;
      }
      
      public function set botSkillData(param1:Array) : void
      {
         var_3959 = param1;
      }
      
      public function get isModerator() : Boolean
      {
         return var_1227;
      }
      
      public function set isModerator(param1:Boolean) : void
      {
         var_1227 = param1;
      }
   }
}
