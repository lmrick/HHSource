package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.habbo.friendbar.data.IFriendNotification;
   import com.sulake.habbo.friendbar.data.class_3394;
   
   public class RoomEventToken extends Token
   {
       
      
      public function RoomEventToken(param1:class_3394, param2:IFriendNotification)
      {
         super(param2);
         prepare("${friendbar.notify.event}",param2.message,"message_piece_xml","friend_bar_event_notification_icon");
      }
   }
}
