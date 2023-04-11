package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.habbo.friendbar.data.IFriendNotification;
   import com.sulake.habbo.friendbar.data.class_3394;
   import com.sulake.habbo.localization.class_18;
   
   public class AchievementToken extends Token
   {
       
      
      public function AchievementToken(param1:class_3394, param2:IFriendNotification, param3:class_18)
      {
         super(param2);
         var _loc4_:String = String(param3.getBadgeName(param2.message));
         prepare("${friendbar.notify.achievement}",_loc4_,"message_piece_xml","friend_bar_event_notification_icon");
      }
   }
}
