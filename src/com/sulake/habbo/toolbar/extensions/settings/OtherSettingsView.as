package com.sulake.habbo.toolbar.extensions.settings
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import package_19.class_517;
   import package_19.class_809;
   import package_45.class_667;
   
   public class OtherSettingsView
   {
       
      
      private var _window:class_3151;
      
      private var _toolbar:HabboToolbar;
      
      public function OtherSettingsView(param1:HabboToolbar)
      {
         super();
         _toolbar = param1;
         createWindow();
      }
      
      public function dispose() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.dispose();
         _window = null;
      }
      
      private function createWindow() : void
      {
         var _loc5_:int = 0;
         var _loc1_:class_3127 = null;
         var _loc4_:XmlAsset = _toolbar.assets.getAssetByName("me_menu_other_settings_xml") as XmlAsset;
         _window = _toolbar.windowManager.buildFromXML(_loc4_.content as XML) as class_3151;
         _loc5_ = 0;
         _loc1_ = null;
         while(_loc5_ < _window.numChildren)
         {
            _loc1_ = _window.getChildAt(_loc5_);
            _loc1_.addEventListener("WME_CLICK",onButtonClicked);
            _loc5_++;
         }
         class_3176(_window.findChildByName("prefer_old_chat_checkbox")).isSelected = _toolbar.freeFlowChat.isDisabledInPreferences;
         class_3176(_window.findChildByName("ignore_room_invites_checkbox")).isSelected = _toolbar.messenger.getRoomInvitesIgnored();
         _window.findChildByName("disable_room_camera_follow_checkbox").visible = _window.findChildByName("disable_room_camera_follow_label").visible = _toolbar.getBoolean("room.camera.follow_user");
         if(_toolbar.getBoolean("room.camera.follow_user"))
         {
            class_3176(_window.findChildByName("disable_room_camera_follow_checkbox")).isSelected = _toolbar.sessionDataManager.isRoomCameraFollowDisabled;
         }
         var _loc2_:Boolean = _toolbar.getBoolean("sms.identity.verification.enabled");
         var _loc7_:* = _toolbar.getInteger("phone.verification.status",0) == 2;
         var _loc3_:* = _toolbar.getInteger("phone.collection.status",0) == 2;
         var _loc8_:Boolean = _toolbar.getBoolean("sms.identity.verification.button.enabled");
         var _loc6_:* = _toolbar.getInteger("phone.collection.status",0) == 0;
         var _loc9_:Boolean = _loc2_ && !_loc7_ && (_loc3_ || _loc8_ && _loc6_);
         _window.findChildByName("btn_reset_phone_number_collection").visible = _loc9_;
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc4_:Boolean = false;
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "back_btn":
               dispose();
               break;
            case "prefer_old_chat_checkbox":
               _toolbar.freeFlowChat.isDisabledInPreferences = class_3176(_window.findChildByName("prefer_old_chat_checkbox")).isSelected;
               if(!_toolbar.freeFlowChat.isDisabledInPreferences)
               {
                  if(_toolbar.roomUI.chatContainer != null && _toolbar.freeFlowChat.displayObject != null)
                  {
                     _toolbar.roomUI.chatContainer.setDisplayObject(_toolbar.freeFlowChat.displayObject);
                     break;
                  }
                  break;
               }
               _toolbar.freeFlowChat.clear();
               break;
            case "ignore_room_invites_checkbox":
               _toolbar.messenger.setRoomInvitesIgnored(class_3176(_window.findChildByName("ignore_room_invites_checkbox")).isSelected);
               _toolbar.connection.send(new class_809(_toolbar.messenger.getRoomInvitesIgnored()));
               break;
            case "disable_room_camera_follow_checkbox":
               _loc4_ = Boolean(class_3176(_window.findChildByName("disable_room_camera_follow_checkbox")).isSelected);
               _toolbar.connection.send(new class_517(_loc4_));
               _toolbar.sessionDataManager.setRoomCameraFollowDisabled(_loc4_);
               break;
            case "btn_reset_phone_number_collection":
               _window.findChildByName("btn_reset_phone_number_collection").visible = false;
               _toolbar.connection.send(new class_667());
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
   }
}
