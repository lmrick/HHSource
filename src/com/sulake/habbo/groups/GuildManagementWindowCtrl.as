package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.groups.badge.BadgeEditorCtrl;
   import com.sulake.habbo.groups.events.GuildSettingsChangedInManageEvent;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.widgets.class_3366;
   import flash.display.BitmapData;
   import package_5.class_1110;
   import package_5.class_1111;
   import package_5.class_1124;
   import package_5.class_1570;
   import package_5.class_1580;
   import package_7.class_245;
   import package_7.class_785;
   import package_7.class_853;
   import package_7.class_878;
   import package_7.class_949;
   
   public class GuildManagementWindowCtrl implements class_13
   {
      
      private static const VIEW_IDENTITY:int = 1;
      
      private static const VIEW_BADGE:int = 2;
      
      private static const VIEW_COLORS:int = 3;
      
      private static const VIEW_CONFIRM:int = 4;
      
      private static const VIEW_SETTINGS:int = 5;
      
      private static const const_671:int = 43;
      
      private static const const_884:int = 69;
      
      private static const EDIT_HEADER_TEXTS_OFFSET:int = -20;
      
      private static const CREATE_HEADER_BITMAP_OFFSET:int = 36;
      
      private static const STEP_TITLE_Y_OFFSET_ACTIVE:int = 5;
      
      private static const STEP_TITLE_Y_OFFSET_INACTIVE:int = 9;
      
      private static const STEP_TITLE_CREDIT_Y_OFFSET_ACTIVE:int = 6;
      
      private static const STEP_TITLE_CREDIT_Y_OFFSET_INACTIVE:int = 10;
      
      private static const MAX_DESCRIPTION_LENGTH:int = 255;
      
      private static const MAX_NAME_LENGTH:int = 30;
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3151;
      
      private var var_1555:BadgeEditorCtrl;
      
      private var var_1593:com.sulake.habbo.groups.ColorGridCtrl;
      
      private var var_1599:com.sulake.habbo.groups.ColorGridCtrl;
      
      private var var_2258:com.sulake.habbo.groups.class_3301;
      
      private var var_3406:Boolean = false;
      
      private var var_2392:int = 0;
      
      private var var_45:class_1110;
      
      private var var_1484:int = 1;
      
      public function GuildManagementWindowCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         super();
         var_437 = param1;
         var_1555 = new BadgeEditorCtrl(var_437);
         var_1593 = new com.sulake.habbo.groups.ColorGridCtrl(var_437,onPrimaryColorSelected);
         var_1599 = new com.sulake.habbo.groups.ColorGridCtrl(var_437,onSecondaryColorSelected);
         var_2258 = new com.sulake.habbo.groups.class_3301();
      }
      
      public function dispose() : void
      {
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1555)
         {
            var_1555.dispose();
            var_1555 = null;
         }
         if(var_1593)
         {
            var_1593.dispose();
            var_1593 = null;
         }
         if(var_1599)
         {
            var_1599.dispose();
            var_1599 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      private function prepare() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(var_437.getXmlWindow("group_management_window"));
         _window.findChildByTag("close").procedure = onCloseWindow;
         _window.center();
         _window.findChildByName("create_room_link_region").procedure = onCreateRoomLink;
         _window.findChildByName("cancel_link_region").procedure = onCancelLink;
         _window.findChildByName("next_step_button").procedure = onNextStep;
         _window.findChildByName("previous_step_link_region").procedure = onPreviousStep;
         _window.findChildByName("buy_button").procedure = onBuy;
         _window.findChildByName("vip_required_region").procedure = onGetVip;
         _window.addEventListener("WE_DEACTIVATED",onWindowUnActivated);
         _window.findChildByName("edit_tab_1").procedure = onTab;
         _window.findChildByName("edit_tab_2").procedure = onTab;
         _window.findChildByName("edit_tab_3").procedure = onTab;
         _window.findChildByName("edit_tab_5").procedure = onTab;
         _window.findChildByName("reset_badge").procedure = onBadgeReset;
         _window.findChildByName("reset_colors").procedure = onColorReset;
         _window.findChildByName("step_1_members_region").procedure = onMembersClick;
         var_2258.prepare(_window);
      }
      
      public function onFlatCreated(param1:int, param2:String) : void
      {
         if(_window != null && false && var_45 != null && true)
         {
            var_45.ownedRooms.splice(0,0,new class_1570(param1,param2,false));
            prepareRoomSelection();
            this.getBaseDropMenu().selection = 0;
         }
      }
      
      public function onSubscriptionChange() : void
      {
         if(_window != null && false && var_45 != null && true && var_1484 == 4)
         {
            refresh();
         }
      }
      
      public function refresh() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3127 = null;
         prepare();
         var _loc3_:Boolean = false;
         _window.findChildByName("edit_tab_1").visible = _loc3_;
         _window.findChildByName("edit_tab_2").visible = _loc3_;
         _window.findChildByName("edit_tab_3").visible = _loc3_;
         _window.findChildByName("edit_tab_5").visible = _loc3_;
         _loc2_ = 1;
         while(_loc2_ <= 5)
         {
            getStepContainer(_loc2_).visible = var_1484 == _loc2_;
            _loc1_ = _window.findChildByName("header_pic_bitmap_step_" + _loc2_);
            _loc1_.y = !!var_45.exists ? 0 : 36;
            _loc1_.visible = var_1484 == _loc2_;
            _loc2_++;
         }
         _window.findChildByName("header_caption_txt").caption = getStepCaption();
         _window.findChildByName("header_desc_txt").caption = getStepDesc();
         _window.findChildByName("header_pic_bitmap");
         _window.findChildByName("header_caption_txt").y = 43 + getHeaderTextOffset();
         _window.findChildByName("header_desc_txt").y = 69 + getHeaderTextOffset();
         _window.findChildByName("edit_guild_tab_context").visible = var_45.exists;
         _window.findChildByName("footer_cont").visible = true;
         _window.findChildByName("reset_badge").visible = false;
         _window.findChildByName("reset_colors").visible = false;
         if(var_1484 == 2)
         {
            if(true)
            {
               var_437.trackGoogle("groupPurchase","step2_badge");
            }
            if(true)
            {
               var_1555.createWindow(getStepContainer(2),var_45.badgeSettings);
               var_1555.resetLayerOptions(var_45.badgeSettings);
            }
            _window.findChildByName("reset_badge").visible = var_45.exists;
         }
         if(var_1484 == 3)
         {
            if(true)
            {
               var_437.trackGoogle("groupPurchase","step3_colors");
            }
            if(true)
            {
               var_1593.createAndAttach(getStepContainer(3),"guild_primary_color_selector",var_437.guildEditorData.guildPrimaryColors);
               if(false)
               {
                  var_1593.setSelectedColorById(var_45.primaryColorId);
               }
               else
               {
                  var_1593.setSelectedColorById(var_437.guildEditorData.findMatchingPrimaryColorId(var_1555.primaryColorIndex));
               }
            }
            if(true)
            {
               var_1599.createAndAttach(getStepContainer(3),"guild_secondary_color_selector",var_437.guildEditorData.guildSecondaryColors);
               if(false)
               {
                  var_1599.setSelectedColorById(var_45.secondaryColorId);
               }
               else
               {
                  var_1599.setSelectedColorById(var_437.guildEditorData.findMatchingSecondaryColorId(var_1555.secondaryColorIndex));
               }
            }
            _window.findChildByName("reset_colors").visible = var_45.exists;
         }
         if(var_1484 == 5)
         {
            if(true)
            {
               var_2258.refresh(var_45);
            }
         }
         if(var_1484 == 4)
         {
            if(true)
            {
               var_437.trackGoogle("groupPurchase","step4_confirm");
            }
            updateConfirmPreview();
         }
         if(var_1484 == 1)
         {
            if(true)
            {
               var_437.trackGoogle("groupPurchase","step1_identity");
            }
            else
            {
               var_437.windowManager.registerLocalizationParameter("group.membercount","totalMembers","undefined");
               _window.findChildByName("step_1_members_txt").caption = var_437.localization.getLocalization("group.membercount");
            }
            _window.findChildByName("base_label").visible = true;
            _window.findChildByName("base_dropmenu").visible = true;
            _window.findChildByName("base_warning").visible = true;
            _window.findChildByName("create_room_link_region").visible = true;
            _window.findChildByName("step_1_members_region").visible = data.exists;
         }
         refreshCreateHeader();
      }
      
      private function updateConfirmPreview() : void
      {
         var _loc1_:BitmapData = null;
         var _loc5_:class_3282 = null;
         var _loc2_:class_1580 = null;
         var _loc4_:class_3127 = null;
         var _loc6_:class_1580 = null;
         var _loc3_:class_3127 = null;
         if(true || _window == null)
         {
            return;
         }
         if(false)
         {
            _loc1_ = var_1555.getBadgeBitmap();
            _loc5_ = _window.findChildByName("badge_preview_image") as class_3282;
            if(_loc1_ != null && _loc5_ != null)
            {
               _loc5_.bitmap = _loc1_;
            }
         }
         if(false)
         {
            _loc2_ = var_1593.getSelectedColorData();
            _loc4_ = _window.findChildByName("badge_preview_primary_color_top");
            if(_loc2_ != null && _loc4_ != null)
            {
               _loc4_.color = _loc2_.color;
            }
         }
         if(false)
         {
            _loc6_ = var_1599.getSelectedColorData();
            _loc3_ = _window.findChildByName("badge_preview_secondary_color_top");
            if(_loc6_ != null && _loc3_ != null)
            {
               _loc3_.color = _loc6_.color;
            }
         }
         if(false)
         {
            _window.findChildByName("buy_button").enable();
            _window.findChildByName("buy_border").color = 16761600;
         }
         else
         {
            _window.findChildByName("buy_border").color = 11184810;
            _window.findChildByName("buy_button").disable();
         }
         _window.findChildByName("vip_required_border").visible = true;
         _window.findChildByName("confirmation_caption").caption = ITextWindow(_window.findChildByName("name_txt")).text;
      }
      
      private function getHeaderTextOffset() : int
      {
         return !!var_45.exists ? -20 : 0;
      }
      
      private function refreshCreateHeader() : void
      {
         var _loc1_:int = 0;
         _window.findChildByName("steps_header_cont").visible = true;
         if(false)
         {
            return;
         }
         _window.findChildByName("next_step_button").visible = hasNextStep();
         _window.findChildByName("previous_step_link_region").visible = hasPreviousStep();
         _window.findChildByName("cancel_link_region").visible = !hasPreviousStep();
         _window.findChildByName("buy_border").visible = !hasNextStep();
         _loc1_ = 1;
         while(_loc1_ <= 4)
         {
            getStepHeader(_loc1_,false).visible = _loc1_ != var_1484;
            getStepHeader(_loc1_,true).visible = _loc1_ == var_1484;
            _window.findChildByName("step_title_" + _loc1_).y = _loc1_ == var_1484 ? 5 : 9;
            _loc1_++;
         }
         _window.findChildByName("gcreate_icon_credit").y = var_1484 == 4 ? 6 : 10;
      }
      
      private function getStepHeader(param1:int, param2:Boolean) : class_3127
      {
         return _window.findChildByName("gcreate_" + param1 + "_" + (param2 ? "1" : "0"));
      }
      
      private function getStepContainer(param1:int) : class_3151
      {
         return class_3151(_window.findChildByName("step_cont_" + param1));
      }
      
      private function getStepCaption() : String
      {
         var _loc1_:String = (!!var_45.exists ? "group.edit.tabcaption." : "group.create.stepcaption.") + var_1484;
         return var_437.localization.getLocalization(_loc1_,_loc1_);
      }
      
      private function getStepDesc() : String
      {
         var _loc1_:String = (!!var_45.exists ? "group.edit.tabdesc." : "group.create.stepdesc.") + var_1484;
         return var_437.localization.getLocalization(_loc1_,_loc1_);
      }
      
      public function onGuildCreationInfo(param1:class_1124) : void
      {
         var_45 = param1;
         var_1484 = 1;
         var_2392 = 0;
         refresh();
         refreshBadgeImage();
         setupInputs();
         var_437.localization.registerParameter("group.create.confirm.buyinfo","amount","" + param1.costInCredits);
         _window.visible = true;
         _window.activate();
      }
      
      public function onGuildEditInfo(param1:class_1111) : void
      {
         var_45 = param1;
         var_1484 = 1;
         var_2392 = 0;
         refresh();
         refreshBadgeImage();
         setupInputs();
         var _loc2_:ITabContextWindow = ITabContextWindow(_window.findChildByName("edit_guild_tab_context"));
         var _loc3_:ISelectableWindow = ISelectableWindow(_window.findChildByName("edit_tab_" + var_1484));
         _loc2_.selector.setSelected(_loc3_);
         _window.visible = true;
         _window.activate();
      }
      
      private function setupInputs() : void
      {
         ITextWindow(_window.findChildByName("name_txt")).text = var_45.groupName;
         ITextWindow(_window.findChildByName("desc_txt")).text = var_45.groupDesc;
         prepareRoomSelection();
         var_1555.resetLayerOptions(var_45.badgeSettings);
         var_1593.setSelectedColorById(var_45.primaryColorId);
         var_1599.setSelectedColorById(var_45.secondaryColorId);
         var_2258.refresh(var_45);
      }
      
      private function onTab(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_SELECT" || param2.id == var_1484)
         {
            return;
         }
         if(!validateView())
         {
            param1.preventDefault();
            return;
         }
         saveView();
         var_1484 = param2.id;
         refresh();
      }
      
      private function onColorReset(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(false)
            {
               var_1593.setSelectedColorById(var_45.primaryColorId);
            }
            if(false)
            {
               var_1599.setSelectedColorById(var_45.secondaryColorId);
            }
         }
      }
      
      private function onBadgeReset(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK" && false)
         {
            var_1555.resetLayerOptions(var_45.badgeSettings);
         }
      }
      
      private function onMembersClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK" && false && false)
         {
            var_437.trackGoogle("groupManagement","groupMembers");
            var_437.guildMembersWindowCtrl.onMembersClick(var_45.groupId,0);
         }
      }
      
      private function onCancelLink(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         close();
      }
      
      private function onCreateRoomLink(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         var_437.navigator.startRoomCreation();
      }
      
      private function onNextStep(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(!validateView())
         {
            return;
         }
         var_1484 = limitStep(var_1484 + 1);
         refresh();
      }
      
      private function onPreviousStep(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(!validateView())
         {
            return;
         }
         var_1484 = limitStep(var_1484 - 1);
         refresh();
      }
      
      private function onBuy(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(true)
         {
            var_437.trackGoogle("groupPurchase","buyGroup");
         }
         sendCreateGuildMessage();
      }
      
      private function onGetVip(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(true)
         {
            var_437.trackGoogle("groupPurchase","buyVip");
         }
         var_437.openVipPurchase("GuildManagementWindowCtrl");
      }
      
      private function showAlert(param1:String, param2:String) : void
      {
         if(!var_3406)
         {
            var_3406 = true;
            var_437.windowManager.alert(param1,param2,0,onAlertClose);
         }
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
         var_3406 = false;
      }
      
      private function validateView() : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:class_1570 = null;
         var _loc4_:String = null;
         var _loc1_:Array = null;
         switch(var_1484 - 1)
         {
            case 0:
               _loc2_ = String(ITextFieldWindow(_window.findChildByName("name_txt")).text);
               if(true)
               {
                  _loc3_ = resolveBaseRoom();
                  if(_loc2_ == null || _loc2_.length == 0 || _loc3_ == null || _loc3_.roomId == 0)
                  {
                     showAlert("${group.edit.error.title}","${group.edit.error.no.name.or.room.selected}");
                     return false;
                  }
                  if(_loc3_.hasControllers && var_2392 != _loc3_.roomId)
                  {
                     var_2392 = _loc3_.roomId;
                     showAlert("${group.edit.error.warning}","${group.edit.error.controllers}");
                     return false;
                  }
               }
               if(_loc2_.length > 30)
               {
                  showAlert("${group.edit.error.title}","${group.edit.error.name.length}");
                  return false;
               }
               if((_loc4_ = String(ITextFieldWindow(_window.findChildByName("desc_txt")).text)) != null && _loc4_.length >= 255)
               {
                  showAlert("${group.edit.error.title}","${group.edit.error.desc.length}");
                  return false;
               }
               return true;
               break;
            case 1:
               _loc1_ = var_1555.isIntialized ? var_1555.getBadgeSettings() : var_45.badgeSettings;
               var_1555.onViewChange();
               return true;
            case 2:
               if(var_1593.getSelectedColorData() == null || var_1599.getSelectedColorData() == null)
               {
                  showAlert("${group.edit.error.title}","${group.edit.error.no.color.selected}");
                  return false;
               }
               return true;
               break;
            default:
               return true;
         }
      }
      
      private function saveView() : void
      {
         var _loc3_:String = null;
         var _loc5_:String = null;
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         switch(var_1484 - 1)
         {
            case 0:
               _loc3_ = String(ITextFieldWindow(_window.findChildByName("name_txt")).text);
               _loc5_ = String(ITextFieldWindow(_window.findChildByName("desc_txt")).text);
               var_437.send(new class_878(var_45.groupId,_loc3_,_loc5_));
               var_437.events.dispatchEvent(new GuildSettingsChangedInManageEvent("GSCIME_GUILD_VISUAL_SETTINGS_CHANGED",var_45.groupId));
               return;
            case 1:
               _loc1_ = var_1555.isIntialized ? var_1555.getBadgeSettings() : var_45.badgeSettings;
               var_437.send(new class_785(var_45.groupId,_loc1_));
               var_437.events.dispatchEvent(new GuildSettingsChangedInManageEvent("GSCIME_GUILD_VISUAL_SETTINGS_CHANGED",var_45.groupId));
               break;
            case 2:
               _loc2_ = var_1593.isInitialized ? var_1593.getSelectedColorId() : int(var_45.primaryColorId);
               _loc4_ = var_1599.isInitialized ? var_1599.getSelectedColorId() : int(var_45.secondaryColorId);
               var_437.send(new class_949(var_45.groupId,_loc2_,_loc4_));
               var_437.events.dispatchEvent(new GuildSettingsChangedInManageEvent("GSCIME_GUILD_VISUAL_SETTINGS_CHANGED",var_45.groupId));
               break;
            case 4:
               var_437.send(new class_853(var_45.groupId,var_2258.guildType,var_2258.rightsLevel));
               var_2258.resetModified();
         }
      }
      
      private function sendCreateGuildMessage() : void
      {
         var _loc3_:String = String(ITextFieldWindow(_window.findChildByName("name_txt")).text);
         var _loc5_:String = String(ITextFieldWindow(_window.findChildByName("desc_txt")).text);
         var _loc6_:class_1570 = resolveBaseRoom();
         var _loc1_:Array = var_1555.isIntialized ? var_1555.getBadgeSettings() : var_45.badgeSettings;
         var _loc2_:int = var_1593.isInitialized ? var_1593.getSelectedColorId() : int(var_45.primaryColorId);
         var _loc4_:int = var_1599.isInitialized ? var_1599.getSelectedColorId() : int(var_45.secondaryColorId);
         var_2392 = 0;
         var_437.send(new class_245(_loc3_,_loc5_,_loc6_.roomId,_loc2_,_loc4_,_loc1_));
      }
      
      private function hasPreviousStep() : Boolean
      {
         return var_1484 != limitStep(var_1484 - 1);
      }
      
      private function hasNextStep() : Boolean
      {
         return var_1484 != limitStep(var_1484 + 1);
      }
      
      private function limitStep(param1:int) : int
      {
         return Math.max(1,Math.min(param1,4));
      }
      
      private function getBaseDropMenu() : class_3287
      {
         return class_3287(_window.findChildByName("base_dropmenu"));
      }
      
      private function prepareRoomSelection() : void
      {
         var _loc2_:int = 0;
         var _loc4_:class_1570 = null;
         var _loc1_:class_3287 = getBaseDropMenu();
         var _loc3_:* = [];
         var _loc5_:int = 0;
         _loc3_.push(var_437.localization.getLocalization("group.edit.base.select.room","group.edit.base.select.room"));
         _loc2_ = 0;
         while(_loc2_ < var_45.ownedRooms.length)
         {
            _loc4_ = var_45.ownedRooms[_loc2_];
            _loc3_.push(_loc4_.roomName);
            if(_loc4_.roomId == var_45.baseRoomId)
            {
               _loc5_ = _loc2_ + 1;
            }
            _loc2_++;
         }
         _loc1_.populate(_loc3_);
         if(_loc3_.length > 0)
         {
            _loc1_.selection = _loc5_;
         }
      }
      
      private function resolveBaseRoom() : class_1570
      {
         var _loc1_:class_3287 = class_3287(_window.findChildByName("base_dropmenu"));
         var _loc2_:int = _loc1_.selection - 1;
         if(_loc2_ >= 0 && _loc2_ < var_45.ownedRooms.length && var_45.ownedRooms[_loc2_] != null)
         {
            return class_1570(var_45.ownedRooms[_loc2_]);
         }
         return null;
      }
      
      private function onCloseWindow(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(false)
         {
            if(!validateView())
            {
               return;
            }
            saveView();
         }
         close();
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      public function onPrimaryColorSelected(param1:com.sulake.habbo.groups.ColorGridCtrl) : void
      {
         var _loc3_:class_1580 = null;
         var _loc2_:class_3127 = _window.findChildByName("guild_color_primary_color_top");
         if(_loc2_ != null && false && param1.selectedColorIndex >= 0 && param1.selectedColorIndex <= var_437.guildEditorData.guildPrimaryColors.length)
         {
            _loc3_ = var_437.guildEditorData.guildPrimaryColors[param1.selectedColorIndex];
            _loc2_.color = _loc3_.color;
         }
      }
      
      public function onSecondaryColorSelected(param1:com.sulake.habbo.groups.ColorGridCtrl) : void
      {
         var _loc3_:class_1580 = null;
         var _loc2_:class_3127 = _window.findChildByName("guild_color_secondary_color_top");
         if(false && param1.selectedColorIndex >= 0 && param1.selectedColorIndex <= var_437.guildEditorData.guildSecondaryColors.length)
         {
            _loc3_ = var_437.guildEditorData.guildSecondaryColors[param1.selectedColorIndex];
            _loc2_.color = _loc3_.color;
         }
      }
      
      public function get data() : class_1110
      {
         return var_45;
      }
      
      private function refreshBadgeImage() : void
      {
         var _loc2_:class_3127 = _window.findChildByName("step_1_badge");
         var _loc1_:class_3366 = class_3217(_window.findChildByName("group_logo")).widget as class_3366;
         if(_loc1_ == null || _loc2_ == null)
         {
            return;
         }
         if(true)
         {
            _loc2_.visible = false;
            _loc2_.invalidate();
         }
         else
         {
            _loc1_.badgeId = var_45.badgeCode;
            _loc1_.groupId = var_45.groupId;
            _loc2_.visible = true;
            _loc2_.invalidate();
         }
      }
      
      private function onWindowUnActivated(param1:class_3134) : void
      {
         if(var_45 != null && false && _window != null && false)
         {
            saveView();
         }
      }
   }
}
