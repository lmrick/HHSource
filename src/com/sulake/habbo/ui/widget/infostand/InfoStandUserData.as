package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class InfoStandUserData
   {
       
      
      private var var_339:int = 0;
      
      private var _userName:String = "";
      
      private var var_110:Array;
      
      private var _groupId:int = 0;
      
      private var _groupName:String = "";
      
      private var var_4020:String = "";
      
      private var var_1337:int = 0;
      
      private var var_4010:int = 0;
      
      private var var_3764:int = 0;
      
      private var var_271:String;
      
      private var var_1357:int = 0;
      
      public function InfoStandUserData()
      {
         var_110 = [];
         super();
      }
      
      public function set userId(param1:int) : void
      {
         var_339 = param1;
      }
      
      public function set userName(param1:String) : void
      {
         _userName = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_110 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         _groupId = param1;
      }
      
      public function set groupName(param1:String) : void
      {
         _groupName = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_4020 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_1337 = param1;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_4010 = param1;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_3764 = param1;
      }
      
      public function set type(param1:String) : void
      {
         var_271 = param1;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         var_1357 = param1;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get badges() : Array
      {
         return var_110.slice();
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
      
      public function get groupName() : String
      {
         return _groupName;
      }
      
      public function get groupBadgeId() : String
      {
         return var_4020;
      }
      
      public function get respectLeft() : int
      {
         return var_1337;
      }
      
      public function get carryItem() : int
      {
         return var_4010;
      }
      
      public function get userRoomId() : int
      {
         return var_3764;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get petRespectLeft() : int
      {
         return var_1357;
      }
      
      public function isBot() : Boolean
      {
         return type == "RWUIUE_BOT";
      }
      
      public function setData(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userId = param1.webID;
         userName = param1.name;
         badges = param1.badges;
         groupId = param1.groupId;
         groupName = param1.groupName;
         groupBadgeId = param1.groupBadgeId;
         respectLeft = param1.respectLeft;
         carryItem = param1.carryItem;
         userRoomId = param1.userRoomId;
         type = param1.type;
      }
   }
}
