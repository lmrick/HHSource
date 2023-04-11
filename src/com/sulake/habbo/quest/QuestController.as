package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.habbo.quest.seasonalcalendar.MainWindow;
   import package_83.class_1605;
   
   public class QuestController implements class_13, class_41
   {
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var var_2060:com.sulake.habbo.quest.QuestsList;
      
      private var _questDetails:com.sulake.habbo.quest.QuestDetails;
      
      private var var_2128:com.sulake.habbo.quest.QuestCompleted;
      
      private var var_1888:com.sulake.habbo.quest.QuestTracker;
      
      private var var_2248:com.sulake.habbo.quest.NextQuestTimer;
      
      private var var_1911:MainWindow;
      
      public function QuestController(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         super();
         _questEngine = param1;
         var_1888 = new com.sulake.habbo.quest.QuestTracker(_questEngine);
         var_2060 = new com.sulake.habbo.quest.QuestsList(_questEngine);
         _questDetails = new com.sulake.habbo.quest.QuestDetails(_questEngine);
         var_2128 = new com.sulake.habbo.quest.QuestCompleted(_questEngine);
         var_2248 = new com.sulake.habbo.quest.NextQuestTimer(_questEngine);
         var_1911 = new MainWindow(_questEngine);
      }
      
      public function onToolbarClick() : void
      {
         if(_questEngine.isSeasonalCalendarEnabled())
         {
            var_1911.onToolbarClick();
            var_2060.close();
         }
         else
         {
            var_2060.onToolbarClick();
         }
      }
      
      public function onQuest(param1:class_1605) : void
      {
         var_1888.onQuest(param1);
         _questDetails.onQuest(param1);
         var_2128.onQuest(param1);
         var_2248.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:class_1605, param2:Boolean) : void
      {
         var_1888.onQuestCompleted(param1,param2);
         _questDetails.onQuestCompleted(param1);
         var_2128.onQuestCompleted(param1,param2);
      }
      
      public function onQuestCancelled() : void
      {
         var_1888.onQuestCancelled();
         _questDetails.onQuestCancelled();
         var_2128.onQuestCancelled();
         var_2248.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         var_1888.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         var_2060.onRoomExit();
         var_1911.onRoomExit();
         var_1888.onRoomExit();
         _questDetails.onRoomExit();
         var_2248.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         var_2128.update(param1);
         var_1888.update(param1);
         var_2248.update(param1);
         var_2060.update(param1);
         _questDetails.update(param1);
         var_1911.update(param1);
      }
      
      public function dispose() : void
      {
         _questEngine = null;
         if(var_2060)
         {
            var_2060.dispose();
            var_2060 = null;
         }
         if(var_1888)
         {
            var_1888.dispose();
            var_1888 = null;
         }
         if(_questDetails)
         {
            _questDetails.dispose();
            _questDetails = null;
         }
         if(var_2128)
         {
            var_2128.dispose();
            var_2128 = null;
         }
         if(var_2248)
         {
            var_2248.dispose();
            var_2248 = null;
         }
         if(var_1911)
         {
            var_1911.dispose();
            var_1911 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine == null;
      }
      
      public function get questsList() : com.sulake.habbo.quest.QuestsList
      {
         return var_2060;
      }
      
      public function get questDetails() : com.sulake.habbo.quest.QuestDetails
      {
         return _questDetails;
      }
      
      public function get questTracker() : com.sulake.habbo.quest.QuestTracker
      {
         return var_1888;
      }
      
      public function get seasonalCalendarWindow() : MainWindow
      {
         return var_1911;
      }
      
      public function onActivityPoints(param1:int, param2:int) : void
      {
         if(var_1911)
         {
            var_1911.onActivityPoints(param1,param2);
         }
      }
   }
}
