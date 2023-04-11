package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Point;
   import package_52.class_412;
   import package_52.class_450;
   import package_52.class_920;
   import package_83.class_1605;
   
   public class QuestDetails implements class_13
   {
      
      private static const const_493:int = 56;
      
      private static const SPACING:int = 5;
      
      private static const TEXT_HEIGHT_SPACING:int = 5;
      
      private static const const_431:Point = new Point(8,8);
      
      private static const const_442:Array = ["PLACE_ITEM","PLACE_FLOOR","PLACE_WALLPAPER","PET_DRINK","PET_EAT"];
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      private var _window:class_3281;
      
      private var var_3246:Boolean;
      
      private var var_363:class_1605;
      
      private var _msecsToRefresh:int;
      
      private var var_3614:Boolean = false;
      
      public function QuestDetails(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         super();
         _questEngine = param1;
      }
      
      public function dispose() : void
      {
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
      
      public function onQuest(param1:class_1605) : void
      {
         if(var_3246)
         {
            var_3246 = false;
            openDetails(param1);
         }
         else if(var_363 == null || var_363.id != param1.id)
         {
            close();
         }
      }
      
      public function onQuestCompleted(param1:class_1605) : void
      {
         close();
      }
      
      public function onQuestCancelled() : void
      {
         close();
      }
      
      public function onRoomExit() : void
      {
         close();
      }
      
      private function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      public function showDetails(param1:class_1605) : void
      {
         if(_window && false)
         {
            _window.visible = false;
            return;
         }
         openDetails(param1);
      }
      
      public function openDetails(param1:class_1605, param2:Boolean = false) : void
      {
         var _loc5_:class_3151 = null;
         var_363 = param1;
         if(param1 == null)
         {
            return;
         }
         var_3614 = param2;
         if(_window == null)
         {
            _window = class_3281(_questEngine.getXmlWindow("QuestDetails"));
            _window.findChildByTag("close").procedure = onDetailsWindowClose;
            _window.center();
            (_loc5_ = _questEngine.questController.questsList.createListEntry(onAcceptQuest,onCancelQuest)).x = const_431.x;
            _loc5_.y = const_431.y;
            _window.content.addChild(_loc5_);
            _window.findChildByName("link_region").procedure = onLinkProc;
         }
         _loc5_ = class_3151(_window.findChildByName("entry_container"));
         _questEngine.questController.questsList.refreshEntryDetails(_loc5_,param1);
         var _loc8_:Boolean = false;
         var _loc3_:ITextWindow = ITextWindow(_loc5_.findChildByName("hint_txt"));
         var _loc9_:int = getTextHeight(_loc3_);
         if(!_loc8_)
         {
            _loc3_.caption = _questEngine.getQuestHint(param1);
            _loc3_.height = _loc3_.textHeight + 5;
         }
         _loc3_.visible = !_loc8_;
         var _loc4_:int = getTextHeight(_loc3_) - _loc9_;
         var _loc7_:int = setupLink("link_region",_loc3_.y + _loc3_.height + 5);
         var _loc6_:class_3151 = class_3151(_loc5_.findChildByName("quest_container"));
         _loc6_.height = _loc6_.height + (_loc4_ + _loc7_);
         _questEngine.questController.questsList.setEntryHeight(_loc5_);
         _window.height = _loc5_.height + 56;
         _window.visible = true;
         _window.activate();
      }
      
      private function setupLink(param1:String, param2:int) : int
      {
         var _loc3_:Boolean = hasCatalogLink();
         var _loc8_:Boolean = !_loc3_ && hasNavigatorLink();
         var _loc5_:Boolean = !_loc3_ && !_loc8_ && hasRoomLink();
         var _loc6_:Boolean = _loc3_ || _loc8_ || _loc5_;
         var _loc7_:IRegionWindow;
         (_loc7_ = IRegionWindow(_window.findChildByName(param1))).y = param2;
         var _loc4_:int = 0;
         if(_loc6_ && !_loc7_.visible)
         {
            _loc4_ = 5 + _loc7_.height;
         }
         if(!_loc6_ && Boolean(_loc7_.visible))
         {
            _loc4_ = -5 - _loc7_.height;
         }
         _loc7_.visible = _loc6_;
         _loc7_.findChildByName("link_catalog").visible = _loc3_;
         _loc7_.findChildByName("link_navigator").visible = _loc8_;
         _loc7_.findChildByName("link_room").visible = _loc5_;
         return _loc4_;
      }
      
      private function hasCatalogLink() : Boolean
      {
         return const_442.indexOf(var_363.type) > -1;
      }
      
      private function hasNavigatorLink() : Boolean
      {
         var _loc2_:Boolean = _questEngine.hasLocalizedValue(var_363.getCampaignLocalizationKey() + ".searchtag");
         var _loc1_:Boolean = _questEngine.hasLocalizedValue(var_363.getCampaignLocalizationKey() + ".searchtag");
         return _loc2_ || _loc1_;
      }
      
      private function hasRoomLink() : Boolean
      {
         return _questEngine.isSeasonalQuest(var_363) && _questEngine.hasQuestRoomsIds();
      }
      
      private function getTextHeight(param1:ITextWindow) : int
      {
         return !!param1.visible ? param1.height : 0;
      }
      
      private function onDetailsWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _window.visible = false;
         }
      }
      
      public function set openForNextQuest(param1:Boolean) : void
      {
         var_3246 = param1;
      }
      
      private function onLinkProc(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(hasCatalogLink())
            {
               _questEngine.openCatalog(var_363);
            }
            else if(hasNavigatorLink())
            {
               _questEngine.openNavigator(var_363);
            }
            else
            {
               _questEngine.goToQuestRooms();
            }
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
         var _loc2_:Boolean = _questEngine.questController.questsList.refreshDelay(_window,var_363);
         if(_loc2_)
         {
            openDetails(var_363,var_3614);
         }
      }
      
      private function onAcceptQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(false)
            {
               _questEngine.send(new class_450(var_363.id));
            }
            else
            {
               _questEngine.send(new class_412(var_363.id));
            }
            _window.visible = false;
            _questEngine.questController.seasonalCalendarWindow.close();
            if(var_3614 && _questEngine.isSeasonalQuest(var_363))
            {
               _questEngine.goToQuestRooms();
            }
         }
      }
      
      private function onCancelQuest(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _questEngine.send(new class_920());
         }
      }
   }
}
