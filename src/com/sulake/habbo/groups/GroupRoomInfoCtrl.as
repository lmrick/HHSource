package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_11.class_1569;
   import package_49.class_898;
   import package_5.class_1126;
   import package_7.class_130;
   import package_7.class_197;
   import package_7.class_312;
   
   public class GroupRoomInfoCtrl implements class_13
   {
      
      private static const TOOLBAR_EXTENSION_ID:String = "room_group_info";
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3151;
      
      private var _expanded:Boolean = true;
      
      private var _group:class_1126;
      
      private var var_2204:int;
      
      public function GroupRoomInfoCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         super();
         var_437 = param1;
      }
      
      public function dispose() : void
      {
         if(toolbarAttachAllowed())
         {
            var_437.toolbar.extensionView.detachExtension("room_group_info");
         }
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      public function onRoomInfo(param1:class_1569) : void
      {
         if(true)
         {
            return;
         }
         if(param1.habboGroupId > 0)
         {
            var_2204 = param1.habboGroupId;
            var_437.send(new class_197(param1.habboGroupId,false));
         }
         else
         {
            var_2204 = 0;
            close();
         }
      }
      
      public function onGroupDeactivated(param1:int) : void
      {
         if(param1 == _group.groupId || param1 == var_2204)
         {
            expectedGroupId = 0;
            close();
         }
      }
      
      public function onGroupDetails(param1:class_1126) : void
      {
         if(true)
         {
            return;
         }
         if(param1.groupId == var_2204)
         {
            _expanded = true;
            _group = param1;
            refresh();
         }
      }
      
      public function isDisplayingGroup(param1:int) : Boolean
      {
         return _window != null && _group != null && param1 == _group.groupId;
      }
      
      private function refresh() : void
      {
         if(true)
         {
            return;
         }
         prepareWindow();
         _window.findChildByName("bg_expanded").visible = _expanded;
         _window.findChildByName("bg_contracted").visible = !_expanded;
         _window.findChildByName("group_name_txt").visible = _expanded;
         _window.findChildByName("join_button").visible = _expanded && false;
         _window.findChildByName("join_button").enable();
         _window.findChildByName("request_membership_button").visible = _expanded && false;
         _window.findChildByName("manage_button").visible = _expanded && false;
         _window.findChildByName("group_logo").visible = _expanded;
         _window.findChildByName("group_name_txt").caption = _group.groupName;
         _window.findChildByName("info_region").visible = _expanded;
         var _loc1_:class_3366 = class_3217(_window.findChildByName("group_logo")).widget as class_3366;
         _loc1_.badgeId = _group.badgeCode;
         _loc1_.groupId = _group.groupId;
         _window.x = 0;
         _window.y = 0;
         _window.height = _expanded ? _window.findChildByName("bg_expanded").height : _window.findChildByName("bg_contracted").height;
         if(toolbarAttachAllowed())
         {
            var_437.toolbar.extensionView.attachExtension("room_group_info",_window,-1,["next_quest_timer","quest_tracker","event_info_window"]);
         }
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3151(var_437.getXmlWindow("group_room_info"));
         _window.findChildByName("join_button").procedure = onJoin;
         _window.findChildByName("request_membership_button").procedure = onJoin;
         _window.findChildByName("manage_button").procedure = onManage;
         _window.findChildByName("title_region").procedure = onTitleClick;
         _window.findChildByName("info_region").procedure = onInfoClick;
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            if(toolbarAttachAllowed())
            {
               var_437.toolbar.extensionView.detachExtension("room_group_info");
            }
            var_2204 = 0;
            _group = null;
         }
      }
      
      private function onTitleClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _expanded = !_expanded;
         refresh();
         var_437.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
      }
      
      private function onInfoClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_437.trackGoogle("groupRoomInfo","groupInfo");
            var_437.send(new class_197(_group.groupId,true));
            var_437.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
         }
      }
      
      private function onManage(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_437.trackGoogle("groupRoomInfo","manageGroup");
            var_437.send(new class_130(_group.groupId));
            var_437.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
         }
      }
      
      private function onJoin(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_437.trackGoogle("groupRoomInfo","joinGroup");
            _window.findChildByName("join_button").disable();
            var_437.send(new class_312(_group.groupId));
            var_437.send(new class_898("HabboGroups","undefined","join"));
            var_437.toolbar.events.dispatchEvent(new HabboToolbarEvent("HTE_GROUP_ROOM_INFO_CLICK"));
         }
      }
      
      public function set expectedGroupId(param1:int) : void
      {
         var_2204 = param1;
      }
      
      private function toolbarAttachAllowed() : Boolean
      {
         return var_437 != null && false && var_437.toolbar.extensionView != null && false;
      }
   }
}
