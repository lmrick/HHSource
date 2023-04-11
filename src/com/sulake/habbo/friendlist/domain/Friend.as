package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendlist.class_3191;
   import flash.display.BitmapData;
   import package_24.class_1599;
   
   public class Friend implements class_3191, class_13
   {
      
      public static const GENDER_FEMALE:int = "F".charCodeAt(0);
      
      public static const GENDER_MALE:int = "M".charCodeAt(0);
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var var_122:int;
      
      private var _online:Boolean;
      
      private var var_1401:Boolean;
      
      private var var_427:String;
      
      private var var_904:String;
      
      private var var_1412:String;
      
      private var var_415:int;
      
      private var _selected:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_1430:class_3151;
      
      private var var_2301:BitmapData;
      
      private var _realName:String;
      
      private var var_1378:Boolean;
      
      private var var_1376:Boolean;
      
      private var var_1356:Boolean;
      
      private var _relationshipStatus:int;
      
      public function Friend(param1:class_1599)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var_247 = param1.id;
         _name = param1.name;
         var_122 = param1.gender;
         _online = param1.online;
         var_1401 = param1.followingAllowed && param1.online;
         var_427 = param1.figure;
         var_904 = param1.motto;
         var_1412 = param1.lastAccess;
         var_415 = param1.categoryId;
         _realName = param1.realName;
         var_1378 = param1.persistedMessageUser;
         var_1356 = param1.vipMember;
         var_1376 = param1.pocketHabboUser;
         _relationshipStatus = param1.relationshipStatus;
         class_14.log("Creating friend: " + id + ", " + name + ", " + gender + ", " + online + ", " + followingAllowed + ", " + figure + ", " + categoryId);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(var_2301 != null)
         {
            var_2301.dispose();
            var_2301 = null;
         }
         _disposed = true;
         var_1430 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get followingAllowed() : Boolean
      {
         return var_1401;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get motto() : String
      {
         return var_904;
      }
      
      public function get lastAccess() : String
      {
         return var_1412;
      }
      
      public function get categoryId() : int
      {
         return var_415;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function get face() : BitmapData
      {
         return var_2301;
      }
      
      public function get realName() : String
      {
         return _realName;
      }
      
      public function get persistedMessageUser() : Boolean
      {
         return var_1378;
      }
      
      public function get pocketHabboUser() : Boolean
      {
         return var_1376;
      }
      
      public function get relationshipStatus() : int
      {
         return _relationshipStatus;
      }
      
      public function get vipMember() : Boolean
      {
         return var_1356;
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
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
      
      public function set followingAllowed(param1:Boolean) : void
      {
         var_1401 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         var_427 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_904 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         var_1412 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_415 = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         _selected = param1;
      }
      
      public function set view(param1:class_3151) : void
      {
         var_1430 = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         var_2301 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         _realName = param1;
      }
      
      public function set persistedMessageUser(param1:Boolean) : void
      {
         var_1378 = param1;
      }
      
      public function set pocketHabboUser(param1:Boolean) : void
      {
         var_1376 = param1;
      }
      
      public function set vipMember(param1:Boolean) : void
      {
         var_1356 = param1;
      }
      
      public function isGroupFriend() : Boolean
      {
         return var_247 < 0;
      }
   }
}
