package com.sulake.habbo.friendlist
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
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendlist.domain.*;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.notifications.class_2082;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboMessenger;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_133.class_1188;
   import package_135.*;
   import package_24.*;
   import package_33.*;
   import package_52.class_645;
   import package_6.class_142;
   import package_6.class_530;
   
   public class HabboFriendList extends class_20 implements class_1869, class_1870, ILinkEventTracker
   {
      
      public static const AVATAR_FACE_NAME:String = "face";
       
      
      private var _windowManager:class_1684;
      
      private var _communication:class_25;
      
      private var _messenger:class_1689;
      
      private var _localization:class_18;
      
      private var _avatarManager:class_1690;
      
      private var _sessionData:ISessionDataManager;
      
      private var _tracking:class_1693;
      
      private var var_3828:com.sulake.habbo.friendlist.class_3131;
      
      private var var_1995:FriendListTabs;
      
      private var var_1430:com.sulake.habbo.friendlist.FriendListView;
      
      private var _openedToWebPopup:com.sulake.habbo.friendlist.OpenedToWebPopup;
      
      private var var_1094:int;
      
      internal var var_1298:FriendCategories;
      
      private var var_1544:FriendRequests;
      
      private var _avatarSearchResults:AvatarSearchResults;
      
      private var _notifications:class_2082;
      
      private var var_2245:Timer;
      
      private var var_3833:int;
      
      private var var_2176:Array;
      
      private var var_1879:Timer;
      
      private var var_3753:Boolean = false;
      
      private var _lastRoomInvitationTime:int = -60000;
      
      public function HabboFriendList(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_1298 = new FriendCategories(new FriendCategoriesDeps(this));
         _avatarSearchResults = new AvatarSearchResults(new AvatarSearchDeps(this));
         var_3828 = new com.sulake.habbo.friendlist.class_3131();
         var_2176 = [];
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         }),new ComponentDependency(new IIDHabboMessenger(),function(param1:class_1689):void
         {
            _messenger = param1;
         },false),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboNotifications(),function(param1:class_2082):void
         {
            _notifications = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionData = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         _communication.addHabboConnectionMessageEvent(new class_530(onUserObject));
         _communication.addHabboConnectionMessageEvent(new class_729(onMessengerInit));
         _communication.addHabboConnectionMessageEvent(new class_374(onFriendsListFragment));
         context.addLinkEventTracker(this);
         send(new class_648());
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         context.removeLinkEventTracker(this);
         if(var_2245)
         {
            var_2245.stop();
            var_2245.removeEventListener("timer",sendFriendListUpdate);
            var_2245 = null;
         }
         if(var_1879)
         {
            if(false)
            {
               var_1879.stop();
            }
            var_1879.removeEventListener("timer",batchFriendsUpdate);
            var_1879 = null;
         }
         super.dispose();
      }
      
      public function send(param1:IMessageComposer) : void
      {
         _communication.connection.send(param1);
      }
      
      public function trackGoogle(param1:String, param2:String, param3:int = -1) : void
      {
         if(_tracking != null)
         {
            _tracking.trackGoogle(param1,param2,param3);
         }
      }
      
      public function openHabboWebPage(param1:String, param2:Dictionary, param3:int, param4:int) : void
      {
         var _loc6_:String = getProperty(param1,param2);
         var _loc5_:String = "habboMain";
         try
         {
            HabboWebTools.navigateToURL(_loc6_,_loc5_);
         }
         catch(e:Error)
         {
            class_14.log("GOT ERROR: " + e);
         }
         if(_openedToWebPopup == null)
         {
            _openedToWebPopup = new com.sulake.habbo.friendlist.OpenedToWebPopup(this);
         }
         _openedToWebPopup.show(param3,param4);
      }
      
      public function getText(param1:String) : String
      {
         return _localization.getLocalization(param1);
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : void
      {
         _localization.registerParameter(param1,param2,param3);
      }
      
      public function showLimitReachedAlert() : void
      {
         registerParameter("friendlist.listfull.text","mylimit","undefined");
         registerParameter("friendlist.listfull.text","clublimit","undefined");
         simpleAlert("${friendlist.listfull.title}","${friendlist.listfull.text}");
      }
      
      public function showFriendRequestSentAlert(param1:String) : void
      {
         registerParameter("friendlist.friendrequestsent.text","user_name",param1);
         simpleAlert("${friendlist.friendrequestsent.title}","${friendlist.friendrequestsent.text}");
      }
      
      public function getFriend(param1:int) : class_3191
      {
         if(var_1430 == null)
         {
            class_14.log("Cannot process getFriend. Friendlist not initialized.");
            return null;
         }
         return var_1298.findFriend(param1);
      }
      
      public function canBeAskedForAFriend(param1:int) : Boolean
      {
         if(var_1430 == null)
         {
            class_14.log("Cannot process canBeAskedForAFriend. Friendlist not initialized.");
            return false;
         }
         return this.getFriend(param1) == null && !searchResults.isFriendRequestSent(param1) && categories.getFriendCount(false) < friendRequests.limit;
      }
      
      public function askForAFriend(param1:int, param2:String) : Boolean
      {
         if(var_1430 == null)
         {
            class_14.log("Cannot ask for friend. Friendlist not initialized.");
            return false;
         }
         if(searchResults.isFriendRequestSent(param1))
         {
            return true;
         }
         if(!canBeAskedForAFriend(param1))
         {
            return false;
         }
         send(new class_893(param2));
         searchResults.setFriendRequestSent(param1);
         send(new class_645());
         return true;
      }
      
      public function openFriendList() : void
      {
         openFriendListWithTab(1);
      }
      
      public function openFriendRequests() : void
      {
         openFriendListWithTab(2);
      }
      
      public function openFriendSearch() : void
      {
         openFriendListWithTab(3);
         SearchView(var_1995.findTab(3).tabView).focus();
      }
      
      public function close() : void
      {
         if(var_1430)
         {
            var_1430.close();
         }
      }
      
      public function alignBottomLeftTo(param1:Point) : void
      {
         if(var_1430)
         {
            var_1430.alignBottomLeftTo(param1);
         }
      }
      
      public function isOpen() : Boolean
      {
         if(var_1430)
         {
            return var_1430.isOpen();
         }
         return false;
      }
      
      public function currentTabId() : int
      {
         if(var_1430 == null || !var_1430.isOpen())
         {
            return 0;
         }
         return var_3833;
      }
      
      private function openFriendListWithTab(param1:int) : void
      {
         if(var_1430 == null)
         {
            class_14.log("Cannot open friendlist. Friendlist not initialized.");
            return;
         }
         var_1430.openFriendList();
         var _loc2_:FriendListTab = tabs.findTab(param1);
         if(_loc2_ != tabs.findSelectedTab())
         {
            tabs.toggleSelected(_loc2_);
            view.refresh("openFriendList");
         }
         var_1430.mainWindow.activate();
         var_3833 = param1;
      }
      
      public function getFriendCount(param1:Boolean, param2:Boolean) : int
      {
         if(var_1430 == null)
         {
            class_14.log("Cannot get friend count. Friendlist not initialized.");
            return 0;
         }
         return this.var_1298.getFriendCount(param1,param2);
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : class_3282
      {
         var _loc8_:BitmapData = getButtonImage(param2);
         var _loc7_:class_3282;
         (_loc7_ = _windowManager.createWindow(param1,"",21,0,17,new Rectangle(param4,param5,_loc8_.width,_loc8_.height),param3,param6) as class_3282).bitmap = _loc8_;
         return _loc7_;
      }
      
      public function getXmlWindow(param1:String) : class_3127
      {
         var _loc3_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc2_:XmlAsset = XmlAsset(_loc3_);
         return _windowManager.buildFromXML(XML(_loc2_.content));
      }
      
      public function isMessagesPersisted() : Boolean
      {
         return getBoolean("friend_list.persistent_message_status.enabled");
      }
      
      public function getSmallGroupBadgeBitmap(param1:String) : BitmapData
      {
         if(_sessionData)
         {
            return _sessionData.getGroupBadgeSmallImage(param1);
         }
         return null;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc3_:Boolean = getBoolean("zoom.enabled");
         var _loc4_:class_3156;
         if(!(_loc4_ = _avatarManager.createAvatarImage(param1,_loc3_ ? "h" : "sh",null,this)))
         {
            return null;
         }
         var _loc2_:BitmapData = _loc4_.getCroppedImage("head",_loc3_ ? 0.5 : 1);
         _loc4_.dispose();
         return _loc2_;
      }
      
      public function isEmbeddedMinimailEnabled() : Boolean
      {
         var _loc1_:String = getProperty("client.minimail.embed.enabled");
         return _loc1_ == "true";
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1188 = (param1 as class_530).getParser();
         var_1094 = _loc2_.id;
      }
      
      private function onFriendsListFragment(param1:IMessageEvent) : void
      {
         var _loc2_:class_1423 = (param1 as class_374).getParser();
         for each(var _loc3_ in _loc2_.friendFragment)
         {
            var_2176.push(_loc3_);
         }
         if(_loc2_.fragmentNo + 1 >= _loc2_.totalFragments)
         {
            var_1879 = new Timer(5000,Math.ceil(0));
            var_1879.addEventListener("timer",batchFriendsUpdate);
            var_1879.start();
         }
      }
      
      private function batchFriendsUpdate(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         var _loc4_:class_1599 = null;
         var _loc3_:int = 0;
         if(false)
         {
            _loc3_ = -300;
         }
         _loc2_ = -1;
         while(_loc2_ >= _loc3_)
         {
            _loc4_ = var_2176[_loc2_];
            var_1298.addFriend(new Friend(_loc4_));
            var_2176.splice(_loc2_,1);
            _loc2_--;
         }
         if(false)
         {
            var_3753 = true;
         }
      }
      
      private function onMessengerInit(param1:IMessageEvent) : void
      {
         var _loc4_:FriendCategory = null;
         var_1430 = new com.sulake.habbo.friendlist.FriendListView(this);
         var _loc2_:class_1498 = (param1 as class_729).getParser();
         var_1544 = new FriendRequests(new FriendRequestsDeps(this),_loc2_.userFriendLimit,_loc2_.extendedFriendLimit);
         for each(var _loc3_ in _loc2_.categories)
         {
            var_1298.addCategory(new FriendCategory(_loc3_.id,_loc3_.name));
         }
         var_1298.addCategory(new FriendCategory(0,getText("friendlist.friends")));
         var_1298.addCategory(new FriendCategory(-1,getText("friendlist.friends.offlinecaption")));
         var_1995 = new FriendListTabs(new FriendListTabsDeps(this));
         if(!var_2245)
         {
            var_2245 = new Timer(120000);
            var_2245.addEventListener("timer",sendFriendListUpdate);
            var_2245.start();
         }
         getFriendRequests();
         registerListeners();
         if(var_1298.getFriendCount(true,false) == 0)
         {
            if(_loc4_ = var_1298.findCategory(-1))
            {
               _loc4_.setOpen(true);
            }
         }
         class_14.log("FRIENDLIST INITIALIZED SUCCESSFULLY");
      }
      
      public function trackFriendListEvent(param1:String) : void
      {
         events.dispatchEvent(new Event(param1));
      }
      
      private function getSortedFriends(param1:Array) : Array
      {
         var _loc3_:* = [];
         var _loc6_:Dictionary = new Dictionary();
         for each(var _loc5_ in param1)
         {
            _loc3_.push(_loc5_.name.toLowerCase());
            _loc6_[_loc5_.name.toLowerCase()] = _loc5_;
         }
         _loc3_.sort();
         var _loc2_:* = [];
         for each(var _loc4_ in _loc3_)
         {
            _loc2_.push(_loc6_[_loc4_]);
         }
         return _loc2_;
      }
      
      private function registerListeners() : void
      {
         _communication.addHabboConnectionMessageEvent(new class_539(onMessengerError));
         _communication.addHabboConnectionMessageEvent(new class_231(onHabboSearchResult));
         _communication.addHabboConnectionMessageEvent(new class_230(onNewFriendRequest));
         _communication.addHabboConnectionMessageEvent(new class_142(onUserRights));
         _communication.addHabboConnectionMessageEvent(new class_1010(onRoomInviteError));
         _communication.addHabboConnectionMessageEvent(new class_208(onAcceptFriendResult));
         _communication.addHabboConnectionMessageEvent(new class_829(onFriendRequests));
         _communication.addHabboConnectionMessageEvent(new class_406(onFriendListUpdate));
         _communication.addHabboConnectionMessageEvent(new class_157(onFollowFriendFailed));
      }
      
      private function getFriendRequests() : void
      {
         class_14.log("Sending friend requests request");
         send(new class_344());
      }
      
      protected function sendFriendListUpdate(param1:Event) : void
      {
         class_14.log("Sending update request");
         send(new class_301());
      }
      
      private function onFriendRequests(param1:IMessageEvent) : void
      {
         var _loc2_:class_1067 = (param1 as class_829).getParser();
         var_1544.clearAndUpdateView(false);
         for each(var _loc3_ in _loc2_.reqs)
         {
            var_1544.addRequest(new FriendRequest(_loc3_));
         }
         if(_loc2_.reqs.length > 0)
         {
            var_1995.findTab(2).setNewMessageArrived(true);
         }
         var_1430.refresh("friendRequests");
      }
      
      private function onNewFriendRequest(param1:IMessageEvent) : void
      {
         class_14.log("Received new friend request");
         var _loc2_:class_1234 = (param1 as class_230).getParser();
         var _loc4_:FriendRequest = new FriendRequest(_loc2_.req);
         var_1544.addRequestAndUpdateView(_loc4_);
         var _loc3_:FriendListTab = var_1995.findTab(2);
         _loc3_.setNewMessageArrived(true);
         var_1430.refresh("newFriendRequest");
      }
      
      private function onAcceptFriendResult(param1:IMessageEvent) : void
      {
         var _loc2_:class_1262 = (param1 as class_208).getParser();
         for each(var _loc3_ in _loc2_.failures)
         {
            friendRequests.acceptFailed(_loc3_.senderId);
            showAlertView(_loc3_.errorCode);
         }
      }
      
      private function onHabboSearchResult(param1:IMessageEvent) : void
      {
         var _loc2_:class_1208 = (param1 as class_231).getParser();
         _avatarSearchResults.searchReceived(_loc2_.friends,_loc2_.others);
         var_1430.refresh("search");
      }
      
      private function onMessengerError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1169 = (param1 as class_539).getParser();
         showAlertView(_loc2_.errorCode,_loc2_.clientMessageId);
      }
      
      private function showAlertView(param1:int, param2:int = 0) : void
      {
         var _loc3_:String = "";
         switch(param1 - 1)
         {
            case 0:
               _loc3_ = "${friendlist.error.friendlistownlimit}";
               break;
            case 1:
               _loc3_ = "${friendlist.error.friendlistlimitofrequester}";
               break;
            case 2:
               _loc3_ = "${friendlist.error.friend_requests_disabled}";
               break;
            case 3:
               _loc3_ = "${friendlist.error.requestnotfound}";
               break;
            default:
               _loc3_ = "Received messenger error: msg: " + param2 + ", errorCode: " + param1;
         }
         simpleAlert("${friendlist.alert.title}",_loc3_);
      }
      
      private function onRoomInviteError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1352 = (param1 as class_1010).getParser();
         var _loc3_:String = "Received room invite error: errorCode: " + _loc2_.errorCode + ", recipients: " + Util.arrayToString(_loc2_.failedRecipients);
         simpleAlert("${friendlist.alert.title}",_loc3_);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var_1298.onFriendListUpdate(param1);
         var_1430.refresh("friendListUpdate");
      }
      
      private function onFollowFriendFailed(param1:IMessageEvent) : void
      {
         var _loc2_:class_1130 = (param1 as class_157).getParser();
         var _loc3_:String = getFollowFriendErrorText(_loc2_.errorCode);
         class_14.log("Received follow friend failed: " + _loc2_.errorCode + ", " + _loc3_);
         simpleAlert("${friendlist.alert.title}",_loc3_);
      }
      
      public function simpleAlert(param1:String, param2:String) : void
      {
         windowManager.simpleAlert(param1,null,param2);
      }
      
      private function getFollowFriendErrorText(param1:int) : String
      {
         if(param1 == 0)
         {
            return "${friendlist.followerror.notfriend}";
         }
         if(param1 == 1)
         {
            return "${friendlist.followerror.offline}";
         }
         if(param1 == 2)
         {
            return "${friendlist.followerror.hotelview}";
         }
         if(param1 == 3)
         {
            return "${friendlist.followerror.prevented}";
         }
         return "Unknown follow friend error " + param1;
      }
      
      public function refreshText(param1:class_3151, param2:String, param3:Boolean, param4:String) : void
      {
         var _loc5_:class_3127 = param1.getChildByName(param2);
         if(!param3)
         {
            _loc5_.visible = false;
         }
         else
         {
            _loc5_.visible = true;
            _loc5_.caption = param4;
         }
      }
      
      public function refreshButton(param1:class_3151, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:class_3127 = param1.findChildByName(param2) as class_3127;
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            prepareButton(_loc6_,param2,param4,param5);
            _loc6_.visible = true;
         }
      }
      
      public function refreshRelationshipRegion(param1:class_3151, param2:String, param3:int, param4:Function, param5:int) : void
      {
         var _loc6_:IRegionWindow = IRegionWindow(param1.findChildByName(param2));
         var _loc7_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_loc6_.findChildByTag("bitmap"));
         var _loc8_:String = "relationship_status_none";
         switch(param3 - 1)
         {
            case 0:
               _loc8_ = "relationship_status_heart";
               break;
            case 1:
               _loc8_ = "relationship_status_smile";
               break;
            case 2:
               _loc8_ = "relationship_status_bobba";
         }
         _loc7_.assetUri = _loc8_;
         _loc7_.visible = true;
         _loc6_.id = param5;
         _loc6_.procedure = param4;
         _loc6_.visible = param5 > 0 && getBoolean("relationship.status.enabled");
      }
      
      public function refreshIcon(param1:class_3151, param2:String, param3:Boolean, param4:Function, param5:int) : void
      {
         var _loc6_:class_3127 = param1.findChildByName(param2);
         if(!param3)
         {
            _loc6_.visible = false;
         }
         else
         {
            _loc6_.id = param5;
            _loc6_.procedure = param4;
            _loc6_.visible = true;
         }
      }
      
      private function prepareButton(param1:class_3127, param2:String, param3:Function, param4:int) : void
      {
         var _loc5_:class_3282 = null;
         param1.id = param4;
         if(param1 is class_3282)
         {
            _loc5_ = param1 as class_3282;
         }
         else
         {
            _loc5_ = class_3151(param1).findChildByTag("bitmap") as class_3282;
         }
         if(_loc5_.bitmap != null)
         {
            return;
         }
         _loc5_.bitmap = getButtonImage(param2);
         _loc5_.width = _loc5_.bitmap.width;
         _loc5_.height = _loc5_.bitmap.height;
         param1.procedure = param3;
      }
      
      public function getButtonImage(param1:String) : BitmapData
      {
         var _loc4_:BitmapData = null;
         var _loc5_:IAsset;
         var _loc3_:BitmapDataAsset = (_loc5_ = assets.getAssetByName(param1 + "_png")) as BitmapDataAsset;
         class_14.log("GETTING ASSET: " + param1);
         var _loc2_:BitmapData = _loc3_.content as BitmapData;
         class_14.log("GOT ASSET: " + _loc5_ + ", " + _loc2_);
         (_loc4_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
         return _loc4_;
      }
      
      public function get lastRoomInvitationTime() : *
      {
         return _lastRoomInvitationTime;
      }
      
      public function resetLastRoomInvitationTime() : void
      {
         _lastRoomInvitationTime = getTimer();
      }
      
      public function get hasfriendsListInitialized() : Boolean
      {
         return var_3753;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get categories() : FriendCategories
      {
         return var_1298;
      }
      
      public function get friendRequests() : FriendRequests
      {
         return var_1544;
      }
      
      public function get searchResults() : AvatarSearchResults
      {
         return _avatarSearchResults;
      }
      
      public function get view() : com.sulake.habbo.friendlist.FriendListView
      {
         return var_1430;
      }
      
      public function get tabs() : FriendListTabs
      {
         return var_1995;
      }
      
      public function get laf() : com.sulake.habbo.friendlist.class_3131
      {
         return var_3828;
      }
      
      public function get messenger() : class_1689
      {
         return _messenger;
      }
      
      public function get avatarId() : int
      {
         return var_1094;
      }
      
      public function get notifications() : class_2082
      {
         return _notifications;
      }
      
      public function get tracking() : class_1693
      {
         return _tracking;
      }
      
      public function get mainWindow() : class_3151
      {
         if(var_1430 == null)
         {
            return null;
         }
         return var_1430.mainWindow;
      }
      
      public function getFriendNames() : Array
      {
         if(var_1298 == null)
         {
            return [];
         }
         return var_1298.getFriendNames();
      }
      
      public function acceptFriendRequest(param1:int) : void
      {
         if(!var_1995)
         {
            return;
         }
         var _loc3_:FriendListTab = var_1995.findTab(2);
         if(!_loc3_)
         {
            return;
         }
         var _loc2_:class_3130 = _loc3_.tabView as class_3130;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.acceptRequest(param1);
      }
      
      public function acceptAllFriendRequests() : void
      {
         var _loc2_:FriendListTab = var_1995.findTab(2);
         if(!_loc2_)
         {
            return;
         }
         var _loc1_:class_3130 = _loc2_.tabView as class_3130;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.acceptAllRequests();
      }
      
      public function declineFriendRequest(param1:int) : void
      {
         var _loc3_:FriendListTab = var_1995.findTab(2);
         if(!_loc3_)
         {
            return;
         }
         var _loc2_:class_3130 = _loc3_.tabView as class_3130;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.declineRequest(param1);
      }
      
      public function declineAllFriendRequests() : void
      {
         var _loc2_:FriendListTab = var_1995.findTab(2);
         if(!_loc2_)
         {
            return;
         }
         var _loc1_:class_3130 = _loc2_.tabView as class_3130;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.declineAllRequests();
      }
      
      public function setRelationshipStatus(param1:int, param2:int) : void
      {
         send(new class_1006(param1,param2));
      }
      
      public function getRelationshipStatus(param1:int) : int
      {
         var _loc2_:Friend = var_1298.findFriend(param1);
         if(_loc2_)
         {
            return _loc2_.relationshipStatus;
         }
         return 0;
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         if(!_sessionData || !var_1544)
         {
            return;
         }
         var _loc2_:int = 0;
         if(false)
         {
            _loc2_ = 0;
         }
         else if(false)
         {
            _loc2_ = 0;
         }
         if(_loc2_ > var_1544.limit)
         {
            var_1544.limit = _loc2_;
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc6_:class_3151 = null;
         var _loc5_:class_3282 = null;
         var _loc3_:BitmapData = null;
         if(disposed || var_1298 == null)
         {
            return;
         }
         var _loc2_:Dictionary = var_1298.getAllFriends();
         if(_loc2_ == null)
         {
            return;
         }
         for each(var _loc4_ in _loc2_)
         {
            if(_loc4_ != null && !_loc4_.disposed && _loc4_.figure == param1)
            {
               if(_loc4_.isGroupFriend())
               {
                  _loc4_.face = getSmallGroupBadgeBitmap(_loc4_.figure);
               }
               else
               {
                  _loc4_.face = getAvatarFaceBitmap(_loc4_.figure);
               }
               if(_loc4_.face != null)
               {
                  if((_loc6_ = _loc4_.view) != null)
                  {
                     if((_loc5_ = _loc6_.getChildByName("face") as class_3282) != null && !_loc5_.disposed)
                     {
                        _loc3_ = _loc5_.bitmap;
                        if(_loc3_ != null)
                        {
                           _loc3_.fillRect(_loc3_.rect,0);
                           _loc3_.copyPixels(_loc4_.face,_loc4_.face.rect,new Point(0,0),null,null,true);
                        }
                        _loc5_.invalidate();
                     }
                  }
               }
            }
         }
      }
      
      public function get linkPattern() : String
      {
         return "friendlist/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         switch(_loc2_[1])
         {
            case "open":
               openFriendList();
               break;
            case "openchat":
               if(_loc2_.length < 3 || _messenger == null)
               {
                  return;
               }
               _loc3_ = _loc2_[2].split(":");
               if(_loc3_.length < 2)
               {
                  return;
               }
               if(int(_loc3_[0]) == var_1094)
               {
                  _loc4_ = int(_loc3_[1]);
               }
               else
               {
                  _loc4_ = int(_loc3_[0]);
               }
               if(_loc4_ && _loc4_ > 0)
               {
                  openFriendList();
                  _messenger.startConversation(_loc4_);
               }
               break;
            default:
               class_14.log("FriendList unknown link-type received: " + _loc2_[1]);
         }
      }
   }
}
