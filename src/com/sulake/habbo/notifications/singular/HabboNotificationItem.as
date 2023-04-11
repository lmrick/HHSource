package com.sulake.habbo.notifications.singular
{
   public class HabboNotificationItem
   {
       
      
      private var _style:com.sulake.habbo.notifications.singular.HabboNotificationItemStyle;
      
      private var _content:String;
      
      private var var_282:com.sulake.habbo.notifications.singular.SingularNotificationController;
      
      public function HabboNotificationItem(param1:String, param2:com.sulake.habbo.notifications.singular.HabboNotificationItemStyle, param3:com.sulake.habbo.notifications.singular.SingularNotificationController)
      {
         super();
         _content = param1;
         _style = param2;
         var_282 = param3;
      }
      
      public function get style() : com.sulake.habbo.notifications.singular.HabboNotificationItemStyle
      {
         return _style;
      }
      
      public function get content() : String
      {
         return _content;
      }
      
      public function dispose() : void
      {
         _content = null;
         if(_style != null)
         {
            _style.dispose();
            _style = null;
         }
         var_282 = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         if(false)
         {
            var_282.onInternalLink(_style.internalLink);
         }
      }
   }
}
