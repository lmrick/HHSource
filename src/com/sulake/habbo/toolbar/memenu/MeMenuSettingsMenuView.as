package com.sulake.habbo.toolbar.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.toolbar.ToolbarView;
   import com.sulake.habbo.toolbar.memenu.chatsettings.MeMenuChatSettingsView;
   import com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsView;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.external.ExternalInterface;
   
   public class MeMenuSettingsMenuView
   {
       
      
      private var var_1429:com.sulake.habbo.toolbar.memenu.MeMenuController;
      
      private var _window:class_3151;
      
      private var var_1527:ToolbarView;
      
      private var var_2751:MeMenuSoundSettingsView;
      
      private var var_2868:MeMenuChatSettingsView;
      
      public function MeMenuSettingsMenuView()
      {
         super();
      }
      
      public function init(param1:com.sulake.habbo.toolbar.memenu.MeMenuController, param2:ToolbarView) : void
      {
         var_1527 = param2;
         var_1429 = param1;
         createWindow();
      }
      
      public function dispose() : void
      {
         if(var_2751 != null)
         {
            var_2751.dispose();
            var_2751 = null;
         }
         if(var_2868 != null)
         {
            var_2868.dispose();
            var_2868 = null;
         }
         var_1429 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      private function createWindow() : void
      {
         var _loc1_:XmlAsset = var_1429.toolbar.assets.getAssetByName("me_menu_settings_menu_xml") as XmlAsset;
         if(_loc1_)
         {
            _window = var_1429.toolbar.windowManager.buildFromXML(_loc1_.content as XML) as class_3151;
         }
         if(_window == null)
         {
            throw new Error("Failed to construct settings window from XML!");
         }
         _window.procedure = eventHandler;
         _window.x = var_1527.window.width + 10;
         _window.y = var_1527.window.bottom - 0;
         if(true || var_1429.toolbar.getProperty("has.identity") != "1")
         {
            _window.findChildByName("character_settings").disable();
         }
         else
         {
            _window.findChildByName("identity_text").visible = false;
         }
         _window.findChildByName("chat_settings").visible = true;
      }
      
      private function eventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "character_settings":
               HabboWebTools.openAvatars();
               break;
            case "sound_settings":
               var_2751 = new MeMenuSoundSettingsView();
               var_2751.init(this,var_1527);
               _window.visible = false;
               break;
            case "chat_settings":
               var_2868 = new MeMenuChatSettingsView();
               var_2868.init(this,var_1527);
               break;
            case "back":
               var_1429.window.visible = true;
               dispose();
         }
      }
      
      public function updateUnseenItemCount(param1:String, param2:int) : void
      {
      }
      
      public function get widget() : com.sulake.habbo.toolbar.memenu.MeMenuController
      {
         return var_1429;
      }
   }
}
