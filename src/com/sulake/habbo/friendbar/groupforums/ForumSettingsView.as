package com.sulake.habbo.friendbar.groupforums
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import package_155.class_1642;
   
   public class ForumSettingsView
   {
      
      private static const const_1066:Number = 0.5;
       
      
      private var var_282:com.sulake.habbo.friendbar.groupforums.GroupForumController;
      
      private var var_1534:com.sulake.habbo.friendbar.groupforums.GroupForumView;
      
      private var _window:class_3281;
      
      private var var_2969:ISelectorWindow;
      
      private var var_2666:ISelectorWindow;
      
      private var var_2695:ISelectorWindow;
      
      private var var_3094:ISelectorWindow;
      
      private var var_506:class_1642;
      
      private var var_1372:int;
      
      private var var_1390:int;
      
      private var var_1392:int;
      
      private var var_1341:int;
      
      public function ForumSettingsView(param1:com.sulake.habbo.friendbar.groupforums.GroupForumView, param2:int, param3:int, param4:class_1642)
      {
         super();
         var_1534 = param1;
         var_282 = var_1534.controller;
         var_506 = param4;
         _window = class_3281(var_282.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_forum_settings_xml())));
         _window.x = param2;
         var _loc5_:int = int(var_282.windowManager.getDesktop(1).width);
         if(NaN > _loc5_)
         {
            _window.x = _loc5_ - 0;
         }
         _window.y = param3;
         initControls();
      }
      
      private static function setSelectorState(param1:ISelectorWindow, param2:int, param3:int) : int
      {
         var _loc5_:* = 0;
         var _loc6_:ISelectableWindow = null;
         var _loc4_:class_3127 = null;
         if(param3 < param2)
         {
            param3 = param2;
         }
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            if((_loc6_ = param1.getSelectableByName(String(_loc5_))) != null)
            {
               _loc6_.disable();
               _loc6_.blend = 0.5;
               if((_loc4_ = class_3151(param1.parent).findChildByName("label" + _loc5_)) != null)
               {
                  _loc4_.blend = 0.5;
               }
            }
            _loc5_++;
         }
         _loc5_ = param2;
         while(_loc5_ < 4)
         {
            if((_loc6_ = param1.getSelectableByName(String(_loc5_))) != null)
            {
               _loc6_.enable();
               _loc6_.blend = 1;
               if((_loc4_ = class_3151(param1.parent).findChildByName("label" + _loc5_)) != null)
               {
                  _loc4_.blend = 1;
               }
               if(_loc5_ == param3)
               {
                  param1.setSelected(_loc6_);
               }
            }
            _loc5_++;
         }
         return param3;
      }
      
      private static function getSelectorState(param1:ISelectorWindow) : int
      {
         var _loc2_:ISelectableWindow = param1.getSelected();
         if(_loc2_ == null)
         {
            return 0;
         }
         return int(_loc2_.name);
      }
      
      public function focus(param1:class_1642) : void
      {
         if(var_506 != param1)
         {
            var_506 = param1;
            initControls();
         }
         _window.activate();
      }
      
      private function initControls() : void
      {
         var _loc2_:IRegionWindow = com.sulake.habbo.friendbar.groupforums.GroupForumView.initTopAreaForForum(_window,var_506);
         _loc2_.removeEventListener("WME_CLICK",onTopAreaClick);
         _loc2_.addEventListener("WME_CLICK",onTopAreaClick);
         var _loc1_:class_3127 = _window.findChildByName("cancel_btn");
         _loc1_.removeEventListener("WME_CLICK",onCancelButtonClick);
         _loc1_.addEventListener("WME_CLICK",onCancelButtonClick);
         var _loc3_:class_3127 = _window.findChildByName("header_button_close");
         _loc3_.removeEventListener("WME_CLICK",onCancelButtonClick);
         _loc3_.addEventListener("WME_CLICK",onCancelButtonClick);
         var _loc4_:class_3127;
         (_loc4_ = _window.findChildByName("ok_btn")).removeEventListener("WME_CLICK",onPostButtonClick);
         _loc4_.addEventListener("WME_CLICK",onPostButtonClick);
         var_2969 = ISelectorWindow(_window.findChildByName("read_selector"));
         var_2969.addEventListener("WME_OVER",onReadSelectorHover);
         addSelectorListeners(var_2969);
         var_2666 = ISelectorWindow(_window.findChildByName("post_message_selector"));
         var_2666.addEventListener("WME_OVER",onPostMessageSelectorHover);
         addSelectorListeners(var_2666);
         var_2695 = ISelectorWindow(_window.findChildByName("post_thread_selector"));
         var_2695.addEventListener("WME_OVER",onPostThreadSelectorHover);
         addSelectorListeners(var_2695);
         var_3094 = ISelectorWindow(_window.findChildByName("moderate_selector"));
         var_3094.addEventListener("WME_OVER",onModerateSelectorHover);
         addSelectorListeners(var_3094);
         var_1372 = setSelectorState(var_2969,0,var_506.readPermissions);
         var_1390 = setSelectorState(var_2666,var_1372,var_506.postMessagePermissions);
         var_1392 = setSelectorState(var_2695,var_1390,var_506.postThreadPermissions);
         var_1341 = setSelectorState(var_3094,2,var_506.moderatePermissions);
      }
      
      public function dispose() : void
      {
         var_282.forumSettingsView = null;
         _window.dispose();
         _window = null;
      }
      
      private function onTopAreaClick(param1:WindowMouseEvent) : void
      {
         var_282.context.createLinkEvent("group/undefined");
      }
      
      private function onPostButtonClick(param1:WindowMouseEvent) : void
      {
         var_282.updateForumSettings(var_506.groupId,var_1372,var_1390,var_1392,var_1341);
         dispose();
      }
      
      private function onCancelButtonClick(param1:WindowMouseEvent) : void
      {
         dispose();
      }
      
      private function addSelectorListeners(param1:ISelectorWindow) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ISelectableWindow = null;
         _loc2_ = 0;
         while(_loc2_ < param1.numSelectables)
         {
            _loc3_ = param1.getSelectableAt(_loc2_);
            _loc3_.removeEventListener("WE_SELECTED",onSelectionChanged);
            _loc3_.addEventListener("WE_SELECTED",onSelectionChanged);
            _loc2_++;
         }
      }
      
      private function onSelectionChanged(param1:class_3134) : void
      {
         var_1372 = getSelectorState(var_2969);
         var_1390 = setSelectorState(var_2666,var_1372,getSelectorState(var_2666));
         var_1392 = setSelectorState(var_2695,var_1390,getSelectorState(var_2695));
         var_1341 = getSelectorState(var_3094);
      }
      
      private function onReadSelectorHover(param1:WindowMouseEvent) : void
      {
         var_282.tracking.trackEventLogOncePerSession("InterfaceExplorer","hover","forum.can.read.seen");
      }
      
      private function onPostMessageSelectorHover(param1:WindowMouseEvent) : void
      {
         var_282.tracking.trackEventLogOncePerSession("InterfaceExplorer","hover","forum.can.post.seen");
      }
      
      private function onPostThreadSelectorHover(param1:WindowMouseEvent) : void
      {
         var_282.tracking.trackEventLogOncePerSession("InterfaceExplorer","hover","forum.can.start.thread.seen");
      }
      
      private function onModerateSelectorHover(param1:WindowMouseEvent) : void
      {
         var_282.tracking.trackEventLogOncePerSession("InterfaceExplorer","hover","forum.can.moderate.seen");
      }
   }
}
