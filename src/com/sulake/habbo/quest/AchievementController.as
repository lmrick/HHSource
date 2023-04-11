package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.quest.events.UnseenAchievementsCountUpdateEvent;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import package_101.class_1614;
   import package_119.class_1029;
   import package_49.class_898;
   
   public class AchievementController implements class_13, class_41
   {
      
      private static const CATEGORIES_COLUMN_COUNT:int = 3;
      
      private static const CATEGORY_SPACING_X:int = 8;
      
      private static const CATEGORY_SPACING_Y:int = 5;
      
      private static const CATEGORY_SPACING_TOP:int = 6;
      
      private static const CATEGORY_ROWS_MAX:int = 3;
      
      private static const ACHIEVEMENT_ROWS_MIN:int = 2;
      
      private static const ACHIEVEMENT_ROWS_MAX:int = 4;
      
      private static const ACHIEVEMENT_COLUMNS:int = 6;
      
      private static const IN_LEVEL_PROGRESS_BAR_WIDTH:int = 180;
      
      private static const TOTAL_PROGRESS_BAR_WIDTH:int = 246;
      
      private static const const_861:uint = 12910463;
      
      private static const const_493:int = 45;
      
      private static const IN_LEVEL_PROGRESS_BAR_LOC:Point = new Point(115,93);
      
      private static const TOTAL_PROGRESS_BAR_LOC:Point = new Point(72,1);
      
      private static const const_1144:int = 20;
      
      private static const ACHIEVEMENT_TOP_SPACING:int = 3;
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var _window:class_3281;
      
      private var var_1999:class_3151;
      
      private var var_2599:class_3151;
      
      private var var_1870:class_3151;
      
      private var var_2519:class_3151;
      
      private var var_2768:class_3151;
      
      private var var_1298:com.sulake.habbo.quest.AchievementCategories;
      
      private var var_774:com.sulake.habbo.quest.AchievementCategory;
      
      private var var_501:class_1614;
      
      private var var_2026:Timer;
      
      private var var_3340:Dictionary;
      
      private var var_2168:com.sulake.habbo.quest.ProgressBar;
      
      private var var_2349:com.sulake.habbo.quest.ProgressBar;
      
      private var var_2963:String = null;
      
      private var var_3097:class_1614;
      
      private var var_2409:Timer;
      
      private var var_2273:Dictionary;
      
      private var var_3201:Boolean;
      
      private var var_1902:Dictionary;
      
      public function AchievementController(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         var_3340 = new Dictionary();
         var_2273 = new Dictionary();
         var_1902 = new Dictionary();
         super();
         _questEngine = param1;
         var_2026 = new Timer(100,1);
         var_2026.addEventListener("timer",doBadgeRefresh);
         var_2409 = new Timer(2000,1);
         var_2409.addEventListener("timer",switchIntoPendingLevel);
         var_2273[16] = 1;
         var_2273[28] = 6;
         var_2273[38] = 4;
         var_2273[39] = 3;
         var_2273[40] = 1;
      }
      
      public static function moveAllChildrenToColumn(param1:class_3151, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:class_3127 = null;
         while(_loc4_ < param1.numChildren)
         {
            if((_loc5_ = param1.getChildAt(_loc4_)) != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      public static function getLowestPoint(param1:class_3151) : int
      {
         var _loc2_:int = 0;
         var _loc4_:class_3127 = null;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.numChildren)
         {
            if((_loc4_ = param1.getChildAt(_loc2_)).visible)
            {
               _loc3_ = Math.max(_loc3_,_loc4_.y + _loc4_.height);
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function dispose() : void
      {
         _questEngine = null;
         var_3340 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_2026)
         {
            var_2026.removeEventListener("timer",doBadgeRefresh);
            var_2026.reset();
            var_2026 = null;
         }
         if(var_2409)
         {
            var_2409.removeEventListener("timer",switchIntoPendingLevel);
            var_2409.reset();
            var_2409 = null;
         }
         if(var_2168)
         {
            var_2168.dispose();
            var_2168 = null;
         }
         if(var_2349)
         {
            var_2349.dispose();
            var_2349 = null;
         }
         var_1999 = null;
         var_1870 = null;
         var_1870 = null;
         var_2519 = null;
         var_2768 = null;
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
         var_1902 = new Dictionary();
         broadcastUnseenAchievementsCount();
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function broadcastUnseenAchievementsCount() : void
      {
         var _loc2_:int = 0;
         for each(var _loc1_ in var_1902)
         {
            if(!isSkippedForUnseenBroadcast(_loc1_.badgeId))
            {
               _loc2_++;
            }
         }
         _questEngine.events.dispatchEvent(new UnseenAchievementsCountUpdateEvent(_loc2_));
      }
      
      public function onRoomExit() : void
      {
         this.close();
      }
      
      public function onToolbarClick() : void
      {
         if(isVisible())
         {
            close();
         }
         else
         {
            show();
         }
      }
      
      public function ensureAchievementsInitialized() : void
      {
         if(var_1298 == null)
         {
            _questEngine.send(new class_1029());
         }
      }
      
      public function show() : void
      {
         if(var_1298 == null)
         {
            _questEngine.send(new class_1029());
            var_3201 = true;
         }
         else
         {
            refresh();
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function onAchievements(param1:Array, param2:String) : void
      {
         if(var_1298 == null)
         {
            var_1298 = new com.sulake.habbo.quest.AchievementCategories(param1);
         }
         if(!var_3201)
         {
            return;
         }
         var_3201 = false;
         refresh();
         this._window.visible = true;
         this._window.activate();
         var _loc3_:String = var_2963 == null ? param2 : var_2963;
         var _loc4_:com.sulake.habbo.quest.AchievementCategory;
         if((_loc4_ = var_1298.getCategoryByCode(_loc3_)) != null)
         {
            pickCategory(_loc4_);
            var_2963 = null;
         }
      }
      
      public function onAchievement(param1:class_1614) : void
      {
         var _loc2_:Boolean = false;
         if(var_1298 != null)
         {
            _loc2_ = var_501 && var_501.achievementId == param1.achievementId;
            if(!_loc2_ && !(param1.achievementId in var_1902))
            {
               var_1902[param1.achievementId] = param1;
               broadcastUnseenAchievementsCount();
            }
            if(_loc2_ && param1.level > var_501.level)
            {
               var_501.setMaxProgress();
               var_3097 = param1;
               var_2409.start();
            }
            else
            {
               var_1298.update(param1);
               if(_loc2_)
               {
                  var_501 = param1;
               }
            }
            if(_window && false)
            {
               refresh();
            }
         }
      }
      
      private function getCategoryUnseenCount(param1:String) : int
      {
         var _loc3_:int = 0;
         for each(var _loc2_ in var_1902)
         {
            if(_loc2_.category == param1)
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshCategoryList();
         refreshCategoryListFooter();
         refreshAchievementsHeader();
         refreshAchievementList();
         refreshAchievementDetails();
         moveAllChildrenToColumn(_window.content,0,4);
         _window.height = getLowestPoint(_window.content) + 45;
      }
      
      private function refreshCategoryList() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = false;
         if(var_774 != null)
         {
            var_1999.visible = false;
            return;
         }
         var_1999.visible = true;
         var _loc2_:Vector.<com.sulake.habbo.quest.AchievementCategory> = var_1298.categoryList;
         _loc3_ = 0;
         while(true)
         {
            if(_loc3_ < _loc2_.length)
            {
               refreshCategoryEntry(_loc3_,_loc2_[_loc3_]);
            }
            else
            {
               _loc1_ = refreshCategoryEntry(_loc3_,null);
               if(_loc1_)
               {
                  break;
               }
            }
            _loc3_++;
         }
         var_1999.height = getLowestPoint(var_1999);
      }
      
      private function refreshCategoryListFooter() : void
      {
         if(var_774 != null)
         {
            var_2768.visible = false;
            return;
         }
         var_2768.visible = true;
         var_2349.refresh(var_1298.getProgress(),var_1298.getMaxProgress(),0,0);
      }
      
      private function refreshAchievementList() : void
      {
         var _loc5_:int = 0;
         var _loc3_:Boolean = false;
         var _loc2_:class_3127 = _window.findChildByName("achievements_list");
         if(var_774 == null)
         {
            _loc2_.visible = false;
            return;
         }
         _loc2_.visible = true;
         class_14.log("undefined has " + var_774.achievements.length + " achievemenets");
         var _loc4_:Vector.<class_1614> = var_774.achievements;
         while(false)
         {
            var_2599.removeChildAt(0);
         }
         _loc5_ = 0;
         while(true)
         {
            if(_loc5_ < _loc4_.length)
            {
               refreshAchievementEntry(_loc5_,_loc4_[_loc5_]);
            }
            else
            {
               _loc3_ = refreshAchievementEntry(_loc5_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc5_++;
         }
         var_2599.height = getLowestPoint(var_2599);
         _loc2_.height = NaN;
         _window.findChildByName("achievements_scrollarea").height = _loc2_.height;
         var _loc1_:class_3127 = _window.findChildByName("achievements_scrollbar");
         _loc1_.visible = achievementsNeedScrolling;
         _loc1_.height = _loc2_.height;
      }
      
      private function refreshAchievementsHeader() : void
      {
         if(var_774 == null)
         {
            var_2519.visible = false;
            return;
         }
         var_2519.visible = true;
         var_2519.findChildByName("category_name_txt").caption = _questEngine.getAchievementCategoryName(var_774.code);
         _questEngine.localization.registerParameter("achievements.details.categoryprogress","progress",var_774.getProgress().toString());
         _questEngine.localization.registerParameter("achievements.details.categoryprogress","limit",var_774.getMaxProgress().toString());
         _questEngine.setupAchievementCategoryImage(var_2519,var_774,false);
      }
      
      private function refreshAchievementDetails() : void
      {
         if(var_501 == null)
         {
            var_1870.visible = false;
            return;
         }
         var_1870.visible = true;
         var _loc2_:String = getAchievedBadgeId(var_501);
         var_1870.findChildByName("achievement_name_txt").caption = _questEngine.localization.getBadgeName(_loc2_);
         var _loc1_:String = String(_questEngine.localization.getBadgeDesc(_loc2_));
         var_1870.findChildByName("achievement_desc_txt").caption = _loc1_ == null ? "" : _loc1_;
         _questEngine.localization.registerParameter("achievements.details.level","level",var_501.finalLevel ? var_501.level.toString() : -1.toString());
         _questEngine.localization.registerParameter("achievements.details.level","limit",var_501.levelCount.toString());
         _questEngine.refreshReward(true,var_1870,var_501.levelRewardPointType,var_501.levelRewardPoints);
         refreshBadgeImageLarge(var_1870,var_501);
         var_2168.refresh(var_501.currentPoints,var_501.scoreLimit,NaN,var_501.scoreAtStartOfLevel);
         var_2168.visible = true;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3281(_questEngine.getXmlWindow("Achievements"));
         _window.findChildByTag("close").procedure = onWindowClose;
         _window.findChildByName("back_button").procedure = onBack;
         _window.center();
         _window.y = 20;
         var_1999 = class_3151(_window.findChildByName("categories_cont"));
         var_2519 = class_3151(_window.findChildByName("achievements_header_cont"));
         var_2599 = class_3151(_window.findChildByName("achievements_cont"));
         var_1870 = class_3151(_window.findChildByName("achievement_cont"));
         var_2768 = class_3151(_window.findChildByName("categories_footer_cont"));
         var_2168 = new com.sulake.habbo.quest.ProgressBar(_questEngine,var_1870,180,"achievements.details.progress",true,IN_LEVEL_PROGRESS_BAR_LOC);
         var_2349 = new com.sulake.habbo.quest.ProgressBar(_questEngine,var_2768,246,"achievements.categories.totalprogress",true,TOTAL_PROGRESS_BAR_LOC);
      }
      
      private function refreshCategoryEntry(param1:int, param2:com.sulake.habbo.quest.AchievementCategory) : Boolean
      {
         var _loc5_:int = 0;
         var _loc3_:class_3151 = class_3151(var_1999.getChildByName(param1.toString()));
         var _loc4_:int;
         var _loc6_:* = (_loc4_ = Math.floor(param1 / 3)) < 3;
         if(_loc3_ == null)
         {
            if(param2 == null && !_loc6_)
            {
               return true;
            }
            _loc3_ = class_3151(_questEngine.getXmlWindow("AchievementCategory"));
            _loc3_.name = param1.toString();
            var_1999.addChild(_loc3_);
            _loc3_.findChildByName("category_region").procedure = onSelectCategory;
            _loc3_.x = (_loc3_.width + 8) * (param1 % 3);
            _loc3_.y = (_loc3_.height + 5) * Math.floor(param1 / 3) + 6;
         }
         _loc3_.findChildByName("category_region").id = param1;
         _loc3_.findChildByName("category_region").visible = param2 != null;
         _loc3_.findChildByName("category_bg_inact").visible = param2 == null;
         _loc3_.findChildByName("category_bg_act").visible = param2 != null;
         _loc3_.findChildByName("category_bg_act_hover").visible = false;
         _loc3_.findChildByName("header_txt").visible = param2 != null;
         _loc3_.findChildByName("completion_txt").visible = param2 != null;
         _loc3_.findChildByName("category_pic_bitmap").visible = param2 != null;
         _loc3_.findChildByName("unseen_count_border").visible = false;
         if(param2)
         {
            _loc3_.findChildByName("header_txt").caption = _questEngine.getAchievementCategoryName(param2.code);
            _loc3_.findChildByName("completion_txt").caption = param2.getProgress() + "/" + param2.getMaxProgress();
            _questEngine.setupAchievementCategoryImage(_loc3_,param2,true);
            if((_loc5_ = getCategoryUnseenCount(param2.code)) > 0)
            {
               _loc3_.findChildByName("unseen_count_border").visible = true;
               _loc3_.findChildByName("unseen_count").caption = _loc5_.toString();
            }
            _loc3_.visible = true;
         }
         else
         {
            _loc3_.visible = _loc6_;
         }
         return false;
      }
      
      private function refreshAchievementEntry(param1:int, param2:class_1614) : Boolean
      {
         var _loc5_:int;
         var _loc8_:* = (_loc5_ = param1 / achievementsColumnCount) < 2;
         if(param2 == null && !_loc8_)
         {
            return true;
         }
         var _loc3_:class_3151 = _questEngine.getXmlWindow("Achievement") as class_3151;
         var_2599.addChild(_loc3_);
         _loc3_.x = (_loc3_.width + (achievementsNeedScrolling ? 5 : 0)) * (param1 % achievementsColumnCount);
         class_14.log("Refreshing " + param1 + " where count is " + var_774.achievements.length + ", row=" + _loc5_ + ", column=" + param1 % achievementsColumnCount);
         _loc3_.y = _loc3_.height * _loc5_ + 3;
         _loc3_.findChildByName("bg_region").procedure = onSelectAchievement;
         var _loc6_:class_3127;
         (_loc6_ = _loc3_.findChildByName("bg_region")).id = param1;
         _loc6_.visible = param2 != null;
         var _loc4_:class_3127 = _loc3_.findChildByName("bg_unselected_bitmap");
         var _loc7_:class_3127 = _loc3_.findChildByName("bg_selected_bitmap");
         this.refreshBadgeImage(_loc3_,param2);
         _loc4_.color = param2 != null && param2.achievementId in var_1902 ? 12910463 : 16777215;
         if(param2)
         {
            _loc4_.visible = param2 != var_501;
            _loc7_.visible = param2 == var_501;
            _loc3_.visible = true;
         }
         else if(_loc8_)
         {
            _loc7_.visible = false;
            _loc4_.visible = true;
            _loc3_.visible = true;
         }
         else
         {
            _loc3_.visible = false;
         }
         return false;
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
         }
      }
      
      private function onSelectCategory(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = param2.id;
         class_14.log("Category index: " + _loc3_);
         if(param1.type == "WME_CLICK")
         {
            pickCategory(var_1298.categoryList[_loc3_]);
         }
         else if(param1.type == "WME_OUT")
         {
            refreshMouseOver(-999);
         }
         else if(param1.type == "WME_OVER")
         {
            refreshMouseOver(_loc3_);
         }
      }
      
      private function pickCategory(param1:com.sulake.habbo.quest.AchievementCategory) : void
      {
         var_774 = param1;
         var_501 = var_774.achievements[0];
         class_14.log("Category: undefined");
         this.refresh();
         _questEngine.send(new class_898("Achievements",var_774.code,"Category selected"));
      }
      
      public function selectCategoryInternalLink(param1:String) : void
      {
         var _loc2_:com.sulake.habbo.quest.AchievementCategory = var_1298 != null ? var_1298.getCategoryByCode(param1) : null;
         if(_loc2_ != null)
         {
            pickCategory(_loc2_);
         }
         else
         {
            var_2963 = param1;
         }
      }
      
      private function refreshMouseOver(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = false;
         var _loc3_:class_3151 = null;
         var _loc5_:class_3127 = null;
         _loc4_ = 0;
         while(_loc4_ < var_1999.numChildren)
         {
            _loc2_ = _loc4_ == param1;
            _loc3_ = class_3151(var_1999.getChildAt(_loc4_));
            _loc3_.findChildByName("category_bg_act").visible = !_loc2_ && _loc4_ < var_1298.categoryList.length;
            _loc3_.findChildByName("category_bg_act_hover").visible = _loc2_;
            (_loc5_ = _loc3_.findChildByName("hover_container")).x = _loc2_ ? 0 : 1;
            _loc5_.y = _loc2_ ? 0 : 1;
            _loc4_++;
         }
      }
      
      private function onSelectAchievement(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:int = param2.id;
         var_501 = var_774.achievements[_loc3_];
         this.refresh();
         _questEngine.send(new class_898("Achievements",var_501.achievementId.toString(),"Achievement selected"));
      }
      
      private function onBack(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(var_774 != null)
         {
            _loc4_ = [];
            for each(_loc3_ in var_1902)
            {
               if(_loc3_.category != var_774.code)
               {
                  _loc4_.push(_loc3_);
               }
            }
            var_1902 = new Dictionary();
            for each(_loc3_ in _loc4_)
            {
               var_1902[_loc3_.achievementId] = _loc3_;
            }
            broadcastUnseenAchievementsCount();
         }
         var_774 = null;
         var_501 = null;
         this.refresh();
      }
      
      private function refreshBadgeImage(param1:class_3151, param2:class_1614) : void
      {
         var _loc4_:class_3217;
         var _loc3_:class_3366 = (_loc4_ = param1.findChildByName("achievement_pic_bitmap") as class_3217).widget as class_3366;
         if(param2 == null)
         {
            _loc4_.visible = false;
            return;
         }
         IStaticBitmapWrapperWindow(class_3151(_loc4_.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
         _loc3_.badgeId = getAchievedBadgeId(param2);
         _loc3_.greyscale = !param2.firstLevelAchieved;
         _loc4_.visible = true;
      }
      
      private function refreshBadgeImageLarge(param1:class_3151, param2:class_1614) : void
      {
         var _loc4_:class_3217;
         var _loc3_:class_3366 = (_loc4_ = param1.findChildByName("achievement_pic_bitmap") as class_3217).widget as class_3366;
         IStaticBitmapWrapperWindow(class_3151(_loc4_.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
         _loc3_.badgeId = getAchievedBadgeId(param2);
         _loc3_.greyscale = !param2.firstLevelAchieved;
         _loc4_.visible = true;
      }
      
      private function doBadgeRefresh(param1:TimerEvent) : void
      {
         this.var_2026.reset();
         this.refresh();
      }
      
      private function switchIntoPendingLevel(param1:TimerEvent) : void
      {
         var_501 = var_3097;
         var_1298.update(var_3097);
         var_3097 = null;
         this.refresh();
      }
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         this.var_3340[param1.badgeId] = param1.badgeImage;
         if(!this.var_2026.running)
         {
            this.var_2026.start();
         }
      }
      
      public function update(param1:uint) : void
      {
         if(var_2168 != null)
         {
            var_2168.updateView();
         }
         if(var_2349 != null)
         {
            var_2349.updateView();
         }
      }
      
      private function getAchievedBadgeId(param1:class_1614) : String
      {
         if(param1.levelCount == 1)
         {
            return param1.badgeId;
         }
         return param1.finalLevel ? param1.badgeId : String(_questEngine.localization.getPreviousLevelBadgeId(param1.badgeId));
      }
      
      private function getPositionFix(param1:int) : int
      {
         return !!var_2273[param1] ? var_2273[param1] : 0;
      }
      
      private function get achievementsColumnCount() : int
      {
         if(achievementsNeedScrolling)
         {
            return 5;
         }
         return 6;
      }
      
      private function get achievementsNeedScrolling() : Boolean
      {
         return var_774 != null && var_774.achievements.length > 24;
      }
      
      private function isSkippedForUnseenBroadcast(param1:String) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:Array = _questEngine.getProperty("toolbar.unseen_notification.skipped_badge_ids").split(",");
         for each(var _loc2_ in _loc4_)
         {
            if(param1.search(_loc2_) != -1)
            {
               _loc3_ = true;
               break;
            }
         }
         return _loc3_;
      }
      
      public function getAchievementLevel(param1:String, param2:String) : int
      {
         var _loc4_:com.sulake.habbo.quest.AchievementCategory = null;
         if(var_1298 != null)
         {
            if((_loc4_ = var_1298.getCategoryByCode(param1)) != null)
            {
               for each(var _loc3_ in _loc4_.achievements)
               {
                  if(_loc3_.badgeId.indexOf(param2) == 0)
                  {
                     return _loc3_.finalLevel ? _loc3_.level : Math.max(0,_loc3_.level - 1);
                  }
               }
            }
         }
         return 0;
      }
   }
}
