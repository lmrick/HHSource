package com.sulake.habbo.catalog.clubcenter
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.clubcenter.util.BadgeResolver;
   import com.sulake.habbo.catalog.offers.IOfferCenter;
   import com.sulake.habbo.catalog.offers.IOfferExtension;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.Stage;
   import flash.utils.getTimer;
   import package_104.class_497;
   import package_130.class_1439;
   import package_153.class_1108;
   import package_23.class_712;
   import package_5.class_1628;
   import package_5.class_347;
   import package_7.class_336;
   import package_8.class_845;
   import package_88.class_601;
   
   public class HabboClubCenter extends class_20 implements ILinkEventTracker, IOfferExtension
   {
      
      private static const USE_FAKE_DATA:Boolean = false;
      
      private static const DATA_UPDATE_INTERVAL_MSEC:int = 10000;
       
      
      private var _communicationManager:class_25;
      
      private var _localizationManager:class_18;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _avatarRenderManager:class_1690;
      
      private var _windowManager:class_1684;
      
      private var _catalog:IHabboCatalog;
      
      private var _toolbar:IHabboToolbar;
      
      private var _offerCenter:IOfferCenter;
      
      private var var_3467:Boolean = false;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private var var_1430:com.sulake.habbo.catalog.clubcenter.ClubCenterView;
      
      private var var_2815:com.sulake.habbo.catalog.clubcenter.ClubSpecialInfoBubbleView;
      
      private var var_45:class_1628;
      
      private var var_4155:int = -10000;
      
      private var var_2651:Boolean = false;
      
      private var var_484:String;
      
      private var var_1146:int;
      
      private var var_3043:Vector.<class_24>;
      
      public function HabboClubCenter(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         },true),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarRenderManager = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_845(onClubGiftInfo));
         addMessageEvent(new class_347(onKickbackInfoMessageEvent));
         addMessageEvent(new class_497(onBadges));
         context.addLinkEventTracker(this);
         if(getBoolean("offers.enabled") && getBoolean("offers.habboclub.enabled"))
         {
            _offerCenter = catalog.getOfferCenter(this);
         }
      }
      
      override public function dispose() : void
      {
         if(_messageEvents != null && _communicationManager != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communicationManager.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         if(_sessionDataManager != null && false)
         {
            _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY",onBadgeReady);
         }
         if(_offerCenter != null)
         {
            _offerCenter = null;
         }
         removeView();
         var_45 = null;
         _messageEvents = null;
         super.dispose();
      }
      
      public function get linkPattern() : String
      {
         return "habboUI/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 3)
         {
            return;
         }
         if(_loc2_[1] == "open")
         {
            var _loc3_:* = _loc2_[2];
            if("hccenter" === _loc3_)
            {
               showClubCenter();
            }
         }
      }
      
      private function showClubCenter() : void
      {
         if(!var_1430)
         {
            var_1430 = new com.sulake.habbo.catalog.clubcenter.ClubCenterView(this,_windowManager,_sessionDataManager.figure);
         }
         if(updateNeeded())
         {
            updateData();
         }
         else
         {
            populate();
         }
         if(_offerCenter && var_1430 && var_3467)
         {
            var_3467 = false;
            indicateVideoAvailable(true);
         }
      }
      
      public function removeView() : void
      {
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         removeBreakdown();
         var_2651 = false;
      }
      
      public function removeBreakdown() : void
      {
         if(var_2815)
         {
            var_2815.dispose();
            var_2815 = null;
         }
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         if(!_communicationManager)
         {
            return;
         }
         _messageEvents.push(_communicationManager.addHabboConnectionMessageEvent(param1));
      }
      
      private function onKickbackInfoMessageEvent(param1:class_347) : void
      {
         var _loc2_:class_1439 = param1.getParser();
         var_45 = _loc2_.data;
         var_2651 = false;
         var_4155 = getTimer();
         populate();
      }
      
      private function onClubGiftInfo(param1:class_845) : void
      {
         var_1146 = param1.getParser().giftsAvailable;
         populate();
      }
      
      private function onBadgeReady(param1:BadgeImageReadyEvent) : void
      {
         if(param1.badgeId != var_484 || !_sessionDataManager)
         {
            return;
         }
         _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY",onBadgeReady);
         populate();
      }
      
      public function onBadges(param1:IMessageEvent) : void
      {
         var _loc3_:class_1108 = (param1 as class_497).getParser();
         if(var_3043 == null)
         {
            var_3043 = new Vector.<class_24>(_loc3_.totalFragments,true);
         }
         var _loc4_:class_24;
         (_loc4_ = new class_24()).concatenate(_loc3_.currentFragment);
         var _loc2_:class_24 = addMessageFragment(_loc4_,_loc3_.totalFragments,_loc3_.fragmentNo,var_3043);
         if(!_loc2_)
         {
            return;
         }
         var_3043 = null;
         var_484 = BadgeResolver.resolveClubBadgeId(_loc2_.getKeys());
      }
      
      private function updateNeeded() : Boolean
      {
         return !var_2651 && getTimer() - var_4155 > 10000;
      }
      
      private function updateData() : void
      {
         var_2651 = true;
         _communicationManager.connection.send(new class_601());
         _communicationManager.connection.send(new class_712());
         _communicationManager.connection.send(new class_336());
      }
      
      private function populate() : void
      {
         if(var_1430)
         {
            var_1430.dataReceived(var_45,getPurse(),getGiftsAvailable(),BadgeResolver.resolveBadgeBitmap(var_484,onBadgeReady,_sessionDataManager));
         }
      }
      
      private function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      private function getPurse() : class_3160
      {
         return catalog != null ? catalog.getPurse() : null;
      }
      
      private function getGiftsAvailable() : int
      {
         return var_1146;
      }
      
      public function get localization() : class_18
      {
         return catalog != null ? catalog.localization : null;
      }
      
      public function get avatarRenderManager() : class_1690
      {
         return _avatarRenderManager;
      }
      
      public function resolveClubStatus() : String
      {
         if(!catalog)
         {
            return "none";
         }
         var _loc1_:class_3160 = getPurse();
         if(_loc1_.clubDays > 0)
         {
            return "active";
         }
         if(_loc1_.pastClubDays > 0 || _loc1_.pastVipDays > 0)
         {
            return "expired";
         }
         return "none";
      }
      
      public function openPurchasePage() : void
      {
         if(catalog)
         {
            catalog.openCatalogPage("hc_membership","NORMAL");
         }
      }
      
      public function openClubGiftPage() : void
      {
         if(catalog)
         {
            catalog.openCatalogPage("club_gifts","NORMAL");
         }
      }
      
      public function showPaydayBreakdownView() : void
      {
         if(var_2815)
         {
            removeBreakdown();
            return;
         }
         var_2815 = new com.sulake.habbo.catalog.clubcenter.ClubSpecialInfoBubbleView(this,_windowManager,var_45,var_1430.getSpecialCalloutAnchor());
      }
      
      public function openPaydayHelpPage() : void
      {
         context.createLinkEvent("habbopages/hcpayday");
      }
      
      public function openHelpPage() : void
      {
         context.createLinkEvent("habbopages/habboclub");
      }
      
      public function processHotelLink(param1:String) : void
      {
         context.createLinkEvent(param1);
      }
      
      public function isKickbackEnabled() : Boolean
      {
         var _loc1_:String = getProperty("hccenter.activity.enabled");
         if(_loc1_ == null || _loc1_ == "")
         {
            return true;
         }
         return _loc1_ == "1" || _loc1_ == "true";
      }
      
      public function get stage() : Stage
      {
         return context && false ? context.displayObjectContainer.stage : null;
      }
      
      public function getOffers() : void
      {
         _catalog.getHabboClubOffers(3);
      }
      
      public function get offerCenter() : IOfferCenter
      {
         return _offerCenter;
      }
      
      public function indicateRewards() : void
      {
      }
      
      public function indicateVideoAvailable(param1:Boolean) : void
      {
         if(var_1430)
         {
            var_1430.setVideoOfferButtonVisibility(param1,_offerCenter != null && true);
         }
         else
         {
            var_3467 = param1;
         }
      }
      
      private function addMessageFragment(param1:class_24, param2:int, param3:int, param4:Vector.<class_24>) : class_24
      {
         if(param2 == 1)
         {
            return param1;
         }
         param4[param3] = param1;
         for each(var _loc5_ in param4)
         {
            if(_loc5_ == null)
            {
               return null;
            }
         }
         var _loc6_:class_24 = new class_24();
         for each(var _loc7_ in param4)
         {
            _loc6_.concatenate(_loc7_);
            _loc7_.dispose();
         }
         param4 = null;
         return _loc6_;
      }
   }
}
