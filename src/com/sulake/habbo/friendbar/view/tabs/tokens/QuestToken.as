package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.habbo.friendbar.data.IFriendNotification;
   import com.sulake.habbo.friendbar.data.class_3394;
   
   public class QuestToken extends Token
   {
       
      
      public function QuestToken(param1:class_3394, param2:IFriendNotification)
      {
         super(param2);
         var _loc3_:String = "${quests." + param2.message + ".name}";
         prepare("${friendbar.notify.quest}",_loc3_,"message_piece_xml","friend_bar_event_notification_icon");
      }
   }
}
