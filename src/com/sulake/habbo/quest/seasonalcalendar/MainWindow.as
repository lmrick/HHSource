package com.sulake.habbo.quest.seasonalcalendar
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.quest.HabboQuestEngine;
   import com.sulake.habbo.quest.events.QuestCompletedEvent;
   import com.sulake.habbo.quest.events.QuestsListEvent;
   import com.sulake.habbo.utils.WindowToggle;
   import package_83.class_1605;
   
   public class MainWindow implements class_13
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _window:class_3281;
      
      private var var_1901:WindowToggle;
      
      private var _calendar:com.sulake.habbo.quest.seasonalcalendar.Calendar;
      
      private var var_2156:com.sulake.habbo.quest.seasonalcalendar.CatalogPromo;
      
      private var var_2548:com.sulake.habbo.quest.seasonalcalendar.RareTeaser;
      
      private var var_4205:Boolean = false;
      
      private var var_289:int;
      
      public function MainWindow(param1:HabboQuestEngine)
      {
         super();
         _questEngine = param1;
         _calendar = new com.sulake.habbo.quest.seasonalcalendar.Calendar(_questEngine,this);
         var_2156 = new com.sulake.habbo.quest.seasonalcalendar.CatalogPromo(_questEngine,this);
         var_2548 = new com.sulake.habbo.quest.seasonalcalendar.RareTeaser(_questEngine);
         _questEngine.events.addEventListener("qe_quests_seasonal",onSeasonalQuests);
         _questEngine.events.addEventListener("qce_seasonal",onSeasonalQuestCompleted);
      }
      
      public function dispose() : void
      {
         if(_questEngine)
         {
            _questEngine.events.removeEventListener("qe_quests_seasonal",onSeasonalQuests);
            _questEngine.events.removeEventListener("qce_seasonal",onSeasonalQuestCompleted);
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
         if(_calendar)
         {
            _calendar.close();
            _calendar.dispose();
            _calendar = null;
         }
         if(var_2156)
         {
            var_2156.dispose();
            var_2156 = null;
         }
         if(var_2548)
         {
            var_2548.dispose();
            var_2548 = null;
         }
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
         if(_calendar)
         {
            _calendar.close();
         }
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
            _questEngine.requestSeasonalQuests();
            return;
         }
         if(!var_1901 || false)
         {
            var_1901 = new WindowToggle(_window,_window.desktop,_questEngine.requestSeasonalQuests,close);
         }
         var_1901.toggle();
      }
      
      public function getCalendarImageGalleryHost() : String
      {
         var _loc1_:String = _questEngine.getSeasonalCampaignCodePrefix();
         return _questEngine.configuration.getProperty("image.library.url") + _loc1_ + "_quest_calendar/";
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         if(!this.isVisible() && !param2)
         {
            return;
         }
         var_289 = resolveCurrentDay(param1);
         _calendar.onQuests(param1);
         refresh();
         if(param2)
         {
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      private function onSeasonalQuests(param1:QuestsListEvent) : void
      {
         this.onQuests(param1.quests,true);
      }
      
      private function onSeasonalQuestCompleted(param1:QuestCompletedEvent) : void
      {
         _questEngine.questController.questTracker.forceWindowCloseAfterAnimationsFinished();
         _questEngine.requestSeasonalQuests();
      }
      
      public function onActivityPoints(param1:int, param2:int) : void
      {
         var_2156.onActivityPoints(param1,param2);
      }
      
      private function resolveCurrentDay(param1:Array) : int
      {
         var _loc2_:int = 0;
         for each(var _loc3_ in param1)
         {
            if(_questEngine.isSeasonalQuest(_loc3_))
            {
               _loc2_ = Math.max(_loc2_,_loc3_.sortOrder);
            }
         }
         return _loc2_;
      }
      
      private function refresh() : void
      {
         prepareWindow();
         _calendar.refresh();
         var_2156.refresh();
         var_2548.refresh();
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3281(_questEngine.getXmlWindow("SeasonalCalendar"));
         var _loc1_:String = "quests." + _questEngine.getSeasonalCampaignCodePrefix() + ".title";
         _window.caption = _questEngine.localization.getLocalizationWithParams(_loc1_,_loc1_);
         _window.findChildByTag("close").procedure = onWindowClose;
         _calendar.prepare(_window);
         var_2156.prepare(_window);
         var_2548.prepare(_window);
         _window.center();
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
         }
      }
      
      public function get currentDay() : int
      {
         return var_289;
      }
      
      public function get catalogPromo() : com.sulake.habbo.quest.seasonalcalendar.CatalogPromo
      {
         return var_2156;
      }
      
      public function update(param1:uint) : void
      {
         if(false && false && !var_4205 && _questEngine.isSeasonalCalendarEnabled())
         {
            _questEngine.requestSeasonalQuests();
            var_4205 = true;
         }
      }
   }
}
