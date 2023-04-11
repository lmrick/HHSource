package com.sulake.habbo.game.snowwar.leaderboard
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextLinkWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import com.sulake.habbo.localization.class_18;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_157.class_1619;
   
   public class LeaderboardViewController implements class_13, class_1870
   {
      
      private static const STATE_FRIENDS_ALLTIME:int = 0;
      
      private static const STATE_ALLTIME:int = 1;
      
      private static const STATE_WEEKLY:int = 2;
      
      private static const STATE_FRIENDS_WEEKLY:int = 3;
      
      private static const STATE_GROUP_WEEKLY:int = 4;
      
      private static const STATE_GROUP_ALLTIME:int = 5;
       
      
      private var var_1451:SnowWarEngine;
      
      private var _localization:class_18;
      
      private var _window:class_3151;
      
      private var _disposed:Boolean;
      
      private var var_159:int;
      
      private var var_19:IItemListWindow;
      
      private var _listBorder:class_3127;
      
      private var var_3451:ITextLinkWindow;
      
      private var var_3367:ITextLinkWindow;
      
      private var var_3263:ITextLinkWindow;
      
      private var _thisWeekButton:class_3282;
      
      private var var_2439:ITextWindow;
      
      private var _allTimeButton:class_3282;
      
      private var var_2964:ITextWindow;
      
      private var var_2257:IRegionWindow;
      
      private var var_2859:IRegionWindow;
      
      private var _nextWeek:IRegionWindow;
      
      private var _previousWeek:IRegionWindow;
      
      private var _weekCaption:String;
      
      private var _minutesUntilWeeklyReset:int;
      
      private var var_2125:Timer;
      
      private var _avatarPlaceholders:class_24;
      
      private var var_1923:com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable;
      
      private var var_2170:com.sulake.habbo.game.snowwar.leaderboard.TotalLeaderboardTable;
      
      private var var_2075:com.sulake.habbo.game.snowwar.leaderboard.TotalGroupLeaderboardTable;
      
      private var var_1630:com.sulake.habbo.game.snowwar.leaderboard.WeeklyTotalLeaderboardTable;
      
      private var var_1623:com.sulake.habbo.game.snowwar.leaderboard.WeeklyGroupLeaderboardTable;
      
      private var var_1631:com.sulake.habbo.game.snowwar.leaderboard.WeeklyFriendLeaderboardTable;
      
      private var var_3845:Boolean;
      
      private var _selectedGame:int = 0;
      
      public function LeaderboardViewController(param1:SnowWarEngine)
      {
         super();
         var_1451 = param1;
         _localization = param1.localization;
         _avatarPlaceholders = new class_24();
         var_3845 = var_1451.config.getBoolean("games.highscores.scrolling.enabled");
         var_1923 = new com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable(var_1451);
         var_2170 = new com.sulake.habbo.game.snowwar.leaderboard.TotalLeaderboardTable(var_1451);
         var_2075 = new com.sulake.habbo.game.snowwar.leaderboard.TotalGroupLeaderboardTable(var_1451);
         var_1630 = new com.sulake.habbo.game.snowwar.leaderboard.WeeklyTotalLeaderboardTable(var_1451);
         var_1623 = new com.sulake.habbo.game.snowwar.leaderboard.WeeklyGroupLeaderboardTable(var_1451);
         var_1631 = new com.sulake.habbo.game.snowwar.leaderboard.WeeklyFriendLeaderboardTable(var_1451);
         sendGetFriendsAllTimeData();
      }
      
      public function set selectedGame(param1:int) : void
      {
         _selectedGame = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         var_1451 = null;
         var_19 = null;
         _listBorder = null;
         var_3451 = null;
         var_3367 = null;
         var_3263 = null;
         _thisWeekButton = null;
         var_2439 = null;
         _allTimeButton = null;
         var_2964 = null;
         var_2257 = null;
         var_2859 = null;
         _nextWeek = null;
         _previousWeek = null;
         _weekCaption = null;
         _avatarPlaceholders.dispose();
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1923)
         {
            var_1923.dispose();
            var_1923 = null;
         }
         if(var_2170)
         {
            var_2170.dispose();
            var_2170 = null;
         }
         if(var_2075)
         {
            var_2075.dispose();
            var_2075 = null;
         }
         if(var_1630)
         {
            var_1630.dispose();
            var_1630 = null;
         }
         if(var_1623)
         {
            var_1623.dispose();
            var_1623 = null;
         }
         if(var_1631)
         {
            var_1631.dispose();
            var_1631 = null;
         }
         disposeWeeklyResetTimer();
         _disposed = true;
      }
      
      private function disposeWeeklyResetTimer() : void
      {
         if(var_2125 != null)
         {
            var_2125.removeEventListener("timer",onTick);
            var_2125.stop();
            var_2125 = null;
         }
      }
      
      private function startWeeklyResetTimer(param1:int) : void
      {
         var_2125 = new Timer(60000,param1);
         var_2125.addEventListener("timer",onTick);
         var_2125.start();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function enableAllTimeButton() : void
      {
         var_2439.textColor = 0;
         var_2964.textColor = 16777215;
         WindowUtils.setElementImage(_thisWeekButton,getBitmap("left_blue"));
         WindowUtils.setElementImage(_allTimeButton,getBitmap("right_black"));
      }
      
      private function enableThisWeekButton() : void
      {
         var_2439.textColor = 16777215;
         var_2964.textColor = 0;
         WindowUtils.setElementImage(_thisWeekButton,getBitmap("left_black"));
         WindowUtils.setElementImage(_allTimeButton,getBitmap("right_blue"));
      }
      
      public function showFriendsAllTime() : void
      {
         var_159 = 0;
         sendGetFriendsAllTimeData();
         visible = true;
         _window.caption = "${snowwar.leaderboard.friends}";
         enableAllTimeButton();
         updateWeekSelection();
         populateList();
      }
      
      public function showAllTime() : void
      {
         var_159 = 1;
         sendGetAllTimeData();
         visible = true;
         _window.caption = "${snowwar.leaderboard.all}";
         enableAllTimeButton();
         updateWeekSelection();
         populateList();
      }
      
      public function showGroupAllTime() : void
      {
         var_159 = 5;
         sendGetAllTimeGroupData();
         visible = true;
         _window.caption = "${snowwar.leaderboard.all}";
         enableAllTimeButton();
         updateWeekSelection();
         populateList();
      }
      
      public function showWeekly() : void
      {
         var_159 = 2;
         var_1630.offset = 0;
         sendGetWeeklyData(0);
         visible = true;
         _window.caption = "${snowwar.leaderboard.all}";
         enableThisWeekButton();
         updateWeekSelection();
         populateList();
      }
      
      public function showGroupWeekly() : void
      {
         var_159 = 4;
         var_1623.offset = 0;
         sendGetGroupWeeklyData(0);
         visible = true;
         _window.caption = "${snowwar.leaderboard.all}";
         enableThisWeekButton();
         updateWeekSelection();
         populateList();
      }
      
      public function showFriendsWeekly() : void
      {
         var_159 = 3;
         var_1631.offset = 0;
         sendGetFriendsWeeklyData(0);
         visible = true;
         _window.caption = "${snowwar.leaderboard.friends}";
         enableThisWeekButton();
         updateWeekSelection();
         populateList();
      }
      
      public function addAllTimeData(param1:Array, param2:int) : void
      {
         var_2170.addEntries(param1,param2);
         if(var_159 == 1 && visible)
         {
            populateList();
         }
         updateWeekSelection();
      }
      
      public function addAllTimeGroupData(param1:Array, param2:int, param3:int) : void
      {
         var_2075.addGroupEntries(param1,param2,param3);
         if(var_159 == 5 && visible)
         {
            populateList();
         }
         updateWeekSelection();
      }
      
      public function addWeeklyData(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int) : void
      {
         disposeWeeklyResetTimer();
         _minutesUntilWeeklyReset = param6;
         _weekCaption = param1 + "/" + param2;
         var_1630.maxOffset = param5;
         var_1630.addEntries(param3,param4);
         if(var_159 == 2 && visible)
         {
            populateList();
         }
         updateWeekSelection();
      }
      
      public function addWeeklyGroupData(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int, param7:int) : void
      {
         disposeWeeklyResetTimer();
         _minutesUntilWeeklyReset = param6;
         _weekCaption = param1 + "/" + param2;
         var_1623.maxOffset = param5;
         var_1623.addGroupEntries(param3,param4,param7);
         if(var_159 == 4 && visible)
         {
            populateList();
         }
         updateWeekSelection();
      }
      
      public function addFriendAllTimeData(param1:Array, param2:int) : void
      {
         var_1923.addEntries(param1,param2);
         if(var_159 == 0 && visible)
         {
            populateList();
         }
         updateWeekSelection();
      }
      
      public function addFriendWeeklyData(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int) : void
      {
         disposeWeeklyResetTimer();
         _minutesUntilWeeklyReset = param6;
         _weekCaption = param1 + "/" + param2;
         var_1631.maxOffset = param5;
         var_1631.addEntries(param3,param4);
         if(var_159 == 3 && visible)
         {
            populateList();
         }
         updateWeekSelection();
      }
      
      public function hide() : void
      {
         visible = false;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc2_:class_3282 = _avatarPlaceholders.remove(param1);
         if(_loc2_ && !_loc2_.disposed)
         {
            setAvatarImage(_loc2_,param1);
         }
      }
      
      private function sendGetFriendsAllTimeData() : void
      {
         var_1923.revertToDefaultView(_selectedGame);
      }
      
      private function sendGetAllTimeData() : void
      {
         var_2170.revertToDefaultView(_selectedGame);
      }
      
      private function sendGetAllTimeGroupData() : void
      {
         var_2075.revertToDefaultView(_selectedGame);
      }
      
      private function sendGetWeeklyData(param1:int) : void
      {
         var_1630.offset = param1;
         var_1630.revertToDefaultView(_selectedGame);
      }
      
      private function sendGetGroupWeeklyData(param1:int) : void
      {
         var_1623.offset = param1;
         var_1623.revertToDefaultView(_selectedGame);
      }
      
      private function sendGetFriendsWeeklyData(param1:int) : void
      {
         var_1631.offset = param1;
         var_1631.revertToDefaultView(_selectedGame);
      }
      
      private function get visible() : Boolean
      {
         return _window && false;
      }
      
      private function set visible(param1:Boolean) : void
      {
         if(param1 && !_window)
         {
            createMainWindow();
         }
         if(param1)
         {
            _window.visible = true;
            _window.activate();
         }
         else if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function createMainWindow() : void
      {
         var _loc2_:class_3127 = null;
         var _loc1_:class_3127 = null;
         if(!_window)
         {
            _window = WindowUtils.createWindow("snowwar_leaderboard",1) as class_3151;
            _window.center();
            _window.findChildByTag("close").addEventListener("WME_CLICK",onClose);
            var_19 = _window.findChildByName("list") as IItemListWindow;
            _listBorder = _window.findChildByName("listBorder");
            var_3451 = _window.findChildByName("changeView") as ITextLinkWindow;
            var_3451.addEventListener("WME_CLICK",onChangeView);
            var_3367 = _window.findChildByName("changeGroupView") as ITextLinkWindow;
            var_3367.addEventListener("WME_CLICK",onChangeGroupView);
            var_3263 = _window.findChildByName("changeFriendsView") as ITextLinkWindow;
            var_3263.addEventListener("WME_CLICK",onChangeFriendsView);
            _loc2_ = _window.findChildByName("all_time_region");
            _loc2_.addEventListener("WME_DOWN",onAllTimeButtonDown);
            _loc1_ = _window.findChildByName("this_week_region");
            _loc1_.addEventListener("WME_DOWN",onThisWeekButtonDown);
            _allTimeButton = _window.findChildByName("all_time_image") as class_3282;
            _thisWeekButton = _window.findChildByName("this_week_image") as class_3282;
            var_2964 = _window.findChildByName("all_time_text") as ITextWindow;
            var_2439 = _window.findChildByName("this_week_text") as ITextWindow;
            var_2257 = _window.findChildByName("scrollUp") as IRegionWindow;
            addScrollButtonEventListeners(var_2257);
            WindowUtils.setElementImage(var_2257.getChildAt(0),getBitmap("scroll_up_normal"));
            var_2859 = _window.findChildByName("scrollDown") as IRegionWindow;
            addScrollButtonEventListeners(var_2859);
            WindowUtils.setElementImage(var_2859.getChildAt(0),getBitmap("scroll_down_normal"));
            _nextWeek = _window.findChildByName("nextWeek") as IRegionWindow;
            _nextWeek.addEventListener("WME_CLICK",onNextWeekButton);
            _nextWeek.visible = false;
            _previousWeek = _window.findChildByName("previousWeek") as IRegionWindow;
            _previousWeek.addEventListener("WME_CLICK",onPreviousWeekButton);
            _previousWeek.visible = false;
            updateScrollButtons();
            updateWeekSelection();
         }
      }
      
      private function addScrollButtonEventListeners(param1:class_3127) : void
      {
         param1.addEventListener("WME_CLICK",onScrollButton);
         param1.addEventListener("WME_OVER",onScrollButton);
         param1.addEventListener("WME_OUT",onScrollButton);
         param1.addEventListener("WME_DOWN",onScrollButton);
         param1.addEventListener("WME_UP",onScrollButton);
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         hide();
      }
      
      private function onChangeView(param1:WindowMouseEvent) : void
      {
         switch(var_159 - 1)
         {
            case 0:
               showAllTime();
               break;
            case 1:
               showWeekly();
               break;
            default:
               var_159 = 2;
               showWeekly();
         }
      }
      
      private function onChangeFriendsView(param1:WindowMouseEvent) : void
      {
         switch(var_159)
         {
            case 0:
               showFriendsAllTime();
               break;
            case 3:
               showFriendsWeekly();
               break;
            default:
               var_159 = 3;
               showFriendsWeekly();
         }
      }
      
      private function onChangeGroupView(param1:WindowMouseEvent) : void
      {
         switch(var_159 - 4)
         {
            case 0:
               showGroupWeekly();
               break;
            case 1:
               showGroupAllTime();
               break;
            default:
               var_159 = 4;
               showGroupWeekly();
         }
      }
      
      private function onAllTimeButtonDown(param1:WindowMouseEvent) : void
      {
         switch(var_159 - 2)
         {
            case 0:
               showAllTime();
               break;
            case 1:
               showFriendsAllTime();
               break;
            case 2:
               showGroupAllTime();
         }
      }
      
      private function onThisWeekButtonDown(param1:WindowMouseEvent) : void
      {
         switch(var_159)
         {
            case 0:
               showFriendsWeekly();
               break;
            case 1:
               showWeekly();
               break;
            case 5:
               showGroupWeekly();
         }
      }
      
      private function getCurrentLeaderboard() : com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable
      {
         var _loc1_:com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable = null;
         switch(var_159)
         {
            case 0:
               _loc1_ = var_1923;
               break;
            case 1:
               _loc1_ = var_2170;
               break;
            case 2:
               _loc1_ = var_1630;
               break;
            case 3:
               _loc1_ = var_1631;
               break;
            case 4:
               _loc1_ = var_1623;
               break;
            case 5:
               _loc1_ = var_2075;
               break;
            default:
               HabboGamesCom.log("Invalid state " + var_159);
         }
         return _loc1_;
      }
      
      private function onScrollUp() : void
      {
         var _loc1_:com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable = getCurrentLeaderboard();
         if(_loc1_ && _loc1_.scrollUp())
         {
            populateList();
         }
      }
      
      private function onScrollDown() : void
      {
         var _loc1_:com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable = getCurrentLeaderboard();
         if(_loc1_ && _loc1_.scrollDown())
         {
            populateList();
         }
      }
      
      private function onScrollButton(param1:WindowMouseEvent) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = param1.window == var_2257 ? "up" : "down";
         switch(param1.type)
         {
            case "WME_CLICK":
               param1.window == var_2257 ? onScrollUp() : onScrollDown();
               return;
            case "WME_OUT":
               _loc4_ = "normal";
               break;
            case "WME_OVER":
               _loc4_ = "hilite";
               break;
            case "WME_DOWN":
               _loc4_ = "click";
               break;
            case "WME_UP":
               _loc4_ = "normal";
         }
         var _loc3_:String = "scroll_" + _loc5_ + "_" + _loc4_;
         var _loc2_:class_3151 = param1.window as class_3151;
         WindowUtils.setElementImage(_loc2_.getChildAt(0),getBitmap(_loc3_));
      }
      
      private function onNextWeekButton(param1:WindowMouseEvent) : void
      {
         if(false)
         {
            switch(var_159 - 2)
            {
               case 0:
                  sendGetWeeklyData(-1);
                  break;
               case 1:
                  sendGetFriendsWeeklyData(-1);
                  break;
               case 2:
                  sendGetGroupWeeklyData(-1);
            }
         }
      }
      
      private function onPreviousWeekButton(param1:WindowMouseEvent) : void
      {
         if(false)
         {
            switch(var_159 - 2)
            {
               case 0:
                  sendGetWeeklyData(NaN);
                  break;
               case 1:
                  sendGetFriendsWeeklyData(NaN);
                  break;
               case 2:
                  sendGetGroupWeeklyData(var_1623 + 1);
            }
         }
      }
      
      private function updateWeekSelection() : void
      {
         switch(var_159 - 2)
         {
            case 0:
               _nextWeek.visible = false;
               _previousWeek.visible = false;
               break;
            case 1:
               _nextWeek.visible = false;
               _previousWeek.visible = false;
               break;
            case 2:
               _nextWeek.visible = false;
               _previousWeek.visible = false;
               break;
            default:
               _nextWeek.visible = false;
               _previousWeek.visible = false;
         }
         if(false)
         {
            var_2439.caption = _weekCaption;
         }
         else
         {
            var_2439.caption = "${snowwar.leaderboard.this_week}";
         }
         switch(var_159 - 2)
         {
            case 0:
            case 1:
            case 2:
               if(true)
               {
                  showTimeUntilWeeklyReset();
                  if(var_2125 == null)
                  {
                     startWeeklyResetTimer(_minutesUntilWeeklyReset);
                     break;
                  }
                  break;
               }
            default:
               WindowUtils.hideElement(_window,"reset_text");
               disposeWeeklyResetTimer();
         }
      }
      
      private function showTimeUntilWeeklyReset() : void
      {
         WindowUtils.showElement(_window,"reset_text");
         var _loc3_:int = convertToDays(_minutesUntilWeeklyReset);
         var _loc1_:int = convertToHours(_minutesUntilWeeklyReset);
         var _loc2_:int = convertToMinutes(_minutesUntilWeeklyReset);
         _localization.registerParameter("snowwar.leaderboard.weekly_reset","days","" + convertToDays(_minutesUntilWeeklyReset));
         _localization.registerParameter("snowwar.leaderboard.weekly_reset","hours","" + convertToHours(_minutesUntilWeeklyReset));
         _localization.registerParameter("snowwar.leaderboard.weekly_reset","minutes","" + convertToMinutes(_minutesUntilWeeklyReset));
         WindowUtils.setCaption(_window.findChildByName("reset_text"),"${snowwar.leaderboard.weekly_reset}");
      }
      
      private function onTick(param1:TimerEvent) : void
      {
         if(var_159 == 2 || var_159 == 3)
         {
            if(_minutesUntilWeeklyReset > 0)
            {
               _minutesUntilWeeklyReset--;
            }
            showTimeUntilWeeklyReset();
         }
      }
      
      private function convertToDays(param1:int) : int
      {
         return Math.floor(param1 / 60 / 24);
      }
      
      private function convertToHours(param1:int) : int
      {
         var _loc2_:int = convertToDays(param1);
         return Math.floor((param1 - _loc2_ * 24 * 60) / 60);
      }
      
      private function convertToMinutes(param1:int) : int
      {
         var _loc3_:int = convertToDays(param1);
         var _loc2_:int = convertToHours(param1);
         return param1 - _loc3_ * 24 * 60 - _loc2_ * 60;
      }
      
      private function getData() : Array
      {
         switch(var_159)
         {
            case 0:
               return var_1923.getVisibleEntries();
            case 1:
               return var_2170.getVisibleEntries();
            case 2:
               return var_1630.getVisibleEntries();
            case 3:
               return var_1631.getVisibleEntries();
            case 4:
               return var_1623.getVisibleEntries();
            case 5:
               return var_2075.getVisibleEntries();
            default:
               return null;
         }
      }
      
      private function getFavouriteGroupId() : int
      {
         switch(var_159 - 4)
         {
            case 0:
               return var_1623.favouriteGroupId;
            case 1:
               return var_2075.favouriteGroupId;
            default:
               return -1;
         }
      }
      
      private function populateList() : void
      {
         var _loc8_:class_1619 = null;
         var _loc15_:class_3151 = null;
         var _loc11_:* = false;
         var _loc13_:Boolean = false;
         var _loc1_:Boolean = false;
         var _loc2_:class_3151 = null;
         var _loc6_:class_3127 = null;
         var _loc7_:int = 0;
         var _loc14_:class_3151 = null;
         var _loc3_:class_3151 = null;
         var _loc4_:Array = getData();
         var _loc10_:int = getFavouriteGroupId();
         var _loc9_:int = var_1451.sessionDataManager.userId;
         if(!_loc4_ || _loc4_.length == 0)
         {
            var_19.visible = false;
            _listBorder.visible = false;
            return;
         }
         var _loc5_:int = 0;
         var_19.destroyListItems();
         var _loc12_:class_3151 = WindowUtils.createWindow("snowwar_leaderboard_entry") as class_3151;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc8_ = _loc4_[_loc5_])
            {
               (_loc15_ = _loc12_.clone() as class_3151).findChildByName("rank").caption = _loc8_.rank.toString();
               _loc15_.findChildByName("score").caption = _loc8_.score.toString();
               _loc15_.findChildByName("name").caption = _loc8_.name;
               _loc11_ = _loc8_.gender == "g";
               if(_loc8_.gender == "g")
               {
                  setGroupBadgeImage(_loc15_.findChildByName("avatarImage") as class_3282,_loc8_.figure);
               }
               else
               {
                  setAvatarImage(_loc15_.findChildByName("avatarImage") as class_3282,_loc8_.figure,_loc8_.gender);
               }
               _loc1_ = (_loc13_ = var_159 == 1 || var_159 == 5) && (_loc8_.userId == _loc9_ || _loc11_ && _loc8_.userId == _loc10_);
               if(!_loc11_ && _loc8_.userId != var_1451.sessionDataManager.userId || _loc11_ && _loc8_.userId != _loc10_ || _loc1_ && _loc5_ < _loc4_.length - 1)
               {
                  _loc15_.findChildByName("highlight").visible = false;
                  _loc15_.findChildByName("divider").visible = false;
                  _loc2_ = var_19.getListItemAt(-1) as class_3151;
                  if(_loc2_)
                  {
                     _loc2_.findChildByName("divider").visible = false;
                  }
               }
               _loc15_.findChildByName("imageRegion").id = _loc8_.userId;
               if(_loc8_.gender == "g")
               {
                  _loc15_.findChildByName("imageRegion").addEventListener("WME_CLICK",onGroupImageRegion);
               }
               else
               {
                  _loc15_.findChildByName("imageRegion").addEventListener("WME_CLICK",onImageRegion);
               }
               var_19.addListItem(_loc15_);
            }
            _loc5_++;
         }
         if(var_159 == 1 || var_159 == 5 || var_159 == 2 || var_159 == 4)
         {
            if(_loc5_ % 0 != 0)
            {
               _loc6_ = var_19.getListItemAt(-1);
               _loc7_ = 0;
               while(_loc7_ < _loc5_ % 0 - 1)
               {
                  (_loc14_ = _loc12_.clone() as class_3151).findChildByName("rank").caption = "";
                  _loc14_.findChildByName("score").caption = "";
                  _loc14_.findChildByName("name").caption = "";
                  _loc14_.findChildByName("highlight").visible = false;
                  _loc14_.findChildByName("divider").visible = false;
                  _loc3_ = var_19.getListItemAt(-1) as class_3151;
                  if(_loc3_)
                  {
                     _loc3_.findChildByName("divider").visible = false;
                  }
                  _loc14_.removeChild(_loc14_.findChildByName("imageRegion"));
                  var_19.addListItem(_loc14_);
                  _loc7_++;
               }
               var_19.addListItem(_loc6_);
            }
         }
         _loc12_.dispose();
         if(_loc12_ = var_19.getListItemAt(-1) as class_3151)
         {
            _loc12_.findChildByName("divider").visible = false;
         }
         var_19.visible = true;
         _listBorder.visible = true;
         updateScrollButtons();
         _window.invalidate();
      }
      
      private function setGroupBadgeImage(param1:class_3282, param2:String) : *
      {
         var _loc3_:BitmapData = var_1451.sessionDataManager.getGroupBadgeImage(param2);
         if(_loc3_)
         {
            _avatarPlaceholders.remove(param2);
            _avatarPlaceholders.add(param2,param1);
            WindowUtils.setElementImage(param1,_loc3_);
            _loc3_.dispose();
         }
      }
      
      private function setAvatarImage(param1:class_3282, param2:String, param3:String = null) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:class_3156;
         if(_loc5_ = var_1451.avatarManager.createAvatarImage(param2,"h",param3,this))
         {
            _loc5_.setDirection("full",2);
            _loc4_ = _loc5_.getCroppedImage("head");
            if(_loc5_.isPlaceholder())
            {
               _avatarPlaceholders.remove(param2);
               _avatarPlaceholders.add(param2,param1);
            }
            _loc5_.dispose();
         }
         WindowUtils.setElementImage(param1,_loc4_);
         _loc4_.dispose();
      }
      
      private function onImageRegion(param1:WindowMouseEvent) : void
      {
         var_1451.groupsManager.showExtendedProfile(param1.window.id);
      }
      
      private function onGroupImageRegion(param1:WindowMouseEvent) : void
      {
         var_1451.groupsManager.showGroupBadgeInfo(false,param1.window.id);
      }
      
      private function updateScrollButtons() : void
      {
         var _loc1_:com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable = getCurrentLeaderboard();
         if(_loc1_ && var_3845)
         {
            var_2257.visible = _loc1_.canScrollUp();
            var_2859.visible = _loc1_.canScrollDown();
         }
      }
      
      private function getBitmap(param1:String) : BitmapData
      {
         var _loc2_:IAsset = var_1451.assets.getAssetByName(param1);
         if(_loc2_)
         {
            return _loc2_.content as BitmapData;
         }
         return null;
      }
   }
}
