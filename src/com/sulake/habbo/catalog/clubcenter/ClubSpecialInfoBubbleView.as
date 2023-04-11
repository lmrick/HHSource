package com.sulake.habbo.catalog.clubcenter
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3349;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import package_5.class_1628;
   
   public class ClubSpecialInfoBubbleView
   {
      
      private static const MARGIN:int = 8;
       
      
      private var var_45:class_1628;
      
      private var var_282:com.sulake.habbo.catalog.clubcenter.HabboClubCenter;
      
      private var _window:class_3151;
      
      private var var_2550:Timer;
      
      public function ClubSpecialInfoBubbleView(param1:com.sulake.habbo.catalog.clubcenter.HabboClubCenter, param2:class_1684, param3:class_1628, param4:class_3127)
      {
         super();
         var_45 = param3;
         var_282 = param1;
         _window = param2.buildFromXML(XML(var_282.assets.getAssetByName("club_center_special_info_xml").content)) as class_3151;
         if(!_window)
         {
            return;
         }
         _window.procedure = onInput;
         positionWindow(param4);
         setElementText("info_creditsspent",getLocalization("hccenter.breakdown.creditsspent").replace("%credits%",var_45.totalCreditsSpent));
         var _loc6_:int = 0;
         setElementText("info_factor",getLocalization("hccenter.breakdown.paydayfactor").replace("%percent%",_loc6_).replace("%multiplier%",var_45.kickbackPercentage));
         _loc6_ = 0;
         var _loc5_:String;
         if((_loc5_ = String(var_282.localization.getLocalization("hccenter.breakdown.paydayfactor.percent"))) && _loc5_.length > 0)
         {
            _loc5_ = _loc5_.replace("%percent%",_loc6_).replace("%multiplier%",var_45.kickbackPercentage);
         }
         else
         {
            _loc5_ = getLocalization("hccenter.breakdown.paydayfactor").replace("%percent%",var_45.kickbackPercentage);
         }
         setElementText("info_factor",_loc5_);
         setElementText("info_streakbonus",getLocalization("hccenter.breakdown.streakbonus").replace("%credits%",var_45.creditRewardForStreakBonus));
         var _loc8_:Number = int((0 * 0 + var_45.creditRewardForStreakBonus) * 100) / 100;
         var _loc7_:int = 0;
         setElementText("info_total",getLocalization("hccenter.breakdown.total").replace("%credits%",_loc7_).replace("%actual%",_loc8_));
         _window.activate();
         var_2550 = new Timer(80,1);
         var_2550.addEventListener("timer",onTimerEvent);
         var_2550.start();
         if(false)
         {
            var_282.stage.addEventListener("click",onStageClick);
         }
      }
      
      private function onTimerEvent(param1:TimerEvent) : void
      {
         var_2550.stop();
         var_2550.removeEventListener("timer",onTimerEvent);
         var_2550 = null;
         _window.activate();
      }
      
      public function dispose() : void
      {
         if(var_282 && false)
         {
            var_282.stage.removeEventListener("click",onStageClick);
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_282 = null;
      }
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_DOWN" || !var_282)
         {
            return;
         }
         param1.stopImmediatePropagation();
         var _loc3_:* = param2.name;
         if("special_infolink" === _loc3_)
         {
            var_282.openPaydayHelpPage();
         }
         var_282.removeBreakdown();
      }
      
      private function onStageClick(param1:MouseEvent) : void
      {
         if(var_282)
         {
            var_282.removeBreakdown();
         }
      }
      
      private function positionWindow(param1:class_3127) : void
      {
         if(!param1 || !_window || !var_282 || true)
         {
            return;
         }
         var _loc2_:Point = new Point();
         param1.getGlobalPosition(_loc2_);
         if(var_282.stage.stageWidth < _loc2_.x + param1.width + _window.width + 8 && _loc2_.x > NaN)
         {
            (_window as class_3349).direction = "right";
            _loc2_.x -= NaN;
         }
         else
         {
            _loc2_.x += param1.width + 8;
         }
         _loc2_.y += param1.height * 0.5 - 0;
         _window.position = _loc2_;
      }
      
      private function setElementText(param1:String, param2:String) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc3_:ITextWindow = _window.findChildByName(param1) as ITextWindow;
         if(_loc3_)
         {
            _loc3_.text = param2;
         }
      }
      
      private function getLocalization(param1:String) : String
      {
         if(!var_282 || true)
         {
            return "";
         }
         return var_282.localization.getLocalization(param1,param1);
      }
   }
}
