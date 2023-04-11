package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.class_17;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.class_803;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.motion.Motion;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.campaign.HabboCampaigns;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.freeflowchat.class_1692;
   import com.sulake.habbo.friendbar.groupforums.UnseenForumsCountUpdatedEvent;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
   import com.sulake.habbo.navigator.IHabboNewNavigator;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.nux.HabboNuxDialogs;
   import com.sulake.habbo.phonenumber.HabboPhoneNumber;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.PerksUpdatedEvent;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.extensions.CitizenshipVipDiscountPromoExtension;
   import com.sulake.habbo.toolbar.extensions.CitizenshipVipQuestsPromoExtension;
   import com.sulake.habbo.toolbar.extensions.ClubDiscountPromoExtension;
   import com.sulake.habbo.toolbar.extensions.PurseAreaExtension;
   import com.sulake.habbo.toolbar.extensions.SettingsExtension;
   import com.sulake.habbo.toolbar.extensions.VideoOfferExtension;
   import com.sulake.habbo.toolbar.extensions.purse.indicators.SeasonalCurrencyIndicator;
   import com.sulake.habbo.toolbar.offers.OfferExtension;
   import com.sulake.habbo.ui.IRoomUI;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboCampaigns;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFreeFlowChat;
   import com.sulake.iid.IIDHabboGroupForumController;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboMessenger;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboNewNavigator;
   import com.sulake.iid.IIDHabboNuxDialogs;
   import com.sulake.iid.IIDHabboPhoneNumber;
   import com.sulake.iid.IIDHabboQuestEngine;
   import com.sulake.iid.IIDHabboRoomUI;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import com.sulake.room.utils.RoomEnterEffect;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import package_49.class_898;
   import package_6.class_142;
   
   public class HabboToolbar extends class_20 implements IHabboToolbar
   {
       
      
      private var _windowManager:class_1684;
      
      private var _communicationManager:class_25;
      
      private var var_1430:com.sulake.habbo.toolbar.BottomBarLeft;
      
      private var var_4302:com.sulake.habbo.toolbar.BottomBackgroundBorder;
      
      private var var_1420:Boolean;
      
      private var _purseExtension:PurseAreaExtension;
      
      private var _settingsExtension:SettingsExtension;
      
      private var _connection:IConnection;
      
      private var _catalog:IHabboCatalog;
      
      private var _messenger:class_1689;
      
      private var _navigator:class_1685;
      
      private var _newNavigator:IHabboNewNavigator;
      
      private var _seasonalCurrencyExtension:SeasonalCurrencyIndicator;
      
      private var _clubDiscountPromoExtension:ClubDiscountPromoExtension;
      
      private var var_3078:CitizenshipVipQuestsPromoExtension;
      
      private var var_2610:CitizenshipVipDiscountPromoExtension;
      
      private var _videoOfferExtension:VideoOfferExtension;
      
      private var _localization:class_17;
      
      private var _inventory:class_1697;
      
      private var var_1693:com.sulake.habbo.toolbar.ExtensionView;
      
      private var _soundManager:class_2089;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _habboHelp:IHabboHelp;
      
      private var _avatarRenderManager:class_1690;
      
      private var _questEngine:class_2047;
      
      private var _freeFlowChat:class_1692;
      
      private var _roomUI:IRoomUI;
      
      private var _offerExtension:OfferExtension;
      
      private var var_1876:Timer;
      
      private var var_2222:Timer;
      
      private var var_2221:Timer;
      
      public function HabboToolbar(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         param1.attachComponent(new HabboPhoneNumber(param1,0,param3),[new IIDHabboPhoneNumber()]);
         param1.attachComponent(new HabboNuxDialogs(param1,0,param3),[new IIDHabboNuxDialogs()]);
         param1.attachComponent(new HabboCampaigns(param1,0,param3),[new IIDHabboCampaigns()]);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(),null,true,[{
            "type":"complete",
            "callback":onConfigurationComplete
         }]),new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         },true),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         },true,[{
            "type":"CATALOG_INITIALIZED",
            "callback":onCatalogEvent
         },{
            "type":"CATALOG_NOT_READY",
            "callback":onCatalogEvent
         },{
            "type":"CATALOG_NEW_ITEMS_SHOW",
            "callback":onCatalogEvent
         },{
            "type":"CATALOG_NEW_ITEMS_HIDE",
            "callback":onCatalogEvent
         }]),new ComponentDependency(new IIDCoreLocalizationManager(),function(param1:class_17):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboInventory(),function(param1:class_1697):void
         {
            _inventory = param1;
         },false,[{
            "type":"HUIUE_UNSEEN_ITEMS_CHANGED",
            "callback":onUnseenItemsUpdate
         },{
            "type":"HIHCE_HABBO_CLUB_CHANGED",
            "callback":onClubChanged
         }]),new ComponentDependency(new IIDHabboSoundManager(),function(param1:class_2089):void
         {
            _soundManager = param1;
         }),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         },true,[{
            "type":"PUE_perks_updated",
            "callback":onPerksUpdated
         }]),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _habboHelp = param1;
         },false),new ComponentDependency(new IIDHabboFreeFlowChat(),function(param1:class_1692):void
         {
            _freeFlowChat = param1;
         },false),new ComponentDependency(new IIDHabboRoomUI(),function(param1:IRoomUI):void
         {
            _roomUI = param1;
         },false),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarRenderManager = param1;
         },false),new ComponentDependency(new IIDHabboQuestEngine(),function(param1:class_2047):void
         {
            _questEngine = param1;
         },false,[{
            "type":"qe_uacue",
            "callback":onUnseenAchievementsCountUpdate
         }]),new ComponentDependency(new IIDHabboMessenger(),function(param1:class_1689):void
         {
            _messenger = param1;
         },false,[{
            "type":"MMME_new",
            "callback":onMiniMailUpdate
         },{
            "type":"MMME_unread",
            "callback":onMiniMailUpdate
         },{
            "type":"HUIUE_UNSEEN_ITEMS_CHANGED",
            "callback":onUnseenItemsUpdate
         }]),new ComponentDependency(new IIDHabboGroupForumController(),null,false,[{
            "type":"UNSEEN_FORUMS_COUNT",
            "callback":onUnseenForumsCountUpdate
         }]),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            _navigator = param1;
         },false),new ComponentDependency(new IIDHabboNewNavigator(),function(param1:IHabboNewNavigator):void
         {
            _newNavigator = param1;
         },false)]);
      }
      
      override public function dispose() : void
      {
         var_1420 = false;
         _connection = null;
         destroyClientPromoTimer();
         destroyDimmerTimer();
         destroyOwnRoomPromoTimer();
         if(var_1693)
         {
            var_1693.dispose();
            var_1693 = null;
         }
         if(_purseExtension)
         {
            _purseExtension.dispose();
            _purseExtension = null;
         }
         if(_settingsExtension)
         {
            _settingsExtension.dispose();
            _settingsExtension = null;
         }
         if(_offerExtension != null)
         {
            _offerExtension.dispose();
            _offerExtension = null;
         }
         if(_clubDiscountPromoExtension)
         {
            _clubDiscountPromoExtension.dispose();
            _clubDiscountPromoExtension = null;
         }
         if(var_3078)
         {
            var_3078.dispose();
            var_3078 = null;
         }
         if(var_2610)
         {
            var_2610.dispose();
            var_2610 = null;
         }
         if(_videoOfferExtension)
         {
            _videoOfferExtension.dispose();
            _videoOfferExtension = null;
         }
         if(_messenger != null)
         {
            if(false)
            {
               _messenger.events.removeEventListener("MMME_new",onMiniMailUpdate);
               _messenger.events.removeEventListener("MMME_unread",onMiniMailUpdate);
            }
            _messenger = null;
         }
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         super.dispose();
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
      }
      
      override protected function initComponent() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _connection = _communicationManager.connection;
         _communicationManager.addHabboConnectionMessageEvent(new class_142(onUserRights));
         var_4302 = new com.sulake.habbo.toolbar.BottomBackgroundBorder(this);
         var_1430 = new com.sulake.habbo.toolbar.BottomBarLeft(this,_windowManager,assets,events);
         var_1430.window.visible = false;
         initRoomEnterEffect();
         var_1693 = new com.sulake.habbo.toolbar.ExtensionView(_windowManager,assets,this);
         if(var_1430 == null)
         {
            class_14.log("Error, toolbar view was not available");
            return;
         }
         var _loc3_:String = getProperty("new.user.wing");
         if(_loc3_ != "")
         {
            _loc1_ = getInteger("new.user.promo.delay",10) * 1000;
            if(_loc1_ > 0 && var_2222 == null)
            {
               var_2222 = new Timer(_loc1_,1);
               var_2222.addEventListener("timerComplete",onShowClientPromo);
               var_2222.start();
            }
            if(_loc3_ == "social" || _loc3_ == "quest" || _loc3_ == "group" || _loc3_ == "game")
            {
               _loc2_ = getInteger("new.user.promo.room.delay",180) * 1000;
               if(_loc2_ > 0 && var_2221 == null)
               {
                  var_2221 = new Timer(_loc2_,1);
                  var_2221.addEventListener("timerComplete",onShowOwnRoomPromo);
                  var_2221.start();
               }
            }
         }
      }
      
      private function onPerksUpdated(param1:PerksUpdatedEvent) : void
      {
         if(var_1693 && !var_1420)
         {
            initPurseAreaExtension();
            initSeasonalCurrencyExtension();
            initVipExtendExtension();
            initCitizenshipVipExtendExtension();
            initCitizenshipVipQuestsExtension();
            initVideoOfferExtension();
            initOfferExtension();
            initSettingsExtension();
            var_1420 = true;
         }
      }
      
      private function onCatalogEvent(param1:CatalogEvent) : void
      {
         if(var_1430)
         {
            var_1430.onCatalogEvent(param1);
         }
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         if(!_videoOfferExtension)
         {
            initVideoOfferExtension();
         }
      }
      
      private function onShowClientPromo(param1:TimerEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:String = null;
         destroyClientPromoTimer();
         var _loc5_:String = getProperty("new.user.wing");
         var _loc4_:int = 0;
         var _loc6_:String = null;
         switch(_loc5_)
         {
            case "social":
               _loc3_ = "new.user.promo.social";
               _loc2_ = "HTIE_ICON_NAVIGATOR";
               _loc6_ = "NAVIGATOR";
               break;
            case "group":
               _loc3_ = "new.user.promo.group";
               _loc2_ = "HTIE_EXT_GROUP";
               _loc4_ = 1;
               break;
            case "quest":
               _loc3_ = "new.user.promo.quest";
               _loc2_ = "HTIE_ICON_QUESTS";
               _loc6_ = "QUESTS";
               break;
            case "game":
               _loc3_ = "new.user.promo.game";
               _loc2_ = "HTIE_ICON_GAMES";
               _loc6_ = "GAMES";
               break;
            default:
               return;
         }
         if(getIconLocation(_loc2_) != null)
         {
            _habboHelp.showWelcomeScreen(_loc2_,_loc3_,_loc4_,_loc6_);
         }
      }
      
      private function onShowOwnRoomPromo(param1:TimerEvent) : void
      {
         destroyOwnRoomPromoTimer();
         _habboHelp.showWelcomeScreen("HTIE_ICON_NAVIGATOR","new.user.promo.room",0,"NAVIGATOR_ME_TAB");
      }
      
      private function initRoomEnterEffect() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!isNewIdentity())
         {
            return;
         }
         if(getBoolean("room.enter.effect.enabled"))
         {
            _loc1_ = getInteger("room.enter.effect.delay",4000);
            _loc2_ = getInteger("room.enter.effect.duration",2000);
            RoomEnterEffect.init(_loc1_,_loc2_);
            createAndAttachDimmerWindow(class_3151(var_1430.window));
            if(var_1876 == null)
            {
               var_1876 = new Timer(_loc1_ + _loc2_,1);
               var_1876.addEventListener("timerComplete",onRemoveDimmer);
               var_1876.start();
            }
         }
      }
      
      private function initPurseAreaExtension() : void
      {
         _purseExtension = new PurseAreaExtension(this,_catalog);
         _purseExtension.getClubArea().onClubChanged();
      }
      
      private function initSettingsExtension() : void
      {
         _settingsExtension = new SettingsExtension(this);
      }
      
      private function initSeasonalCurrencyExtension() : void
      {
         var _loc1_:PurseEvent = null;
         if(getBoolean("seasonalcurrencyindicator.enabled"))
         {
            _seasonalCurrencyExtension = new SeasonalCurrencyIndicator(this,_windowManager,assets,_catalog,_localization);
            _loc1_ = new PurseEvent("catalog_purse_activity_point_balance",_catalog.getPurse().getActivityPointsForType(101),101);
            _seasonalCurrencyExtension.onBalance(_loc1_);
         }
      }
      
      private function initVipExtendExtension() : void
      {
         if(getBoolean("club.membership.extend.vip.promotion.enabled"))
         {
            _clubDiscountPromoExtension = new ClubDiscountPromoExtension(this);
         }
      }
      
      private function initCitizenshipVipQuestsExtension() : void
      {
         if(getBoolean("citizenship.vip.quest.promotion.enabled"))
         {
            var_3078 = new CitizenshipVipQuestsPromoExtension(this,_windowManager,assets,events,_localization,_connection);
         }
      }
      
      private function initCitizenshipVipExtendExtension() : void
      {
         if(getBoolean("club.membership.extend.vip.promotion.enabled"))
         {
            var_2610 = new CitizenshipVipDiscountPromoExtension(this);
         }
      }
      
      private function initVideoOfferExtension() : void
      {
         var _loc1_:Boolean = !isNewIdentity() || !getBoolean("new.identity.hide.ui");
         if(_catalog.videoOffers.enabled && getBoolean("toolbar.extension.video.promo.enabled") && _loc1_)
         {
            _videoOfferExtension = new VideoOfferExtension(this);
         }
      }
      
      private function initOfferExtension() : void
      {
         var _loc1_:Boolean = !isNewIdentity() || !getBoolean("new.identity.hide.ui");
         if(getBoolean("offers.enabled") && _loc1_ && !getBoolean("offers.habboclub.enabled"))
         {
            _offerExtension = new OfferExtension(this,_windowManager,assets,_catalog);
         }
      }
      
      public function toggleSettingVisibility() : void
      {
         if(_settingsExtension && false)
         {
            _settingsExtension.window.visible = !_settingsExtension.window.visible;
         }
         extensionView.refreshItemWindow();
      }
      
      private function onRemoveDimmer(param1:TimerEvent) : void
      {
         destroyDimmerTimer();
         if(var_1430)
         {
            removeDimmer(var_1430.window as class_3151);
         }
         if(var_1693)
         {
            var_1693.removeDimmers();
         }
      }
      
      public function createAndAttachDimmerWindow(param1:class_3151) : void
      {
         var _loc2_:class_3127 = null;
         if(RoomEnterEffect.isRunning())
         {
            if(param1 == null)
            {
               return;
            }
            _loc2_ = _windowManager.createWindow("toolbar_dimmer","",30,1,2177,new Rectangle(0,0,param1.width,param1.height),null,0);
            _loc2_.color = 0;
            _loc2_.blend = 0.3;
            param1.addChild(_loc2_);
            param1.invalidate();
         }
      }
      
      public function removeDimmer(param1:class_3151) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:class_3127 = param1.findChildByName("toolbar_dimmer");
         if(_loc2_ != null)
         {
            param1.removeChild(_loc2_);
            param1.invalidate();
            _windowManager.destroy(_loc2_);
         }
      }
      
      public function toggleWindowVisibility(param1:String) : void
      {
         var _loc4_:HabboToolbarEvent = null;
         var _loc5_:HabboToolbarEvent = null;
         var _loc2_:String = "null";
         if(_loc2_ == "HTIE_ICON_CAMERA")
         {
            (_loc4_ = new HabboToolbarEvent("HTE_ICON_CAMERA")).iconName = "toolBarCameraIcon";
            events.dispatchEvent(_loc4_);
         }
         else
         {
            (_loc5_ = new HabboToolbarEvent("HTE_TOOLBAR_CLICK")).iconId = _loc2_;
            _loc5_.iconName = param1;
            events.dispatchEvent(_loc5_);
         }
         var _loc3_:class_898 = new class_898("Toolbar",param1,"client.toolbar.clicked");
         if(_connection)
         {
            _connection.send(_loc3_);
         }
      }
      
      public function getIconLocation(param1:String) : Rectangle
      {
         var _loc2_:Rectangle = null;
         if(param1 == "HTIE_EXT_GROUP")
         {
            _loc2_ = var_1693.getIconLocation(param1);
         }
         else if(var_1430)
         {
            _loc2_ = var_1430.getIconLocation(param1);
         }
         if(!_loc2_ && _purseExtension)
         {
            _loc2_ = _purseExtension.getIconLocation(param1);
         }
         return _loc2_;
      }
      
      public function getIcon(param1:String) : class_3127
      {
         var _loc2_:class_3127 = null;
         if(param1 == "HTIE_EXT_GROUP")
         {
            _loc2_ = var_1693.getIcon(param1);
         }
         else if(var_1430)
         {
            _loc2_ = var_1430.geIcon(param1);
            if(_loc2_ as IStaticBitmapWrapperWindow)
            {
               _loc2_ = _loc2_.parent;
            }
         }
         if(!_loc2_ && _purseExtension)
         {
            _loc2_ = _purseExtension.getIcon(param1);
         }
         return _loc2_;
      }
      
      public function setUnseenItemCount(param1:String, param2:int) : void
      {
         if(var_1430)
         {
            var_1430.setUnseenItemCount(param1,param2);
         }
      }
      
      public function setToolbarState(param1:String) : void
      {
         switch(param1)
         {
            case "HTE_STATE_HOTEL_VIEW":
            case "HTE_STATE_GAME_CENTER_VIEW":
               showExtensions(true);
               break;
            case "HTE_STATE_ROOM_VIEW":
               showExtensions(true);
               break;
            case "HTE_STATE_HIDDEN":
               showExtensions(false);
         }
         if(var_1693 != null)
         {
            var_1693.landingView = param1 == "HTE_STATE_HOTEL_VIEW";
         }
         if(var_1430)
         {
            var_1430.setToolbarState(param1);
            var_1430.window.visible = true;
         }
         if(_habboHelp != null)
         {
            _habboHelp.outsideRoom = param1 != "HTE_STATE_ROOM_VIEW";
         }
         var _loc2_:HabboToolbarEvent = new HabboToolbarEvent("HTE_RESIZED");
         events.dispatchEvent(_loc2_);
      }
      
      private function showExtensions(param1:Boolean) : void
      {
         if(var_1693)
         {
            var_1693.visible = param1;
         }
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:BitmapData = null;
         if(param2 != null)
         {
            _loc3_ = param2.clone();
         }
         if(var_1430)
         {
            var_1430.setIconBitmap(param1,param2);
         }
      }
      
      public function getRect() : Rectangle
      {
         if(var_1430)
         {
            return var_1430.window.rectangle;
         }
         return new Rectangle();
      }
      
      public function get extensionView() : IExtensionView
      {
         return var_1693;
      }
      
      public function get soundManager() : class_2089
      {
         return _soundManager;
      }
      
      public function createTransitionToIcon(param1:String, param2:BitmapData, param3:int, param4:int) : Motion
      {
         if(var_1430)
         {
            return var_1430.animateToIcon(param1,param2,param3,param4);
         }
         param2.dispose();
         return null;
      }
      
      public function isXmasEnabled() : Boolean
      {
         return getBoolean("xmas11.enabled");
      }
      
      public function isValentinesEnabled() : Boolean
      {
         return getBoolean("valentines.enabled");
      }
      
      public function isNewIdentity() : Boolean
      {
         return getInteger("new.identity",0) > 0;
      }
      
      public function setIconVisibility(param1:String, param2:Boolean) : void
      {
         if(var_1430)
         {
            var_1430.iconVisibility(param1,param2);
         }
      }
      
      private function destroyDimmerTimer() : void
      {
         if(var_1876)
         {
            var_1876.removeEventListener("timerComplete",onRemoveDimmer);
            var_1876.stop();
            var_1876 = null;
         }
      }
      
      private function destroyClientPromoTimer() : void
      {
         if(var_2222)
         {
            var_2222.removeEventListener("timerComplete",onShowClientPromo);
            var_2222.stop();
            var_2222 = null;
         }
      }
      
      private function destroyOwnRoomPromoTimer() : void
      {
         if(var_2221)
         {
            var_2221.removeEventListener("timerComplete",onShowOwnRoomPromo);
            var_2221.stop();
            var_2221 = null;
         }
      }
      
      private function onMiniMailUpdate(param1:MiniMailMessageEvent) : void
      {
         if(!_messenger || !var_1430)
         {
            return;
         }
         if(var_1430 != null)
         {
            var_1430.unseenMiniMailMessageCount = _messenger.getUnseenMiniMailMessageCount();
            var_1430.memenu.unseenMinimailsCount = _messenger.getUnseenMiniMailMessageCount();
            setUnseenItemCount("HTIE_ICON_MEMENU",var_1430.unseenMeMenuCount);
         }
      }
      
      private function onUnseenAchievementsCountUpdate(param1:UnseenAchievementsCountUpdateEvent) : void
      {
         if(var_1430 != null)
         {
            var_1430.unseenAchievementCount = param1.count;
            var_1430.memenu.unseenAchievementsCount = param1.count;
            setUnseenItemCount("HTIE_ICON_MEMENU",var_1430.unseenMeMenuCount);
         }
      }
      
      private function onUnseenForumsCountUpdate(param1:UnseenForumsCountUpdatedEvent) : void
      {
         if(var_1430 != null)
         {
            var_1430.unseenForumsCount = param1.unseenForumsCount;
            var_1430.memenu.unseenForumsCount = param1.unseenForumsCount;
            setUnseenItemCount("HTIE_ICON_MEMENU",var_1430.unseenMeMenuCount);
         }
      }
      
      public function set onDuty(param1:Boolean) : void
      {
         if(var_1430 != null)
         {
            var_1430.onDuty = param1;
         }
      }
      
      private function onUnseenItemsUpdate(param1:HabboUnseenItemsUpdatedEvent) : void
      {
         setUnseenItemCount("HTIE_ICON_INVENTORY",param1.inventoryCount);
         setUnseenItemCount("HTIE_ICON_GAMES",param1.getCategoryCount(6));
      }
      
      public function onClubChanged(param1:HabboInventoryHabboClubEvent) : void
      {
         if(_purseExtension != null)
         {
            _purseExtension.getClubArea().onClubChanged(param1);
         }
         if(var_2610 != null)
         {
            var_2610.onClubChanged(param1);
         }
         if(_videoOfferExtension != null)
         {
            _videoOfferExtension.onClubChanged(param1);
         }
         if(_clubDiscountPromoExtension != null)
         {
            _clubDiscountPromoExtension.onClubChanged(param1);
         }
      }
      
      public function get toolBarAreaWidth() : int
      {
         if(var_1430)
         {
            return var_1430.getToolbarAreaWidth();
         }
         return 0;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get avatarRenderManager() : class_1690
      {
         return _avatarRenderManager;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get communicationManager() : class_25
      {
         return _communicationManager;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function get navigator() : class_1685
      {
         if(_newNavigator != null)
         {
            return _newNavigator.legacyNavigator;
         }
         return null;
      }
      
      public function get questEngine() : class_2047
      {
         return _questEngine;
      }
      
      public function get freeFlowChat() : class_1692
      {
         return _freeFlowChat;
      }
      
      public function get roomUI() : IRoomUI
      {
         return _roomUI;
      }
      
      public function get inventory() : class_1697
      {
         return _inventory;
      }
      
      public function get localization() : class_17
      {
         return _localization;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get messenger() : class_1689
      {
         return _messenger;
      }
      
      public function reboot() : void
      {
         (context as class_803).reboot();
      }
   }
}
