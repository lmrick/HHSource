package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendlist.Util;
   
   public class FriendCategory implements class_13
   {
      
      public static const PAGE_SIZE:int = 100;
      
      public static const CATID_ONLINE:int = 0;
      
      public static const CATID_OFFLINE:int = -1;
       
      
      private var var_247:int;
      
      private var _name:String;
      
      private var _open:Boolean;
      
      private var var_1124:Array;
      
      private var var_3971:Boolean;
      
      private var _disposed:Boolean;
      
      private var var_1430:class_3151;
      
      private var var_559:int;
      
      public function FriendCategory(param1:int, param2:String)
      {
         var_1124 = [];
         super();
         var_247 = param1;
         _name = param2;
         _open = var_247 != -1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1430 = null;
      }
      
      public function addFriend(param1:Friend) : void
      {
         removeFriend(param1.id);
         var_1124.push(param1);
         var_1124.sortOn(["pocketHabboUser","name"],[18,1]);
      }
      
      public function getSelectedFriends(param1:Array) : void
      {
         for each(var _loc2_ in var_1124)
         {
            if(_loc2_.selected)
            {
               param1.push(_loc2_);
            }
         }
      }
      
      public function getFriend(param1:int) : Friend
      {
         for each(var _loc2_ in var_1124)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getFriendCount(param1:Boolean, param2:Boolean = false) : int
      {
         var _loc3_:int = 0;
         for each(var _loc4_ in var_1124)
         {
            if((!param1 || _loc4_.online) && (!param2 || _loc4_.followingAllowed))
            {
               _loc3_ += 1;
            }
         }
         return _loc3_;
      }
      
      public function removeFriend(param1:int) : Friend
      {
         var _loc2_:Friend = getFriend(param1);
         if(_loc2_ != null)
         {
            Util.remove(var_1124,_loc2_);
            return _loc2_;
         }
         return null;
      }
      
      private function checkPageIndex() : void
      {
         if(this.var_559 >= this.getPageCount())
         {
            this.var_559 = Math.max(0,this.getPageCount() - 1);
         }
      }
      
      public function getPageCount() : int
      {
         return Math.ceil(this.var_1124.length / 100);
      }
      
      public function getStartFriendIndex() : int
      {
         checkPageIndex();
         return this.var_559 * 100;
      }
      
      public function getEndFriendIndex() : int
      {
         checkPageIndex();
         return Math.min((this.var_559 + 1) * 100,this.var_1124.length);
      }
      
      public function setOpen(param1:Boolean) : void
      {
         _open = param1;
         if(!param1)
         {
            for each(var _loc2_ in var_1124)
            {
               _loc2_.selected = false;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get received() : Boolean
      {
         return var_3971;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get friends() : Array
      {
         return var_1124;
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get pageIndex() : int
      {
         return var_559;
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set view(param1:class_3151) : void
      {
         var_1430 = param1;
      }
      
      public function set received(param1:Boolean) : void
      {
         var_3971 = param1;
      }
      
      public function set pageIndex(param1:int) : void
      {
         var_559 = param1;
      }
   }
}
