package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements class_3394
   {
      
      private static var ROLLING_LOG_EVENT_ID:int = 0;
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_122:int;
      
      private var _online:Boolean;
      
      private var _allowFollow:Boolean;
      
      private var var_427:String;
      
      private var var_415:int;
      
      private var var_904:String;
      
      private var var_1412:String;
      
      private var _realName:String;
      
      private var _notifications:Vector.<com.sulake.habbo.friendbar.data.IFriendNotification>;
      
      private var var_4099:int = -1;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         var_247 = param1;
         _name = param2;
         _realName = param3;
         var_904 = param4;
         var_122 = param5;
         _online = param6;
         _allowFollow = param7;
         var_427 = param8;
         var_415 = param9;
         var_1412 = param10;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get gender() : int
      {
         return var_122;
      }
      
      public function get online() : Boolean
      {
         return _online;
      }
      
      public function get allowFollow() : Boolean
      {
         return _allowFollow;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function get lastAccess() : String
      {
         return var_1412;
      }
      
      public function get realName() : String
      {
         return _realName;
      }
      
      public function get logEventId() : int
      {
         return var_4099;
      }
      
      public function get notifications() : Vector.<com.sulake.habbo.friendbar.data.IFriendNotification>
      {
         if(!_notifications)
         {
            _notifications = new Vector.<com.sulake.habbo.friendbar.data.IFriendNotification>();
         }
         return _notifications;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         var_122 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         _online = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         _allowFollow = param1;
      }
      
      public function set figure(param1:String) : void
      {
         var_427 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_415 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_904 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         var_1412 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         _realName = param1;
      }
      
      public function set logEventId(param1:int) : void
      {
         var_4099 = param1;
      }
      
      public function getNextLogEventId() : int
      {
         return ++ROLLING_LOG_EVENT_ID;
      }
   }
}
