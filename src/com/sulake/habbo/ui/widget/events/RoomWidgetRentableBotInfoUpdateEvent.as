package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRentableBotInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const RENTABLE_BOT:String = "RWRBIUE_RENTABLE_BOT";
      
      public static const DEFAULT_BOT_BADGE_ID:String = "RENTABLE_BOT";
       
      
      private var _name:String = "";
      
      private var var_904:String = "";
      
      private var var_761:int = 0;
      
      private var var_427:String = "";
      
      private var var_110:Array;
      
      private var var_4010:int = 0;
      
      private var var_3764:int = 0;
      
      private var var_684:int;
      
      private var _ownerName:String;
      
      private var var_3344:Boolean = false;
      
      private var var_3207:Boolean = false;
      
      private var var_3452:int = 0;
      
      private var _botSkills:Array;
      
      public function RoomWidgetRentableBotInfoUpdateEvent(param1:Boolean = false, param2:Boolean = false)
      {
         var_110 = [];
         super("RWRBIUE_RENTABLE_BOT",param1,param2);
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set motto(param1:String) : void
      {
         var_904 = param1;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function set webID(param1:int) : void
      {
         var_761 = param1;
      }
      
      public function get webID() : int
      {
         return var_761;
      }
      
      public function set figure(param1:String) : void
      {
         var_427 = param1;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function set badges(param1:Array) : void
      {
         var_110 = param1;
      }
      
      public function get badges() : Array
      {
         return var_110;
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
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_3344 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_3344;
      }
      
      public function set myRoomControllerLevel(param1:int) : void
      {
         var_3452 = param1;
      }
      
      public function get myRoomControllerLevel() : int
      {
         return var_3452;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_3207 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_3207;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_4010 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_4010;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_3764 = param1;
      }
      
      public function get userRoomId() : int
      {
         return var_3764;
      }
      
      public function get botSkills() : Array
      {
         return _botSkills;
      }
      
      public function set botSkills(param1:Array) : void
      {
         _botSkills = param1;
      }
   }
}
