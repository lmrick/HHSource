package com.sulake.habbo.toolbar.memenu.chatsettings
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.ToolbarView;
   import com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView;
   
   public class MeMenuChatSettingsView
   {
       
      
      private var var_1429:MeMenuSettingsMenuView;
      
      private var _window:class_3151;
      
      private var var_1527:ToolbarView;
      
      public function MeMenuChatSettingsView()
      {
         super();
      }
      
      public function init(param1:MeMenuSettingsMenuView, param2:ToolbarView) : void
      {
         var_1429 = param1;
         var_1527 = param2;
         createWindow();
      }
      
      public function dispose() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:class_3176 = _window.findChildByName("prefer_old_chat_checkbox") as class_3176;
         var_1429.window.visible = true;
         var_1429.widget.toolbar.freeFlowChat.isDisabledInPreferences = _loc1_ != null && Boolean(_loc1_.isSelected);
         _window.dispose();
         _window = null;
         var_1429 = null;
      }
      
      private function createWindow() : void
      {
         var _loc3_:int = 0;
         var _loc1_:class_3127 = null;
         var _loc2_:XmlAsset = var_1429.widget.toolbar.assets.getAssetByName("me_menu_chat_settings_xml") as XmlAsset;
         _window = var_1429.widget.toolbar.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         _window.x = var_1527.window.width + 10;
         _window.y = var_1527.window.bottom - 0;
         var_1429.window.visible = false;
         _loc3_ = 0;
         _loc1_ = null;
         while(_loc3_ < _window.numChildren)
         {
            _loc1_ = _window.getChildAt(_loc3_);
            _loc1_.addEventListener("WME_CLICK",onButtonClicked);
            _loc3_++;
         }
         class_3176(_window.findChildByName("prefer_old_chat_checkbox")).isSelected = var_1429.widget.toolbar.freeFlowChat.isDisabledInPreferences;
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "back_btn":
               dispose();
               break;
            case "prefer_old_chat_checkbox":
               var_1429.widget.toolbar.freeFlowChat.isDisabledInPreferences = class_3176(_window.findChildByName("prefer_old_chat_checkbox")).isSelected;
               if(!var_1429.widget.toolbar.freeFlowChat.isDisabledInPreferences)
               {
                  if(var_1429.widget.toolbar.roomUI.chatContainer != null)
                  {
                     var_1429.widget.toolbar.roomUI.chatContainer.setDisplayObject(var_1429.widget.toolbar.freeFlowChat.displayObject);
                     break;
                  }
                  break;
               }
               var_1429.widget.toolbar.freeFlowChat.clear();
               break;
         }
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
   }
}
