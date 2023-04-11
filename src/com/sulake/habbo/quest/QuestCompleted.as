package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_52.class_440;
   import package_52.class_547;
   import package_83.class_1605;
   
   public class QuestCompleted implements class_13
   {
      
      private static const const_772:int = 2000;
      
      private static const TEXT_HEIGHT_SPACING:int = 5;
      
      private static const MIN_DESC_HEIGHT:int = 31;
       
      
      private var _window:class_3281;
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var var_363:class_1605;
      
      private var _twinkleAnimation:com.sulake.habbo.quest.Animation;
      
      private var var_2805:int;
      
      public function QuestCompleted(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         super();
         _questEngine = param1;
      }
      
      public function dispose() : void
      {
         _questEngine = null;
         var_363 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(_twinkleAnimation)
         {
            _twinkleAnimation.dispose();
            _twinkleAnimation = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      public function onQuest(param1:class_1605) : void
      {
         close();
      }
      
      public function onQuestCancelled() : void
      {
         close();
      }
      
      public function onQuestCompleted(param1:class_1605, param2:Boolean) : void
      {
         if(param2)
         {
            prepare(param1);
            var_2805 = 2000;
         }
      }
      
      private function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function onNextQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         _window.visible = false;
         _questEngine.questController.questDetails.openForNextQuest = _questEngine.getBoolean("questing.showDetailsForNextQuest");
         _questEngine.send(new class_440());
      }
      
      private function onMoreQuests(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _window.visible = false;
            _questEngine.send(new class_547());
         }
      }
      
      public function prepare(param1:class_1605) : void
      {
         var_363 = param1;
         if(_window == null)
         {
            _window = class_3281(_questEngine.getXmlWindow("QuestCompletedDialog"));
            _window.findChildByTag("close").procedure = onNextQuest;
            _window.findChildByName("next_quest_button").procedure = onNextQuest;
            _window.findChildByName("more_quests_button").procedure = onMoreQuests;
            _window.findChildByName("catalog_link_region").procedure = onCatalogLink;
            _twinkleAnimation = _questEngine.getTwinkleAnimation(_window);
         }
         _window.findChildByName("catalog_link_txt").caption = _questEngine.localization.getLocalization("quests.completed.cataloglink.undefined");
         var _loc2_:String = "quests.completed.reward.undefined";
         _questEngine.localization.registerParameter(_loc2_,"amount",var_363.rewardCurrencyAmount.toString());
         _window.findChildByName("reward_txt").caption = _questEngine.localization.getLocalization(_loc2_,_loc2_);
         _window.findChildByName("reward_txt").visible = false;
         _window.visible = false;
         _window.findChildByName("congrats_txt").caption = _questEngine.localization.getLocalization(var_363.lastQuestInCampaign ? "quests.completed.campaign.caption" : "quests.completed.quest.caption");
         _window.findChildByName("more_quests_button").visible = var_363.lastQuestInCampaign;
         _window.findChildByName("campaign_reward_icon").visible = var_363.lastQuestInCampaign;
         _window.findChildByName("catalog_link_region").visible = false;
         _window.findChildByName("next_quest_button").visible = true;
         _window.findChildByName("reward_icon").visible = true;
         _window.findChildByName("campaign_reward_icon").visible = var_363.lastQuestInCampaign;
         _window.findChildByName("campaign_pic_bitmap").visible = var_363.lastQuestInCampaign;
         setWindowTitle(var_363.lastQuestInCampaign ? "quests.completed.campaign.title" : "quests.completed.quest.title");
         _questEngine.setupCampaignImage(_window,param1,var_363.lastQuestInCampaign);
         var _loc5_:ITextWindow;
         var _loc3_:int = int((_loc5_ = ITextWindow(_window.findChildByName("desc_txt"))).height);
         setDesc(var_363.getQuestLocalizationKey() + ".completed");
         _loc5_.height = Math.max(31,_loc5_.textHeight + 5);
         var _loc4_:int = _loc5_.height - _loc3_;
         _window.height += _loc4_;
      }
      
      private function setWindowTitle(param1:String) : void
      {
         _questEngine.localization.registerParameter(param1,"category",_questEngine.getCampaignName(var_363));
         _window.caption = _questEngine.localization.getLocalization(param1,param1);
      }
      
      private function setDesc(param1:String) : void
      {
         _window.findChildByName("desc_txt").caption = _questEngine.localization.getLocalization(param1,param1);
      }
      
      private function onCatalogLink(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.openCatalog(var_363);
         }
      }
      
      public function update(param1:uint) : void
      {
         if(var_2805 > 0)
         {
            var_2805 -= param1;
            if(var_2805 < 1)
            {
               _window.center();
               _window.visible = true;
               _window.activate();
               if(false)
               {
                  _twinkleAnimation.restart();
               }
               else
               {
                  _twinkleAnimation.stop();
               }
            }
         }
         if(_twinkleAnimation != null)
         {
            _twinkleAnimation.update(param1);
         }
      }
   }
}
