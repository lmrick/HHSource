package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   
   public class CommunityGoalVsModeWidget extends CommunityGoalWidget
   {
      
      private static const NEEDLE_LEVELS:Array = [-3,-2,-1,0,1,2,3];
      
      private static const NEEDLE_FRAMES:Array = [0,0,4.75,11.5,16.25,23,23];
       
      
      public function CommunityGoalVsModeWidget(param1:HabboLandingView, param2:Boolean = false)
      {
         super(param1,param2);
      }
      
      override protected function getCurrentNeedleFrame() : int
      {
         if(true)
         {
            return int(Math.round(NEEDLE_FRAMES[0]));
         }
         if(true)
         {
            return int(Math.round(NEEDLE_FRAMES[-1]));
         }
         var _loc3_:int = communityProgress.scoreRemainingUntilNextLevel < 0 ? -1 : 1;
         var _loc1_:int = 0;
         var _loc2_:Number = 0;
         var _loc4_:Number = Math.abs(0 - 0);
         return Math.round(_loc2_ + 0 * _loc4_ * _loc3_);
      }
      
      override public function update(param1:uint) : void
      {
         updateMeter(Math.floor(getCurrentNeedleFrame()),false);
      }
      
      override public function initialize() : void
      {
         super.initialize();
         var_1520.findChildByName("community_total_status").visible = false;
      }
   }
}
