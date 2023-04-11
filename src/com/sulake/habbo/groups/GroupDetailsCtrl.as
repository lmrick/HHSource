package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_49.class_898;
   import package_5.class_1126;
   import package_7.class_130;
   import package_7.class_312;
   import package_7.class_974;
   
   public class GroupDetailsCtrl implements class_13
   {
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3151;
      
      private var _selectedGroup:class_1126;
      
      public function GroupDetailsCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager, param2:Boolean)
      {
         super();
         var_437 = param1;
      }
      
      public function dispose() : void
      {
         var_437 = null;
         _selectedGroup = null;
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
      
      private function prepareWindow(param1:class_3151) : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3151(var_437.getXmlWindow("group"));
         setProc("group_room_link_region",onRoomLink);
         setProc("manage_guild_region",onManageGuild);
         setProc("delete_guild_region",onDeleteGuild);
         setProc("members_region",onMembers);
         setProc("pending_members_region",onPendingMembers);
         setProc("show_groups_link_region",onShowGroups);
         setProc("buy_furni_link_region",onBuyFurni);
         _window.findChildByName("leave_button").procedure = onLeave;
         _window.findChildByName("join_button").procedure = onJoin;
         _window.findChildByName("request_membership_button").procedure = onJoin;
      }
      
      private function attachWindow(param1:class_3151) : void
      {
         if(param1.getChildIndex(_window) == -1)
         {
            param1.addChild(_window);
         }
      }
      
      public function onGroupDetails(param1:class_3151, param2:class_1126) : void
      {
         _selectedGroup = param2;
         prepareWindow(param1);
         attachWindow(param1);
         var _loc10_:class_3127 = _window.findChildByName("group_decorate_icon_region");
         var _loc9_:class_3127;
         (_loc9_ = _window.findChildByName("group_name")).caption = param2.groupName;
         _loc10_.visible = param2.membersCanDecorate;
         _loc9_.x = param2.membersCanDecorate ? _loc10_.x + _loc10_.width : _loc10_.x;
         var _loc6_:ITextWindow;
         (_loc6_ = ITextWindow(_window.findChildByName("group_description"))).caption = param2.description;
         _loc6_.height = _loc6_.textHeight + 5;
         _window.findChildByName("group_description_scrollbar").visible = _loc6_.height > _window.findChildByName("group_description_item_list").height;
         var _loc8_:Boolean = false;
         _window.findChildByName("show_forum_link_region").visible = _loc8_;
         _window.findChildByName("show_forum_link").visible = _loc8_;
         if(_loc8_)
         {
            setProc("show_forum_link_region",onForumLink);
         }
         var_437.windowManager.registerLocalizationParameter("group.created","date","" + param2.creationDate);
         var_437.windowManager.registerLocalizationParameter("group.created","owner","" + param2.ownerName);
         _window.findChildByName("created_txt").caption = var_437.localization.getLocalization("group.created");
         var_437.windowManager.registerLocalizationParameter("group.membercount","totalMembers","" + param2.totalMembers);
         _window.findChildByName("members_txt").caption = var_437.localization.getLocalization("group.membercount");
         _window.findChildByName("group_room_link_region").visible = param2.roomId > -1;
         var_437.windowManager.registerLocalizationParameter("group.linktobase","room_name",param2.roomName);
         _window.findChildByName("group_room_link").caption = var_437.localization.getLocalization("group.linktobase");
         var _loc4_:class_3366;
         (_loc4_ = class_3217(_window.findChildByName("group_logo")).widget as class_3366).badgeId = _selectedGroup.badgeCode;
         _loc4_.groupId = _selectedGroup.groupId;
         _window.findChildByName("join_button").visible = param2.joiningAllowed;
         _window.findChildByName("join_button").enable();
         _window.findChildByName("request_membership_button").visible = param2.requestMembershipAllowed;
         _window.findChildByName("leave_button").visible = param2.leaveAllowed;
         _window.findChildByName("membership_pending_txt").visible = param2.status == 2;
         _window.findChildByName("youaremember_txt").visible = param2.status == 1;
         _window.findChildByName("youaremember_icon").visible = param2.status == 1;
         var _loc5_:class_3127;
         (_loc5_ = _window.findChildByName("pending_members_region")).visible = false;
         if(false)
         {
            var_437.windowManager.registerLocalizationParameter("group.pendingmembercount","amount","" + param2.pendingMemberCount);
            _window.findChildByName("pending_members_txt").caption = var_437.localization.getLocalization("group.pendingmembercount");
         }
         var _loc3_:class_3127 = _window.findChildByName("manage_guild_region");
         _loc3_.visible = false && false;
         _loc3_.y = _loc5_.visible ? _loc5_.y + 16 : _loc5_.y;
         var _loc7_:class_3127;
         (_loc7_ = _window.findChildByName("delete_guild_region")).visible = false && false && (false || var_437.sessionDataManager.hasSecurity(5));
         _loc7_.y = _loc3_.visible ? _loc3_.y + 16 : _loc5_.y;
         _window.findChildByName("you_are_owner_region").visible = false && false;
         _window.findChildByName("you_are_admin_region").visible = false && false && true;
         _window.findChildByName("you_are_member_region").visible = false && (false && !(false || false));
         getGroupTypeRegion(0).visible = false;
         getGroupTypeRegion(1).visible = false;
         getGroupTypeRegion(2).visible = false;
         if(getGroupTypeRegion(param2.type) != null)
         {
            getGroupTypeRegion(param2.type).visible = true;
         }
      }
      
      private function getGroupTypeRegion(param1:int) : class_3127
      {
         return _window.findChildByName("grouptype_region_" + param1);
      }
      
      private function getGroupTypeIcon(param1:int) : class_3127
      {
         return _window.findChildByName("grouptype_icon_" + param1);
      }
      
      private function setProc(param1:String, param2:Function) : void
      {
         var _loc3_:class_3127 = _window.findChildByName(param1);
         _loc3_.mouseThreshold = 0;
         _loc3_.procedure = param2;
      }
      
      private function onLeave(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","leaveGroup");
         var_437.handleUserKick(var_437.avatarId,_selectedGroup.groupId);
      }
      
      private function onJoin(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","joinGroup");
         _window.findChildByName("join_button").disable();
         var_437.send(new class_312(_selectedGroup.groupId));
         var_437.send(new class_898("HabboGroups","undefined","join"));
      }
      
      private function onRoomLink(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","groupBaseRoom");
         var_437.navigator.goToPrivateRoom(_selectedGroup.roomId);
         var_437.send(new class_898("HabboGroups","undefined","base"));
      }
      
      private function onForumLink(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.openGroupForum(_selectedGroup.groupId);
      }
      
      private function openExternalLink(param1:String) : void
      {
         if(param1 != "")
         {
            var_437.windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,onExternalLink);
            HabboWebTools.navigateToURL(param1,"_empty");
         }
      }
      
      private function onExternalLink(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      private function onManageGuild(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","groupManage");
         var_437.send(new class_130(_selectedGroup.groupId));
      }
      
      private function onDeleteGuild(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.windowManager.confirm("${group.deleteconfirm.title}","${group.deleteconfirm.desc}",0,onDeleteGuildConfirmation);
      }
      
      private function onDeleteGuildConfirmation(param1:class_3216, param2:class_3134) : void
      {
         param1.dispose();
         if(param2.type == "WE_OK")
         {
            var_437.trackGoogle("groupDetails","groupDelete");
            var_437.send(new class_974(_selectedGroup.groupId));
         }
      }
      
      private function onMembers(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","groupMembers");
         var_437.guildMembersWindowCtrl.onMembersClick(_selectedGroup.groupId,0);
      }
      
      private function onPendingMembers(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","groupPendingMembers");
         var_437.guildMembersWindowCtrl.onMembersClick(_selectedGroup.groupId,2);
      }
      
      private function onShowGroups(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","hottestGroups");
         var_437.navigator.performGuildBaseSearch();
      }
      
      private function onBuyFurni(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.trackGoogle("groupDetails","groupFurni");
         var_437.openCatalog("guild_custom_furni");
      }
   }
}
