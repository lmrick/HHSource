package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.quest.events.QuestsListEvent;
   import com.sulake.habbo.utils.FriendlyTime;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.utils.class_3132;
   import package_52.class_450;
   import package_52.class_920;
   import package_83.class_1605;
   
   public class QuestsList implements class_13
   {
      
      private static const COL_SPACING:int = 5;
      
      private static const QUEST_LIST_SPACING:int = 10;
      
      private static const CANCEL_LINK_OFFSET_FROM_RIGHT:int = 10;
      
      private static const COMPLETION_TEXT_OFFSET_FROM_BOTTOM:int = 30;
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var _window:class_3281;
      
      private var var_19:IItemListWindow;
      
      private var var_1974:IScrollbarWindow;
      
      private var _showToolbarNotification:Boolean = true;
      
      private var var_3466:Boolean;
      
      private var var_1901:WindowToggle;
      
      private var var_614:Array;
      
      private var _msecsToRefresh:int = 1000;
      
      public function QuestsList(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         var_614 = [];
         super();
         _questEngine = param1;
         _questEngine.events.addEventListener("qu_quests",onQuestsEvent);
      }
      
      public function dispose() : void
      {
         if(_questEngine)
         {
            _questEngine.events.removeEventListener("qu_quests",onQuestsEvent);
            _questEngine = null;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1901)
         {
            var_1901.dispose();
            var_1901 = null;
         }
         var_19 = null;
         var_1974 = null;
         var_614 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine == null;
      }
      
      public function isVisible() : Boolean
      {
         return _window && false;
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      public function onRoomExit() : void
      {
         this.close();
      }
      
      public function onToolbarClick() : void
      {
         if(!_window)
         {
            _questEngine.requestQuests();
            return;
         }
         if(!var_1901 || false)
         {
            var_1901 = new WindowToggle(_window,_window.desktop,_questEngine.requestQuests,close);
         }
         var_1901.toggle();
         _showToolbarNotification = false;
      }
      
      private function onQuestsEvent(param1:QuestsListEvent) : void
      {
         this.onQuests(param1.quests,true);
      }
      
      private function onQuests(param1:Array, param2:Boolean) : void
      {
         var_614 = [];
         var _loc3_:* = null;
         for each(_loc3_ in param1)
         {
            if(!_questEngine.isSeasonalQuest(_loc3_))
            {
               var_614.push(_loc3_);
            }
         }
         if(!this.isVisible() && !param2)
         {
            return;
         }
         refresh(false);
         this._window.visible = true;
         this._window.activate();
         var_3466 = false;
         for each(_loc3_ in param1)
         {
            if(_loc3_.accepted)
            {
               var_3466 = true;
            }
         }
      }
      
      private function refresh(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         prepareWindow();
         var_19.autoArrangeItems = false;
         _loc3_ = 0;
         while(true)
         {
            if(_loc3_ < var_614.length)
            {
               refreshEntry(true,_loc3_,var_614[_loc3_],param1);
            }
            else
            {
               _loc2_ = refreshEntry(false,_loc3_,null,param1);
               if(_loc2_)
               {
                  break;
               }
            }
            _loc3_++;
         }
         var_19.autoArrangeItems = true;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3281(_questEngine.getXmlWindow("Quests"));
         _window.findChildByTag("close").procedure = onWindowClose;
         var_19 = IItemListWindow(_window.findChildByName("quest_list"));
         var_1974 = IScrollbarWindow(_window.findChildByName("scroller"));
         _window.center();
         var_19.spacing = 10;
      }
      
      private function refreshEntry(param1:Boolean, param2:int, param3:class_1605, param4:Boolean) : Boolean
      {
         var _loc5_:class_3151 = class_3151(var_19.getListItemAt(param2));
         var _loc6_:Boolean = false;
         if(_loc5_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc5_ = createListEntry(onAcceptQuest,onCancelQuest);
            var_19.addListItem(_loc5_);
            _loc6_ = true;
         }
         if(param1)
         {
            if(param4)
            {
               refreshDelay(_loc5_,param3);
            }
            else
            {
               refreshEntryDetails(_loc5_,param3);
            }
            _loc5_.visible = true;
         }
         else
         {
            _loc5_.visible = false;
         }
         return false;
      }
      
      public function createListEntry(param1:Function, param2:Function) : class_3151
      {
         var _loc3_:class_3151 = class_3151(_questEngine.getXmlWindow("QuestEntry"));
         var _loc6_:class_3151 = class_3151(_questEngine.getXmlWindow("Campaign"));
         var _loc9_:class_3151 = class_3151(_questEngine.getXmlWindow("Quest"));
         var _loc5_:class_3151 = class_3151(_questEngine.getXmlWindow("EntryArrows"));
         var _loc8_:class_3151 = class_3151(_questEngine.getXmlWindow("CampaignCompleted"));
         _loc3_.addChild(_loc6_);
         _loc3_.addChild(_loc9_);
         _loc3_.addChild(_loc8_);
         _loc3_.addChild(_loc5_);
         _loc9_.findChildByName("accept_button").procedure = param1;
         _loc9_.findChildByName("cancel_region").procedure = param2;
         _loc3_.findChildByName("hint_txt").visible = false;
         _loc3_.findChildByName("link_region").visible = false;
         var _loc7_:class_3127 = _loc3_.findChildByName("cancel_region");
         var _loc4_:class_3127 = _loc3_.findChildByName("cancel_txt");
         _loc7_.width = _loc4_.width;
         _loc7_.x = _loc9_.width - _loc7_.width - 10;
         _loc9_.x = _loc6_.x + _loc6_.width + 5;
         _loc3_.width = _loc9_.x + _loc9_.width;
         _loc8_.x = _loc9_.x;
         setEntryHeight(_loc3_);
         return _loc3_;
      }
      
      public function setEntryHeight(param1:class_3151) : void
      {
         var _loc5_:class_3151 = class_3151(param1.findChildByName("campaign_container"));
         var _loc6_:class_3151 = class_3151(param1.findChildByName("quest_container"));
         var _loc4_:class_3151 = class_3151(param1.findChildByName("entry_arrows_cont"));
         _loc5_.height = _loc6_.height;
         param1.height = _loc6_.height;
         _loc4_.x = _loc5_.x + _loc5_.width - 2;
         _loc4_.y = Math.floor((_loc5_.height - _loc4_.height) / 2) + 1;
         _loc5_.findChildByName("completion_txt").y = _loc5_.height - 30;
         var _loc3_:class_3127 = _loc5_.findChildByName("bg_bottom");
         _loc3_.height = Math.floor((_loc5_.height - 2 * 2) / 2);
         _loc3_.y = 2 + _loc3_.height;
      }
      
      public function refreshEntryDetails(param1:class_3151, param2:class_1605) : void
      {
         param1.findChildByName("campaign_header_txt").caption = _questEngine.getCampaignName(param2);
         param1.findChildByName("completion_txt").caption = param2.completedQuestsInCampaign + "/" + param2.questCountInCampaign;
         _questEngine.setupCampaignImage(param1,param2,true);
         setColor(param1,"bg",param2.accepted,4290944315,4284769380);
         setColor(param1,"bg_top",param2.accepted,4294956936,4290427578);
         setColor(param1,"bg_bottom",param2.accepted,4294952792,4289440683);
         param1.findChildByName("completion_bg_red_bitmap").visible = !param2.completedCampaign && param2.completedQuestsInCampaign < 1;
         param1.findChildByName("completion_bg_blue_bitmap").visible = !param2.completedCampaign && param2.completedQuestsInCampaign > 0;
         param1.findChildByName("completion_bg_green_bitmap").visible = param2.completedCampaign;
         param1.findChildByName("arrow_0").visible = !param2.accepted;
         param1.findChildByName("arrow_1").visible = param2.accepted;
         param1.findChildByName("quest_container").visible = !param2.completedCampaign;
         param1.findChildByName("campaign_completed_container").visible = param2.completedCampaign;
         if(!param2.completedCampaign)
         {
            this.refreshEntryQuestDetails(class_3151(param1.findChildByName("quest_container")),param2);
            refreshDelay(param1,param2);
         }
      }
      
      private function refreshEntryQuestDetails(param1:class_3151, param2:class_1605) : void
      {
         param1.findChildByName("quest_header_txt").caption = _questEngine.getQuestRowTitle(param2);
         param1.findChildByName("desc_txt").caption = _questEngine.getQuestDesc(param2);
         param1.findChildByName("cancel_txt").visible = param2.accepted;
         param1.findChildByName("cancel_region").visible = param2.accepted;
         param1.findChildByName("accept_button").visible = !param2.accepted;
         param1.findChildByName("accept_button").id = param2.id;
         setColor(param1,null,param2.accepted,15982264,13158600);
         setColor(param1,"quest_header",param2.accepted,15577658,9276813);
         ITextWindow(param1.findChildByName("quest_header_txt")).textColor = param2.accepted ? 4294967295 : 4281808695;
         _questEngine.setupQuestImage(param1,param2);
         _questEngine.refreshReward(param2.waitPeriodSeconds < 1,param1,param2.activityPointType,param2.rewardCurrencyAmount);
         param1.findChildByName("delay_desc_txt").visible = param2.waitPeriodSeconds > 0;
         param1.findChildByName("delay_txt").visible = param2.waitPeriodSeconds > 0;
         param1.findChildByName("desc_txt").visible = param2.waitPeriodSeconds < 1;
      }
      
      public function refreshDelay(param1:class_3151, param2:class_1605) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(param1.findChildByName("delay_desc_txt").visible)
         {
            _loc3_ = param2.waitPeriodSeconds;
            if(_loc3_ <= 0)
            {
               this.refreshEntryQuestDetails(param1,param2);
               return true;
            }
            _loc4_ = FriendlyTime.getFriendlyTime(_questEngine.localization,_loc3_);
            param1.findChildByName("delay_txt").caption = _loc4_;
         }
         return false;
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:* = false;
         if(param1.type == "WME_CLICK")
         {
            close();
            _loc3_ = _questEngine.getInteger("new.identity",0) > 0;
            if(_loc3_ && _showToolbarNotification && !var_3466)
            {
               _showToolbarNotification = false;
               _questEngine.habboHelp.showWelcomeScreen("HTIE_ICON_QUESTS","quests.rejectnotification",0);
            }
         }
      }
      
      private function onAcceptQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:int = param2.id;
         class_14.log("Accept quest: " + _loc3_);
         _questEngine.send(new class_450(_loc3_));
         _window.visible = false;
      }
      
      private function onCancelQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         class_14.log("Reject quest");
         _questEngine.send(new class_920());
      }
      
      private function setColor(param1:class_3151, param2:String, param3:Boolean, param4:uint, param5:uint) : void
      {
         (param2 == null ? param1 : param1.findChildByName(param2)).color = param3 ? param4 : param5;
      }
      
      public function onAlert(param1:class_3132, param2:class_3134) : void
      {
         if(param2.type == "WE_OK" || param2.type == "WE_CANCEL")
         {
            param1.dispose();
         }
      }
      
      public function update(param1:uint) : void
      {
         if(_window == null || true)
         {
            return;
         }
         _msecsToRefresh -= param1;
         if(_msecsToRefresh > 0)
         {
            return;
         }
         _msecsToRefresh = 1000;
         refresh(true);
      }
   }
}
