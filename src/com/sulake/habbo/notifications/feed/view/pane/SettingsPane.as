package com.sulake.habbo.notifications.feed.view.pane
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.notifications.feed.FeedSettings;
   import com.sulake.habbo.notifications.feed.NotificationView;
   
   public class SettingsPane extends AbstractPane
   {
       
      
      public function SettingsPane(param1:String, param2:NotificationView, param3:class_3151)
      {
         super(param1,param2,param3,2);
         applySettingsToView();
         _window.procedure = onWindowEventProc;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function applySettingsToView() : void
      {
         var _loc1_:FeedSettings = var_1534.controller.getSettings();
         _loc1_.getVisibleFeedCategories();
      }
      
      public function onWindowEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:FeedSettings = null;
         var _loc5_:int = 0;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = var_1534.controller.getSettings();
            for each(var _loc4_ in param2.tags)
            {
               switch(_loc4_)
               {
                  case "ME":
                     _loc5_ = 0;
                     break;
                  case "HOTEL":
                     _loc5_ = 2;
                     break;
                  case "FRIENDS":
                     _loc5_ = 1;
               }
               _loc3_.toggleVisibleFeedCategory(_loc5_);
            }
            applySettingsToView();
         }
      }
   }
}
