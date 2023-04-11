package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.habbo.friendbar.data.IFriendNotification;
   import com.sulake.habbo.friendbar.data.class_3394;
   
   public class MessengerToken extends Token
   {
       
      
      public function MessengerToken(param1:class_3394, param2:IFriendNotification)
      {
         super(param2);
         prepare("${friendbar.notify.messenger}",param2.message,"message_piece_xml","messenger_notification_icon");
      }
   }
}
