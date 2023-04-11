package
{
   import com.sulake.bootstrap.HabboNotificationsBootstrap;
   import com.sulake.iid.IIDHabboNotifications;
   import mx.core.SimpleApplication;

   public class HabboNotificationsCom extends SimpleApplication
   {
      
      public static var manifest:Class = class_2610;
      
      public static var habbo_notifications_config_xml:Class = class_2365;
      
      public static var if_icon_temp_png:Class = if_icon_temp8;
      
      public static var if_icon_hc_png:Class = if_icon_hc;
      
      public static var if_icon_vip_png:Class = if_icon_vip3;
      
      public static var if_icon_recycler_png:Class = class_2493;
      
      public static var if_icon_friend_bg_blue_png:Class = class_2492;
      
      public static var if_icon_duckets_png:Class = if_icon_duckets;
      
      public static var if_icon_loyalty_png:Class = if_icon_loyalty;
      
      public static var if_icon_diamond_png:Class = if_icon_diamond;
      
      public static var motd_notification_xml:Class = motd_notification;
      
      public static var motd_notification_item_xml:Class = motd_notification_item;
      
      public static var layout_notification_xml:Class = notification;
      
      public static var layout_notifications_browser_xml:Class = class_2696;
      
      public static var club_gift_notification_xml:Class = class_2000;
      
      public static var safety_locked_notification_xml:Class = class_2829;
      
      public static var layout_notification_popup_xml:Class = notification_popup;
      
      public static var requiredClasses:Array = new Array(HabboNotificationsBootstrap,IIDHabboNotifications);
       
      
      public function HabboNotificationsCom()
      {
         super();
      }
   }
}
