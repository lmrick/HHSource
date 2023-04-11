package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.HabboFriendList;
   import com.sulake.habbo.friendlist.class_3150;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.notifications.class_2082;
   
   public class FriendCategoriesDeps implements class_3162
   {
       
      
      private var _friendList:HabboFriendList;
      
      public function FriendCategoriesDeps(param1:HabboFriendList)
      {
         super();
         this._friendList = param1;
      }
      
      public function get view() : class_3150
      {
         return _friendList.tabs.findTab(1).tabView as class_3150;
      }
      
      public function get messenger() : class_1689
      {
         return this._friendList.messenger;
      }
      
      public function get notifications() : class_2082
      {
         return this._friendList.notifications;
      }
   }
}
