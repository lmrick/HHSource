package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.*;
   import com.sulake.habbo.navigator.roomsettings.class_3386;
   import flash.utils.Dictionary;
   import package_11.*;
   import package_132.*;
   import package_154.class_1256;
   
   public class NavigatorData
   {
      
      private static const MAX_HISTORY_LENGTH:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var _lastMsg:class_1556;
      
      private var var_2380:class_1573;
      
      private var var_3805:Boolean;
      
      private var var_4138:Boolean;
      
      private var var_2391:Boolean;
      
      private var var_1433:int;
      
      private var var_1094:int;
      
      private var _enteredGuestRoom:class_1569;
      
      private var var_4086:Boolean;
      
      private var var_3880:int;
      
      private var _hotRoomPopupOpen:Boolean;
      
      private var var_786:int;
      
      private var var_3775:Boolean;
      
      private var var_2436:Array;
      
      private var var_3127:Array;
      
      private var var_2921:Array;
      
      private var var_2907:Array;
      
      private var var_4270:int;
      
      private var var_3216:int;
      
      private var var_2698:Dictionary;
      
      private var var_2177:Boolean;
      
      private var var_3786:int;
      
      private var var_1398:Boolean;
      
      private var var_3925:Boolean;
      
      private var var_3899:int = 0;
      
      private var var_1162:class_1549;
      
      private var _promotedRooms:class_1583;
      
      private var _friendList:class_3386;
      
      private var var_3459:com.sulake.habbo.navigator.domain.RoomSessionTags;
      
      private var var_3760:class_1559;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_2436 = [];
         var_3127 = [];
         var_2921 = [];
         var_2907 = [];
         var_2698 = new Dictionary();
         _friendList = new class_3386();
         super();
         _navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return _enteredGuestRoom != null && !var_2391;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return _enteredGuestRoom != null && (var_2391 || _navigator.sessionData.hasSecurity(5));
      }
      
      public function onRoomEnter(param1:class_1256) : void
      {
         _enteredGuestRoom = null;
         var_2391 = false;
         var_2391 = param1.owner;
         var_1433 = param1.guestRoomId;
      }
      
      public function onRoomExit() : void
      {
         if(var_2380 != null)
         {
            var_2380.dispose();
            var_2380 = null;
         }
         if(_enteredGuestRoom != null)
         {
            _enteredGuestRoom.dispose();
            _enteredGuestRoom = null;
         }
         var_2391 = false;
      }
      
      public function set enteredRoom(param1:class_1569) : void
      {
         if(_enteredGuestRoom != null)
         {
            _enteredGuestRoom.dispose();
         }
         _enteredGuestRoom = param1;
      }
      
      public function set roomEventData(param1:class_1573) : void
      {
         if(var_2380 != null)
         {
            var_2380.dispose();
         }
         var_2380 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return _lastMsg != null && _lastMsg as class_1617 != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return _lastMsg != null && _lastMsg as class_1630 != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return _lastMsg != null && _lastMsg as class_1557 != null;
      }
      
      public function get categoriesWithUserCountArrived() : Boolean
      {
         return _lastMsg != null && _lastMsg as class_1639 != null;
      }
      
      public function set guestRoomSearchResults(param1:class_1630) : void
      {
         disposeCurrentMsg();
         _lastMsg = param1;
         var_1162 = param1.ad;
         var_2177 = false;
      }
      
      public function set popularTags(param1:class_1617) : void
      {
         disposeCurrentMsg();
         _lastMsg = param1;
         var_2177 = false;
      }
      
      public function set officialRooms(param1:class_1557) : void
      {
         disposeCurrentMsg();
         _lastMsg = param1;
         var_2177 = false;
      }
      
      public function set categoriesWithVisitorData(param1:class_1639) : void
      {
         disposeCurrentMsg();
         _lastMsg = param1;
         var_2177 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(_lastMsg == null)
         {
            return;
         }
         _lastMsg.dispose();
         _lastMsg = null;
      }
      
      public function set adRoom(param1:class_1549) : void
      {
         var_1162 = param1;
      }
      
      public function set promotedRooms(param1:class_1583) : void
      {
         _promotedRooms = param1;
      }
      
      public function get adRoom() : class_1549
      {
         return var_1162;
      }
      
      public function get guestRoomSearchResults() : class_1630
      {
         return _lastMsg as class_1630;
      }
      
      public function get popularTags() : class_1617
      {
         return _lastMsg as class_1617;
      }
      
      public function get officialRooms() : class_1557
      {
         return _lastMsg as class_1557;
      }
      
      public function get categoriesWithVisitorData() : class_1639
      {
         return _lastMsg as class_1639;
      }
      
      public function get promotedRooms() : class_1583
      {
         return _promotedRooms;
      }
      
      public function get roomEventData() : class_1573
      {
         return var_2380;
      }
      
      public function get avatarId() : int
      {
         return var_1094;
      }
      
      public function get eventMod() : Boolean
      {
         return var_3805;
      }
      
      public function get roomPicker() : Boolean
      {
         return var_4138;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_2391;
      }
      
      public function get enteredGuestRoom() : class_1569
      {
         return _enteredGuestRoom;
      }
      
      public function get hcMember() : Boolean
      {
         return var_4086;
      }
      
      public function get createdFlatId() : int
      {
         return var_3880;
      }
      
      public function get homeRoomId() : int
      {
         return var_786;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return _hotRoomPopupOpen;
      }
      
      public function get currentRoomRating() : int
      {
         return var_3786;
      }
      
      public function get canRate() : Boolean
      {
         return var_1398;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_3775;
      }
      
      public function get adIndex() : int
      {
         return var_3899;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return var_3925;
      }
      
      public function get currentRoomId() : int
      {
         return var_1433;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1094 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_3880 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_4086 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_3805 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         var_4138 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         _hotRoomPopupOpen = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_786 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_3786 = param1;
      }
      
      public function set canRate(param1:Boolean) : void
      {
         var_1398 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_3775 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         var_3899 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         var_3925 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var_2436 = param1;
         var_3127 = [];
         for each(var _loc2_ in var_2436)
         {
            if(_loc2_.visible)
            {
               var_3127.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return var_2436;
      }
      
      public function get visibleCategories() : Array
      {
         return var_3127;
      }
      
      public function getCategoryById(param1:int) : class_1625
      {
         for each(var _loc2_ in var_2436)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function set eventCategories(param1:Array) : void
      {
         var_2921 = param1;
         var_2907 = [];
         for each(var _loc2_ in var_2921)
         {
            if(_loc2_.visible)
            {
               var_2907.push(_loc2_);
            }
         }
      }
      
      public function get allEventCategories() : Array
      {
         return var_2921;
      }
      
      public function get visibleEventCategories() : Array
      {
         return var_2907;
      }
      
      public function getEventCategoryById(param1:int) : class_1551
      {
         for each(var _loc2_ in var_2436)
         {
            if(_loc2_.categoryId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function onFavourites(param1:class_1488) : void
      {
         this.var_4270 = param1.limit;
         this.var_3216 = param1.favouriteRoomIds.length;
         this.var_2698 = new Dictionary();
         for each(var _loc2_ in param1.favouriteRoomIds)
         {
            this.var_2698[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_2698[param1] = param2 ? "yes" : null;
         var_3216 += param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(_enteredGuestRoom == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_786 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_3216 >= var_4270;
      }
      
      public function isRoomHome(param1:int) : Boolean
      {
         return param1 == var_786;
      }
      
      public function startLoading() : void
      {
         this.var_2177 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_2177;
      }
      
      public function get friendList() : class_3386
      {
         return _friendList;
      }
      
      public function getAndResetSessionTags() : com.sulake.habbo.navigator.domain.RoomSessionTags
      {
         var _loc1_:com.sulake.habbo.navigator.domain.RoomSessionTags = var_3459;
         var_3459 = null;
         return _loc1_;
      }
      
      public function set roomSessionTags(param1:com.sulake.habbo.navigator.domain.RoomSessionTags) : void
      {
         var_3459 = param1;
      }
      
      public function get competitionRoomsData() : class_1559
      {
         return var_3760;
      }
      
      public function set competitionRoomsData(param1:class_1559) : void
      {
         var_3760 = param1;
      }
   }
}
