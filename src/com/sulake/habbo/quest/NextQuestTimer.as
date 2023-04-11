package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.FriendlyTime;
   import package_83.class_1605;
   
   public class NextQuestTimer implements class_13
   {
      
      public static const REFRESH_PERIOD_IN_MSECS:int = 1000;
      
      private static const TOOLBAR_EXTENSION_ID:String = "next_quest";
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var var_363:class_1605;
      
      private var _window:class_3151;
      
      private var _expanded:Boolean = false;
      
      private var _msecsToRefresh:int;
      
      public function NextQuestTimer(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         super();
         _questEngine = param1;
      }
      
      public function dispose() : void
      {
         if(_questEngine)
         {
            _questEngine.toolbar.extensionView.detachExtension("next_quest");
         }
         _questEngine = null;
         var_363 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine == null;
      }
      
      public function onQuestCancelled() : void
      {
         var_363 = null;
         close();
      }
      
      public function onRoomExit() : void
      {
         if(_window != null && false)
         {
            _window.findChildByName("more_info_region").visible = false;
            _window.findChildByName("more_info_txt").visible = false;
         }
      }
      
      public function onQuest(param1:class_1605) : void
      {
         if(param1.waitPeriodSeconds < 1)
         {
            close();
            return;
         }
         var_363 = param1;
         prepareWindow();
         refreshVisibility();
         this._window.visible = true;
         _questEngine.toolbar.extensionView.attachExtension("next_quest",_window);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3151(_questEngine.getXmlWindow("NextQuestTimer"));
         _window.x = 0;
         _window.y = 0;
         _window.findChildByName("more_info_region").procedure = onMoreInfo;
         _window.findChildByName("quest_timer_expanded").procedure = onToggleExpanded;
         _window.findChildByName("quest_timer_contracted").procedure = onToggleExpanded;
         refreshVisibility();
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         if(_loc1_ < 1)
         {
            close();
            var_363.waitPeriodSeconds = 0;
            _questEngine.questController.onQuest(var_363);
         }
         var _loc3_:String = FriendlyTime.getFriendlyTime(_questEngine.localization,_loc1_);
         var _loc2_:String = var_363.getCampaignLocalizationKey() + ".delayedmsg";
         _questEngine.localization.registerParameter("quests.nextquesttimer.caption.contracted","time",_loc3_);
         _questEngine.localization.registerParameter(_loc2_,"time",_loc3_);
         _window.findChildByName("quest_header_txt").caption = _questEngine.localization.getLocalization("quests.nextquesttimer.caption." + (_expanded ? "expanded" : "contracted"));
         _window.findChildByName("desc_txt").caption = _questEngine.localization.getLocalization(_loc2_,_loc2_);
      }
      
      private function refreshVisibility() : void
      {
         _window.findChildByName("quest_timer_expanded").visible = _expanded;
         _window.findChildByName("quest_timer_contracted").visible = !_expanded;
         _window.findChildByName("more_info_txt").visible = _expanded && false;
         _window.findChildByName("more_info_region").visible = _expanded && false;
         _window.findChildByName("quest_pic_bitmap").visible = _expanded;
         _window.findChildByName("desc_txt").visible = _expanded;
         refresh();
      }
      
      private function onMoreInfo(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.questController.questDetails.showDetails(var_363);
         }
      }
      
      private function onToggleExpanded(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _expanded = !_expanded;
            refreshVisibility();
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
         refresh();
      }
      
      private function getDefaultLocationX() : int
      {
         return 0;
      }
      
      public function isVisible() : Boolean
      {
         return _window && false;
      }
      
      public function close() : void
      {
         if(_window != null && false)
         {
            _window.visible = false;
            _questEngine.toolbar.extensionView.detachExtension("next_quest");
         }
      }
      
      private function setQuestImageVisible(param1:Boolean) : void
      {
         _window.findChildByName("quest_pic_bitmap").visible = param1;
      }
   }
}
