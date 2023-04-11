package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.class_3517;
   import package_139.class_1281;
   import package_52.class_412;
   import package_52.class_778;
   import package_52.class_988;
   import package_83.class_1605;
   import package_83.class_915;
   
   public class DailyQuestWidget implements class_13, ILandingViewWidget, ISlotAwareWidget, class_3517
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_45:class_1605;
      
      private var var_1066:int;
      
      private var var_1294:int;
      
      private var _index:int;
      
      private var var_3978:int;
      
      private var var_3146:int;
      
      private var var_3250:String;
      
      public function DailyQuestWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public static function moveChildrenToRow(param1:class_3151, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc5_:class_3127 = null;
         var _loc4_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.numChildren)
         {
            (_loc5_ = param1.getChildAt(_loc3_)).x = _loc4_;
            _loc4_ += _loc5_.width + param2;
            _loc3_++;
         }
      }
      
      public function set configurationCode(param1:String) : void
      {
         var_3250 = param1;
      }
      
      public function set slot(param1:int) : void
      {
         var_3146 = param1;
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _container = null;
         var_45 = null;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("daily_quest"));
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_915(onDailyQuest));
         _container.findChildByName("accept_button").procedure = onAcceptButton;
         _container.findChildByName("go_button").procedure = onGoButton;
         _container.findChildByName("next_quest_region").procedure = onNextQuest;
         _container.findChildByName("cancel_quest_region").procedure = onCancelQuest;
         _container.findChildByName("easy_region").procedure = onEasyRegion;
         _container.findChildByName("hard_region").procedure = onHardRegion;
         var _loc1_:class_3127 = _container.findChildByName("hdr_line");
         var_3978 = _loc1_.x + _loc1_.width;
         GenericWidget.configureLayout(_landingView,var_3146,var_3250,_container);
      }
      
      public function refresh() : void
      {
         _index = 0;
         _landingView.send(new class_988(true,0));
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      private function onDailyQuest(param1:IMessageEvent) : void
      {
         var _loc2_:class_1281 = class_1281(param1.parser);
         var_45 = _loc2_.quest;
         var_1066 = _loc2_.easyQuestCount;
         var_1294 = _loc2_.hardQuestCount;
         refreshContent();
      }
      
      private function refreshContent() : void
      {
         _container.findChildByName("caption_txt").caption = !!var_45 ? getChainSpecificText("chaincaption") : getText("landing.view.quest.currenttask.alldone.caption");
         _container.findChildByName("info_txt").caption = !!var_45 ? getChainSpecificText("chaininfo") : getText("landing.view.quest.currenttask.alldone.info");
         _container.findChildByName("accept_button").visible = var_45;
         _container.findChildByName("next_quest_region").visible = var_45 && (var_45.easy ? var_1066 : var_1294) > 1;
         _container.findChildByName("next_quest_txt").caption = getText("landing.view.quest.nextquest." + (var_45 && false ? "easy" : "hard"));
         _container.findChildByName("title_txt").caption = getText("landing.view.quest.title." + (var_45 && false ? "accepted" : "notaccepted"));
         HabboLandingView.positionAfterAndStretch(_container,"title_txt","hdr_line");
         _container.findChildByName("cancel_quest_region").visible = var_45 && false;
         _container.findChildByName("current_quest_border").visible = var_45 && false;
         if(var_45)
         {
            _landingView.localizationManager.registerParameter("landing.view.quest.currenttask","task",getQuestName());
         }
         var _loc1_:class_3151 = class_3151(_container.findChildByName("difficulty_container"));
         var _loc2_:int = _loc1_.x + _loc1_.width;
         _loc1_.visible = var_45 && var_1066 > 0 && var_1294 > 0;
         setupDifficultyText("easy_region",var_45);
         setupDifficultyText("hard_region",var_45 && false);
         moveChildrenToRow(_loc1_,5);
         _loc1_.width = _loc1_.findChildByName("hard_region").x + _loc1_.findChildByName("hard_region").width;
         _loc1_.x = _loc2_ - _loc1_.width;
         var _loc4_:class_3127 = _container.findChildByName("hdr_line");
         var _loc3_:int = int(!!_loc1_.visible ? _loc1_.x - 5 : var_3978);
         _loc4_.width = _loc3_ - _loc4_.x;
      }
      
      private function setupDifficultyText(param1:String, param2:Boolean) : void
      {
         var _loc4_:class_3151 = class_3151(_container.findChildByName(param1));
         var _loc3_:ITextWindow = ITextWindow(_loc4_.findChildByName("label_txt"));
         _loc3_.width = _loc3_.textWidth;
         _loc3_.underline = param2;
         _loc4_.width = _loc3_.width;
      }
      
      private function getChainSpecificKey(param1:String) : String
      {
         return "quests.undefined.undefined." + param1;
      }
      
      private function getChainSpecificText(param1:String) : String
      {
         var _loc2_:String = getChainSpecificKey(param1);
         return "${" + _loc2_ + "}";
      }
      
      private function getText(param1:String) : String
      {
         return "${" + param1 + "}";
      }
      
      private function onGoButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.goToRoom();
         }
      }
      
      private function onEasyRegion(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            sendGetDailyQuest(true);
         }
      }
      
      private function onHardRegion(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            sendGetDailyQuest(false);
         }
      }
      
      public function getQuestName() : String
      {
         var _loc1_:String = var_45.getQuestLocalizationKey() + ".name";
         return "${" + _loc1_ + "}";
      }
      
      private function onAcceptButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.send(new class_412(var_45.id));
         }
      }
      
      private function onNextQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _index++;
            sendGetDailyQuest(var_45.easy);
         }
      }
      
      private function onCancelQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.send(new class_778());
         }
      }
      
      private function sendGetDailyQuest(param1:Boolean) : void
      {
         _landingView.send(new class_988(param1,_index));
      }
   }
}
