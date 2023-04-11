package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_262:int;
      
      private var var_3969:int;
      
      private var var_1258:int;
      
      private var var_3985:int;
      
      private var var_727:int;
      
      private var var_3804:int;
      
      private var _nutrition:int;
      
      private var var_3813:int;
      
      private var var_3856:int;
      
      private var _name:String = "";
      
      private var var_421:int = -1;
      
      private var var_271:int;
      
      private var var_3860:int;
      
      private var var_973:BitmapData;
      
      private var var_3935:Boolean;
      
      private var var_684:int;
      
      private var _ownerName:String;
      
      private var var_3838:Boolean;
      
      private var var_783:int;
      
      private var var_1260:int;
      
      private var var_759:int;
      
      private var var_511:Array;
      
      private var var_1117:int;
      
      private var var_784:int;
      
      private var _hasBreedingPermission:Boolean;
      
      private var var_940:int;
      
      private var var_1038:int;
      
      private var var_705:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get id() : int
      {
         return var_421;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get race() : int
      {
         return var_3860;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_3935;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canRemovePet() : Boolean
      {
         return var_3838;
      }
      
      public function get age() : int
      {
         return var_1260;
      }
      
      public function get breedId() : int
      {
         return var_759;
      }
      
      public function get skillTresholds() : Array
      {
         return var_511;
      }
      
      public function get accessRights() : int
      {
         return var_1117;
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
      
      public function get petRespect() : int
      {
         return var_3856;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
      }
      
      public function get maxWellBeingSeconds() : int
      {
         return var_940;
      }
      
      public function get remainingWellBeingSeconds() : int
      {
         return var_1038;
      }
      
      public function get remainingGrowingSeconds() : int
      {
         return var_705;
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_421 = param1.id;
         var_271 = param1.petType;
         var_3860 = param1.petRace;
         var_973 = param1.image;
         var_3935 = param1.isOwnPet;
         var_684 = param1.ownerId;
         _ownerName = param1.ownerName;
         var_3838 = param1.canRemovePet;
         var_262 = param1.level;
         var_3969 = param1.levelMax;
         var_1258 = param1.experience;
         var_3985 = param1.experienceMax;
         var_727 = param1.energy;
         var_3804 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_3813 = param1.nutritionMax;
         var_3856 = param1.petRespect;
         var_783 = param1.roomIndex;
         var_1260 = param1.age;
         var_759 = param1.breedId;
         var_511 = param1.skillTresholds;
         var_1117 = param1.accessRights;
         var_940 = param1.maxWellBeingSeconds;
         var_1038 = param1.remainingWellBeingSeconds;
         var_705 = param1.remainingGrowingSeconds;
         var_784 = param1.rarityLevel;
         _hasBreedingPermission = param1.hasBreedingPermission;
      }
   }
}
