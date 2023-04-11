package com.sulake.habbo.groups
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.InfoText;
   import com.sulake.habbo.utils.LoadingIcon;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Timer;
   import package_130.class_1527;
   import package_5.class_1138;
   import package_5.class_1174;
   import package_5.class_169;
   import package_5.class_221;
   import package_5.class_307;
   import package_5.class_632;
   import package_5.class_855;
   import package_7.class_1032;
   import package_7.class_124;
   import package_7.class_219;
   import package_7.class_304;
   import package_7.class_313;
   import package_7.class_555;
   import package_7.class_861;
   import package_7.class_984;
   
   public class GuildMembersWindowCtrl implements class_13
   {
      
      private static const MEMBER_SPACING:Point = new Point(5,5);
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3281;
      
      private var _groupId:int;
      
      private var var_1856:Timer;
      
      private var var_45:class_1138;
      
      private var var_938:InfoText;
      
      private var _loadingIcon:LoadingIcon;
      
      public function GuildMembersWindowCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         var_1856 = new Timer(1000,1);
         super();
         var_437 = param1;
         var_1856.addEventListener("timer",onSearchTimer);
         _loadingIcon = new LoadingIcon();
      }
      
      public function dispose() : void
      {
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_938 != null)
         {
            var_938.dispose();
            var_938 = null;
         }
         if(var_1856)
         {
            var_1856.removeEventListener("timer",onSearchTimer);
            var_1856.stop();
            var_1856 = null;
         }
         if(_loadingIcon)
         {
            _loadingIcon.dispose();
            _loadingIcon = null;
         }
      }
      
      private function setSearchingIcon(param1:Boolean) : void
      {
         if(_window)
         {
            _loadingIcon.setVisible(IIconWindow(_window.findChildByName("searching_icon")),param1);
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      public function onGuildMembers(param1:IMessageEvent) : void
      {
         var_45 = class_221(param1).data;
         show();
         populateSearchTypes();
         populateUserNameFilter();
      }
      
      public function onGuildMembershipUpdated(param1:IMessageEvent) : void
      {
         var _loc2_:class_307 = class_307(param1);
         if(var_45 != null && var_45.groupId == _loc2_.guildId)
         {
            var_45.update(_loc2_.data);
            reload();
         }
      }
      
      public function onGuildMemberMgmtFailed(param1:IMessageEvent) : void
      {
         var _loc2_:class_632 = class_632(param1);
         var _loc3_:int = _loc2_.reason;
         var _loc4_:String = "group.membermgmt.fail." + _loc3_;
         var _loc5_:String = String(var_437.localization.getLocalization(_loc4_,_loc4_));
         var_437.windowManager.alert("${group.membermgmt.fail.title}",_loc5_,0,null);
         if(var_45 != null && var_45.groupId == _loc2_.guildId && _window != null && false)
         {
            doSearch(var_45.pageIndex);
         }
      }
      
      public function onGuildMembershipRejected(param1:IMessageEvent) : void
      {
         var _loc2_:class_169 = class_169(param1);
         if(_window && false && var_45 != null && var_45.groupId == _loc2_.getParser().guildId)
         {
            doSearch(var_45.pageIndex);
         }
      }
      
      public function onMembershipRequested(param1:IMessageEvent) : void
      {
         var _loc2_:class_1527 = class_855(param1).getParser();
         if(_window && false && var_45 != null && var_45.groupId == _loc2_.groupId)
         {
            doSearch(var_45.pageIndex);
         }
      }
      
      public function onMembersClick(param1:int, param2:int) : void
      {
         if(!var_437.getBoolean("groupMembers.enabled"))
         {
            return;
         }
         if(_window != null && false && _groupId == param1)
         {
            close();
         }
         else
         {
            if(var_938)
            {
               var_938.goBackToInitialState();
            }
            _groupId = param1;
            var_437.send(new class_1032(param1,0,"",param2));
         }
      }
      
      public function show() : void
      {
         prepareWindow();
         refresh();
         _window.visible = true;
         _window.activate();
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var _loc2_:int = 0;
         var_437.localization.registerParameter("group.members.title","groupName",var_45.groupName);
         var _loc3_:class_3151 = class_3151(_window.findChildByName("members_cont"));
         var _loc4_:Array = var_45.entries;
         _loc2_ = 0;
         while(_loc2_ < var_45.pageSize)
         {
            refreshEntry(_loc3_,_loc2_,_loc4_[_loc2_]);
            _loc2_++;
         }
         var _loc1_:class_3366 = class_3217(_window.findChildByName("group_logo")).widget as class_3366;
         _loc1_.badgeId = var_45.badgeCode;
         _loc1_.groupId = var_45.groupId;
         var_437.localization.registerParameter("group.members.pageinfo","amount","undefined");
         var_437.localization.registerParameter("group.members.pageinfo","page","NaN");
         var_437.localization.registerParameter("group.members.pageinfo","totalPages","undefined");
         _window.findChildByName("previous_page_button").visible = hasPreviousPage();
         _window.findChildByName("next_page_button").visible = hasNextPage();
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(var_437.getXmlWindow("guild_members_window"));
         _window.findChildByTag("close").procedure = onClose;
         _window.findChildByName("previous_page_button").procedure = onPreviousPage;
         _window.findChildByName("next_page_button").procedure = onNextPage;
         var_938 = new InfoText(ITextFieldWindow(_window.findChildByName("filter_members_input")),var_437.localization.getLocalization("group.members.searchinfo"));
         _window.center();
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         close();
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _groupId = 0;
            _window.visible = false;
         }
      }
      
      private function refreshEntry(param1:class_3151, param2:int, param3:class_1174) : void
      {
         var _loc4_:class_3151;
         if((_loc4_ = class_3151(param1.getChildAt(param2))) == null)
         {
            if(param3 == null)
            {
               return;
            }
            (_loc4_ = getListEntry()).tags[0] = "" + param2;
            param1.addChild(_loc4_);
            _loc4_.x = param2 % 2 == 0 ? 0 : _loc4_.width + MEMBER_SPACING.x;
            _loc4_.y = Math.floor(param2 / 2) * (_loc4_.height + MEMBER_SPACING.y);
         }
         if(param3 != null)
         {
            refreshUserEntry(_loc4_,param3);
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.visible = false;
         }
      }
      
      public function refreshUserEntry(param1:class_3151, param2:class_1174) : void
      {
         var _loc8_:* = false;
         param1.findChildByName("user_name_txt").caption = param2.userName;
         param1.findChildByName("icon_owner").visible = param2.owner;
         this.setAdminState(param2.member,param2.admin,param1);
         var _loc5_:class_3127;
         (_loc5_ = param1.findChildByName("admin_container")).visible = !_loc8_ && (param2.admin || false);
         var _loc9_:IRegionWindow;
         (_loc9_ = IRegionWindow(param1.findChildByName("bg_region"))).id = param2.userId;
         this.setRemoveState(false,param1);
         this.setActionLinkState(false,param1);
         _loc8_ = param2.userId == var_437.avatarId;
         var _loc11_:IRegionWindow;
         (_loc11_ = IRegionWindow(param1.findChildByName("remove_region"))).toolTipCaption = var_437.localization.getLocalization(param2.member ? "group.members.kick" : "group.members.reject");
         _loc11_.visible = !param2.owner && !_loc8_ && false && !param2.blocked;
         _loc11_.id = param2.userId;
         var _loc6_:Boolean = param2.member && !param2.owner && !_loc8_ && false && var_437.getBoolean("group.blocking.enabled") && !param2.blocked;
         var _loc3_:IRegionWindow = IRegionWindow(param1.findChildByName("block_region"));
         _loc3_.toolTipCaption = var_437.localization.getLocalization("group.members.block");
         _loc3_.visible = _loc6_;
         _loc3_.id = param2.userId;
         var _loc4_:Boolean = !_loc8_ && false;
         var _loc10_:IRegionWindow;
         (_loc10_ = IRegionWindow(param1.findChildByName("action_link_region"))).visible = _loc4_;
         _loc10_.id = param2.userId;
         var _loc7_:ITextWindow;
         (_loc7_ = ITextWindow(param1.findChildByName("member_since_txt"))).visible = !_loc4_ && param2.memberSince != "";
         var_437.localization.registerParameter("group.members.since","date",param2.memberSince);
         _loc7_.caption = var_437.localization.getLocalization("group.members.since");
         class_3308(class_3217(param1.findChildByName("avatar_image")).widget).figure = param2.figure;
         if(param2.blocked)
         {
            setActionLink(param1,"group.members.unblock",false);
         }
         else if(param2.owner)
         {
            setActionLink(param1,"group.members.owner",false);
         }
         else if(param2.admin)
         {
            setActionLink(param1,"group.members.removerights",true);
         }
         else if(param2.member)
         {
            setActionLink(param1,"group.members.giverights",true);
         }
         else
         {
            setActionLink(param1,"group.members.accept",true);
         }
      }
      
      public function getListEntry() : class_3151
      {
         var _loc1_:class_3151 = class_3151(var_437.getXmlWindow("member_entry"));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName("bg_region"));
         _loc3_.procedure = onBg;
         var _loc2_:IRegionWindow = IRegionWindow(_loc1_.findChildByName("block_region"));
         _loc2_.addEventListener("WME_OVER",onRemoveMouseOver);
         _loc2_.addEventListener("WME_OUT",onRemoveMouseOut);
         _loc2_.addEventListener("WME_CLICK",onBlockMouseClick);
         var _loc5_:IRegionWindow;
         (_loc5_ = IRegionWindow(_loc1_.findChildByName("remove_region"))).addEventListener("WME_OVER",onRemoveMouseOver);
         _loc5_.addEventListener("WME_OUT",onRemoveMouseOut);
         _loc5_.addEventListener("WME_CLICK",onRemoveMouseClick);
         var _loc4_:IRegionWindow;
         (_loc4_ = IRegionWindow(_loc1_.findChildByName("action_link_region"))).addEventListener("WME_OVER",onActionLinkMouseOver);
         _loc4_.addEventListener("WME_OUT",onActionLinkMouseOut);
         _loc4_.addEventListener("WME_CLICK",onActionLinkClick);
         return _loc1_;
      }
      
      private function onRemoveMouseOver(param1:class_3134) : void
      {
         var _loc2_:IRegionWindow = IRegionWindow(param1.target);
         setRemoveState(true,_loc2_);
      }
      
      private function onRemoveMouseOut(param1:class_3134) : void
      {
         var _loc2_:IRegionWindow = IRegionWindow(param1.target);
         setRemoveState(false,_loc2_);
      }
      
      private function onRemoveMouseClick(param1:class_3134) : void
      {
         var _loc3_:class_3127 = param1.target;
         var _loc2_:class_1174 = var_45.getUser(_loc3_.id);
         if(_loc2_ == null || _loc2_.owner)
         {
            return;
         }
         if(_loc2_.member)
         {
            var_437.handleUserKick(_loc3_.id,var_45.groupId);
         }
         else
         {
            var_437.send(new class_984(var_45.groupId,_loc2_.userId));
         }
      }
      
      private function onBlockMouseClick(param1:class_3134) : void
      {
         var _loc3_:class_3127 = param1.target;
         var _loc2_:class_1174 = var_45.getUser(_loc3_.id);
         if(_loc2_ == null || _loc2_.owner)
         {
            return;
         }
         if(_loc2_.member)
         {
            var_437.handleUserBlock(_loc3_.id,var_45.groupId);
         }
      }
      
      private function setActionLink(param1:class_3151, param2:String, param3:Boolean) : void
      {
         var _loc4_:ITextWindow;
         (_loc4_ = ITextWindow(param1.findChildByName("action_link"))).text = var_437.localization.getLocalization(param2,param2);
         _loc4_.underline = param3;
      }
      
      private function setRemoveState(param1:Boolean, param2:class_3151) : void
      {
         param2.findChildByName("icon_close_off").visible = !param1;
         param2.findChildByName("icon_close_over").visible = param1;
         param2.findChildByName("icon_close_down").visible = false;
      }
      
      private function setActionLinkState(param1:Boolean, param2:class_3151) : void
      {
         var _loc3_:ITextWindow = ITextWindow(param2.findChildByName("action_link"));
         _loc3_.textColor = param1 ? 4280984060 : 4285492837;
      }
      
      private function onActionLinkMouseOver(param1:class_3134) : void
      {
         var _loc3_:IRegionWindow = IRegionWindow(param1.target);
         var _loc2_:class_1174 = var_45.getUser(param1.target.id);
         if(_loc2_ == null || _loc2_.owner)
         {
            return;
         }
         setActionLinkState(true,_loc3_);
         setAdminState(_loc2_.member,!_loc2_.admin,class_3151(_loc3_.parent));
      }
      
      private function onActionLinkMouseOut(param1:class_3134) : void
      {
         var _loc3_:IRegionWindow = IRegionWindow(param1.target);
         setActionLinkState(false,_loc3_);
         var _loc2_:class_1174 = var_45.getUser(param1.target.id);
         if(_loc2_ != null)
         {
            setAdminState(_loc2_.member,_loc2_.admin,class_3151(_loc3_.parent));
         }
      }
      
      private function onActionLinkClick(param1:class_3134) : void
      {
         var _loc2_:class_1174 = var_45.getUser(param1.target.id);
         if(_loc2_ == null || _loc2_.owner)
         {
            return;
         }
         if(_loc2_.blocked)
         {
            var_437.send(new class_861(var_45.groupId,_loc2_.userId));
         }
         else if(_loc2_.admin)
         {
            var_437.send(new class_555(var_45.groupId,_loc2_.userId));
         }
         else if(_loc2_.member)
         {
            var_437.send(new class_124(var_45.groupId,_loc2_.userId));
         }
         else
         {
            var_437.send(new class_219(var_45.groupId,_loc2_.userId));
         }
      }
      
      private function setAdminState(param1:Boolean, param2:Boolean, param3:class_3151) : void
      {
         param3.findChildByName("icon_admin_off").visible = param1 && param2;
         param3.findChildByName("icon_admin_over").visible = param1 && !param2;
      }
      
      private function onBg(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_437.send(new class_313(param2.id));
         }
      }
      
      private function onFilterMembers(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_CHANGE")
         {
            var_1856.reset();
            var_1856.start();
            setSearchingIcon(true);
         }
      }
      
      private function onTypeDropmenu(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_SELECTED")
         {
            doSearch(0);
         }
      }
      
      private function doSearch(param1:int) : void
      {
         var_1856.stop();
         var_1856.reset();
         setSearchingIcon(true);
         var _loc2_:class_1138 = var_45;
         var _loc3_:String = var_938.getText();
         var _loc4_:int = getTypeDropMenu().selection;
         var_437.send(new class_1032(_loc2_.groupId,param1,_loc3_,_loc4_));
      }
      
      private function onAcceptAll(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.send(new class_304(var_45.groupId));
      }
      
      private function getTypeDropMenu() : class_3287
      {
         return class_3287(_window.findChildByName("type_drop_menu"));
      }
      
      private function onSearchTimer(param1:Event) : void
      {
         if(_window != null && false)
         {
            doSearch(0);
         }
      }
      
      private function onNextPage(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         doSearch(limitPageIndex(NaN));
      }
      
      private function onPreviousPage(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         doSearch(limitPageIndex(-1));
      }
      
      private function hasPreviousPage() : Boolean
      {
         return var_45.pageIndex != limitPageIndex(-1);
      }
      
      private function hasNextPage() : Boolean
      {
         return var_45.pageIndex != limitPageIndex(NaN);
      }
      
      private function limitPageIndex(param1:int) : int
      {
         var _loc2_:int = Math.ceil(0 / 0);
         return Math.max(0,Math.min(param1,_loc2_ - 1));
      }
      
      public function get data() : class_1138
      {
         return var_45;
      }
      
      private function populateSearchTypes() : void
      {
         var _loc2_:* = [];
         _loc2_.push("${group.members.search.all}");
         _loc2_.push("${group.members.search.admins}");
         if(false)
         {
            _loc2_.push("${group.members.search.pending}");
            if(var_437.getBoolean("group.blocking.enabled"))
            {
               _loc2_.push("${group.members.search.blocked}");
            }
         }
         var _loc1_:class_3287 = getTypeDropMenu();
         _loc1_.procedure = null;
         _loc1_.populate(_loc2_);
         _loc1_.selection = var_45.allowedToManage ? var_45.searchType : Math.min(var_45.searchType,1);
         _loc1_.procedure = onTypeDropmenu;
      }
      
      private function populateUserNameFilter() : void
      {
         var _loc1_:ITextFieldWindow = var_938.input;
         _loc1_.procedure = null;
         if(var_938.getText() != var_45.userNameFilter)
         {
            var_938.setText(var_45.userNameFilter);
         }
         _loc1_.procedure = onFilterMembers;
         var_1856.stop();
         setSearchingIcon(false);
      }
   }
}
