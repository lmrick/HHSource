package com.sulake.habbo.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.quest.events.QuestCompletedEvent;
   import com.sulake.habbo.quest.events.QuestsListEvent;
   import com.sulake.habbo.window.utils.class_3132;
   import flash.utils.Dictionary;
   import package_10.class_606;
   import package_101.class_1042;
   import package_101.class_449;
   import package_101.class_807;
   import package_133.class_1072;
   import package_139.class_1155;
   import package_139.class_1186;
   import package_139.class_1328;
   import package_139.class_1493;
   import package_147.class_1192;
   import package_17.class_194;
   import package_17.class_323;
   import package_17.class_486;
   import package_173.class_1413;
   import package_173.class_1473;
   import package_173.class_1519;
   import package_176.class_1342;
   import package_176.class_1345;
   import package_176.class_1428;
   import package_28.class_201;
   import package_28.class_281;
   import package_28.class_448;
   import package_49.class_898;
   import package_5.class_993;
   import package_6.class_453;
   import package_66.class_471;
   import package_66.class_842;
   import package_66.class_951;
   import package_73.class_379;
   import package_73.class_655;
   import package_78.class_515;
   import package_83.class_335;
   import package_83.class_854;
   import package_83.class_924;
   import package_83.class_940;
   import package_83.class_955;

   public class IncomingMessages implements class_13
   {
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var var_3681:class_3132;
      
      private var var_311:Boolean = false;
      
      public function IncomingMessages(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         super();
         _questEngine = param1;
         var _loc2_:class_25 = _questEngine.communication;
         _loc2_.addHabboConnectionMessageEvent(new class_655(onCompetitionEntrySubmitResult));
         _loc2_.addHabboConnectionMessageEvent(new class_281(onActivityPoints));
         _loc2_.addHabboConnectionMessageEvent(new class_201(onLevelUp));
         _loc2_.addHabboConnectionMessageEvent(new class_323(onFurnisChanged));
         _loc2_.addHabboConnectionMessageEvent(new class_471(onAchievementResolutionProgress));
         _loc2_.addHabboConnectionMessageEvent(new class_453(onIsFirstLoginOfDay));
         _loc2_.addHabboConnectionMessageEvent(new class_993(onSubscriptionUserInfoEvent));
         _loc2_.addHabboConnectionMessageEvent(new class_379(onCompetitionVotingInfo));
         _loc2_.addHabboConnectionMessageEvent(new class_449(onAchievements));
         _loc2_.addHabboConnectionMessageEvent(new class_807(onAchievement));
         _loc2_.addHabboConnectionMessageEvent(new class_940(onQuestCancelled));
         _loc2_.addHabboConnectionMessageEvent(new class_486(onRoomEnter));
         _loc2_.addHabboConnectionMessageEvent(new class_842(onAchievementResolutions));
         _loc2_.addHabboConnectionMessageEvent(new class_924(onQuest));
         _loc2_.addHabboConnectionMessageEvent(new class_448(onActivityPointsNotification));
         _loc2_.addHabboConnectionMessageEvent(new class_335(onSeasonalQuests));
         _loc2_.addHabboConnectionMessageEvent(new class_606(onRoomExit));
         _loc2_.addHabboConnectionMessageEvent(new class_1042(onAchievementsScore));
         _loc2_.addHabboConnectionMessageEvent(new class_854(onQuests));
         _loc2_.addHabboConnectionMessageEvent(new class_194(onFurnisChanged));
         _loc2_.addHabboConnectionMessageEvent(new class_515(onRoomSettingsSaved));
         _loc2_.addHabboConnectionMessageEvent(new class_951(onAchievementResolutionCompleted));
         _loc2_.addHabboConnectionMessageEvent(new class_955(onQuestCompleted));
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      private function onQuestCompleted(param1:IMessageEvent) : void
      {
         var _loc2_:class_1328 = (param1 as class_955).getParser();
         class_14.log("Quest Completed: " + _loc2_.questData.campaignCode + " quest: " + _loc2_.questData.id);
         _questEngine.questController.onQuestCompleted(_loc2_.questData,_loc2_.showDialog);
         if(_questEngine.isSeasonalQuest(_loc2_.questData))
         {
            _questEngine.events.dispatchEvent(new QuestCompletedEvent("qce_seasonal",_loc2_.questData));
         }
      }
      
      private function onQuestCancelled(param1:IMessageEvent) : void
      {
         class_14.log("Quest Cancelled: ");
         _questEngine.questController.onQuestCancelled();
         if(class_940(param1).getParser().expired)
         {
            _questEngine.windowManager.alert("${quests.expired.title}","${quests.expired.body}",0,null);
         }
      }
      
      private function onQuests(param1:IMessageEvent) : void
      {
         var _loc2_:class_1186 = (param1 as class_854).getParser();
         class_14.log("Got Quests: " + _loc2_.quests + ", " + _loc2_.openWindow);
         _questEngine.events.dispatchEvent(new QuestsListEvent("qu_quests",_loc2_.quests,_loc2_.openWindow));
      }
      
      private function onSeasonalQuests(param1:IMessageEvent) : void
      {
         var _loc2_:class_1493 = (param1 as class_335).getParser();
         class_14.log("Got seasonal Quests: " + _loc2_.quests);
         _questEngine.events.dispatchEvent(new QuestsListEvent("qe_quests_seasonal",_loc2_.quests,true));
      }
      
      private function onQuest(param1:IMessageEvent) : void
      {
         var _loc2_:class_1155 = (param1 as class_924).getParser();
         class_14.log("Got Quest: " + _loc2_.quest);
         _questEngine.questController.onQuest(_loc2_.quest);
      }
      
      public function dispose() : void
      {
         if(var_3681)
         {
            var_3681.dispose();
            var_3681 = null;
         }
         var_311 = true;
      }
      
      private function onRoomEnter(param1:class_486) : void
      {
         _questEngine.roomCompetitionController.onRoomEnter(param1);
         _questEngine.currentlyInRoom = true;
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         _questEngine.questController.onRoomExit();
         _questEngine.achievementController.onRoomExit();
         _questEngine.roomCompetitionController.onRoomExit();
         _questEngine.currentlyInRoom = false;
      }
      
      private function onFurnisChanged(param1:IMessageEvent) : void
      {
         _questEngine.roomCompetitionController.onContextChanged();
      }
      
      private function onRoomSettingsSaved(param1:IMessageEvent) : void
      {
         _questEngine.roomCompetitionController.onContextChanged();
      }
      
      private function onAchievements(param1:IMessageEvent) : void
      {
         var _loc2_:class_449 = param1 as class_449;
         var _loc3_:class_1428 = _loc2_.getParser() as class_1428;
         _questEngine.achievementController.onAchievements(_loc3_.achievements,_loc3_.defaultCategory);
      }
      
      private function onAchievementResolutions(param1:class_842) : void
      {
         var _loc2_:class_1413 = param1.getParser();
         _questEngine.achievementsResolutionController.onResolutionAchievements(_loc2_.stuffId,_loc2_.achievements,_loc2_.endTime);
      }
      
      private function onAchievementResolutionProgress(param1:class_471) : void
      {
         var _loc2_:class_1519 = param1.getParser();
         _questEngine.achievementsResolutionController.onResolutionProgress(_loc2_.stuffId,_loc2_.achievementId,_loc2_.requiredLevelBadgeCode,_loc2_.userProgress,_loc2_.totalProgress,_loc2_.endTime);
      }
      
      private function onAchievementResolutionCompleted(param1:class_951) : void
      {
         var _loc2_:class_1473 = param1.getParser();
         _questEngine.achievementsResolutionController.onResolutionCompleted(_loc2_.badgeCode,_loc2_.stuffCode);
      }
      
      private function onAchievement(param1:IMessageEvent) : void
      {
         var _loc2_:class_807 = param1 as class_807;
         var _loc3_:class_1345 = _loc2_.getParser() as class_1345;
         _questEngine.achievementController.onAchievement(_loc3_.achievement);
         _questEngine.achievementsResolutionController.onAchievement(_loc3_.achievement);
      }
      
      private function onAchievementsScore(param1:IMessageEvent) : void
      {
         var _loc2_:class_1042 = param1 as class_1042;
         var _loc3_:class_1342 = _loc2_.getParser() as class_1342;
         _questEngine.localization.registerParameter("achievements.categories.score","score",_loc3_.score.toString());
      }
      
      private function onLevelUp(param1:IMessageEvent) : void
      {
         var _loc2_:class_201 = param1 as class_201;
         var _loc3_:class_1192 = _loc2_.getParser();
         var _loc4_:String = String(_questEngine.localization.getBadgeBaseName(_loc3_.data.badgeCode));
         _questEngine.send(new class_898("Achievements",_loc4_,"Leveled","",_loc3_.data.level));
         _questEngine.achievementsResolutionController.onLevelUp(_loc3_.data);
      }
      
      private function onIsFirstLoginOfDay(param1:IMessageEvent) : void
      {
         var _loc2_:class_1072 = (param1 as class_453).getParser();
         _questEngine.setIsFirstLoginOfDay(_loc2_.isFirstLoginOfDay);
      }
      
      private function onCompetitionEntrySubmitResult(param1:class_655) : void
      {
         _questEngine.roomCompetitionController.onCompetitionEntrySubmitResult(param1);
      }
      
      private function onCompetitionVotingInfo(param1:class_379) : void
      {
         _questEngine.roomCompetitionController.onCompetitionVotingInfo(param1);
      }
      
      private function onSubscriptionUserInfoEvent(param1:class_993) : void
      {
         if(param1.getParser().isVIP && param1.getParser().responseType == 2)
         {
            _questEngine.roomCompetitionController.sendRoomCompetitionInit();
         }
      }
      
      private function onActivityPoints(param1:IMessageEvent) : void
      {
         var _loc3_:Dictionary = class_281(param1).points;
         for each(var _loc4_ in class_3244.values())
         {
            _questEngine.questController.onActivityPoints(_loc4_,0);
         }
         for(var _loc2_ in _loc3_)
         {
            _questEngine.questController.onActivityPoints(int(_loc2_),_loc3_[_loc2_]);
         }
      }
      
      private function onActivityPointsNotification(param1:class_448) : void
      {
         _questEngine.questController.onActivityPoints(param1.type,param1.amount);
      }
   }
}
