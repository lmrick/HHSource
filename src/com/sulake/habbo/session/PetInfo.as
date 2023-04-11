package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_421:int;
      
      private var var_262:int;
      
      private var var_3969:int;
      
      private var var_1258:int;
      
      private var var_3985:int;
      
      private var var_727:int;
      
      private var var_3804:int;
      
      private var _nutrition:int;
      
      private var var_3813:int;
      
      private var var_684:int;
      
      private var _ownerName:String;
      
      private var var_1012:int;
      
      private var var_1260:int;
      
      private var var_759:int;
      
      private var var_841:Boolean;
      
      private var var_1018:Boolean;
      
      private var var_883:Boolean;
      
      private var var_511:Array;
      
      private var var_1117:int;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var var_940:int;
      
      private var var_1038:int;
      
      private var var_705:int;
      
      private var var_784:int;
      
      private var _hasBreedingPermission:Boolean;
      
      private var var_4329:int = 7;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get levelMax() : int
      {
         return var_3969;
      }
      
      public function get experience() : int
      {
         return var_1258;
      }
      
      public function get experienceMax() : int
      {
         return var_3985;
      }
      
      public function get energy() : int
      {
         return var_727;
      }
      
      public function get energyMax() : int
      {
         return var_3804;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return var_3813;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1012;
      }
      
      public function get age() : int
      {
         return var_1260;
      }
      
      public function get breedId() : int
      {
         return var_759;
      }
      
      public function get hasFreeSaddle() : Boolean
      {
         return var_841;
      }
      
      public function get isRiding() : Boolean
      {
         return var_1018;
      }
      
      public function get skillTresholds() : Array
      {
         return var_511;
      }
      
      public function get accessRights() : int
      {
         return var_1117;
      }
      
      public function get canBreed() : Boolean
      {
         return var_883;
      }
      
      public function get canHarvest() : Boolean
      {
         return var_712;
      }
      
      public function get canRevive() : Boolean
      {
         return var_878;
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
      }
      
      public function set petId(param1:int) : void
      {
         var_421 = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_262 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_3969 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1258 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_3985 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         var_727 = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_3804 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_3813 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_684 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         var_1012 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1260 = param1;
      }
      
      public function set breedId(param1:int) : void
      {
         var_759 = param1;
      }
      
      public function set hasFreeSaddle(param1:Boolean) : void
      {
         var_841 = param1;
      }
      
      public function set isRiding(param1:Boolean) : void
      {
         var_1018 = param1;
      }
      
      public function set skillTresholds(param1:Array) : void
      {
         var_511 = param1;
      }
      
      public function set accessRights(param1:int) : void
      {
         var_1117 = param1;
      }
      
      public function set canBreed(param1:Boolean) : void
      {
         var_883 = param1;
      }
      
      public function set canHarvest(param1:Boolean) : void
      {
         var_712 = param1;
      }
      
      public function set canRevive(param1:Boolean) : void
      {
         var_878 = param1;
      }
      
      public function get maxWellBeingSeconds() : int
      {
         return var_940;
      }
      
      public function set maxWellBeingSeconds(param1:int) : void
      {
         var_940 = param1;
      }
      
      public function get remainingWellBeingSeconds() : int
      {
         return var_1038;
      }
      
      public function set remainingWellBeingSeconds(param1:int) : void
      {
         var_1038 = param1;
      }
      
      public function get remainingGrowingSeconds() : int
      {
         return var_705;
      }
      
      public function set remainingGrowingSeconds(param1:int) : void
      {
         var_705 = param1;
      }
      
      public function set rarityLevel(param1:int) : void
      {
         var_784 = param1;
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
      
      public function set hasBreedingPermission(param1:Boolean) : void
      {
         _hasBreedingPermission = param1;
      }
      
      public function get adultLevel() : int
      {
         return var_4329;
      }
   }
}
