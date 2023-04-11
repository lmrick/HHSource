package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class AvatarInfoData
   {
       
      
      private var var_3359:Boolean = false;
      
      private var var_3446:Boolean = false;
      
      private var _canTradeReason:int = 0;
      
      private var var_3210:Boolean = false;
      
      private var var_3230:Boolean = false;
      
      private var var_3384:Boolean = false;
      
      private var var_3431:Boolean = false;
      
      private var var_3344:Boolean = false;
      
      private var var_3207:Boolean = false;
      
      private var var_1337:int = 0;
      
      private var var_3289:Boolean = false;
      
      private var var_3470:Boolean = false;
      
      private var _isGuildRoom:Boolean = false;
      
      private var var_3177:int = 0;
      
      private var var_3452:int = 0;
      
      private var var_3471:int = 0;
      
      private var var_1087:Boolean = false;
      
      private var _isAmbassador:Boolean = false;
      
      public function AvatarInfoData()
      {
         super();
      }
      
      public function get isIgnored() : Boolean
      {
         return var_3359;
      }
      
      public function get canTrade() : Boolean
      {
         return var_3446;
      }
      
      public function get canTradeReason() : int
      {
         return _canTradeReason;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_3210;
      }
      
      public function get canBeBanned() : Boolean
      {
         return var_3230;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_3431;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_3344;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_3207;
      }
      
      public function get respectLeft() : int
      {
         return var_1337;
      }
      
      public function get isOwnUser() : Boolean
      {
         return var_3289;
      }
      
      public function get allowNameChange() : Boolean
      {
         return var_3470;
      }
      
      public function get isGuildRoom() : Boolean
      {
         return _isGuildRoom;
      }
      
      public function get carryItemType() : int
      {
         return var_3177;
      }
      
      public function get myRoomControllerLevel() : int
      {
         return var_3452;
      }
      
      public function get targetRoomControllerLevel() : int
      {
         return var_3471;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_3359 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_3446 = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         _canTradeReason = param1;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_3210 = param1;
      }
      
      public function set canBeBanned(param1:Boolean) : void
      {
         var_3230 = param1;
      }
      
      public function get canBeMuted() : Boolean
      {
         return var_3384;
      }
      
      public function set canBeMuted(param1:Boolean) : void
      {
         var_3384 = param1;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_3431 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_3344 = param1;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_3207 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_1337 = param1;
      }
      
      public function set isOwnUser(param1:Boolean) : void
      {
         var_3289 = param1;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         var_3470 = param1;
      }
      
      public function set isGuildRoom(param1:Boolean) : void
      {
         _isGuildRoom = param1;
      }
      
      public function set carryItemType(param1:int) : void
      {
         var_3177 = param1;
      }
      
      public function set myRoomControllerLevel(param1:int) : void
      {
         var_3452 = param1;
      }
      
      public function set targetRoomControllerLevel(param1:int) : void
      {
         var_3471 = param1;
      }
      
      public function get isFriend() : Boolean
      {
         return var_1087;
      }
      
      public function get isAmbassador() : Boolean
      {
         return _isAmbassador;
      }
      
      public function populate(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var_3207 = param1.amIAnyRoomController;
         var_3452 = param1.myRoomControllerLevel;
         var_3344 = param1.amIOwner;
         var_3431 = param1.canBeAskedAsFriend;
         var_3210 = param1.canBeKicked;
         var_3230 = param1.canBeBanned;
         var_3384 = param1.canBeMuted;
         var_3446 = param1.canTrade;
         _canTradeReason = param1.canTradeReason;
         var_3359 = param1.isIgnored;
         var_1337 = param1.respectLeft;
         var_3289 = param1.type == "RWUIUE_OWN_USER";
         var_3470 = param1.allowNameChange;
         _isGuildRoom = param1.isGuildRoom;
         var_3471 = param1.targetRoomControllerLevel;
         var_3177 = param1.carryItem;
         var_1087 = param1.isFriend;
         _isAmbassador = param1.amIAnAmbassador;
      }
   }
}
