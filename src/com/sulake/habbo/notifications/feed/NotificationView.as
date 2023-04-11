package com.sulake.habbo.notifications.feed
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.notifications.HabboNotifications;
   import com.sulake.habbo.notifications.feed.view.content.FeedEntity;
   import com.sulake.habbo.notifications.feed.view.content.class_3359;
   import com.sulake.habbo.notifications.feed.view.pane.AbstractPane;
   import com.sulake.habbo.notifications.feed.view.pane.InfoPane;
   import com.sulake.habbo.notifications.feed.view.pane.NotificationsPane;
   import com.sulake.habbo.notifications.feed.view.pane.SettingsPane;
   import com.sulake.habbo.notifications.feed.view.pane.StatusPane;
   import com.sulake.habbo.notifications.feed.view.pane.StreamPane;
   import com.sulake.habbo.notifications.feed.view.pane.class_3413;
   import com.sulake.habbo.window.class_1684;
   
   public class NotificationView
   {
      
      public static const VIEW_PANE_FEEDS:String = "pane_feeds";
      
      public static const VIEW_PANE_NOTIFICATIONS:String = "pane_notifications";
      
      public static const VIEW_PANE_STREAM:String = "pane_stream";
      
      public static const VIEW_PANE_SETTINGS:String = "pane_settings";
      
      public static const VIEW_PANE_INFO:String = "pane_info";
      
      public static const VIEW_PANE_STATUS:String = "pane_status";
      
      private static const const_928:String = "settings_toggle";
      
      private static const ELEMENT_INFO:String = "info_toggle";
       
      
      private var var_2114:com.sulake.habbo.notifications.feed.StateController;
      
      private var var_1460:HabboNotifications;
      
      private var var_282:com.sulake.habbo.notifications.feed.NotificationController;
      
      private var _window:class_3151;
      
      private var var_1649:class_24;
      
      public function NotificationView(param1:com.sulake.habbo.notifications.feed.NotificationController, param2:HabboNotifications)
      {
         super();
         var_282 = param1;
         var_1460 = param2;
         var_2114 = new com.sulake.habbo.notifications.feed.StateController();
         FeedEntity.assignHandles(windowManager,assets,localization,param1);
         setupUserInterface();
         closePaneLevel(2);
         switchToPane("pane_notifications");
         setVisibilityState(1);
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1649)
         {
            for each(var _loc1_ in var_1649)
            {
               _loc1_.dispose();
            }
            var_1649.dispose();
            var_1649 = null;
         }
         FeedEntity.removeHandles();
         var_282 = null;
         var_2114 = null;
         var_1460 = null;
      }
      
      public function get windowManager() : class_1684
      {
         return var_1460.windowManager;
      }
      
      public function get assets() : class_21
      {
         return var_1460.assets;
      }
      
      public function get localization() : class_18
      {
         return var_1460.localization;
      }
      
      public function get controller() : com.sulake.habbo.notifications.feed.NotificationController
      {
         return var_282;
      }
      
      private function setupUserInterface() : void
      {
         if(_window)
         {
            return;
         }
         _window = var_1460.windowManager.buildFromXML(var_1460.assets.getAssetByName("feed_display_xml").content as XML) as class_3151;
         _window.height = _window.desktop.height;
         _window.setParamFlag(64);
         _window.setParamFlag(2048);
         _window.findChildByName("settings_toggle").addEventListener("WME_CLICK",onSettingsToggle);
         _window.findChildByName("info_toggle").addEventListener("WME_CLICK",onInfoToggle);
         var_1649 = new class_24();
         var_1649.add("pane_notifications",new NotificationsPane("pane_notifications",this,_window.findChildByName("pane_notifications") as class_3151));
         var_1649.add("pane_stream",new StreamPane("pane_stream",this,_window.findChildByName("pane_stream") as class_3151));
         var_1649.add("pane_info",new InfoPane("pane_info",this,_window.findChildByName("pane_info") as class_3151));
         var_1649.add("pane_settings",new SettingsPane("pane_settings",this,_window.findChildByName("pane_settings") as class_3151));
         var_1649.add("pane_status",new StatusPane("pane_status",this,_window.findChildByName("pane_status") as class_3151));
      }
      
      public function toggleMinimized() : void
      {
         switch(var_2114.currentState() - 1)
         {
            case 0:
               setVisibilityState(2);
               break;
            case 1:
               setVisibilityState(1);
         }
      }
      
      public function setVisibilityState(param1:int) : void
      {
         var _loc2_:class_3151 = null;
         var _loc3_:int = var_2114.requestState(param1);
         switch(_loc3_)
         {
            case 0:
               _window.x = _window.desktop.width;
               _window.visible = false;
               break;
            case 1:
               _window.visible = true;
               _loc2_ = _window.findChildByName("main_view") as class_3151;
               _window.x = _window.desktop.width - (0 - _loc2_.width);
               break;
            case 2:
               _window.visible = true;
               _window.x = _window.desktop.width - 0;
         }
      }
      
      public function setViewEnabled(param1:Boolean) : void
      {
         var_2114.setEnabled(param1);
         setVisibilityState(var_2114.currentState());
      }
      
      public function setGameMode(param1:Boolean) : void
      {
         var_2114.setGameMode(param1);
         setVisibilityState(var_2114.currentState());
      }
      
      public function switchToPane(param1:String) : void
      {
         var _loc2_:class_3413 = var_1649.getValue(param1);
         if(!_loc2_)
         {
            return;
         }
         closePaneLevel(_loc2_.paneLevel);
         _loc2_.isVisible = true;
      }
      
      public function closePaneLevel(param1:int) : void
      {
         for each(var _loc2_ in var_1649)
         {
            if(_loc2_.paneLevel == param1)
            {
               _loc2_.isVisible = false;
            }
         }
      }
      
      public function addNotificationFeedItem(param1:int, param2:class_3359) : void
      {
         (var_1649.getValue("pane_notifications") as NotificationsPane).addItem(param1,param2);
      }
      
      public function addStreamFeedItem(param1:class_3359) : void
      {
         (var_1649.getValue("pane_stream") as StreamPane).addItem(param1);
      }
      
      public function removeStreamItems() : void
      {
      }
      
      private function onSettingsToggle(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3413 = var_1649.getValue("pane_settings") as class_3413;
         if(_loc2_)
         {
            if(_loc2_.isVisible)
            {
               closePaneLevel(2);
            }
            else
            {
               switchToPane("pane_settings");
            }
         }
      }
      
      private function onInfoToggle(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3413 = var_1649.getValue("pane_info") as class_3413;
         if(_loc2_)
         {
            if(_loc2_.isVisible)
            {
               closePaneLevel(2);
            }
            else
            {
               switchToPane("pane_info");
            }
         }
      }
   }
}
