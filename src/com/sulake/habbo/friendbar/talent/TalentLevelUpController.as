package com.sulake.habbo.friendbar.talent
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.widgets.class_3366;
   import package_149.class_1088;
   import package_149.class_1591;
   import package_149.class_1643;
   import package_80.class_956;
   import package_92.class_369;
   
   public class TalentLevelUpController implements class_13
   {
       
      
      private var _habboTalent:com.sulake.habbo.friendbar.talent.HabboTalent;
      
      private var _disposed:Boolean;
      
      private var _window:class_3151;
      
      private var var_3709:String;
      
      private var var_2755:class_3127;
      
      private var var_2745:class_3127;
      
      private var var_2812:class_3127;
      
      public function TalentLevelUpController(param1:com.sulake.habbo.friendbar.talent.HabboTalent)
      {
         super();
         _habboTalent = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_2812 != null)
            {
               var_2812.dispose();
               var_2812 = null;
            }
            if(var_2755 != null)
            {
               var_2755.dispose();
               var_2755 = null;
            }
            if(var_2745 != null)
            {
               var_2745.dispose();
               var_2745 = null;
            }
            closeWindow();
            _habboTalent = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function initialize() : void
      {
         _habboTalent.communicationManager.addHabboConnectionMessageEvent(new class_369(onTalentLevelUp));
      }
      
      private function onTalentLevelUp(param1:class_369) : void
      {
         var _loc2_:class_1088 = param1.getParser();
         if(_loc2_.level == 1 && _loc2_.talentTrackName == "helper" && false)
         {
            return;
         }
         showWindow(_loc2_.talentTrackName,_loc2_.level,_loc2_.rewardPerks,_loc2_.rewardProducts);
      }
      
      public function showWindow(param1:String, param2:int, param3:Vector.<class_1643>, param4:Vector.<class_1591>) : void
      {
         closeWindow();
         var_3709 = param1;
         _window = _habboTalent.getXmlWindow("level_up") as class_3151;
         _window.center();
         _window.procedure = onWindowEvent;
         IStaticBitmapWrapperWindow(_window.findChildByName("level_decoration")).assetUri = "${image.library.url}talent/" + param1 + "_levelup_" + param2 + ".png";
         _window.findChildByName("level_up_message").caption = "${talent.track." + param1 + ".levelup.message}";
         _window.findChildByName("level_title").caption = "${talent.track." + param1 + ".level." + param2 + ".title}";
         _window.findChildByName("level_description").caption = "${talent.track." + param1 + ".level." + param2 + ".description}";
         var _loc8_:IItemListWindow = IItemListWindow(_window.findChildByName("reward_list"));
         var _loc6_:class_3127 = _loc8_.removeListItem(_loc8_.getListItemByName("plus_template"));
         var_2755 = _loc8_.removeListItem(_loc8_.getListItemByName("reward_product_template"));
         var_2745 = _loc8_.removeListItem(_loc8_.getListItemByName("reward_vip_template"));
         var_2812 = _loc8_.removeListItem(_loc8_.getListItemByName("reward_perk_template"));
         var _loc7_:Boolean = false;
         for each(var _loc5_ in param3)
         {
            if(_loc7_)
            {
               _loc8_.addListItem(_loc6_.clone());
            }
            _loc8_.addListItem(createRewardPerk(_loc5_));
            _loc7_ = true;
         }
         for each(var _loc9_ in param4)
         {
            if(_loc7_)
            {
               _loc8_.addListItem(_loc6_.clone());
            }
            _loc8_.addListItem(createRewardProduct(_loc9_));
            _loc7_ = true;
         }
         if(_loc8_.numListItems < 1)
         {
            _window.findChildByName("level_rewards").visible = false;
            IItemListWindow(_window.findChildByName("level_up_layout")).arrangeListItems();
         }
      }
      
      private function createRewardPerk(param1:class_1643) : class_3127
      {
         var _loc2_:class_3151 = var_2812.clone() as class_3151;
         class_3366(class_3217(_loc2_.findChildByName("perk_image")).widget).badgeId = param1.perkId;
         _loc2_.findChildByName("perk_name").caption = "${perk." + param1.perkId + ".name}";
         return _loc2_;
      }
      
      private function createRewardProduct(param1:class_1591) : class_3127
      {
         var _loc2_:class_3127 = null;
         if(param1.vipDays == 0)
         {
            _loc2_ = var_2755.clone();
            IStaticBitmapWrapperWindow(_loc2_).assetUri = "${image.library.url}talent/reward_product_" + param1.productCode.toLowerCase().replace(" ","_") + ".png";
         }
         else
         {
            _loc2_ = var_2745.clone();
            class_3151(_loc2_).findChildByName("vip_length").caption = _habboTalent.localizationManager.getLocalizationWithParams("catalog.vip.item.header.days","","num_days",param1.vipDays);
         }
         return _loc2_;
      }
      
      private function closeWindow() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(_window == null || false || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "close_button":
               closeWindow();
               break;
            case "talent_button":
               closeWindow();
               _habboTalent.tracking.trackTalentTrackOpen(var_3709,"levelup");
               _habboTalent.send(new class_956(var_3709));
         }
      }
   }
}
