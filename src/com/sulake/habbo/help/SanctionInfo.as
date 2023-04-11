package com.sulake.habbo.help
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.StringUtil;
   import package_165.class_1506;
   import package_36.class_608;
   
   public class SanctionInfo implements class_13
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _window:class_3151;
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      public function SanctionInfo(param1:com.sulake.habbo.help.HabboHelp)
      {
         super();
         _habboHelp = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function openWindow(param1:class_608) : void
      {
         dispose();
         _disposed = false;
         _window = _habboHelp.getXmlWindow("sanction_info") as class_3151;
         _window.center();
         _window.procedure = windowEventHandler;
         var _loc2_:class_1506 = param1.getParser();
         if(_loc2_.sanctionReason == "cfh.reason.EMPTY")
         {
            _window.findChildByName("no_sanction_info").visible = true;
            _window.findChildByName("last_sanction_type").visible = false;
            _window.findChildByName("sanction_start_time").visible = false;
            _window.findChildByName("sanction_reason").visible = false;
            _window.findChildByName("probation_info").visible = false;
         }
         else
         {
            _window.findChildByName("last_sanction_type").caption = _habboHelp.localization.getLocalization("help.sanction.last.sanction") + " " + getSanctionTypeDescription("current",_loc2_.sanctionName,_loc2_.sanctionLengthHours);
            if(_loc2_.isSanctionNew)
            {
               (_window.findChildByName("last_sanction_type") as ITextWindow).textColor = 16711680;
            }
            _window.findChildByName("sanction_start_time").caption = _habboHelp.localization.getLocalization("generic.start.time") + " " + _loc2_.sanctionCreationTime;
            _window.findChildByName("sanction_reason").caption = _habboHelp.localization.getLocalization("generic.reason") + " " + _loc2_.sanctionReason;
            if(_loc2_.isSanctionActive)
            {
               _window.findChildByName("probation_info").visible = false;
            }
            else
            {
               _window.findChildByName("probation_info").caption = _habboHelp.localization.getLocalization("help.sanction.probation.days.left") + " " + (int(_loc2_.probationHoursLeft / 24) + 1);
            }
            _window.findChildByName("probation_reminder_title").visible = _loc2_.probationHoursLeft > 0 || _loc2_.isSanctionActive;
         }
         if(_loc2_.hasCustomMute && !_loc2_.isSanctionActive)
         {
            _window.findChildByName("no_sanction_info").visible = false;
            _window.findChildByName("custom_mute_info").visible = true;
            _window.findChildByName("last_sanction_type").visible = false;
            _window.findChildByName("sanction_start_time").visible = false;
            _window.findChildByName("sanction_reason").visible = false;
         }
         if(!StringUtil.isEmpty(_loc2_.tradeLockExpiryTime))
         {
            _window.findChildByName("no_sanction_info").visible = false;
            _window.findChildByName("trade_lock_info").caption = _habboHelp.localization.getLocalization("trade.locked.until") + " " + _loc2_.tradeLockExpiryTime;
            _window.findChildByName("trade_lock_info").visible = true;
         }
         _window.findChildByName("next_sanction").caption = getSanctionTypeDescription("next",_loc2_.nextSanctionName,_loc2_.nextSanctionLengthHours);
         IItemListWindow(_window.findChildByName("main_contents_list")).arrangeListItems();
      }
      
      private function getSanctionTypeDescription(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:String = "help.sanction." + param1;
         switch(param2)
         {
            case "ALERT":
               _loc4_ += ".alert";
               break;
            case "MUTE":
               _loc4_ += ".mute";
               break;
            case "BAN_PERMANENT":
               _loc4_ += ".permban";
               break;
            default:
               _loc4_ += ".ban";
               if(param3 > 24)
               {
                  _loc4_ += ".days";
                  return _habboHelp.localization.registerParameter(_loc4_,"days",(param3 / 24).toString());
               }
               break;
         }
         return _habboHelp.localization.registerParameter(_loc4_,"hours",param3.toString());
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(_disposed || !_window || param1.type != "WME_CLICK" || !param2)
         {
            return;
         }
         switch(param2.name)
         {
            case "faq_link":
               _habboHelp.openCfhFaq();
               break;
            case "header_button_close":
            case "ok_button":
               dispose();
         }
      }
   }
}
