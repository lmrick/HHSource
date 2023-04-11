package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const OWN_USER:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const PEER:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const TRADE_REASON_SHUTDOWN:int = 2;
      
      public static const TRADE_REASON_NO_TRADINGROOM:int = 3;
      
      public static const DEFAULT_BOT_BADGE_ID:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_904:String = "";
      
      private var _achievementScore:int;
      
      private var var_761:int = 0;
      
      private var var_4111:int = 0;
      
      private var var_876:int;
      
      private var var_427:String = "";
      
      private var var_110:Array;
      
      private var _groupId:int = 0;
      
      private var _groupName:String = "";
      
      private var var_4020:String = "";
      
      private var var_4010:int = 0;
      
      private var var_3764:int = 0;
      
      private var var_3325:Boolean = false;
      
      private var _realName:String = "";
      
      private var var_3470:Boolean = false;
      
      private var var_3344:Boolean = false;
      
      private var var_3207:Boolean = false;
      
      private var var_3452:int = 0;
      
      private var var_3431:Boolean = false;
      
      private var var_3210:Boolean = false;
      
      private var var_3230:Boolean = false;
      
      private var var_3384:Boolean = false;
      
      private var var_1337:int = 0;
      
      private var var_3359:Boolean = false;
      
      private var _isGuildRoom:Boolean = false;
      
      private var var_3446:Boolean = false;
      
      private var _canTradeReason:int = 0;
      
      private var var_3471:int = 0;
      
      private var var_1087:Boolean = false;
      
      private var _isAmbassador:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_110 = [];
         super(param1,param2,param3);
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
      
      public function set achievementScore(param1:int) : void
      {
         _achievementScore = param1;
      }
      
      public function get achievementScore() : int
      {
         return _achievementScore;
      }
      
      public function set webID(param1:int) : void
      {
         var_761 = param1;
      }
      
      public function get webID() : int
      {
         return var_761;
      }
      
      public function set xp(param1:int) : void
      {
         var_4111 = param1;
      }
      
      public function get xp() : int
      {
         return var_4111;
      }
      
      public function set userType(param1:int) : void
      {
         var_876 = param1;
      }
      
      public function get userType() : int
      {
         return var_876;
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
      
      public function set groupId(param1:int) : void
      {
         _groupId = param1;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function set groupName(param1:String) : void
      {
         _groupName = param1;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_4020 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return var_4020;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_3431 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_3431;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_1337 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_1337;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_3359 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_3359;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_3344 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_3344;
      }
      
      public function set isGuildRoom(param1:Boolean) : void
      {
         _isGuildRoom = param1;
      }
      
      public function get isGuildRoom() : Boolean
      {
         return _isGuildRoom;
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
      
      public function set canTrade(param1:Boolean) : void
      {
         var_3446 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return var_3446;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         _canTradeReason = param1;
      }
      
      public function get canTradeReason() : int
      {
         return _canTradeReason;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_3210 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_3210;
      }
      
      public function set canBeBanned(param1:Boolean) : void
      {
         var_3230 = param1;
      }
      
      public function get canBeBanned() : Boolean
      {
         return var_3230;
      }
      
      public function get canBeMuted() : Boolean
      {
         return var_3384;
      }
      
      public function set canBeMuted(param1:Boolean) : void
      {
         var_3384 = param1;
      }
      
      public function set targetRoomControllerLevel(param1:int) : void
      {
         var_3471 = param1;
      }
      
      public function get targetRoomControllerLevel() : int
      {
         return var_3471;
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
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_3325 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_3325;
      }
      
      public function set realName(param1:String) : void
      {
         _realName = param1;
      }
      
      public function get realName() : String
      {
         return _realName;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         var_3470 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return var_3470;
      }
      
      public function get isFriend() : Boolean
      {
         return var_1087;
      }
      
      public function set isFriend(param1:Boolean) : void
      {
         var_1087 = param1;
      }
      
      public function get amIAnAmbassador() : Boolean
      {
         return _isAmbassador;
      }
      
      public function set amIAnAmbassador(param1:Boolean) : void
      {
         _isAmbassador = param1;
      }
   }
}
