package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.*;
   
   public class FriendListTabs
   {
       
      
      private var var_2547:com.sulake.habbo.friendlist.domain.class_3275;
      
      private var var_1995:Array;
      
      private var var_3508:com.sulake.habbo.friendlist.domain.FriendListTab;
      
      private var var_2558:int = 200;
      
      private var var_4200:int = 200;
      
      private var _windowWidth:int = 200;
      
      public function FriendListTabs(param1:com.sulake.habbo.friendlist.domain.class_3275)
      {
         var_1995 = [];
         super();
         var_2547 = param1;
         var_1995.push(new com.sulake.habbo.friendlist.domain.FriendListTab(var_2547.getFriendList(),1,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_1995.push(new com.sulake.habbo.friendlist.domain.FriendListTab(var_2547.getFriendList(),2,new class_3387(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_1995.push(new com.sulake.habbo.friendlist.domain.FriendListTab(var_2547.getFriendList(),3,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         toggleSelected(null);
      }
      
      public function getTabs() : Array
      {
         return var_1995;
      }
      
      public function findTab(param1:int) : com.sulake.habbo.friendlist.domain.FriendListTab
      {
         for each(var _loc2_ in var_1995)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function clearSelections() : void
      {
         for each(var _loc1_ in var_1995)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function findSelectedTab() : com.sulake.habbo.friendlist.domain.FriendListTab
      {
         for each(var _loc1_ in var_1995)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function toggleSelected(param1:com.sulake.habbo.friendlist.domain.FriendListTab) : void
      {
         var _loc2_:com.sulake.habbo.friendlist.domain.FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_2558 = var_4200;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_4200 = var_2558;
            var_2558 = 0;
            clearSelections();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      private function setSelected(param1:com.sulake.habbo.friendlist.domain.FriendListTab, param2:Boolean) : void
      {
         var _loc3_:com.sulake.habbo.friendlist.domain.FriendListTab = findSelectedTab();
         clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            var_3508 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:com.sulake.habbo.friendlist.domain.FriendListTab) : com.sulake.habbo.friendlist.domain.FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_3508 != null)
         {
            return var_3508;
         }
         return var_1995[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_2558;
      }
      
      public function get windowWidth() : int
      {
         return _windowWidth;
      }
      
      public function get tabContentWidth() : int
      {
         return _windowWidth - 2;
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_2558 = param1;
      }
      
      public function set windowWidth(param1:int) : void
      {
         _windowWidth = param1;
      }
   }
}
