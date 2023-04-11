package com.sulake.habbo.friendbar.talent
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.session.talent.TalentEnum;
   import com.sulake.habbo.utils.class_403;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.geom.Point;
   import package_149.class_1120;
   import package_149.class_1591;
   import package_149.class_1606;
   import package_149.class_1643;
   import package_149.class_1657;
   import package_149.class_1669;
   import package_5.class_1126;
   import package_5.class_522;
   import package_5.class_656;
   import package_5.class_788;
   import package_7.class_197;
   import package_7.class_575;
   import package_7.class_992;
   import package_80.class_605;
   import package_80.class_956;
   import package_92.class_533;
   
   public class TalentTrackController implements class_13
   {
      
      private static const MODAL_DIALOG_LAYER:int = 3;
      
      private static const HORIZONTAL_MARGIN:int = 100;
      
      private static const BEGIN_PANE_PREFIX:String = "begin_";
      
      private static const LEVEL_PANE_PREFIX:String = "level_pane_";
      
      private static const NO_CITIZENSHIP_SUFFIX:String = "_no_citizenship";
      
      private static const PROGRESS_BAR_MARGIN:int = 40;
      
      private static const DEFAULT_PADDING:int = 10;
      
      private static const REWARD_WIDTH:int = 200;
      
      private static const BADGE_RECT_SIZE:int = 60;
       
      
      private var _habboTalent:com.sulake.habbo.friendbar.talent.HabboTalent;
      
      private var _disposed:Boolean = false;
      
      private var var_1680:IModalDialog;
      
      private var _window:class_3151;
      
      private var _taskProgressPopup:IModalDialog;
      
      private var var_1569:IItemListWindow;
      
      private var _talentTrack:class_1606;
      
      private var _talentProgressMeter:com.sulake.habbo.friendbar.talent.TalentProgressMeter;
      
      private var var_2014:class_3151;
      
      private var var_2816:class_3213;
      
      private var var_2885:class_3213;
      
      private var var_2755:class_3213;
      
      private var var_2745:class_3213;
      
      private var var_2850:class_3151;
      
      private var var_2781:class_3151;
      
      private var var_2731:class_3151;
      
      private var _overlayTemplate:class_3127;
      
      private var var_3175:int = -1;
      
      public function TalentTrackController(param1:com.sulake.habbo.friendbar.talent.HabboTalent)
      {
         super();
         _habboTalent = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_talentProgressMeter)
            {
               _talentProgressMeter.dispose();
               _talentProgressMeter = null;
            }
            destroyWindow();
            _habboTalent = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function get talentTrack() : class_1606
      {
         return _talentTrack;
      }
      
      public function initialize() : void
      {
         _habboTalent.communicationManager.addHabboConnectionMessageEvent(new class_522(onEmailStatus));
         _habboTalent.communicationManager.addHabboConnectionMessageEvent(new class_533(onTalentTrack));
         _habboTalent.communicationManager.addHabboConnectionMessageEvent(new class_788(onGroupDetails));
         _habboTalent.communicationManager.addHabboConnectionMessageEvent(new class_656(onChangeEmailResult));
      }
      
      private function onEmailStatus(param1:class_522) : void
      {
         var _loc2_:class_3151 = getEmailContainer();
         if(_loc2_ != null)
         {
            getEmailText().text = param1.getParser().email;
            _loc2_.findChildByName("unverified_container").visible = !param1.getParser().isVerified;
            _loc2_.findChildByName("verified_txt").visible = param1.getParser().isVerified;
         }
      }
      
      private function onChangeEmailResult(param1:class_656) : void
      {
         setEmailErrorStatus(true,param1.getParser().result);
      }
      
      private function onTalentTrack(param1:class_533) : void
      {
         var _loc2_:class_1120 = param1.getParser();
         _talentTrack = _loc2_.getTalentTrack();
         createWindow();
      }
      
      private function onGroupDetails(param1:class_788) : void
      {
         var _loc2_:class_1126 = param1.data;
         if(_loc2_.groupId == var_3175)
         {
            var_3175 = -1;
            _habboTalent.navigator.goToPrivateRoom(_loc2_.roomId);
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:class_3151 = null;
         var _loc5_:int = 0;
         destroyWindow();
         var_1680 = _habboTalent.getModalXmlWindow("talent_track");
         _window = class_3151(var_1680.rootWindow);
         _window.procedure = onWindowEvent;
         var_1680.background.procedure = onModalWindowBackgroundEvent;
         _habboTalent.windowManager.getWindowContext(3).getDesktopWindow().addEventListener("WE_RESIZED",onDesktopResized);
         var_1569 = IItemListWindow(_window.findChildByName("panorama"));
         var_2014 = class_3151(var_1569.removeListItem(var_1569.getListItemByName("level_pane")));
         var _loc2_:IItemListWindow = IItemListWindow(var_2014.findChildByName("reward_list"));
         var_2816 = class_3213(_loc2_.removeListItem(_loc2_.getListItemByName("reward_achieved")));
         var_2885 = class_3213(_loc2_.removeListItem(_loc2_.getListItemByName("reward_locked")));
         var_2755 = class_3213(_loc2_.removeListItem(_loc2_.getListItemByName("reward_product")));
         var_2745 = class_3213(_loc2_.removeListItem(_loc2_.getListItemByName("reward_vip")));
         var _loc4_:IItemListWindow = IItemListWindow(var_2014.findChildByName("task_list_top"));
         var_2850 = class_3151(_loc4_.removeListItem(_loc4_.getListItemByName("task_achieved")));
         var_2781 = class_3151(_loc4_.removeListItem(_loc4_.getListItemByName("task_ongoing")));
         var_2731 = class_3151(_loc4_.removeListItem(_loc4_.getListItemByName("task_locked")));
         _overlayTemplate = var_2014.removeChild(var_2014.findChildByName("action_overlay"));
         var _loc3_:Boolean = false;
         for each(var _loc7_ in TalentEnum.asArray)
         {
            _loc1_ = var_1569.getListItemByName("begin_" + _loc7_) as class_3151;
            if(_loc1_ != null)
            {
               _loc1_.visible = _loc7_ == _talentTrack.name && _loc3_;
               if(_loc1_.visible)
               {
                  showAvatarInContainer(_loc1_);
               }
            }
            if(_loc7_ != "citizenship")
            {
               _loc1_ = var_1569.getListItemByName("begin_" + _loc7_ + "_no_citizenship") as class_3151;
               if(_loc1_ != null)
               {
                  _loc1_.visible = _loc7_ == _talentTrack.name && !_loc3_;
                  if(_loc1_.visible)
                  {
                     showAvatarInContainer(_loc1_);
                  }
               }
            }
         }
         _window.findChildByName("frame_title").caption = "${talent.track.undefined.frame.title}";
         _window.findChildByName("frame_subtitle").caption = "${talent.track.undefined.frame.subtitle}";
         _window.findChildByName("progress_text").caption = "${talent.track.undefined.progress.title}";
         if(_loc3_)
         {
            _talentTrack.removeFirstLevel();
         }
         var _loc6_:* = 0;
         _loc5_ = 0;
         while(_loc5_ < _talentTrack.levels.length)
         {
            createLevelPane(_talentTrack.levels[_loc5_],_loc5_);
            if(_talentTrack.levels[_loc5_].state == 1)
            {
               _loc6_ = _loc5_;
            }
            _loc5_++;
         }
         _talentProgressMeter = new com.sulake.habbo.friendbar.talent.TalentProgressMeter(_habboTalent,this);
         var_1569.setListItemIndex(var_1569.getListItemByName("end_padding"),-1);
         resizeWindow();
         scrollToLevel(_loc6_);
      }
      
      private function showAvatarInContainer(param1:class_3151) : void
      {
         var _loc2_:class_3217 = param1.findChildByName("avatar_image") as class_3217;
         if(_loc2_ != null)
         {
            class_3308(_loc2_.widget).figure = _habboTalent.sessionManager.figure;
         }
      }
      
      private function createLevelPane(param1:class_1669, param2:int) : void
      {
         var _loc16_:class_3213 = null;
         var _loc3_:ITextWindow = null;
         var _loc4_:ITextWindow = null;
         var _loc21_:ITextWindow = null;
         var _loc6_:ITextWindow = null;
         var _loc7_:IItemListWindow = null;
         var _loc18_:int = 0;
         var _loc22_:class_3127 = null;
         var _loc17_:* = undefined;
         var _loc15_:class_3127 = null;
         var _loc5_:Point = null;
         var _loc9_:class_3151 = class_3151(var_2014.clone());
         var _loc14_:IItemListWindow = IItemListWindow(_loc9_.findChildByName("status_list"));
         var _loc19_:class_3151 = class_3151(_loc9_.findChildByName("level_reward"));
         var _loc10_:class_3151 = class_3151(_loc9_.findChildByName("level_task"));
         var _loc12_:IItemListWindow = IItemListWindow(_loc9_.findChildByName("task_list_top"));
         var _loc20_:IItemListWindow = IItemListWindow(_loc9_.findChildByName("task_list_bottom"));
         _loc9_.name = "level_pane_" + param2;
         _loc9_.findChildByName("level_title").caption = "${talent.track.undefined.level." + param1.level + ".title}";
         _loc9_.findChildByName("level_description").caption = "${talent.track.undefined.level." + param1.level + ".description}";
         if(param2 == 0)
         {
            _loc19_.width = 0;
            _loc19_.visible = false;
            _loc14_.x = 40;
         }
         else
         {
            _loc16_ = class_3213(_loc19_.findChildByName("border"));
            _loc3_ = ITextWindow(_loc19_.findChildByName("title_locked"));
            _loc4_ = ITextWindow(_loc19_.findChildByName("title_achieved"));
            _loc21_ = ITextWindow(_loc19_.findChildByName("description_locked"));
            _loc6_ = ITextWindow(_loc19_.findChildByName("description_achieved"));
            _loc7_ = IItemListWindow(_loc19_.findChildByName("reward_list"));
            switch(param1.state)
            {
               case 0:
                  _loc16_.color = 12434877;
                  _loc16_.findChildByName("unlocked").visible = false;
                  _loc3_.caption = "${talent.track.undefined.level." + param1.level + ".title}";
                  _loc4_.visible = false;
                  _loc21_.caption = "${talent.track.undefined.level." + param1.level + ".unlock}";
                  _loc6_.visible = false;
                  _loc19_.findChildByName("achieved").visible = false;
                  break;
               case 1:
               case 2:
                  _loc16_.color = 4537147;
                  _loc3_.visible = false;
                  _loc4_.caption = _habboTalent.localizationManager.getLocalization("talent.track.common.unlocked.level.prefix") + " " + _habboTalent.localizationManager.getLocalization("talent.track.undefined.level." + param1.level + ".title");
                  _loc21_.visible = false;
                  _loc6_.caption = "${talent.track.undefined.level." + param1.level + ".unlock}";
                  _loc19_.findChildByName("locked").visible = false;
            }
            if(param1.rewardCount == 0)
            {
               _loc18_ = Math.max(200,Math.max(_loc4_.width,_loc3_.width));
               _loc21_.width = _loc18_;
               _loc6_.width = _loc18_;
               _loc16_.width = _loc18_ + 20;
               _loc19_.width = _loc18_ + 20;
               _loc16_.height = _loc6_.y + Math.max(_loc6_.height,_loc21_.height) + 10;
               _loc19_.height = _loc16_.height + _loc16_.y;
               _loc7_.visible = false;
            }
            else if(param1.rewardCount == 1 && param1.rewardProducts.length > 0)
            {
               _loc18_ = Math.max(220,Math.max(_loc4_.width,_loc3_.width));
               _loc21_.width = _loc18_;
               _loc6_.width = _loc18_;
               _loc7_.addListItem(createRewardProduct(param1,param1.rewardProducts[0]));
               _loc16_.width = _loc18_ + 20;
               _loc19_.width = _loc18_ + 20;
            }
            else if(param1.rewardCount == 1)
            {
               _loc16_.width = 420;
               _loc21_.width = 400;
               _loc6_.width = 400;
               _loc7_.addListItem(param1.rewardPerks.length > 0 ? createRewardPerk(param1,param1.rewardPerks[0]) : createRewardProduct(param1,param1.rewardProducts[0]));
               _loc7_.arrangeListItems();
               _loc19_.width = _loc7_.width + 20;
               _loc16_.width = _loc7_.width + 20;
            }
            else
            {
               for each(var _loc11_ in param1.rewardPerks)
               {
                  _loc7_.addListItem(createRewardPerk(param1,_loc11_));
               }
               for each(var _loc8_ in param1.rewardProducts)
               {
                  _loc7_.addListItem(createRewardProduct(param1,_loc8_));
               }
               _loc7_.arrangeListItems();
               _loc19_.width = _loc7_.width + 20;
               _loc16_.width = _loc7_.width + 20;
               _loc6_.width = _loc16_.width - 20;
            }
         }
         if(param1.tasks.length == 0)
         {
            _loc10_.width = 0;
            _loc10_.visible = false;
         }
         else
         {
            _loc17_ = new Vector.<class_3127>();
            for each(var _loc13_ in param1.tasks)
            {
               _loc22_ = createTask(param1,_loc13_);
               if(_loc12_.numListItems == _loc20_.numListItems)
               {
                  _loc12_.addListItem(_loc22_);
               }
               else
               {
                  _loc20_.addListItem(_loc22_);
               }
               if(_loc13_.badgeCode == "ACH_SafetyQuizGraduate1" && _loc13_.state == 1)
               {
                  _loc17_.push(_loc22_);
               }
            }
            _loc12_.arrangeListItems();
            _loc20_.arrangeListItems();
            _loc10_.width = Math.max(_loc12_.width,_loc20_.width);
            for each(_loc22_ in _loc17_)
            {
               _loc15_ = _overlayTemplate.clone();
               _loc5_ = new Point();
               _loc9_.addChild(_loc15_);
               _loc22_.convertPointFromLocalToGlobalSpace(_loc5_);
               _loc9_.convertPointFromGlobalToLocalSpace(_loc5_);
               _loc15_.x += _loc5_.x;
               _loc15_.y += _loc5_.y;
               _loc15_.visible = true;
            }
         }
         _loc14_.arrangeListItems();
         _loc14_.width = _loc19_.width + 10 + _loc10_.width;
         _loc9_.width = _loc14_.x + _loc14_.width + 10;
         repositionLevelIllustration(param1,_loc9_);
         var_1569.addListItem(_loc9_);
      }
      
      private function repositionLevelIllustration(param1:class_1669, param2:class_3151) : void
      {
         var _loc3_:class_3127 = param2.findChildByName("level_description");
         var _loc4_:IStaticBitmapWrapperWindow;
         (_loc4_ = IStaticBitmapWrapperWindow(param2.findChildByName("level_illustration"))).assetUri = "${image.library.url}talent/undefined_" + param1.level + ".png";
         if(param1.level == 8 && false)
         {
            _loc4_.width = 220;
            _loc4_.height = 270;
            _loc4_.x = Math.max(_loc3_.right,param2.width);
         }
         else if(param1.level == 0 && false)
         {
            _loc4_.width = 0;
            _loc4_.x = Math.max(_loc3_.right,param2.width);
         }
         else if(param1.level == 4 && false)
         {
            _loc4_.width = 220;
            _loc4_.height = 280;
            _loc4_.x = Math.max(_loc3_.right,param2.width);
         }
         else
         {
            _loc4_.x = Math.max(_loc3_.right,param2.width - _loc4_.width);
         }
         param2.width = Math.max(param2.width,_loc4_.right);
      }
      
      private function createRewardPerk(param1:class_1669, param2:class_1643) : class_3151
      {
         var _loc3_:class_3151 = null;
         switch(param1.state)
         {
            case 0:
               _loc3_ = class_3151(var_2885.clone());
               break;
            case 1:
            case 2:
               _loc3_ = class_3151(var_2816.clone());
               class_3366(class_3217(_loc3_.findChildByName("achieved")).widget).badgeId = param2.perkId;
         }
         var _loc5_:class_3127 = class_3127(_loc3_.findChildByName("title"));
         var _loc4_:class_3127 = ITextWindow(_loc3_.findChildByName("description"));
         _loc5_.caption = "${perk." + param2.perkId + ".name}";
         _loc4_.caption = "${perk." + param2.perkId + ".description}";
         if(param1.rewardCount == 1)
         {
            _loc3_.width = 400;
            _loc3_.findChildByName("title").width = 340;
            _loc3_.findChildByName("description").width = 340;
         }
         else
         {
            if(_loc4_.height > 30)
            {
               _loc4_.width += 40;
            }
            _loc4_.width = Math.max(_loc4_.width,_loc5_.width);
            _loc3_.width = Math.max(_loc4_.width,_loc5_.width) + 60 + 10;
         }
         return _loc3_;
      }
      
      private function createRewardProduct(param1:class_1669, param2:class_1591) : class_3151
      {
         var _loc3_:class_3151 = null;
         if(param2.vipDays == 0)
         {
            _loc3_ = class_3151(var_2755.clone());
            IStaticBitmapWrapperWindow(_loc3_.findChildByName("product_icon")).assetUri = "${image.library.url}talent/reward_product_" + param2.productCode.toLowerCase().replace(" ","_") + ".png";
         }
         else
         {
            _loc3_ = class_3151(var_2745.clone());
            _loc3_.findChildByName("vip_length").caption = _habboTalent.localizationManager.getLocalizationWithParams("catalog.vip.item.header.days","","num_days",param2.vipDays);
         }
         if(param1.state == 0)
         {
            _loc3_.color = 9934743;
            _loc3_.blend = 0.6;
         }
         return _loc3_;
      }
      
      private function createTask(param1:class_1669, param2:class_1657) : class_3151
      {
         var _loc6_:class_3151 = null;
         var _loc3_:IRegionWindow = null;
         if(param2.badgeCode == null || param2.badgeCode == "")
         {
            return null;
         }
         switch(param2.state)
         {
            case 0:
               _loc6_ = class_3151(var_2731.clone());
               break;
            case 1:
               _loc6_ = class_3151(var_2781.clone());
               class_3366(class_3217(_loc6_.findChildByName("badge")).widget).badgeId = param2.badgeCode;
               _loc6_.findChildByName("task_progress_fg").width = class_403.map(param2.currentScore,0,param2.totalScore,0,48);
               _loc3_ = _loc6_.findChildByName("task_ongoing_region") as IRegionWindow;
               _loc3_.id = param2.achievementId;
               if(param2.badgeCode == "ACH_SafetyQuizGraduate1")
               {
                  _loc3_.toolTipCaption = "";
                  _loc3_.name = param2.badgeCode;
                  break;
               }
               break;
            case 2:
               _loc6_ = class_3151(var_2850.clone());
               class_3366(class_3217(_loc6_.findChildByName("badge")).widget).badgeId = param2.badgeCode;
         }
         var _loc5_:class_3127 = _loc6_.findChildByName("title");
         var _loc4_:class_3127 = _loc6_.findChildByName("description");
         _loc5_.caption = _habboTalent.localizationManager.getAchievementName(param2.badgeCode).toUpperCase();
         _loc4_.caption = _habboTalent.localizationManager.getAchievementInstruction(param2.badgeCode);
         if(_loc5_.height > 20)
         {
            _loc5_.y -= 5;
            _loc4_.y += 5;
         }
         else if(_loc4_.height > 30)
         {
            _loc5_.y -= 5;
            _loc4_.y -= 5;
         }
         return _loc6_;
      }
      
      private function destroyWindow() : void
      {
         destroyTaskProgressDialog();
         if(_overlayTemplate != null)
         {
            _overlayTemplate.dispose();
            _overlayTemplate = null;
         }
         if(var_2014)
         {
            var_2014.dispose();
            var_2014 = null;
         }
         if(var_2816)
         {
            var_2816.dispose();
            var_2816 = null;
         }
         if(var_2885)
         {
            var_2885.dispose();
            var_2885 = null;
         }
         if(var_2755)
         {
            var_2755.dispose();
            var_2755 = null;
         }
         if(var_2745)
         {
            var_2745.dispose();
            var_2745 = null;
         }
         if(var_2850)
         {
            var_2850.dispose();
            var_2850 = null;
         }
         if(var_2781)
         {
            var_2781.dispose();
            var_2781 = null;
         }
         if(var_2731)
         {
            var_2731.dispose();
            var_2731 = null;
         }
         if(var_1680)
         {
            var_1680.dispose();
            var_1680 = null;
            _window = null;
            _habboTalent.windowManager.getWindowContext(3).getDesktopWindow().removeEventListener("WE_RESIZED",onDesktopResized);
         }
      }
      
      private function resizeWindow() : void
      {
         if(var_1680 == null || false)
         {
            return;
         }
         _window.x = 100;
         _window.width = _window.desktop.width - 200;
         _window.findChildByName("frame").width = _window.width;
         _window.findChildByName("panorama").width = _window.width;
         _window.findChildByName("panorama_scrollbar").width = _window.width;
         _talentProgressMeter.resize();
         var_1569.arrangeListItems();
         _window.invalidate();
      }
      
      private function onDesktopResized(param1:class_3134) : void
      {
         resizeWindow();
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(_window == null || false || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
               destroyWindow();
               break;
            case "progress_container":
               _loc3_ = int(WindowMouseEvent(param1).localX);
               if(_loc3_ < 40)
               {
                  var_1569.scrollH = 0;
                  break;
               }
               if(_loc3_ > -40)
               {
                  var_1569.scrollH = 1;
                  break;
               }
               scrollToLevel(int(Math.floor(_loc3_ / 0)));
               break;
            case "task_ongoing_region":
               createTaskProgressDialog(param2.id);
               break;
            case "citizenship_button":
               _habboTalent.tracking.trackTalentTrackOpen("citizenship","talentrack");
               _habboTalent.send(new class_956("citizenship"));
               break;
            case "button_track_citizenship":
            case "button_track_helper":
               break;
            case "ACH_SafetyQuizGraduate1":
               closeAndLog(param2.name);
               _habboTalent.habboHelp.showSafetyBooklet();
         }
      }
      
      private function onModalWindowBackgroundEvent(param1:class_3134, param2:class_3127) : void
      {
         if(_window == null || false || param1.type != "WME_CLICK")
         {
            return;
         }
         destroyWindow();
      }
      
      private function scrollToLevel(param1:int) : void
      {
         var _loc2_:class_3127 = null;
         if(param1 == 0)
         {
            var_1569.scrollH = 0;
         }
         else
         {
            _loc2_ = var_1569.getListItemByName("level_pane_" + param1);
            if(_loc2_ != null)
            {
               class_14.log(var_1569.scrollH);
               var_1569.scrollH = class_403.map(_loc2_.x - 20,0,var_1569.scrollableRegion.width - var_1569.visibleRegion.width,0,1);
               class_14.log(_loc2_.x + " " + var_1569.scrollableRegion.width + " " + class_403.map(_loc2_.x,0,var_1569.scrollableRegion.width,0,1) + " " + var_1569.scrollH);
            }
         }
      }
      
      private function createTaskProgressDialog(param1:int) : void
      {
         var _loc7_:String = null;
         var _loc5_:String = null;
         var _loc4_:Boolean = false;
         destroyTaskProgressDialog();
         var _loc3_:class_1657 = _talentTrack.findTaskByAchievementId(param1);
         if(_loc3_ == null || _loc3_.badgeCode == null || _loc3_.badgeCode == "")
         {
            return;
         }
         _habboTalent.tracking.trackEventLog("Talent",talentTrack.name,"talent.progress.show",_loc3_.badgeCode);
         if(_loc3_.badgeCode == "ACH_GuideAdvertisementReader1")
         {
            setupTourAdvertisement();
            return;
         }
         _taskProgressPopup = _habboTalent.getModalXmlWindow("task_progress_dialog");
         _taskProgressPopup.rootWindow.procedure = onTaskProgressWindowEvent;
         _taskProgressPopup.background.procedure = onTaskProgressBackgroundWindowEvent;
         var _loc2_:class_3151 = class_3151(_taskProgressPopup.rootWindow);
         _loc2_.findChildByName("instruction").caption = _habboTalent.localizationManager.getAchievementInstruction(_loc3_.badgeCode);
         _loc2_.findChildByName("title").caption = _habboTalent.localizationManager.getAchievementName(_loc3_.badgeCode);
         _loc2_.findChildByName("progress_text").caption = _habboTalent.localizationManager.getLocalization("talent.track.task.progress.dialog.progress") + " " + _loc3_.currentScore + "/" + _loc3_.totalScore;
         class_3366(class_3217(_loc2_.findChildByName("badge")).widget).badgeId = _loc3_.badgeCode;
         getEmailContainer().visible = false;
         if(false)
         {
            _loc7_ = String(_habboTalent.localizationManager.getLocalization("talent.track.task.action.undefined." + mapBadgeCode(_loc3_.badgeCode) + ".description",""));
            _loc5_ = String(_habboTalent.localizationManager.getLocalization("talent.track.task.action.undefined." + mapBadgeCode(_loc3_.badgeCode) + ".link",""));
            _loc4_ = _loc7_ != "" || _loc5_ != "";
            _loc2_.findChildByName("action_separator").visible = _loc4_;
            _loc2_.findChildByName("action_title").visible = _loc4_;
            setText(_loc2_,"action_description",_loc7_);
            setText(_loc2_,"action_link",_loc5_);
            _loc2_.findChildByName("action_link").name = _loc3_.badgeCode;
            _loc2_.findChildByName("progress_separator").visible = _loc5_ != "";
            if(_loc3_.badgeCode == "ACH_EmailVerification1" && emailChangeEnabled)
            {
               getEmailContainer().visible = true;
               getEmailContainer().findChildByName("change_email_region").procedure = onChangeEmail;
               getEmailText().procedure = onEmailTxt;
               _habboTalent.send(new class_992());
               setEmailErrorStatus(false);
            }
         }
         else
         {
            _loc2_.findChildByName("action_separator").visible = false;
            _loc2_.findChildByName("action_title").visible = false;
            _loc2_.findChildByName("action_description").visible = false;
            _loc2_.findChildByName("action_link").visible = false;
         }
         IItemListWindow(_loc2_.findChildByName("top_list")).arrangeListItems();
         if(_loc3_.currentScore <= 0)
         {
            _loc2_.findChildByName("achieved_left").visible = false;
            _loc2_.findChildByName("achieved_right").visible = false;
            _loc2_.findChildByName("achieved_mid").visible = false;
         }
         else if(_loc3_.currentScore < _loc3_.totalScore)
         {
            _loc2_.findChildByName("achieved_right").visible = false;
            _loc2_.findChildByName("achieved_mid").width = class_403.map(_loc3_.currentScore,0,_loc3_.totalScore,0,_loc2_.findChildByName("unachieved_mid").width);
         }
         var _loc6_:IItemListWindow = IItemListWindow(_loc2_.findChildByName("list"));
         if(!_loc3_.hasProgressDisplay())
         {
            _loc6_.removeListItem(_loc6_.getListItemByName("progress_main_container"));
         }
         _loc6_.arrangeListItems();
      }
      
      private function getEmailContainer() : class_3151
      {
         if(_taskProgressPopup == null || true)
         {
            return null;
         }
         var _loc1_:class_3151 = class_3151(_taskProgressPopup.rootWindow);
         return _loc1_ == null ? null : class_3151(_loc1_.findChildByName("email_container"));
      }
      
      private function mapBadgeCode(param1:String) : String
      {
         if(param1 == "ACH_RoomEntry1" || param1 == "ACH_RoomEntry2")
         {
            return "ACH_RoomEntry";
         }
         return param1;
      }
      
      private function setText(param1:class_3151, param2:String, param3:String) : void
      {
         var _loc4_:class_3127;
         (_loc4_ = param1.findChildByName(param2)).caption = param3;
         _loc4_.visible = param3 != "";
      }
      
      private function destroyTaskProgressDialog() : void
      {
         if(_taskProgressPopup != null)
         {
            _taskProgressPopup.dispose();
            _taskProgressPopup = null;
         }
      }
      
      private function onTaskProgressWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(_taskProgressPopup == null || false || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "thanks_button":
               destroyTaskProgressDialog();
               break;
            case "ACH_HabboWayGraduate1":
               closeAndLog(param2.name);
               _habboTalent.habboHelp.showHabboWay();
               break;
            case "ACH_GuideGroupMember1":
               closeAndLog(param2.name);
               _loc3_ = _habboTalent.getInteger("guide.help.alpha.groupid",0);
               if(_loc3_ > 0)
               {
                  var_3175 = _loc3_;
                  _habboTalent.send(new class_197(_loc3_,false));
                  break;
               }
               break;
            case "ACH_SafetyQuizGraduate1":
               closeAndLog(param2.name);
               _habboTalent.habboHelp.showSafetyBooklet();
               break;
            case "ACH_RoomEntry1":
            case "ACH_RoomEntry2":
               closeAndLog(param2.name);
               _habboTalent.navigator.openNavigator(null);
               break;
            case "ACH_AvatarLooks1":
               closeAndLog(param2.name);
               _habboTalent.avatarEditor.openEditor(0,null,null,true);
               _habboTalent.avatarEditor.loadOwnAvatarInEditor(0);
         }
      }
      
      private function closeAndLog(param1:String) : void
      {
         destroyWindow();
         _habboTalent.tracking.trackEventLog("Talent",_talentTrack.name,"talent.progress.click_activity",param1);
      }
      
      private function setupTourAdvertisement() : void
      {
         _taskProgressPopup = _habboTalent.getModalXmlWindow("tour_task_progress_dialog");
         var _loc1_:class_3151 = class_3151(_taskProgressPopup.rootWindow);
         _loc1_.findChildByName("take_tour_button").procedure = onTakeTour;
         _loc1_.findChildByName("decline_tour_region").procedure = onDeclineTour;
         _loc1_.findChildByName("header_button_close").procedure = onCloseTourAd;
      }
      
      private function onTakeTour(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            destroyWindow();
            destroyTaskProgressDialog();
            _habboTalent.send(new class_605());
            _habboTalent.habboHelp.requestGuide();
            _habboTalent.tracking.trackEventLog("Help","","tour.new_user.accept");
            _habboTalent.tracking.trackGoogle("newbieTourWindow","click_acceptTour");
         }
      }
      
      private function onCloseTourAd(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            destroyTaskProgressDialog();
         }
      }
      
      private function onDeclineTour(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            destroyWindow();
            destroyTaskProgressDialog();
            _habboTalent.send(new class_605());
            _habboTalent.tracking.trackEventLog("Help","","tour.new_user.cancel");
            _habboTalent.tracking.trackGoogle("newbieTourWindow","click_refuseTour");
         }
      }
      
      private function onChangeEmail(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = String(getEmailText().text);
            _habboTalent.send(new class_575(_loc3_));
         }
      }
      
      private function onEmailTxt(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_FOCUSED")
         {
            setEmailErrorStatus(false);
         }
      }
      
      private function setEmailErrorStatus(param1:Boolean, param2:int = 0) : void
      {
         if(getEmailContainer() == null)
         {
            return;
         }
         var _loc3_:Boolean = param1 && param2 != 0;
         var _loc5_:class_3127;
         var _loc4_:class_3151;
         (_loc5_ = (_loc4_ = getEmailContainer()).findChildByName("error_txt")).visible = _loc3_;
         _loc5_.caption = "${welcome.gift.email.error." + param2 + "}";
         _loc4_.findChildByName("error_border").visible = _loc3_;
         _loc4_.findChildByName("change_email_region").visible = !param1;
         _loc4_.findChildByName("changed_container").visible = param1 && param2 == 0;
      }
      
      private function getEmailText() : ITextFieldWindow
      {
         return ITextFieldWindow(getEmailContainer().findChildByName("email_txt"));
      }
      
      private function onTaskProgressBackgroundWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(_taskProgressPopup == null || false || param1.type != "WME_CLICK")
         {
            return;
         }
         destroyTaskProgressDialog();
      }
      
      private function get emailChangeEnabled() : Boolean
      {
         return _habboTalent.getBoolean("talent.progress.emailchange.enabled");
      }
   }
}
