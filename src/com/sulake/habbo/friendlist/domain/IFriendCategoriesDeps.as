package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.class_3150;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.notifications.class_2082;
   
   public interface IFriendCategoriesDeps
   {
       
      
      function get view() : class_3150;
      
      function get messenger() : class_1689;
      
      function get notifications() : class_2082;
   }
}
