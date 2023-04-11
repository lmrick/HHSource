package com.sulake.habbo.groups
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.groups.events.HabboGroupsEditorData;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.IHabboNewNavigator;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboNewNavigator;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import package_10.class_606;
   import package_11.class_751;
   import package_11.class_846;
   import package_130.class_1276;
   import package_132.class_1084;
   import package_132.class_1514;
   import package_133.class_1188;
   import package_154.class_1256;
   import package_17.class_486;
   import package_49.class_898;
   import package_5.class_1111;
   import package_5.class_1124;
   import package_5.class_1126;
   import package_5.class_1138;
   import package_5.class_1174;
   import package_5.class_1218;
   import package_5.class_122;
   import package_5.class_131;
   import package_5.class_1481;
   import package_5.class_149;
   import package_5.class_169;
   import package_5.class_221;
   import package_5.class_227;
   import package_5.class_233;
   import package_5.class_241;
   import package_5.class_260;
   import package_5.class_307;
   import package_5.class_387;
   import package_5.class_420;
   import package_5.class_632;
   import package_5.class_743;
   import package_5.class_783;
   import package_5.class_788;
   import package_5.class_800;
   import package_5.class_855;
   import package_5.class_935;
   import package_5.class_993;
   import package_6.class_530;
   import package_7.class_141;
   import package_7.class_197;
   import package_7.class_313;
   import package_7.class_857;
   import package_7.class_912;
   
   public class HabboGroupsManager extends class_20 implements class_1752, ILinkEventTracker
   {
      
      public static const GROUPS_TRACKING_CATEGORY:String = "HabboGroups";
       
      
      private var _communication:class_25;
      
      private var _windowManager:class_1684;
      
      private var _localization:class_18;
      
      private var _navigator:class_1685;
      
      private var _newNavigator:IHabboNewNavigator;
      
      private var _friendlist:class_1869;
      
      private var _catalog:IHabboCatalog;
      
      private var _toolbar:IHabboToolbar;
      
      private var _habboTracking:class_1693;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var var_2038:com.sulake.habbo.groups.DetailsWindowCtrl;
      
      private var var_1899:com.sulake.habbo.groups.GuildMembersWindowCtrl;
      
      private var var_1918:com.sulake.habbo.groups.GuildManagementWindowCtrl;
      
      private var var_1811:com.sulake.habbo.groups.ExtendedProfileWindowCtrl;
      
      private var var_2608:com.sulake.habbo.groups.HcRequiredWindowCtrl;
      
      private var var_2780:com.sulake.habbo.groups.GroupCreatedWindowCtrl;
      
      private var var_1819:com.sulake.habbo.groups.GroupRoomInfoCtrl;
      
      private var var_3522:class_1218;
      
      private var var_1094:int;
      
      private var var_354:int;
      
      private var var_3867:Boolean;
      
      private var var_1908:com.sulake.habbo.groups.GuildKickData;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      public function HabboGroupsManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_2038 = new com.sulake.habbo.groups.DetailsWindowCtrl(this);
         var_1899 = new com.sulake.habbo.groups.GuildMembersWindowCtrl(this);
         var_1918 = new com.sulake.habbo.groups.GuildManagementWindowCtrl(this);
         var_1811 = new com.sulake.habbo.groups.ExtendedProfileWindowCtrl(this);
         var_2608 = new com.sulake.habbo.groups.HcRequiredWindowCtrl(this);
         var_2780 = new com.sulake.habbo.groups.GroupCreatedWindowCtrl(this);
         var_1819 = new com.sulake.habbo.groups.GroupRoomInfoCtrl(this);
         class_14.log("HabboGroupsManager initialized: " + param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         }),new ComponentDependency(new IIDHabboNewNavigator(),function(param1:IHabboNewNavigator):void
         {
            _newNavigator = param1;
         }),new ComponentDependency(new IIDHabboFriendList(),function(param1:class_1869):void
         {
            _friendlist = param1;
         }),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _habboTracking = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_530(onUserObject));
         addMessageEvent(new class_783(onGuildEditFailed));
         addMessageEvent(new class_486(onRoomEnter));
         addMessageEvent(new class_751(onFlatCreated));
         addMessageEvent(new class_632(var_1899.onGuildMemberMgmtFailed));
         addMessageEvent(new class_788(onGroupDetails));
         addMessageEvent(new class_241(onGroupDeactivated));
         addMessageEvent(new class_131(onExtendedProfileChanged));
         addMessageEvent(new class_935(onExtendedProfile));
         addMessageEvent(new class_260(onGuildCreationInfo));
         addMessageEvent(new class_846(onRoomInfo));
         addMessageEvent(new class_743(onGuildCreated));
         addMessageEvent(new class_307(var_1899.onGuildMembershipUpdated));
         addMessageEvent(new class_606(onRoomLeave));
         addMessageEvent(new class_800(onUserBadgesMessage));
         addMessageEvent(new class_227(onJoinFailed));
         addMessageEvent(new class_169(var_1899.onGuildMembershipRejected));
         addMessageEvent(new class_122(onGuildEditorData));
         addMessageEvent(new class_221(var_1899.onGuildMembers));
         addMessageEvent(new class_233(onGuildEditInfo));
         addMessageEvent(new class_387(onKickConfirmation));
         addMessageEvent(new class_855(var_1899.onMembershipRequested));
         addMessageEvent(new class_993(onSubscriptionInfo));
         addMessageEvent(new class_149(onGroupDetailsChanged));
         addMessageEvent(new class_420(onRelationshipStatusInfo));
         context.addLinkEventTracker(this);
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         _messageEvents.push(_communication.addHabboConnectionMessageEvent(param1));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_messageEvents != null && _communication != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communication.removeHabboConnectionMessageEvent(_loc1_);
            }
            _messageEvents = null;
         }
         if(var_2038)
         {
            var_2038.dispose();
            var_2038 = null;
         }
         if(var_1899)
         {
            var_1899.dispose();
            var_1899 = null;
         }
         if(var_1918)
         {
            var_1918.dispose();
            var_1918 = null;
         }
         if(var_1811)
         {
            var_1811.dispose();
            var_1811 = null;
         }
         if(var_2608)
         {
            var_2608.dispose();
            var_2608 = null;
         }
         if(var_2780)
         {
            var_2780.dispose();
            var_2780 = null;
         }
         if(var_1819)
         {
            var_1819.dispose();
            var_1819 = null;
         }
         super.dispose();
      }
      
      public function get linkPattern() : String
      {
         return "group/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length != 2)
         {
            return;
         }
         var _loc3_:int = int(_loc2_[1]);
         openGroupInfo(_loc3_);
      }
      
      public function showGroupBadgeInfo(param1:Boolean, param2:int) : void
      {
         openGroupInfo(param2);
         send(new class_898("HabboGroups","" + param2,"badge clicked"));
      }
      
      public function openGroupInfo(param1:int) : void
      {
         send(new class_197(param1,true));
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.connection.send(param1);
      }
      
      public function getXmlWindow(param1:String) : class_3127
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:class_3127 = null;
         try
         {
            _loc4_ = assets.getAssetByName(param1);
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = _windowManager.buildFromXML(XML(_loc2_.content));
         }
         catch(e:Error)
         {
         }
         return _loc3_;
      }
      
      public function getButtonImage(param1:String) : BitmapData
      {
         var _loc3_:* = param1;
         var _loc6_:IAsset = assets.getAssetByName(_loc3_);
         var _loc4_:BitmapDataAsset = BitmapDataAsset(_loc6_);
         var _loc2_:BitmapData = BitmapData(_loc4_.content);
         var _loc5_:BitmapData;
         (_loc5_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
         return _loc5_;
      }
      
      public function openGroupForum(param1:int) : void
      {
         context.createLinkEvent("groupforum/" + param1);
      }
      
      private function onGroupDeactivated(param1:IMessageEvent) : void
      {
         var _loc2_:int = int(class_241(param1).groupId);
         var_2038.onGroupDeactivated(_loc2_);
         var_1819.onGroupDeactivated(_loc2_);
      }
      
      private function onGroupDetails(param1:IMessageEvent) : void
      {
         var _loc2_:class_1126 = class_788(param1).data;
         var_2038.onGroupDetails(_loc2_);
         var_1811.onGroupDetails(_loc2_);
         var_1819.onGroupDetails(_loc2_);
      }
      
      private function onExtendedProfile(param1:IMessageEvent) : void
      {
         var _loc2_:class_1481 = class_935(param1).data;
         if(_loc2_.openProfileWindow)
         {
            var_1811.badgeUpdateExpected = true;
            var_1811.relationshipUpdateExpected = true;
            var_1811.onProfile(_loc2_);
         }
      }
      
      private function onExtendedProfileChanged(param1:IMessageEvent) : void
      {
         var _loc2_:int = int(class_131(param1).userId);
         var_1811.onProfileChanged(_loc2_);
      }
      
      private function onGroupDetailsChanged(param1:IMessageEvent) : void
      {
         var _loc2_:int = int(class_149(param1).groupId);
         if(var_2038.isDisplayingGroup(_loc2_) || var_1819.isDisplayingGroup(_loc2_))
         {
            send(new class_197(_loc2_,false));
         }
      }
      
      private function onJoinFailed(param1:IMessageEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:int = int(class_227(param1).reason);
         if(_loc2_ == 4)
         {
            var_2608.show(false);
         }
         else
         {
            _loc3_ = "group.joinfail." + _loc2_;
            _loc4_ = String(_localization.getLocalization(_loc3_,_loc3_));
            _windowManager.alert("${group.joinfail.title}",_loc4_,0,onAlertClose);
         }
      }
      
      private function onGuildCreationInfo(param1:IMessageEvent) : void
      {
         var _loc2_:class_1124 = class_260(param1).data;
         var_1918.onGuildCreationInfo(_loc2_);
         requestGuildEditorData();
      }
      
      private function onGuildEditInfo(param1:IMessageEvent) : void
      {
         var _loc2_:class_1111 = class_233(param1).data;
         var_1918.onGuildEditInfo(_loc2_);
         requestGuildEditorData();
      }
      
      private function onRoomLeave(param1:IMessageEvent) : void
      {
         var_2038.close();
         var_1819.close();
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         var_2038.close();
         var_1819.close();
         var _loc2_:class_1256 = class_486(param1).getParser();
         var_354 = _loc2_.guestRoomId;
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
      
      private function onGuildEditorData(param1:IMessageEvent) : void
      {
         var_3522 = class_122(param1).data;
         events.dispatchEvent(new HabboGroupsEditorData());
      }
      
      private function onGuildEditFailed(param1:IMessageEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:int = int(class_783(param1).reason);
         if(_loc2_ == 2)
         {
            var_2608.show(true);
         }
         else
         {
            _loc3_ = "group.edit.fail." + _loc2_;
            _loc4_ = String(_localization.getLocalization(_loc3_,_loc3_));
            _windowManager.alert("${group.edit.fail.title}",_loc4_,0,onAlertClose);
         }
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1188 = class_530(param1).getParser();
         var_1094 = _loc2_.id;
      }
      
      private function onFlatCreated(param1:IMessageEvent) : void
      {
         var _loc2_:class_1514 = class_751(param1).getParser();
         var_1918.onFlatCreated(_loc2_.flatId,_loc2_.flatName);
      }
      
      private function onGuildCreated(param1:IMessageEvent) : void
      {
         var _loc2_:class_743 = class_743(param1);
         var_2780.show(_loc2_.groupId);
         var_1918.close();
         var_1819.expectedGroupId = _loc2_.groupId;
         if(var_354 != _loc2_.baseRoomId)
         {
            _navigator.goToPrivateRoom(_loc2_.baseRoomId);
         }
      }
      
      private function onKickConfirmation(param1:IMessageEvent) : void
      {
         var _loc4_:int = int(class_387(param1).userId());
         var _loc6_:int = int(class_387(param1).furniCount());
         var _loc5_:class_1174 = null;
         var _loc2_:class_1138 = var_1899.data;
         var _loc3_:String = var_1908.targetBlocked ? "group.block" : "group.kick";
         if(_loc6_ > 0)
         {
            if(_loc4_ == var_1094)
            {
               localization.registerParameter("group.leaveconfirm.desc","amount",_loc6_.toString());
               _windowManager.confirm("${group.leaveconfirm.title}","${group.leaveconfirm.desc}",0,onKickConfirmationClose);
            }
            else
            {
               _loc5_ = _loc2_.getUser(_loc4_);
               localization.registerParameter(_loc3_ + "confirm.desc","amount",_loc6_.toString());
               localization.registerParameter(_loc3_ + "confirm.desc","user",_loc5_.userName);
               _windowManager.confirm("${" + _loc3_ + "confirm.title}","${" + _loc3_ + "confirm.desc}",0,onKickConfirmationClose);
            }
         }
         else if(_loc4_ == var_1094)
         {
            _windowManager.confirm("${group.leaveconfirm.title}","${group.leaveconfirm_nofurni.desc}",0,onKickConfirmationClose);
         }
         else if(_loc2_)
         {
            _loc5_ = _loc2_.getUser(_loc4_);
            localization.registerParameter(_loc3_ + "confirm_nofurni.desc","user",_loc5_.userName);
            _windowManager.confirm("${" + _loc3_ + "confirm.title}","${" + _loc3_ + "confirm_nofurni.desc}",0,onKickConfirmationClose);
         }
      }
      
      private function onKickConfirmationClose(param1:class_3216, param2:class_3134) : void
      {
         if(param1 == null || Boolean(param1.disposed) || var_1908 == null)
         {
            var_1908 = null;
            return;
         }
         param1.dispose();
         if(param2.type == "WE_OK")
         {
            send(new class_857(var_1908.kickGuildId,var_1908.kickTargetId,var_1908.targetBlocked));
         }
         var_1908 = null;
      }
      
      private function onSubscriptionInfo(param1:IMessageEvent) : void
      {
         var _loc2_:class_1276 = class_993(param1).getParser();
         var_3867 = _loc2_.isVIP && _loc2_.minutesUntilExpiration > 0;
         var_1918.onSubscriptionChange();
      }
      
      private function onRoomInfo(param1:IMessageEvent) : void
      {
         var _loc2_:class_1084 = class_846(param1).getParser();
         if(_loc2_.enterRoom)
         {
            var_1819.onRoomInfo(_loc2_.data);
         }
      }
      
      private function onRelationshipStatusInfo(param1:IMessageEvent) : void
      {
         var _loc2_:class_420 = class_420(param1);
         var_1811.onRelationshipStatusInfo(_loc2_.userId,_loc2_.relationshipStatusMap);
      }
      
      private function onUserBadgesMessage(param1:class_800) : void
      {
         var_1811.onUserBadges(param1.userId,param1.badges);
      }
      
      private function requestGuildEditorData() : void
      {
         if(var_3522 == null)
         {
            send(new class_141());
         }
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get guildManagementWindowCtrl() : com.sulake.habbo.groups.GuildManagementWindowCtrl
      {
         return var_1918;
      }
      
      public function get groupRoomInfoCtrl() : com.sulake.habbo.groups.GroupRoomInfoCtrl
      {
         return var_1819;
      }
      
      public function get groupRoomInfoEnabled() : Boolean
      {
         return getBoolean("groupRoomInfo.enabled");
      }
      
      public function get groupDeletionEnabled() : Boolean
      {
         return getBoolean("group.deletion.enabled");
      }
      
      public function get groupRoomInfoBadgeEnabled() : Boolean
      {
         return groupRoomInfoEnabled && getBoolean("groupRoomInfo.badge.enabled");
      }
      
      public function get toolbarAttachEnabled() : Boolean
      {
         return groupRoomInfoEnabled && getBoolean("groupRoomInfo.attach.enabled");
      }
      
      public function get isActivityDisplayEnabled() : Boolean
      {
         return getBoolean("activity.point.display.enabled");
      }
      
      public function get guildEditorData() : class_1218
      {
         return var_3522;
      }
      
      public function get avatarId() : int
      {
         return var_1094;
      }
      
      public function get navigator() : class_1685
      {
         return _newNavigator.legacyNavigator;
      }
      
      public function get friendlist() : class_1869
      {
         return _friendlist;
      }
      
      public function get guildMembersWindowCtrl() : com.sulake.habbo.groups.GuildMembersWindowCtrl
      {
         return var_1899;
      }
      
      public function get habboTracking() : class_1693
      {
         return _habboTracking;
      }
      
      public function trackGoogle(param1:String, param2:String, param3:int = -1) : void
      {
         if(_habboTracking != null)
         {
            _habboTracking.trackGoogle(param1,param2,param3);
         }
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function updateVisibleExtendedProfile(param1:int) : void
      {
         var_1811.updateVisibleExtendedProfile(param1);
      }
      
      public function showExtendedProfile(param1:int) : void
      {
         send(new class_313(param1));
      }
      
      public function openCatalog(param1:String) : void
      {
         _catalog.openCatalogPage(param1);
      }
      
      public function openVipPurchase(param1:String) : void
      {
         _catalog.openClubCenter();
      }
      
      public function get hasVip() : Boolean
      {
         return var_3867;
      }
      
      public function handleUserKick(param1:int, param2:int) : void
      {
         var_1908 = new com.sulake.habbo.groups.GuildKickData(param1,param2);
         send(new class_912(param2,param1));
      }
      
      public function handleUserBlock(param1:int, param2:int) : void
      {
         var_1908 = new com.sulake.habbo.groups.GuildKickData(param1,param2,true);
         send(new class_912(param2,param1));
      }
      
      public function get newNavigator() : IHabboNewNavigator
      {
         return _newNavigator;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
   }
}
