package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.*;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import package_139.class_1073;
   import package_52.class_753;
   import package_83.class_1571;
   import package_83.class_513;
   
   public class CommunityGoalWidget implements class_41, ILandingViewWidget, ISettingsAwareWidget
   {
      
      private static const CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES:Array = [0,8,16,23];
      
      private static const METER_INITIAL_DELAY_MS:int = 1500;
      
      private static const METER_BUILDUP_TIME_MS:int = 1000;
       
      
      protected var _landingView:HabboLandingView;
      
      protected var var_1520:class_3151;
      
      private var var_4243:IStaticBitmapWrapperWindow;
      
      protected var var_1579:class_1571;
      
      private var var_3319:Boolean = false;
      
      private var var_3726:Number = 0;
      
      private var var_2630:Number = 0;
      
      private var var_1420:Boolean = false;
      
      private var var_3488:Boolean = true;
      
      private var var_3145:Boolean = false;
      
      public function CommunityGoalWidget(param1:HabboLandingView, param2:Boolean = false)
      {
         super();
         _landingView = param1;
         var_3145 = param2;
      }
      
      public function get container() : class_3127
      {
         return var_1520;
      }
      
      public function dispose() : void
      {
         if(_landingView != null && false)
         {
            class_20(_landingView.windowManager).removeUpdateReceiver(this);
         }
         _landingView = null;
         var_1520 = null;
         var_1579 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function initialize() : void
      {
         var _loc1_:class_3127 = null;
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_513(onCommunityGoalProgress));
         var_1520 = class_3151(var_3145 ? _landingView.getXmlWindow("community_goal_voting") : _landingView.getXmlWindow("community_goal"));
         var_4243 = IStaticBitmapWrapperWindow(var_1520.findChildByName("meter_needle"));
         if(!var_3145)
         {
            _loc1_ = var_1520.findChildByName("community_catalog_button");
            var_3488 = _landingView.getBoolean("landing.view.community.interactive");
            _loc1_.visible = var_3488;
            _loc1_.procedure = onCommunityCatalogButtonClick;
         }
         HabboLandingView.positionAfterAndStretch(var_1520,"community_title","hdr_line");
      }
      
      private function campaignizeMeterElementAssetUri(param1:class_3127) : void
      {
         var _loc3_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(param1);
         var _loc2_:int = _loc3_.assetUri.indexOf(".png");
         _loc3_.assetUri = _loc3_.assetUri.substr(0,_loc2_) + "_" + var_1579.goalCode + ".png";
      }
      
      protected function setCampaignLocalization(param1:String, param2:String) : void
      {
         var _loc3_:class_3127 = var_1520.findChildByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.caption = "${" + param2 + "." + var_1579.goalCode + "}";
         }
      }
      
      protected function getCurrentNeedleFrame() : int
      {
         if(true)
         {
            return CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[-1];
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0 - _loc1_;
         return _loc1_ + Math.floor(0 * (_loc2_ + 0.001) / 100);
      }
      
      private function initializeLocalizations() : void
      {
         var _loc1_:int = 0;
         if(var_1579 != null && false)
         {
            _loc1_ = 0;
            while(_loc1_ < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
            {
               campaignizeMeterElementAssetUri(var_1520.findChildByName("meter_level_" + _loc1_));
               if(_loc1_ > 0)
               {
                  campaignizeMeterElementAssetUri(var_1520.findChildByName("meter_level_" + _loc1_ + "_icon"));
                  campaignizeMeterElementAssetUri(var_1520.findChildByName("meter_level_" + _loc1_ + "_icon_locked"));
               }
               _loc1_++;
            }
            setCampaignLocalization("community_title","landing.view.community.headline");
            setCampaignLocalization("goal_caption","landing.view.community.caption");
            setCampaignLocalization("goal_info","landing.view.community.info");
            setCampaignLocalization("community_catalog_button","landing.view.community_catalog_button.text");
            var_1420 = true;
         }
      }
      
      private function refreshContent() : void
      {
         var _loc3_:int = 0;
         if(var_1579 == null)
         {
            var_1520.visible = false;
            return;
         }
         if(!var_1420)
         {
            initializeLocalizations();
         }
         _loc3_ = 1;
         while(_loc3_ < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
         {
            var_1520.findChildByName("meter_level_" + _loc3_).visible = false;
            var_1520.findChildByName("meter_level_" + _loc3_ + "_icon").visible = false;
            var_1520.findChildByName("meter_level_" + _loc3_ + "_icon_locked").visible = false;
            _loc3_++;
         }
         _landingView.localizationManager.registerParameter("landing.view.community.meter","userRank",var_1579.personalContributionRank.toString());
         _landingView.localizationManager.registerParameter("landing.view.community.meter","userAmount",var_1579.personalContributionScore.toString());
         _landingView.localizationManager.registerParameter("landing.view.community.meter","totalAmount",var_1579.communityTotalScore.toString());
         if(var_1579 != null && false)
         {
            _landingView.localizationManager.registerParameter("landing.view.community.meter.undefined","totalAmount",var_1579.communityTotalScore.toString());
            setCampaignLocalization("community_total_status","landing.view.community.meter");
            if(var_3145)
            {
               setCampaignLocalization("community_vote_one_button","landing.view.vote_one_button.text");
               setCampaignLocalization("community_vote_two_button","landing.view.vote_two_button.text");
            }
         }
         var _loc1_:ITextWindow = ITextWindow(var_1520.findChildByName("goal_info"));
         _loc1_.height = _loc1_.textHeight + 6;
         if(!var_3145)
         {
            var_1520.findChildByName("community_catalog_button").visible = var_3488;
         }
         var_1520.visible = true;
         var_1520.invalidate();
      }
      
      protected function updateMeter(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         _loc3_ = 1;
         while(_loc3_ < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
         {
            _loc4_ = param2 && param1 >= CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[_loc3_];
            var_1520.findChildByName("meter_level_" + _loc3_).visible = _loc4_;
            var_1520.findChildByName("meter_level_" + _loc3_ + "_icon").visible = _loc4_;
            var_1520.findChildByName("meter_level_" + _loc3_ + "_icon_locked").visible = !_loc4_;
            _loc3_++;
         }
         var_4243.assetUri = "landing_view_needle_meter_needle" + param1;
      }
      
      public function refresh() : void
      {
         requestCommunityGoalProgress();
         refreshContent();
      }
      
      private function requestCommunityGoalProgress() : void
      {
         if(!var_3319)
         {
            _landingView.send(new class_753());
            var_3319 = true;
         }
      }
      
      public function update(param1:uint) : void
      {
         var_3726 += param1;
         if(var_3726 > 1500)
         {
            var_2630 += param1 / 1000;
            if(var_2630 > 1)
            {
               var_2630 = 1;
               class_20(_landingView.windowManager).removeUpdateReceiver(this);
            }
            updateMeter(Math.floor(getCurrentNeedleFrame() * var_2630));
         }
      }
      
      private function onCommunityGoalProgress(param1:IMessageEvent) : void
      {
         var_1579 = class_1073(param1.parser).data;
         var_3319 = false;
         refreshContent();
         class_20(_landingView.windowManager).registerUpdateReceiver(this,10);
      }
      
      private function onCommunityCatalogButtonClick(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = _landingView.getProperty("landing.view.community.catalog.target");
            _landingView.catalog.openCatalogPage(_loc3_);
            _landingView.tracking.trackGoogle("landingView","click_communityCatalogTarget");
         }
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(var_1520,param1);
      }
      
      protected function get communityProgress() : class_1571
      {
         return var_1579;
      }
   }
}
