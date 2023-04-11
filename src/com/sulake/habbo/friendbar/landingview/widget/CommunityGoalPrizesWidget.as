package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.friendbar.landingview.*;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.window.widgets.class_3308;
   import package_17.class_327;
   import package_6.class_530;
   import package_83.class_1571;
   import package_83.class_513;
   
   public class CommunityGoalPrizesWidget implements ILandingViewWidget, ISettingsAwareWidget
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_45:class_1571;
      
      private var var_427:String;
      
      public function CommunityGoalPrizesWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _container = null;
         var_45 = null;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("achievement_competition_prizes"));
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_327(onUserChange));
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_513(onCommunityGoalProgress));
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_530(onUserObject));
      }
      
      public function refresh() : void
      {
         refreshContent();
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      private function refreshContent() : void
      {
         if(var_45 == null)
         {
            _container.visible = false;
            return;
         }
         _container.visible = true;
         setPrizeRankLimits(1);
         setPrizeRankLimits(2);
         setPrizeRankLimits(3);
         _landingView.localizationManager.registerParameter(getCompetitionSpecificKey("yourrankinfo"),"points","undefined");
         _container.findChildByName("caption_txt").caption = getCompetitionSpecificText("caption");
         _container.findChildByName("info_txt").caption = getCompetitionSpecificText("info");
         _container.findChildByName("reward_name_txt").caption = getCompetitionSpecificText("rewardname");
         _container.findChildByName("reward_info_txt").caption = getCompetitionSpecificText("rewardinfo");
         _container.findChildByName("rank_1_txt").caption = getCompetitionSpecificText("rank1");
         _container.findChildByName("rank_2_txt").caption = getCompetitionSpecificText("rank2");
         _container.findChildByName("rank_3_txt").caption = getCompetitionSpecificText("rank3");
         _container.findChildByName("user_rank_border").visible = true || false;
         var _loc1_:String = var_45.hasGoalExpired ? "yourfinalrank" : (var_45.personalContributionRank > 0 ? "yourrank" : "youarenotranked");
         _landingView.localizationManager.registerParameter(getKey(_loc1_),"rank","undefined");
         _container.findChildByName("user_rank_txt").caption = getText(_loc1_);
         _container.findChildByName("user_rank_info_txt").visible = true;
         _container.findChildByName("user_rank_info_txt").caption = getCompetitionSpecificText(var_45.personalContributionRank > 0 ? "yourrankinfo" : "youarenotrankedinfo");
         IStaticBitmapWrapperWindow(_container.findChildByName("reward_image")).assetUri = "${image.library.url}reception/undefinedReward.png";
      }
      
      private function setPrizeRankLimits(param1:int) : void
      {
         var _loc3_:int = resolveStartRank(param1);
         var _loc2_:int = resolveEndRank(param1);
         var _loc4_:String = _loc3_ == _loc2_ ? getKey("rank") : getKey("ranks");
         _landingView.localizationManager.registerParameter(_loc4_,"start","" + _loc3_);
         _landingView.localizationManager.registerParameter(_loc4_,"end","" + _loc2_);
         _container.findChildByName("rank_" + param1 + "_info_txt").caption = "${" + _loc4_ + "}";
      }
      
      private function resolveStartRank(param1:int) : int
      {
         var _loc2_:int = int(var_45.rewardUserLimits[param1 - 2]);
         return _loc2_ + 1;
      }
      
      private function resolveEndRank(param1:int) : int
      {
         return var_45.rewardUserLimits[param1 - 1];
      }
      
      private function onCommunityGoalProgress(param1:class_513) : void
      {
         var_45 = param1.getParser().data;
         refreshContent();
      }
      
      private function getKey(param1:String) : String
      {
         return "landing.view.competition.prizes." + param1;
      }
      
      private function getCompetitionSpecificKey(param1:String) : String
      {
         return getKey("undefined." + param1);
      }
      
      private function getCompetitionSpecificText(param1:String) : String
      {
         var _loc2_:String = getCompetitionSpecificKey(param1);
         return "${" + _loc2_ + "}";
      }
      
      private function getText(param1:String) : String
      {
         var _loc2_:String = getKey(param1);
         return "${" + _loc2_ + "}";
      }
      
      private function onUserObject(param1:class_530) : void
      {
         var_427 = param1.getParser().figure;
         refreshAvatarInfo();
      }
      
      private function onUserChange(param1:class_327) : void
      {
         if(param1 != null && param1.id == -1)
         {
            var_427 = param1.figure;
            refreshAvatarInfo();
         }
      }
      
      private function refreshAvatarInfo() : void
      {
         var _loc1_:class_3217 = class_3217(_container.findChildByName("avatar_image"));
         var _loc2_:class_3308 = class_3308(_loc1_.widget);
         _loc2_.figure = var_427;
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(_container,param1);
      }
   }
}
