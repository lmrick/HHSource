package package_134
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1150 implements IMessageParser
   {
       
      
      private var var_421:int;
      
      private var _name:String;
      
      private var var_262:int;
      
      private var var_948:int;
      
      private var var_1258:int;
      
      private var var_727:int;
      
      private var _nutrition:int;
      
      private var var_1305:int;
      
      private var var_980:int;
      
      private var var_949:int;
      
      private var var_1012:int;
      
      private var var_684:int;
      
      private var _ownerName:String;
      
      private var var_1260:int;
      
      private var var_759:int;
      
      private var var_841:Boolean;
      
      private var var_1018:Boolean;
      
      private var var_883:Boolean;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var var_940:int;
      
      private var var_1038:int;
      
      private var var_705:int;
      
      private var var_511:Array;
      
      private var var_1117:int;
      
      private var var_784:int;
      
      private var _hasBreedingPermission:Boolean;
      
      public function class_1150()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get level() : int
      {
         return var_262;
      }
      
      public function get maxLevel() : int
      {
         return var_948;
      }
      
      public function get experience() : int
      {
         return var_1258;
      }
      
      public function get energy() : int
      {
         return var_727;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1305;
      }
      
      public function get maxEnergy() : int
      {
         return var_980;
      }
      
      public function get maxNutrition() : int
      {
         return var_949;
      }
      
      public function get respect() : int
      {
         return var_1012;
      }
      
      public function get ownerId() : int
      {
         return var_684;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
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
      
      public function get skillTresholds() : Array
      {
         return var_511;
      }
      
      public function get accessRights() : int
      {
         return var_1117;
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
      
      public function flush() : Boolean
      {
         var_421 = -1;
         var_511 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         var_421 = param1.readInteger();
         _name = param1.readString();
         var_262 = param1.readInteger();
         var_948 = param1.readInteger();
         var_1258 = param1.readInteger();
         var_1305 = param1.readInteger();
         var_727 = param1.readInteger();
         var_980 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_949 = param1.readInteger();
         var_1012 = param1.readInteger();
         var_684 = param1.readInteger();
         var_1260 = param1.readInteger();
         _ownerName = param1.readString();
         var_759 = param1.readInteger();
         var_841 = param1.readBoolean();
         var_1018 = param1.readBoolean();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_511.push(param1.readInteger());
            _loc2_++;
         }
         var_511.sort(16);
         var_1117 = param1.readInteger();
         var_883 = param1.readBoolean();
         var_712 = param1.readBoolean();
         var_878 = param1.readBoolean();
         var_784 = param1.readInteger();
         var_940 = param1.readInteger();
         var_1038 = param1.readInteger();
         var_705 = param1.readInteger();
         _hasBreedingPermission = param1.readBoolean();
         return true;
      }
   }
}
