package package_78
{
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1553
   {
      
      public static const const_179:int = 0;
      
      public static const const_352:int = 1;
      
      public static const const_198:int = 2;
      
      public static const const_124:int = 3;
      
      public static const const_111:int = 4;
      
      public static const const_145:int = 0;
      
      public static const const_125:int = 1;
      
      public static const const_189:int = 2;
       
      
      private var var_354:int;
      
      private var _name:String;
      
      private var _description:String;
      
      private var var_719:int;
      
      private var var_415:int;
      
      private var var_1067:int;
      
      private var var_1058:int;
      
      private var var_239:Array;
      
      private var var_776:int;
      
      private var var_834:Boolean;
      
      private var var_1060:Boolean;
      
      private var var_811:Boolean;
      
      private var _hideWalls:Boolean;
      
      private var _wallThickness:int;
      
      private var _floorThickness:int;
      
      private var var_201:Dictionary;
      
      private var var_155:Array;
      
      private var var_798:int;
      
      private var var_250:Dictionary;
      
      private var var_143:Array;
      
      private var var_412:package_78.class_1621;
      
      private var var_569:package_78.class_1622;
      
      private var var_1177:Boolean;
      
      public function class_1553()
      {
         super();
      }
      
      public static function getDoorModeLocalizationKey(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return "${navigator.door.mode.open}";
            case 1:
               return "${navigator.door.mode.closed}";
            case 2:
               return "${navigator.door.mode.password}";
            case 3:
               return "${navigator.door.mode.invisible}";
            case 4:
               return "${navigator.door.mode.noobs_only}";
            default:
               return "";
         }
      }
      
      public function get tradeMode() : int
      {
         return var_776;
      }
      
      public function set tradeMode(param1:int) : void
      {
         var_776 = param1;
      }
      
      public function get allowPets() : Boolean
      {
         return var_834;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_834 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1060;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1060 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_811;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_811 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return _hideWalls;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         _hideWalls = param1;
      }
      
      public function get wallThickness() : int
      {
         return _wallThickness;
      }
      
      public function set wallThickness(param1:int) : void
      {
         _wallThickness = param1;
      }
      
      public function get floorThickness() : int
      {
         return _floorThickness;
      }
      
      public function set floorThickness(param1:int) : void
      {
         _floorThickness = param1;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function set roomId(param1:int) : void
      {
         var_354 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function set description(param1:String) : void
      {
         _description = param1;
      }
      
      public function get doorMode() : int
      {
         return var_719;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_719 = param1;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_415 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1067;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1067 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1058;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1058 = param1;
      }
      
      public function get tags() : Array
      {
         return var_239;
      }
      
      public function set tags(param1:Array) : void
      {
         var_239 = param1;
      }
      
      public function setFlatController(param1:int, param2:class_1624) : void
      {
         if(var_201 != null)
         {
            var_201[param1] = param2;
            var_155 = null;
            var_798 = param1;
         }
      }
      
      public function get roomModerationSettings() : package_78.class_1621
      {
         return var_412;
      }
      
      public function set roomModerationSettings(param1:package_78.class_1621) : void
      {
         var_412 = param1;
      }
      
      public function get controllersById() : Dictionary
      {
         return var_201;
      }
      
      public function set controllersById(param1:Dictionary) : void
      {
         var_201 = param1;
      }
      
      public function get controllerList() : Array
      {
         var _loc3_:int = 0;
         var _loc2_:class_1624 = null;
         if(var_155 == null)
         {
            var_155 = [];
            for(var _loc1_ in var_201)
            {
               _loc3_ = int(_loc1_);
               _loc2_ = var_201[_loc3_];
               if(_loc2_ != null)
               {
                  var_155.push(_loc2_);
               }
            }
            var_155.sortOn("userName",1);
         }
         return var_155;
      }
      
      public function get highlightedUserId() : int
      {
         return var_798;
      }
      
      public function setBannedUser(param1:int, param2:class_1636) : void
      {
         if(var_250 == null)
         {
            var_250 = new Dictionary();
         }
         else
         {
            var_143 = null;
         }
         var_250[param1] = param2;
      }
      
      public function get bannedUsersById() : Dictionary
      {
         return var_250;
      }
      
      public function get bannedUsersList() : Array
      {
         if(var_143 == null)
         {
            var_143 = [];
            for each(var _loc1_ in var_250)
            {
               var_143.push(_loc1_);
            }
            var_143.sortOn("userName",1);
         }
         return var_143;
      }
      
      public function get chatSettings() : package_78.class_1622
      {
         return var_569;
      }
      
      public function set chatSettings(param1:package_78.class_1622) : void
      {
         var_569 = param1;
      }
      
      public function get allowNavigatorDynamicCats() : Boolean
      {
         return var_1177;
      }
      
      public function set allowNavigatorDynamicCats(param1:Boolean) : void
      {
         var_1177 = param1;
      }
   }
}
