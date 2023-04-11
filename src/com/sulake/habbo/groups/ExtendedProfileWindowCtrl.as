package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendlist.class_3277;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_49.class_898;
   import package_5.class_1126;
   import package_5.class_1481;
   import package_5.class_1633;
   import package_5.class_1645;
   import package_7.class_193;
   import package_7.class_197;
   import package_7.class_313;
   import package_7.class_692;
   import package_7.class_762;
   import package_7.class_844;
   
   public class ExtendedProfileWindowCtrl implements class_13
   {
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3151;
      
      private var var_2251:IItemListWindow;
      
      private var var_3588:class_3151;
      
      private var var_1664:int;
      
      private var var_2737:com.sulake.habbo.groups.GroupDetailsCtrl;
      
      private var var_2875:class_3151;
      
      private var var_45:class_1481;
      
      private var var_3435:Boolean;
      
      private var var_3977:Boolean = false;
      
      private var var_165:class_24;
      
      private var var_3903:Boolean = false;
      
      public function ExtendedProfileWindowCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         var_165 = new class_24();
         super();
         var_437 = param1;
         var_2737 = new com.sulake.habbo.groups.GroupDetailsCtrl(param1,false);
      }
      
      public function dispose() : void
      {
         var_437 = null;
         var_2251 = null;
         var_45 = null;
         if(var_165)
         {
            var_165.dispose();
            var_165 = null;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_2737)
         {
            var_2737.dispose();
            var_2737 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         if(var_3588 == null)
         {
            var_3588 = class_3151(var_437.getXmlWindow("group_entry"));
         }
         if(var_2875 == null)
         {
            var_2875 = class_3151(var_437.getXmlWindow("no_groups"));
            var_2875.findChildByName("view_groups_button").procedure = onViewGroups;
         }
         _window = class_3281(var_437.getXmlWindow("new_extended_profile"));
         _window.findChildByTag("close").procedure = onClose;
         _window.findChildByName("addasfriend_button").procedure = onAddAsFriend;
         _window.findChildByName("rooms_button").procedure = onRooms;
         var_2251 = IItemListWindow(_window.findChildByName("groups_list"));
         _window.center();
         _window.findChildByName("change_looks").procedure = onChangeLooks;
         _window.findChildByName("change_badges").procedure = onChangeBadges;
         _window.findChildByName("user_activity_points").visible = var_437.isActivityDisplayEnabled;
         for each(var _loc1_ in class_3277.displayableStatuses)
         {
            _window.findChildByName(class_3277.statusAsString(_loc1_) + "_friend_name_link_region").procedure = onRelationshipLink;
         }
      }
      
      public function onProfileChanged(param1:int) : void
      {
         if(var_45 != null && var_45.userId == param1 && _window != null && false)
         {
            var_437.send(new class_313(param1));
            var_3435 = true;
         }
      }
      
      public function onProfile(param1:class_1481) : void
      {
         var_45 = param1;
         var _loc2_:class_1633 = getSelectedGroup();
         if(_loc2_ == null)
         {
            if(var_45.guilds.length > 0)
            {
               var_1664 = var_45.guilds[0].groupId;
               _loc2_ = var_45.guilds[0];
            }
            else
            {
               var_1664 = 0;
            }
         }
         if(var_1664 > 0)
         {
            var_437.send(new class_197(var_1664,false));
         }
         refresh();
         _window.visible = true;
         if(!var_3435)
         {
            _window.activate();
         }
         var_3435 = false;
      }
      
      private function getSelectedGroup() : class_1633
      {
         for each(var _loc1_ in var_45.guilds)
         {
            if(_loc1_.groupId == var_1664)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function refresh() : void
      {
         var_437.send(new class_692(var_45.userId));
         var_437.send(new class_844(var_45.userId));
         prepareWindow();
         refreshHeader();
         refreshGroupList();
      }
      
      private function refreshGroupList() : void
      {
         var _loc1_:class_3151 = null;
         var _loc2_:class_3366 = null;
         var _loc4_:class_3151 = null;
         var _loc3_:Boolean = true;
         var_2251.visible = var_45.guilds.length > 0;
         var_2251.destroyListItems();
         for each(var _loc5_ in var_45.guilds)
         {
            _loc1_ = class_3151(var_3588.clone());
            _loc1_.id = _loc5_.groupId;
            _loc1_.findChildByName("bg_region").procedure = onSelectGroup;
            _loc1_.findChildByName("bg_region").id = _loc5_.groupId;
            _loc1_.findChildByName("clear_favourite").procedure = onClearFavourite;
            _loc1_.findChildByName("clear_favourite").visible = _loc5_.favourite && _loc3_;
            _loc1_.findChildByName("clear_favourite").id = _loc5_.groupId;
            _loc1_.findChildByName("make_favourite").procedure = onMakeFavourite;
            _loc1_.findChildByName("make_favourite").visible = !_loc5_.favourite && _loc3_;
            _loc1_.findChildByName("make_favourite").id = _loc5_.groupId;
            _loc2_ = class_3366(class_3217(_loc1_.findChildByName("group_pic_bitmap")).widget);
            _loc2_.type = "group";
            _loc2_.badgeId = _loc5_.badgeCode;
            _loc2_.groupId = _loc5_.groupId;
            var_2251.addListItem(_loc1_);
         }
         refreshGroupListSelection();
         var_437.localization.registerParameter("extendedprofile.groups.count","count",var_45.guilds.length.toString());
         if(var_45.guilds.length < 1)
         {
            (_loc4_ = class_3151(_window.findChildByName("group_cont"))).removeChildAt(0);
            _loc4_.addChild(var_2875);
            var_2875.findChildByName("no_groups_caption").caption = var_437.localization.getLocalization(_loc3_ ? "extendedprofile.nogroups.me" : "extendedprofile.nogroups.user");
            var_2875.findChildByName("view_groups_button").visible = true;
         }
      }
      
      private function refreshGroupListSelection() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3151 = null;
         _loc2_ = 0;
         while(_loc2_ < var_2251.numListItems)
         {
            _loc1_ = class_3151(var_2251.getListItemAt(_loc2_));
            _loc1_.findChildByName("bg_selected_bitmap").visible = var_1664 == _loc1_.id;
            _loc1_.findChildByName("bg_unselected_bitmap").visible = var_1664 != _loc1_.id;
            _loc2_++;
         }
      }
      
      private function refreshHeader() : void
      {
         var _loc1_:Boolean = true;
         _window.findChildByName("motto_txt").caption = var_45.motto;
         _window.findChildByName("status_txt").visible = false || _loc1_;
         _window.findChildByName("friend_request_sent_txt").visible = var_45.isFriendRequestSent;
         _window.findChildByName("offline_icon").visible = true;
         _window.findChildByName("online_icon").visible = var_45.isOnline;
         _window.findChildByName("status").invalidate();
         var_437.localization.registerParameter("extendedprofile.username","username",var_45.userName);
         var_437.localization.registerParameter("extendedprofile.created","created",var_45.creationDate);
         var_437.localization.registerParameter("extendedprofile.activitypoints","activitypoints",var_45.achievementScore.toString());
         var_437.localization.registerParameter("extendedprofile.last.login","lastlogin",FriendlyTime.getFriendlyTime(var_437.localization,var_45.lastAccessSinceInSeconds,".ago"));
         _window.findChildByName("user_last_login").visible = true;
         refreshAvatarImage();
         var _loc2_:Boolean = true;
         var _loc3_:Boolean = false && _loc2_ || _loc1_;
         _window.findChildByName("addasfriend_button").visible = !_loc1_ && var_437.friendlist.canBeAskedForAFriend(var_45.userId) && _loc2_;
         _window.findChildByName("ok_icon").visible = _loc3_;
         _window.findChildByName("status_txt").visible = _loc3_;
         _window.findChildByName("top_right").visible = _loc2_;
         _window.findChildByName("status_txt").caption = var_437.localization.getLocalization(var_45.isFriend ? "extendedprofile.friend" : "extendedprofile.me");
         _window.findChildByName("change_own_attributes").visible = _loc1_;
         _window.findChildByName("levelValue").caption = var_45.accountLevel.toString();
         _window.findChildByName("starGemCount").caption = var_45.starGemCount.toString();
      }
      
      private function refreshRelationships() : void
      {
         var _loc1_:Boolean = var_437.getBoolean("relationship.status.enabled");
         if(_loc1_ && _window)
         {
            _window.findChildByName("rel_status_label_txt").visible = true;
            for each(var _loc2_ in class_3277.displayableStatuses)
            {
               setRelationshipDetails(_loc2_);
            }
         }
         var_437.localization.registerParameter("extendedprofile.friends.count","count",var_45.friendCount.toString());
      }
      
      private function setRelationshipDetails(param1:int) : void
      {
         var _loc4_:class_1645 = var_165.getValue(param1);
         var _loc5_:String = class_3277.statusAsString(param1);
         var _loc6_:class_3127 = _window.findChildByName(_loc5_ + "_txt");
         var _loc3_:class_3127 = _window.findChildByName(_loc5_ + "_friend_name_link_text");
         var _loc2_:class_3217 = class_3217(_window.findChildByName(_loc5_ + "_head"));
         if(_loc4_ && _loc4_.friendCount > 0)
         {
            _loc3_.caption = _loc4_.randomFriendName;
            _loc2_.visible = true;
            class_3308(_loc2_.widget).figure = _loc4_.randomFriendFigure;
            if(_loc4_.friendCount > 1)
            {
               _loc6_.visible = true;
               _loc6_.invalidate();
               _loc6_.caption = var_437.localization.getLocalizationWithParams("extendedprofile.relstatus.others." + _loc5_,"","count","" + (_loc4_.friendCount - 1));
            }
            else
            {
               _loc6_.visible = false;
            }
         }
         else
         {
            _loc2_.visible = false;
            _loc3_.caption = "${extendedprofile.add.friends}";
            _loc6_.caption = "${extendedprofile.no.friends.in.this.category}";
            _loc6_.visible = true;
         }
      }
      
      public function onGroupDetails(param1:class_1126) : void
      {
         var _loc2_:class_3151 = null;
         if(var_1664 == param1.groupId)
         {
            _loc2_ = class_3151(_window.findChildByName("group_cont"));
            _loc2_.removeChildAt(0);
            _loc2_.invalidate();
            var_2737.onGroupDetails(_loc2_,param1);
         }
      }
      
      public function onRelationshipStatusInfo(param1:int, param2:class_24) : void
      {
         if(var_45 && relationshipUpdateExpected)
         {
            var_165 = param2.clone();
            refreshRelationships();
            relationshipUpdateExpected = false;
         }
      }
      
      public function onUserBadges(param1:int, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_3366 = null;
         if(var_45 && badgeUpdateExpected && _window != null)
         {
            _loc4_ = 0;
            while(_loc4_ < 5)
            {
               _loc3_ = class_3366(class_3217(_window.findChildByName("badge_" + _loc4_)).widget);
               _loc3_.type = "normal";
               _loc3_.badgeId = _loc4_ < param2.length ? param2[_loc4_] : "";
               _loc4_++;
            }
            badgeUpdateExpected = false;
         }
      }
      
      private function setProc(param1:String, param2:Function) : void
      {
         var _loc3_:class_3127 = _window.findChildByName(param1);
         _loc3_.mouseThreshold = 0;
         _loc3_.procedure = param2;
      }
      
      private function onAddAsFriend(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.friendlist.askForAFriend(var_45.userId,var_45.userName);
         var_45.isFriendRequestSent = true;
         refresh();
      }
      
      private function onRooms(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.newNavigator.performSearch("hotel_view","owner:undefined");
      }
      
      private function onRelationshipLink(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:String = null;
         var _loc3_:class_1645 = null;
         var _loc5_:int = 0;
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(param1.target != null && param2.name != null && var_165 != null)
         {
            _loc4_ = param2.name.substr(0,param2.name.indexOf("_"));
            _loc3_ = var_165.getValue(class_3277.stringAsStatus(_loc4_));
            if(_loc3_ != null)
            {
               if(_loc5_ = _loc3_.randomFriendId)
               {
                  var_437.showExtendedProfile(_loc5_);
               }
            }
            else
            {
               var_437.windowManager.alert("${extendedprofile.add.friends.alert.title}","${extendedprofile.add.friends.alert.body}",0,addFriendsAlertCallback);
            }
         }
      }
      
      private function onViewGroups(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.navigator.performGuildBaseSearch();
      }
      
      private function onSelectGroup(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_1664 = param2.id;
         var_437.send(new class_197(var_1664,false));
         var_437.send(new class_898("HabboGroups","" + param2.id,"select"));
         this.refreshGroupListSelection();
      }
      
      private function onMakeFavourite(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.send(new class_193(param2.id));
         var_437.send(new class_898("HabboGroups","" + param2.parent.id,"make favourite"));
         var_1664 = param2.id;
      }
      
      private function onClearFavourite(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.send(new class_762(param2.id));
         var_437.send(new class_898("HabboGroups","" + param2.parent.id,"clear favourite"));
         var_1664 = param2.id;
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         close();
      }
      
      private function onChangeLooks(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.context.createLinkEvent("avatareditor/open");
      }
      
      private function onChangeBadges(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.context.createLinkEvent("inventory/open/badges");
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      private function refreshAvatarImage(param1:Boolean = false) : void
      {
         var _loc2_:class_3217 = class_3217(_window.findChildByName("avatar_image"));
         var _loc3_:class_3308 = class_3308(_loc2_.widget);
         _loc3_.figure = var_45.figure;
      }
      
      public function updateVisibleExtendedProfile(param1:int) : void
      {
         if(_window != null && false && var_45 != null && var_45.userId != param1)
         {
            var_437.send(new class_313(param1));
         }
      }
      
      public function get badgeUpdateExpected() : Boolean
      {
         return var_3977;
      }
      
      public function set badgeUpdateExpected(param1:Boolean) : void
      {
         var_3977 = param1;
      }
      
      public function set relationshipUpdateExpected(param1:Boolean) : void
      {
         var_3903 = param1;
      }
      
      public function get relationshipUpdateExpected() : Boolean
      {
         return var_3903;
      }
      
      private function addFriendsAlertCallback(param1:class_3132, param2:class_3134) : void
      {
         if(param2.type == "WE_OK")
         {
            var_437.context.createLinkEvent("friendbar/findfriends");
            close();
         }
         param1.dispose();
      }
   }
}
