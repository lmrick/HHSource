package com.sulake.habbo.friendbar.talent
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import package_149.class_1088;
   import package_149.class_1231;
   import package_6.class_530;
   import package_80.class_320;
   import package_80.class_956;
   import package_92.class_1040;
   import package_92.class_369;
   
   public class TalentPromoCtrl implements class_13
   {
      
      private static const BG_COLOR_LIGHT:uint = 4286084205;
      
      private static const BG_COLOR_DARK:uint = 4283781966;
       
      
      private var var_437:com.sulake.habbo.friendbar.talent.HabboTalent;
      
      private var _window:class_3151;
      
      private var var_262:int;
      
      private var var_948:int;
      
      private var var_4135:int;
      
      public function TalentPromoCtrl(param1:com.sulake.habbo.friendbar.talent.HabboTalent)
      {
         super();
         var_437 = param1;
      }
      
      public function dispose() : void
      {
         if(toolbarAttachAllowed())
         {
            var_437.toolbar.extensionView.detachExtension("talent_promo");
         }
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      public function initialize() : void
      {
         if(!enabled)
         {
            return;
         }
         var_437.communicationManager.addHabboConnectionMessageEvent(new class_1040(onTalentTrackLevel));
         var_437.communicationManager.addHabboConnectionMessageEvent(new class_530(onUserObject));
         var_437.communicationManager.addHabboConnectionMessageEvent(new class_369(onTalentLevelUp));
      }
      
      private function onUserObject(param1:class_530) : void
      {
         var_437.send(new class_320(promotedTalentTrack));
      }
      
      private function onTalentTrackLevel(param1:class_1040) : void
      {
         var _loc2_:class_1231 = param1.getParser();
         if(_loc2_.talentTrackName == promotedTalentTrack)
         {
            var_948 = _loc2_.maxLevel;
            var_262 = _loc2_.level;
            refresh();
         }
      }
      
      private function onTalentLevelUp(param1:class_369) : void
      {
         var _loc2_:class_1088 = param1.getParser();
         if(_loc2_.talentTrackName == promotedTalentTrack)
         {
            var_262 = _loc2_.level;
            refresh();
         }
      }
      
      private function refresh() : void
      {
         if(!enabled || maxLevelReached)
         {
            close();
            return;
         }
         prepareWindow();
         setText("title");
         _window.x = 0;
         _window.y = 0;
         if(toolbarAttachAllowed())
         {
            var_437.toolbar.extensionView.attachExtension("talent_promo",_window,7);
         }
      }
      
      private function setText(param1:String) : void
      {
         _window.findChildByName(param1 + "_txt").caption = "${talentpromo." + promotedTalentTrack + "." + param1 + "}";
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = class_3151(var_437.getXmlWindow("track_promo"));
         _window.addEventListener("WME_CLICK",onCheckProgress);
         _window.addEventListener("WME_OVER",onContainerMouseOver);
         _window.addEventListener("WME_OUT",onContainerMouseOut);
         var_4135 = _window.height;
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            if(toolbarAttachAllowed())
            {
               var_437.toolbar.extensionView.detachExtension("talent_promo");
            }
         }
      }
      
      private function onCheckProgress(param1:class_3134, param2:class_3127 = null) : void
      {
         if(param1.type == "WME_CLICK" && enabled)
         {
            var_437.tracking.trackTalentTrackOpen(promotedTalentTrack,"talentpromo");
            var_437.send(new class_956(promotedTalentTrack));
         }
      }
      
      private function toolbarAttachAllowed() : Boolean
      {
         return var_437 != null && false && var_437.toolbar.extensionView != null && enabled;
      }
      
      private function get enabled() : Boolean
      {
         return promotedTalentTrack != "";
      }
      
      private function get promotedTalentTrack() : String
      {
         return var_437.getProperty("talentpromo.track");
      }
      
      private function get maxLevelReached() : Boolean
      {
         return var_262 >= var_948;
      }
      
      private function onContainerMouseOver(param1:WindowMouseEvent) : void
      {
         _window.findChildByTag("BGCOLOR").color = 4286084205;
      }
      
      private function onContainerMouseOut(param1:WindowMouseEvent) : void
      {
         _window.findChildByTag("BGCOLOR").color = 4283781966;
      }
   }
}
