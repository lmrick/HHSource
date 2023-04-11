package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.habbo.window.widgets.class_3332;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_101.class_1613;
   import package_101.class_1614;
   import package_28.class_1574;
   import package_30.class_162;
   import package_30.class_646;
   
   public class AchievementsResolutionController implements class_13
   {
      
      private static const const_563:String = "header_button_close";
      
      private static const const_526:String = "save_button";
      
      private static const const_813:String = "cancel_button";
      
      private static const const_515:String = "ok_button";
      
      private static const ELEM_DISABLED_INFO:String = "disabled.reason";
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var _window:class_3281;
      
      private var _progressView:com.sulake.habbo.quest.AchievementResolutionProgressView;
      
      private var _completedView:com.sulake.habbo.quest.AchievementResolutionCompletedView;
      
      private var _stuffId:int;
      
      private var var_246:Vector.<class_1613>;
      
      private var _selectedAchievementId:int = -1;
      
      private var _endTime:int = -1;
      
      public function AchievementsResolutionController(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         super();
         _questEngine = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:IItemGridWindow = null;
         _questEngine = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("achievements") as IItemGridWindow;
            if(_loc1_)
            {
               _loc1_.destroyGridItems();
            }
            if(_progressView)
            {
               _progressView.dispose();
               _progressView = null;
            }
            if(_completedView)
            {
               _completedView.dispose();
               _completedView = null;
            }
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine == null;
      }
      
      public function onResolutionAchievements(param1:int, param2:Vector.<class_1613>, param3:int) : void
      {
         _stuffId = param1;
         var_246 = param2;
         _endTime = param3;
         if(param2.length == 0)
         {
            return;
         }
         refresh();
         _window.visible = true;
         _selectedAchievementId = var_246[0].achievementId;
         populateAchievementGrid();
         selectAchievement(_selectedAchievementId);
      }
      
      public function onResolutionProgress(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int) : void
      {
         if(!_progressView)
         {
            _progressView = new com.sulake.habbo.quest.AchievementResolutionProgressView(this);
         }
         _progressView.show(param1,param2,param3,param4,param5,param6);
      }
      
      public function onResolutionCompleted(param1:String, param2:String) : void
      {
         if(!_completedView)
         {
            _completedView = new com.sulake.habbo.quest.AchievementResolutionCompletedView(this);
         }
         _completedView.show(param2,param1);
      }
      
      public function onLevelUp(param1:class_1574) : void
      {
         if(_progressView && false && param1.type == _progressView.achievementId)
         {
            _questEngine.send(new class_646(_progressView.stuffId,0));
         }
      }
      
      public function onAchievement(param1:class_1614) : void
      {
         if(_progressView && false && param1.achievementId == _progressView.achievementId)
         {
            _questEngine.send(new class_646(_progressView.stuffId,0));
         }
      }
      
      public function resetResolution(param1:int) : void
      {
         var title:String;
         var summary:String;
         var stuffId:int = param1;
         if(_progressView && false && stuffId == _progressView.stuffId)
         {
            title = "${resolution.reset.confirmation.title}";
            summary = "${resolution.reset.confirmation.text}";
            _questEngine.windowManager.confirm(title,summary,0,function(param1:class_3216, param2:class_3134):void
            {
               param1.dispose();
               if(param2.type == "WE_OK")
               {
                  _questEngine.send(new class_162(stuffId));
                  _questEngine.send(new class_646(_progressView.stuffId,0));
               }
            });
         }
      }
      
      private function refresh() : void
      {
         if(_window == null)
         {
            prepareWindow();
         }
         var _loc1_:class_3217 = class_3217(_window.findChildByName("countdown_widget"));
         var _loc2_:class_3332 = class_3332(_loc1_.widget);
         _loc2_.seconds = _endTime;
         _loc2_.running = true;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3281(_questEngine.getXmlWindow("AchievementsResolutions"));
         _window.findChildByTag("close").procedure = onWindowClose;
         _window.center();
         _window.visible = true;
         addClickListener("header_button_close");
         addClickListener("save_button");
         addClickListener("cancel_button");
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
         }
      }
      
      private function addClickListener(param1:String) : void
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseClick);
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         var title:String;
         var summary:String;
         var event:WindowMouseEvent = param1;
         switch(event.target.name)
         {
            case "header_button_close":
            case "cancel_button":
               close();
               break;
            case "ok_button":
               break;
            case "save_button":
               title = "${resolution.confirmation.title}";
               summary = "${resolution.confirmation.text}";
               close();
               _questEngine.windowManager.confirm(title,summary,0,function(param1:class_3216, param2:class_3134):void
               {
                  param1.dispose();
                  if(param2.type == "WE_OK")
                  {
                     _questEngine.send(new class_646(_stuffId,_selectedAchievementId));
                  }
                  else
                  {
                     _window.visible = true;
                  }
               });
         }
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
      
      private function populateAchievementGrid() : void
      {
         var _loc3_:class_3151 = null;
         var _loc2_:IItemGridWindow = _window.findChildByName("achievements") as IItemGridWindow;
         _loc2_.destroyGridItems();
         var _loc4_:class_3127 = _questEngine.getXmlWindow("AchievementSimple");
         for each(var _loc1_ in var_246)
         {
            _loc3_ = _loc4_.clone() as class_3151;
            _loc3_.id = _loc1_.achievementId;
            refreshBadgeImage(_loc3_,_loc1_);
            _loc3_.findChildByName("bg_region").procedure = onSelectAchievementProc;
            _loc3_.findChildByName("bg_selected_bitmap").visible = false;
            _loc2_.addGridItem(_loc3_);
         }
      }
      
      private function hiliteGridItem(param1:int, param2:Boolean) : void
      {
         var _loc4_:IItemGridWindow;
         var _loc3_:class_3151 = (_loc4_ = _window.findChildByName("achievements") as IItemGridWindow).getGridItemByID(param1) as class_3151;
         if(_loc3_)
         {
            _loc3_.findChildByName("bg_selected_bitmap").visible = param2;
         }
      }
      
      private function selectAchievement(param1:int) : void
      {
         if(_selectedAchievementId != -1)
         {
            hiliteGridItem(_selectedAchievementId,false);
         }
         var _loc2_:class_1613 = findAchievement(param1);
         if(_loc2_ == null)
         {
            return;
         }
         _selectedAchievementId = param1;
         hiliteGridItem(_selectedAchievementId,true);
         _window.findChildByName("achievement.name").caption = _questEngine.localization.getBadgeName(_loc2_.badgeId);
         _window.findChildByName("achievement.description").caption = _questEngine.localization.getBadgeDesc(_loc2_.badgeId);
         _window.findChildByName("achievement.level").caption = _loc2_.level.toString();
         _questEngine.localization.registerParameter("resolution.achievement.target.value","level",_loc2_.requiredLevel.toString());
         refreshBadgeImageLarge(_loc2_);
         _loc2_.enabled ? enable() : disable(_loc2_.state);
      }
      
      private function disable(param1:int) : void
      {
         _window.setVisibleChildren(false,["save_button"]);
         _window.setVisibleChildren(true,["disabled.reason"]);
         _window.findChildByName("disabled.reason").caption = "${resolution.disabled." + param1 + "}";
      }
      
      public function enable() : void
      {
         _window.setVisibleChildren(true,["save_button"]);
         _window.setVisibleChildren(false,["disabled.reason"]);
      }
      
      private function onSelectAchievementProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         selectAchievement(param2.parent.id);
      }
      
      private function refreshBadgeImage(param1:class_3151, param2:class_1613) : void
      {
         var _loc4_:class_3217;
         var _loc3_:class_3366 = (_loc4_ = param1.findChildByName("achievement_pic_bitmap") as class_3217).widget as class_3366;
         if(param2 == null)
         {
            _loc4_.visible = false;
            return;
         }
         IStaticBitmapWrapperWindow(class_3151(_loc4_.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
         _loc3_.badgeId = param2.badgeId;
         _loc3_.greyscale = !param2.enabled;
         _loc4_.visible = true;
      }
      
      private function refreshBadgeImageLarge(param1:class_1613) : void
      {
         var _loc3_:class_3217 = _window.findChildByName("achievement_badge") as class_3217;
         var _loc2_:class_3366 = _loc3_.widget as class_3366;
         IStaticBitmapWrapperWindow(class_3151(_loc3_.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
         _loc2_.badgeId = param1.badgeId;
         _loc2_.greyscale = !param1.enabled;
         _loc3_.visible = true;
      }
      
      private function findAchievement(param1:int) : class_1613
      {
         for each(var _loc2_ in var_246)
         {
            if(_loc2_.achievementId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get questEngine() : com.sulake.habbo.quest.HabboQuestEngine
      {
         return _questEngine;
      }
   }
}
