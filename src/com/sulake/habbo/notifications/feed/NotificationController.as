package com.sulake.habbo.notifications.feed
{
   import com.sulake.habbo.notifications.HabboNotifications;
   import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
   import com.sulake.habbo.notifications.feed.view.content.EntityFactory;
   import com.sulake.habbo.notifications.feed.view.content.class_3359;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   
   public class NotificationController
   {
       
      
      private var var_1460:HabboNotifications;
      
      private var var_2067:com.sulake.habbo.notifications.feed.NotificationView;
      
      private var var_2694:com.sulake.habbo.notifications.feed.FeedSettings;
      
      private var var_2712:EntityFactory;
      
      public function NotificationController(param1:HabboNotifications)
      {
         super();
         var_1460 = param1;
         var_2694 = new com.sulake.habbo.notifications.feed.FeedSettings(this);
         var_2067 = new com.sulake.habbo.notifications.feed.NotificationView(this,param1);
         var_2712 = new EntityFactory();
         var_1460.roomSessionManager.events.addEventListener("RSE_CREATED",roomSessionStateEventHandler);
         var_1460.roomSessionManager.events.addEventListener("RSE_STARTED",roomSessionStateEventHandler);
         var_1460.roomSessionManager.events.addEventListener("RSE_ENDED",roomSessionStateEventHandler);
      }
      
      public function dispose() : void
      {
         if(var_2067)
         {
            var_2067.dispose();
            var_2067 = null;
         }
         var_1460.roomSessionManager.events.removeEventListener("RSE_CREATED",roomSessionStateEventHandler);
         var_1460.roomSessionManager.events.removeEventListener("RSE_STARTED",roomSessionStateEventHandler);
         var_1460.roomSessionManager.events.removeEventListener("RSE_ENDED",roomSessionStateEventHandler);
         var_1460 = null;
         if(var_2694)
         {
            var_2694.dispose();
            var_2694 = null;
         }
         if(var_2712)
         {
            var_2712.dispose();
            var_2712 = null;
         }
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case "RSE_CREATED":
            case "RSE_STARTED":
            case "RSE_ENDED":
               if(var_2067)
               {
                  var_2067.setGameMode(param1.session.isGameSession);
                  break;
               }
         }
      }
      
      public function setFeedEnabled(param1:Boolean) : void
      {
         if(var_2067)
         {
            var_2067.setViewEnabled(param1);
         }
      }
      
      public function getSettings() : com.sulake.habbo.notifications.feed.FeedSettings
      {
         return var_2694;
      }
      
      public function updateFeedCategoryFiltering() : void
      {
      }
      
      public function addFeedItem(param1:int, param2:GenericNotificationItemData) : void
      {
         var _loc3_:class_3359 = var_2712.createNotificationEntity(param2);
         var_2067.addNotificationFeedItem(param1,_loc3_);
      }
      
      public function executeAction(param1:String) : void
      {
         if(param1.indexOf("http") == 0)
         {
            HabboWebTools.openWebPage(param1);
         }
      }
   }
}
