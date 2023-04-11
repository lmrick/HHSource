package com.sulake.habbo.quest
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.IHabboNewNavigator;
   import com.sulake.habbo.notifications.class_2082;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNewNavigator;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import package_52.class_412;
   import package_52.class_458;
   import package_52.class_547;
   import package_83.class_1605;
   
   public class HabboQuestEngine extends class_20 implements class_2047, class_41, ILinkEventTracker
   {
      
      private static const const_541:int = 5;
      
      private static const TWINKLE_ANIMATION_START_TIME:int = 800;
      
      private static const TWINKLE_ANIMATION_OBJECT_COUNT:int = 15;
      
      private static const DELAY_BETWEEN_TWINKLE_STARTS:int = 300;
      
      private static const const_434:Array = ["MOVEITEM","ENTEROTHERSROOM","CHANGEFIGURE","FINDLIFEGUARDTOWER","SCRATCHAPET"];
       
      
      private var _windowManager:class_1684;
      
      private var _communication:class_25;
      
      private var _localization:class_18;
      
      private var _configuration:class_19;
      
      private var var_2619:com.sulake.habbo.quest.class_3136;
      
      private var var_2461:com.sulake.habbo.quest.QuestController;
      
      private var var_1722:com.sulake.habbo.quest.AchievementController;
      
      private var var_3651:com.sulake.habbo.quest.RoomCompetitionController;
      
      private var _toolbar:IHabboToolbar;
      
      private var _catalog:IHabboCatalog;
      
      private var _navigator:IHabboNewNavigator;
      
      private var _notifications:class_2082;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _habboHelp:IHabboHelp;
      
      private var _tracking:class_1693;
      
      private var var_2420:com.sulake.habbo.quest.TwinkleImages;
      
      private var _currentlyInRoom:Boolean = false;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_1338:Boolean = false;
      
      private var var_2762:com.sulake.habbo.quest.AchievementsResolutionController;
      
      public function HabboQuestEngine(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_2461 = new com.sulake.habbo.quest.QuestController(this);
         var_1722 = new com.sulake.habbo.quest.AchievementController(this);
         var_2762 = new com.sulake.habbo.quest.AchievementsResolutionController(this);
         var_3651 = new com.sulake.habbo.quest.RoomCompetitionController(this);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationComponentInit);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboNotifications(),onNotificationsReady);
         queueInterface(new IIDHabboHelp(),onHabboHelpReady);
         queueInterface(new IIDHabboNewNavigator(),onHabboNavigatorReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboTracking(),onTrackingReady);
         param1.addLinkEventTracker(this);
         registerUpdateReceiver(this,5);
      }
      
      public static function moveChildrenToRow(param1:class_3151, param2:Array, param3:int, param4:int) : void
      {
         var _loc6_:class_3127 = null;
         for each(var _loc5_ in param2)
         {
            if((_loc6_ = param1.getChildByName(_loc5_)) != null && _loc6_.visible)
            {
               _loc6_.x = param3;
               param3 += _loc6_.width + param4;
            }
         }
      }
      
      override public function dispose() : void
      {
         removeUpdateReceiver(this);
         context.removeLinkEventTracker(this);
         if(_toolbar)
         {
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_notifications != null)
         {
            _notifications.release(new IIDHabboNotifications());
            _notifications = null;
         }
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(_configuration != null)
         {
            _configuration.release(new IIDHabboConfigurationManager());
            _configuration = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_sessionDataManager != null)
         {
            _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY",var_1722.onBadgeImageReady);
            _sessionDataManager.release(new IIDSessionDataManager());
            _sessionDataManager = null;
         }
         if(var_2619)
         {
            var_2619.dispose();
         }
         if(_habboHelp != null)
         {
            _habboHelp.release(new IIDHabboHelp());
            _habboHelp = null;
         }
         if(_navigator != null)
         {
            _navigator.release(new IIDHabboNewNavigator());
            _navigator = null;
         }
         if(_tracking != null)
         {
            _tracking.release(new IIDHabboTracking());
            _tracking = null;
         }
         if(var_2420)
         {
            var_2420.dispose();
            var_2420 = null;
         }
         if(_roomEngine)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(var_2762)
         {
            var_2762.dispose();
            var_2762 = null;
         }
         super.dispose();
      }
      
      public function getXmlWindow(param1:String, param2:int = 1) : class_3127
      {
         var _loc5_:IAsset = null;
         var _loc3_:XmlAsset = null;
         var _loc4_:class_3127 = null;
         try
         {
            _loc5_ = assets.getAssetByName(param1);
            _loc3_ = XmlAsset(_loc5_);
            _loc4_ = _windowManager.buildFromXML(XML(_loc3_.content),param2);
         }
         catch(e:Error)
         {
         }
         return _loc4_;
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         _communication = class_25(param2);
         var_2619 = new com.sulake.habbo.quest.class_3136(this);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = class_1684(param2);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _localization = class_18(param2);
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         _configuration = param2 as class_19;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _notifications = param2 as class_2082;
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _sessionDataManager = param2 as ISessionDataManager;
         _sessionDataManager.events.addEventListener("BIRE_BADGE_IMAGE_READY",var_1722.onBadgeImageReady);
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _habboHelp = param2 as IHabboHelp;
      }
      
      private function onHabboNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _navigator = param2 as IHabboNewNavigator;
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _roomEngine = param2 as IRoomEngine;
      }
      
      private function onTrackingReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _tracking = param2 as class_1693;
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get questController() : com.sulake.habbo.quest.QuestController
      {
         return var_2461;
      }
      
      public function get roomCompetitionController() : com.sulake.habbo.quest.RoomCompetitionController
      {
         return var_3651;
      }
      
      public function get achievementController() : com.sulake.habbo.quest.AchievementController
      {
         return var_1722;
      }
      
      public function get achievementsResolutionController() : com.sulake.habbo.quest.AchievementsResolutionController
      {
         return var_2762;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get tracking() : class_1693
      {
         return _tracking;
      }
      
      public function openCatalog(param1:class_1605) : void
      {
         var _loc2_:String = param1.catalogPageName;
         if(_loc2_ != "")
         {
            class_14.log("Questing->Open Catalog: " + _loc2_);
            _catalog.openCatalogPage(_loc2_);
         }
         else
         {
            class_14.log("Questing->Open Catalog: Quest Catalog page name not defined");
            _catalog.openCatalog();
         }
      }
      
      public function openNavigator(param1:class_1605) : void
      {
         var _loc3_:String = null;
         var _loc2_:Boolean = hasLocalizedValue(param1.getQuestLocalizationKey() + ".searchtag");
         if(_loc2_)
         {
            _loc3_ = param1.getQuestLocalizationKey() + ".searchtag";
         }
         else
         {
            _loc3_ = param1.getCampaignLocalizationKey() + ".searchtag";
         }
         var _loc4_:String = String(_localization.getLocalization(_loc3_));
         class_14.log("Questing->Open Navigator: " + _loc4_);
         _navigator.performTagSearch(_loc4_);
      }
      
      public function hasQuestRoomsIds() : Boolean
      {
         var _loc1_:String = getQuestRoomIds();
         return _loc1_ != null && _loc1_ != "";
      }
      
      private function getQuestRoomIds() : String
      {
         return _localization.getLocalization("quests." + getSeasonalCampaignCodePrefix() + ".roomids");
      }
      
      public function goToQuestRooms() : void
      {
         if(!hasQuestRoomsIds())
         {
            return;
         }
         var _loc4_:String;
         var _loc2_:Array = (_loc4_ = getQuestRoomIds()).split(",");
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:int = Math.max(0,Math.min(_loc2_.length - 1,Math.floor(Math.random() * _loc2_.length)));
         var _loc1_:String = String(_loc2_[_loc3_]);
         var _loc5_:int = int(_loc1_);
         class_14.log("Forwarding to a guest room: " + _loc5_);
         _navigator.goToRoom(_loc5_);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = IHabboToolbar(param2) as IHabboToolbar;
         _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK",onHabboToolbarEvent);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == "HTE_TOOLBAR_CLICK")
         {
            if(param1.iconId == "HTIE_ICON_QUESTS")
            {
               var_2461.onToolbarClick();
            }
            if(param1.iconId == "HTIE_ICON_ACHIEVEMENTS")
            {
               var_1722.onToolbarClick();
            }
         }
      }
      
      public function ensureAchievementsInitialized() : void
      {
         if(var_1722 != null)
         {
            var_1722.ensureAchievementsInitialized();
         }
      }
      
      public function showAchievements() : void
      {
         if(var_1722 != null)
         {
            var_1722.show();
         }
      }
      
      public function showQuests() : void
      {
      }
      
      public function getAchievementLevel(param1:String, param2:String) : int
      {
         if(var_1722 != null)
         {
            return var_1722.getAchievementLevel(param1,param2);
         }
         return 0;
      }
      
      public function reenableRoomCompetitionWindow() : void
      {
         var_3651.dontShowAgain = false;
      }
      
      public function get notifications() : class_2082
      {
         return _notifications;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function send(param1:IMessageComposer) : void
      {
         communication.connection.send(param1);
      }
      
      public function isTrackerVisible() : Boolean
      {
         return var_2461.questTracker.isVisible();
      }
      
      public function getQuestRowTitle(param1:class_1605) : String
      {
         var _loc2_:String = param1.waitPeriodSeconds < 1 ? param1.getQuestLocalizationKey() + ".name" : "quests.list.questdelayed";
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function getQuestName(param1:class_1605) : String
      {
         var _loc2_:String = param1.getQuestLocalizationKey() + ".name";
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function getQuestDesc(param1:class_1605) : String
      {
         var _loc2_:String = param1.getQuestLocalizationKey() + ".desc";
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function getQuestHint(param1:class_1605) : String
      {
         var _loc2_:String = param1.getQuestLocalizationKey() + ".hint";
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function getActivityPointName(param1:int) : String
      {
         var _loc2_:String = "achievements.activitypoint." + param1;
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function getCampaignNameByCode(param1:String) : String
      {
         var _loc2_:String = param1 + ".name";
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function getCampaignName(param1:class_1605) : String
      {
         return getCampaignNameByCode(param1.getCampaignLocalizationKey());
      }
      
      public function getAchievementCategoryName(param1:String) : String
      {
         var _loc2_:String = "quests." + param1 + ".name";
         return _localization.getLocalization(_loc2_,_loc2_);
      }
      
      public function setupQuestImage(param1:class_3151, param2:class_1605) : void
      {
         var _loc3_:IStaticBitmapWrapperWindow = param1.findChildByName("quest_pic_bitmap") as IStaticBitmapWrapperWindow;
         var _loc4_:String = param2.waitPeriodSeconds > 0 ? "quest_timer_questionmark" : (param2.campaignCode + "_" + param2.localizationCode + param2.imageVersion + (isQuestWithPrompts(param2) ? "_a" : "")).toLowerCase();
         _loc3_.assetUri = "${image.library.questing.url}" + _loc4_ + ".png";
      }
      
      public function setupPromptFrameImage(param1:class_3151, param2:class_1605, param3:String) : void
      {
         var _loc4_:IStaticBitmapWrapperWindow;
         (_loc4_ = param1.findChildByName("prompt_pic_" + param3) as IStaticBitmapWrapperWindow).assetUri = "${image.library.questing.url}" + (param2.campaignCode + "_" + param2.localizationCode + param2.imageVersion + "_" + param3).toLowerCase() + ".png";
      }
      
      public function setupRewardImage(param1:class_3151, param2:int) : void
      {
         var _loc3_:class_3127 = param1.findChildByName("currency_icon");
         _loc3_.style = class_3244.getIconStyleFor(param2,this,true);
      }
      
      public function setupCampaignImage(param1:class_3151, param2:class_1605, param3:Boolean) : void
      {
         var _loc4_:IStaticBitmapWrapperWindow = param1.findChildByName("campaign_pic_bitmap") as IStaticBitmapWrapperWindow;
         if(!param3)
         {
            _loc4_.visible = false;
            return;
         }
         _loc4_.visible = true;
         var _loc5_:String = param2.campaignCode;
         if(isSeasonalQuest(param2))
         {
            _loc5_ = getSeasonalCampaignCodePrefix() + "_campaign_icon";
         }
         _loc4_.assetUri = "${image.library.questing.url}" + _loc5_ + ".png";
      }
      
      public function setupAchievementCategoryImage(param1:class_3151, param2:AchievementCategory, param3:Boolean) : void
      {
         var _loc4_:IStaticBitmapWrapperWindow;
         (_loc4_ = param1.findChildByName("category_pic_bitmap") as IStaticBitmapWrapperWindow).assetUri = "${image.library.questing.url}" + (param3 ? "ach_category_" + param2.code : "achicon_" + param2.code) + ".png";
      }
      
      public function isQuestWithPrompts(param1:class_1605) : Boolean
      {
         return const_434.indexOf(param1.localizationCode) > -1;
      }
      
      public function refreshReward(param1:Boolean, param2:class_3151, param3:int, param4:int) : void
      {
         param1 = param3 < 0 || param4 < 1 ? false : param1;
         var _loc5_:class_3127 = param2.findChildByName("reward_caption_txt");
         var _loc6_:class_3127 = param2.findChildByName("reward_amount_txt");
         var _loc7_:class_3127 = param2.findChildByName("currency_icon");
         _loc6_.visible = param1;
         _loc5_.visible = param1;
         _loc7_.visible = param1;
         if(!param1)
         {
            return;
         }
         _loc6_.caption = "" + param4;
         moveChildrenToRow(param2,["reward_caption_txt","reward_amount_txt","currency_icon"],_loc5_.x,3);
         this.setupRewardImage(param2,param3);
      }
      
      public function update(param1:uint) : void
      {
         var_2461.update(param1);
         var_1722.update(param1);
      }
      
      public function getTwinkleAnimation(param1:class_3151) : Animation
      {
         var _loc3_:int = 0;
         if(var_2420 == null)
         {
            var_2420 = new com.sulake.habbo.quest.TwinkleImages(this);
         }
         var _loc4_:int = 800;
         var _loc2_:Animation = new Animation(class_3282(param1.findChildByName("twinkle_bitmap")));
         _loc3_ = 0;
         while(_loc3_ < 15)
         {
            _loc2_.addObject(new Twinkle(var_2420,_loc4_));
            _loc4_ += 300;
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get currentlyInRoom() : Boolean
      {
         return _currentlyInRoom;
      }
      
      public function set currentlyInRoom(param1:Boolean) : void
      {
         _currentlyInRoom = param1;
      }
      
      public function isSeasonalCalendarEnabled() : Boolean
      {
         return _configuration.getBoolean("seasonalQuestCalendar.enabled");
      }
      
      public function isSeasonalQuest(param1:class_1605) : Boolean
      {
         var _loc2_:String = getSeasonalCampaignCodePrefix();
         return _loc2_ != "" && param1.campaignCode.indexOf(_loc2_) == 0;
      }
      
      public function getSeasonalCampaignCodePrefix() : String
      {
         return getProperty("seasonalQuestCalendar.campaignPrefix");
      }
      
      public function setIsFirstLoginOfDay(param1:Boolean) : void
      {
         this.var_1338 = param1;
      }
      
      public function get isFirstLoginOfDay() : Boolean
      {
         return this.var_1338;
      }
      
      public function get configuration() : class_19
      {
         return _configuration;
      }
      
      public function hasLocalizedValue(param1:String) : Boolean
      {
         return _localization.getLocalization(param1,"") != "";
      }
      
      public function get navigator() : IHabboNewNavigator
      {
         return _navigator;
      }
      
      public function requestSeasonalQuests() : void
      {
         send(new class_458());
      }
      
      public function requestQuests() : void
      {
         send(new class_547());
      }
      
      public function activateQuest(param1:int) : void
      {
         send(new class_412(param1));
      }
      
      public function get linkPattern() : String
      {
         return "questengine/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         switch(_loc2_[1])
         {
            case "gotorooms":
               goToQuestRooms();
               break;
            case "achievements":
               if(_loc2_.length == 3)
               {
                  var_1722.show();
                  var_1722.selectCategoryInternalLink(_loc2_[2]);
               }
               else
               {
                  showAchievements();
               }
               break;
            case "calendar":
               var_2461.seasonalCalendarWindow.onToolbarClick();
               break;
            case "quests":
               var_2461.onToolbarClick();
               break;
            default:
               class_14.log("QuestEngine unknown link-type received: " + _loc2_[1]);
         }
      }
   }
}
