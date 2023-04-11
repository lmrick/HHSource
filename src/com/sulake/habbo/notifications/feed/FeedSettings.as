package com.sulake.habbo.notifications.feed
{
   public class FeedSettings
   {
      
      public static const const_850:int = 0;
      
      public static const const_495:int = 1;
      
      public static const const_672:int = 2;
      
      public static const const_765:int = 3;
      
      public static const FEED_CATEGORY_ME:int = 0;
      
      public static const const_539:int = 1;
      
      public static const FEED_CATEGORY_HOTEL:int = 2;
       
      
      private var var_3849:com.sulake.habbo.notifications.feed.NotificationController;
      
      private var var_2496:Vector.<int>;
      
      public function FeedSettings(param1:com.sulake.habbo.notifications.feed.NotificationController)
      {
         super();
         var_2496 = new Vector.<int>();
         var_2496.push(1);
         var_2496.push(0);
         var_2496.push(2);
      }
      
      public function dispose() : void
      {
         var_3849 = null;
         var_2496 = null;
      }
      
      public function getVisibleFeedCategories() : Vector.<int>
      {
         return var_2496;
      }
      
      public function toggleVisibleFeedCategory(param1:int) : void
      {
         var_3849.updateFeedCategoryFiltering();
      }
   }
}
