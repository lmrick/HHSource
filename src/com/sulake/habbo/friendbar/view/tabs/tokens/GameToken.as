package com.sulake.habbo.friendbar.view.tabs.tokens
{
   import com.sulake.habbo.friendbar.data.IFriendNotification;
   import com.sulake.habbo.friendbar.data.class_3394;
   
   public class GameToken extends Token
   {
       
      
      public function GameToken(param1:class_3394, param2:IFriendNotification)
      {
         super(param2);
         var _loc3_:String = param2.message;
         var _loc4_:String = "${gamecenter." + _loc3_ + ".name}";
         prepare("${friendbar.notify.game}",_loc4_,"message_piece_xml","snowball_notification_icon");
      }
   }
}
