package com.sulake.habbo.toolbar.extensions
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.toolbar.extensions.settings.OtherSettingsView;
   import com.sulake.habbo.toolbar.extensions.settings.SoundSettingsView;
   import com.sulake.habbo.utils.HabboWebTools;
   
   public class SettingsExtension implements class_13
   {
      
      private static const SPACING:int = 3;
      
      private static const PADDING:int = 7;
       
      
      private var _toolbar:HabboToolbar;
      
      private var _window:class_3151;
      
      private var _buttons:Vector.<class_3127>;
      
      private var _disposed:Boolean = false;
      
      public function SettingsExtension(param1:HabboToolbar)
      {
         _buttons = new Vector.<class_3127>();
         super();
         _toolbar = param1;
         _window = _toolbar.windowManager.buildFromXML(param1.assets.getAssetByName("settings_xml").content as XML) as class_3151;
         _window.procedure = windowProcedure;
         addButton("avatar_settings",_toolbar.localization.getLocalization("widget.memenu.settings.character","avatar settings"));
         addButton("sound",_toolbar.localization.getLocalization("widget.memenu.settings.audio","sound settings"));
         addButton("chat",_toolbar.localization.getLocalization("widget.memenu.settings.other","other settings"));
         param1.extensionView.attachExtension("settings",_window,1);
         _window.visible = false;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _toolbar = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function addButton(param1:String, param2:String) : void
      {
         var _loc3_:class_3151 = _toolbar.windowManager.buildFromXML(_toolbar.assets.getAssetByName("setting_category_xml").content as XML) as class_3151;
         _window.addChild(_loc3_);
         _loc3_.findChildByName("button_label").caption = param2;
         if(false)
         {
            _loc3_.y = _buttons[-1].bottom + 3;
         }
         else
         {
            _loc3_.y = 7;
         }
         _loc3_.x = 7;
         _loc3_.name = param1;
         _loc3_.procedure = windowProcedure;
         _buttons.push(_loc3_);
         _window.height = _buttons[-1].bottom + 7;
      }
      
      private function openSoundSettingsWindow() : void
      {
         var _loc2_:SoundSettingsView = new SoundSettingsView(_toolbar);
         var _loc1_:class_3151 = _toolbar.windowManager.getDesktop(1);
         _loc1_.addChild(_loc2_.window);
         _loc2_.window.x = _loc1_.width - _loc2_.window.width - 200;
      }
      
      private function openChatSettingsWindow() : void
      {
         var _loc2_:OtherSettingsView = new OtherSettingsView(_toolbar);
         var _loc1_:class_3151 = _toolbar.windowManager.getDesktop(1);
         _loc1_.addChild(_loc2_.window);
         _loc2_.window.x = _loc1_.width - _loc2_.window.width - 200;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "avatar_settings":
               HabboWebTools.openAvatars();
               _toolbar.toggleSettingVisibility();
               break;
            case "sound":
               openSoundSettingsWindow();
               _toolbar.toggleSettingVisibility();
               break;
            case "chat":
               openChatSettingsWindow();
               _toolbar.toggleSettingVisibility();
         }
      }
   }
}
