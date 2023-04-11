package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import package_114.class_812;
   
   public class CommunityGoalVsModeWidgetWithVoting extends CommunityGoalVsModeWidget
   {
       
      
      private var _voteOptionOneButton:class_3127;
      
      private var _voteOptionTwoButton:class_3127;
      
      private var _voteOption:String;
      
      public function CommunityGoalVsModeWidgetWithVoting(param1:HabboLandingView)
      {
         super(param1,true);
      }
      
      override public function initialize() : void
      {
         super.initialize();
         _voteOptionOneButton = var_1520.findChildByName("community_vote_one_button");
         _voteOptionOneButton.procedure = onVoteOptionOneClick;
         _voteOptionTwoButton = var_1520.findChildByName("community_vote_two_button");
         _voteOptionTwoButton.procedure = onVoteOptionTwoClick;
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_812(onInfo));
      }
      
      override public function refresh() : void
      {
         super.refresh();
         if(communityProgress != null)
         {
            if(_voteOptionOneButton != null)
            {
               _voteOptionOneButton.visible = false;
            }
            if(_voteOptionTwoButton != null)
            {
               _voteOptionTwoButton.visible = false;
            }
         }
      }
      
      private function onVoteOptionOneClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            hideVoteButtons();
            _landingView.communityGoalVote(1);
            _landingView.tracking.trackGoogle("landingView","click_voteoption_one");
         }
      }
      
      private function onVoteOptionTwoClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            hideVoteButtons();
            _landingView.communityGoalVote(2);
            _landingView.tracking.trackGoogle("landingView","click_voteoption_two");
         }
      }
      
      private function onInfo(param1:class_812) : void
      {
         if(param1.getParser().acknowledged)
         {
            hideVoteButtons();
         }
      }
      
      private function hideVoteButtons() : void
      {
         _voteOptionOneButton.visible = false;
         _voteOptionTwoButton.visible = false;
      }
   }
}
