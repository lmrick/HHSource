package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.friendlist.Util;
   import com.sulake.habbo.friendlist.class_3150;
   import flash.utils.Dictionary;
   import package_135.*;
   import package_24.*;
   
   public class FriendCategories
   {
       
      
      private var var_2547:com.sulake.habbo.friendlist.domain.class_3162;
      
      private var var_1298:Array;
      
      private var var_2465:Dictionary;
      
      public function FriendCategories(param1:com.sulake.habbo.friendlist.domain.class_3162)
      {
         var_1298 = [];
         var_2465 = new Dictionary();
         super();
         var_2547 = param1;
      }
      
      public function addFriend(param1:Friend) : FriendCategory
      {
         var _loc2_:int = param1.online ? param1.categoryId : -1;
         var _loc3_:FriendCategory = findCategory(_loc2_);
         if(_loc3_ != null)
         {
            _loc3_.addFriend(param1);
            var_2465[param1.id] = param1;
            return _loc3_;
         }
         class_14.log("No category " + _loc2_ + " found for friend " + param1.id + ". Ignoring");
         return null;
      }
      
      public function getSelectedFriends() : Array
      {
         var _loc1_:* = [];
         for each(var _loc2_ in var_1298)
         {
            _loc2_.getSelectedFriends(_loc1_);
         }
         return _loc1_;
      }
      
      public function getSelectedFriend() : Friend
      {
         var _loc1_:Array = getSelectedFriends();
         return _loc1_.length == 1 ? _loc1_[0] : null;
      }
      
      public function getAllFriends() : Dictionary
      {
         return var_2465;
      }
      
      public function getFriendCount(param1:Boolean, param2:Boolean = false) : int
      {
         var _loc3_:int = 0;
         for each(var _loc4_ in var_1298)
         {
            _loc3_ += _loc4_.getFriendCount(param1,param2);
         }
         return _loc3_;
      }
      
      public function getCategories() : Array
      {
         return var_1298;
      }
      
      public function addCategory(param1:FriendCategory) : void
      {
         var_1298.push(param1);
      }
      
      public function findFriend(param1:int) : Friend
      {
         return var_2465[param1];
      }
      
      public function findCategory(param1:int) : FriendCategory
      {
         for each(var _loc2_ in var_1298)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:class_1099 = null;
         var _loc8_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc5_:Friend = null;
         class_14.log("Received friend list update");
         var _loc9_:int = 0;
         try
         {
            _loc2_ = (param1 as class_406).getParser();
            _loc9_ = 1;
            updateCategories(_loc2_.cats);
            _loc9_ = 2;
            for each(var _loc4_ in _loc2_.removedFriendIds)
            {
               removeFriend(_loc4_,true);
            }
            _loc9_ = 3;
            for each(var _loc7_ in _loc2_.updatedFriends)
            {
               class_14.log("Got UPDATE: " + _loc7_.id + ", " + _loc7_.online + ", " + _loc7_.name + ", " + _loc7_.followingAllowed);
               var_2547.messenger.setFollowingAllowed(_loc7_.id,_loc7_.followingAllowed && _loc7_.online);
               if((_loc8_ = isFriendOnline(_loc7_.id)) && !_loc7_.online)
               {
                  var_2547.messenger.setOnlineStatus(_loc7_.id,_loc7_.online);
               }
               if(!_loc8_ && _loc7_.online)
               {
                  var_2547.messenger.setOnlineStatus(_loc7_.id,_loc7_.online);
                  var_2547.view.setNewMessageArrived();
               }
               _loc3_ = removeFriend(_loc7_.id,true);
               (_loc5_ = new Friend(_loc7_)).selected = _loc3_;
               addFriend(_loc5_);
            }
            _loc9_ = 4;
            for each(var _loc6_ in _loc2_.addedFriends)
            {
               class_14.log("Got INSERT: " + _loc6_.id + ", " + _loc6_.name);
               removeFriend(_loc6_.id,true);
               addFriend(new Friend(_loc6_));
            }
            _loc9_ = 5;
            this.var_2547.view.refreshList();
            _loc9_ = 6;
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("FriendCategories","onFriendListUpdate crashed, status = " + String(_loc9_) + "!");
            throw e;
         }
      }
      
      private function updateCategories(param1:Array) : void
      {
         var _loc4_:FriendCategory = null;
         var _loc3_:FriendCategory = null;
         flushReceivedStatus();
         findCategory(-1).received = true;
         findCategory(0).received = true;
         for each(var _loc5_ in param1)
         {
            if((_loc4_ = findCategory(_loc5_.id)) != null)
            {
               _loc4_.received = true;
               if(_loc4_.name != _loc5_.name)
               {
                  _loc4_.name = _loc5_.name;
               }
            }
            else
            {
               _loc3_ = new FriendCategory(_loc5_.id,_loc5_.name);
               _loc3_.received = true;
               addCategory(_loc3_);
            }
         }
         for each(var _loc2_ in getCategoriesNotReceived())
         {
            if(_loc2_.friends.length <= 0)
            {
               Util.remove(var_1298,_loc2_);
               _loc2_.dispose();
            }
         }
      }
      
      private function removeFriend(param1:int, param2:Boolean) : Boolean
      {
         var _loc4_:Friend = null;
         if(param2)
         {
            var_2465[param1] = null;
         }
         var _loc5_:Boolean = false;
         for each(var _loc3_ in var_1298)
         {
            if((_loc4_ = _loc3_.removeFriend(param1)) != null)
            {
               _loc5_ = _loc4_.selected;
               if(param2)
               {
                  _loc4_.dispose();
               }
            }
         }
         return _loc5_;
      }
      
      private function flushReceivedStatus() : void
      {
         for each(var _loc1_ in var_1298)
         {
            _loc1_.received = false;
         }
      }
      
      private function getCategoriesNotReceived() : Array
      {
         var _loc1_:* = [];
         for each(var _loc2_ in var_1298)
         {
            if(!_loc2_.received)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      private function isFriendOnline(param1:int) : Boolean
      {
         var _loc2_:Friend = findFriend(param1);
         return _loc2_ == null ? false : _loc2_.online;
      }
      
      public function getFriendNames() : Array
      {
         if(var_2465 == null)
         {
            return [];
         }
         var _loc1_:* = [];
         for each(var _loc2_ in var_2465)
         {
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_.name);
            }
         }
         return _loc1_;
      }
      
      public function get view() : class_3150
      {
         return this.var_2547.view;
      }
   }
}
