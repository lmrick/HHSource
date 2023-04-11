package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.friendbar.landingview.*;
   import package_3.class_170;
   import package_3.class_950;
   import package_52.class_377;
   import package_73.class_551;
   import package_83.class_1567;
   import package_83.class_1658;
   import package_83.class_1659;
   import package_83.class_889;
   
   public class CommunityGoalHallOfFameWidget extends UserListWidget
   {
       
      
      private var var_45:class_1567;
      
      private var var_1050:String;
      
      public function CommunityGoalHallOfFameWidget(param1:HabboLandingView)
      {
         super(param1);
      }
      
      override public function initialize() : void
      {
         super.initialize();
         var_1050 = landingView.getProperty("landing.view.dynamic.slot.6.conf");
      }
      
      override protected function registerMessageListeners() : void
      {
         landingView.communicationManager.addHabboConnectionMessageEvent(new class_889(onCommunityGoalHallOfFame));
         landingView.communicationManager.addHabboConnectionMessageEvent(new class_551(onTimingCode));
      }
      
      override public function refresh() : void
      {
         landingView.send(new class_950(var_1050));
      }
      
      override protected function get users() : Array
      {
         return var_45 == null ? null : var_45.hof;
      }
      
      override protected function refreshPopup(param1:class_1658, param2:class_3151) : void
      {
         var _loc4_:class_1659 = class_1659(param1);
         param2.findChildByName("user_name_txt").caption = _loc4_.userName;
         landingView.localizationManager.registerParameter("landing.view.competition.hof.points","points","" + _loc4_.currentScore);
         param2.findChildByName("score_txt").caption = getText("landing.view.competition.hof.points");
         param2.findChildByName("rank_desc_txt").caption = getText("landing.view.competition.hof.undefined.rankdesc.leader");
      }
      
      override protected function getPopupXml() : String
      {
         return "competition_user_popup";
      }
      
      private function onCommunityGoalHallOfFame(param1:class_889) : void
      {
         var_45 = param1.getParser().data;
         refreshContent();
      }
      
      override protected function hasExtraLink() : Boolean
      {
         return landingView.getBoolean("landing.view.communitygoalhof.hasroomlink");
      }
      
      override protected function extraLinkClicked(param1:class_1658) : void
      {
         landingView.send(new class_170(var_45.goalCode,param1.userId));
      }
      
      private function onTimingCode(param1:class_551) : void
      {
         var _loc2_:String = param1.getParser().code;
         if(param1.getParser().schedulingStr == var_1050 && _loc2_ != "" && !disposed)
         {
            loadConfigurationOverrides(_loc2_);
            landingView.send(new class_377(param1.getParser().code));
         }
      }
      
      private function loadConfigurationOverrides(param1:String) : void
      {
         var _loc4_:Array = null;
         var _loc3_:int = 0;
         var _loc6_:String = "landing.view." + param1 + ".avatarlist.yoffsets.array";
         if(landingView.propertyExists(_loc6_))
         {
            _loc4_ = landingView.getProperty(_loc6_).split(",");
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               _loc4_[_loc3_] = parseInt(_loc4_[_loc3_]);
               _loc3_++;
            }
            avatarOffsetsY = _loc4_;
         }
         var _loc5_:String = "landing.view." + param1 + ".avatarlist.widths.array";
         if(landingView.propertyExists(_loc5_))
         {
            _loc4_ = landingView.getProperty(_loc5_).split(",");
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               _loc4_[_loc3_] = parseInt(_loc4_[_loc3_]);
               _loc3_++;
            }
            avatarContainerWidths = _loc4_;
         }
         var _loc2_:String = "landing.view." + param1 + ".avatarlist.startoffset";
         if(landingView.propertyExists(_loc2_))
         {
            startOffset = parseInt(landingView.getProperty(_loc2_));
         }
      }
   }
}
