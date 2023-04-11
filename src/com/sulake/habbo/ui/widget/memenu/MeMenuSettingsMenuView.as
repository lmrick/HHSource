package com.sulake.habbo.ui.widget.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.external.ExternalInterface;
   
   public class MeMenuSettingsMenuView implements IMeMenuView
   {
       
      
      private var var_1429:com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
      
      private var _window:class_3151;
      
      public function MeMenuSettingsMenuView()
      {
         super();
      }
      
      public function init(param1:com.sulake.habbo.ui.widget.memenu.MeMenuWidget, param2:String) : void
      {
         var_1429 = param1;
         createWindow(param2);
      }
      
      public function dispose() : void
      {
         var_1429 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc2_:XmlAsset = var_1429.assets.getAssetByName("memenu_settings_menu") as XmlAsset;
         if(_loc2_)
         {
            _window = var_1429.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         }
         if(_window == null)
         {
            throw new Error("Failed to construct settings window from XML!");
         }
         _window.name = param1;
         _window.procedure = eventHandler;
         if(true || var_1429.config.getProperty("has.identity") != "1")
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
               var_1429.hide();
               break;
            case "sound_settings":
               var_1429.changeView("me_menu_sound_settings");
               break;
            case "chat_settings":
               var_1429.changeView("me_menu_chat_settings");
               break;
            case "back":
               var_1429.changeView("me_menu_top_view");
         }
      }
      
      public function updateUnseenItemCount(param1:String, param2:int) : void
      {
      }
   }
}
