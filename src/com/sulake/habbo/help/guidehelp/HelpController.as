package com.sulake.habbo.help.guidehelp
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.help.GuideHelpManager;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.habbo.window.widgets.class_3308;
   import com.sulake.habbo.window.widgets.class_3368;
   import flash.utils.getTimer;
   import package_183.class_1589;
   import package_22.class_316;
   
   public class HelpController implements class_13
   {
       
      
      private var _habboHelp:HabboHelp;
      
      private var _guideHelp:GuideHelpManager;
      
      private var _disposed:Boolean = false;
      
      private var var_1921:IModalDialog;
      
      private var _tourPopup:class_3151;
      
      private var _tourPopupShowTime:int;
      
      private var var_1825:class_3151;
      
      public function HelpController(param1:GuideHelpManager)
      {
         super();
         _habboHelp = param1.habboHelp;
         _guideHelp = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         closeWindow();
         closeTourPopup();
         _habboHelp = null;
         _guideHelp = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function openWindow() : void
      {
         if(var_1921 == null && !disposed)
         {
            var_1921 = _guideHelp.habboHelp.getModalXmlWindow("main_help");
            var_1921.rootWindow.procedure = windowEventProcedure;
         }
      }
      
      public function closeWindow() : void
      {
         if(var_1921 != null)
         {
            var_1921.dispose();
            var_1921 = null;
         }
      }
      
      private function windowEventProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_3176 = null;
         if(disposed || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
               closeWindow();
               break;
            case "tour_button":
               _guideHelp.createHelpRequest(_habboHelp.newIdentity ? 0 : 2);
               _habboHelp.trackGoogle("helpWindow","click_userTour");
               closeWindow();
               break;
            case "bully_button":
               closeWindow();
               _habboHelp.toggleNewHelpWindow();
               _habboHelp.trackGoogle("helpWindow","click_reportBully");
               break;
            case "instructions_button":
               _guideHelp.createHelpRequest(1);
               _habboHelp.trackGoogle("helpWindow","click_instructions");
               closeWindow();
               break;
            case "self_help_link":
               HabboWebTools.openWebPage(_habboHelp.getProperty("zendesk.url"),"habboMain");
               _habboHelp.trackGoogle("helpWindow","click_selfHelp");
               closeWindow();
               break;
            case "habboway_link":
               if(_habboHelp.getBoolean("habboway.enabled"))
               {
                  _habboHelp.showHabboWay();
               }
               else
               {
                  HabboWebTools.openWebPage(_habboHelp.getProperty("habboway.url"),"habboMain");
               }
               _habboHelp.trackGoogle("helpWindow","click_habboWay");
               closeWindow();
               break;
            case "safetybooklet_link":
               _habboHelp.showSafetyBooklet();
               _habboHelp.trackGoogle("helpWindow","click_showSafetyBooklet");
               closeWindow();
               break;
            case "emergency_button":
               _loc3_ = class_3151(var_1921.rootWindow).findChildByName("leave_room") as class_3176;
               if(_loc3_ != null && Boolean(_loc3_.isSelected))
               {
                  _habboHelp.sendMessage(new class_316());
               }
               closeWindow();
               _habboHelp.startEmergencyRequest();
               _habboHelp.trackGoogle("helpWindow","click_emergency");
         }
      }
      
      public function openTourPopup() : void
      {
         if(_tourPopup == null && !disposed)
         {
            _tourPopupShowTime = getTimer();
            _tourPopup = _guideHelp.habboHelp.getXmlWindow("welcome_tour_popup") as class_3151;
            _tourPopup.center();
            _tourPopup.y = 0;
            _tourPopup.procedure = tourPopupEventProcedure;
         }
      }
      
      private function closeTourPopup() : void
      {
         if(_tourPopup != null)
         {
            _tourPopup.dispose();
            _tourPopup = null;
         }
      }
      
      private function tourPopupEventProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(disposed || param1.type != "WME_CLICK")
         {
            return;
         }
         var _loc3_:int = (_tourPopupShowTime - getTimer()) / 1000;
         switch(param2.name)
         {
            case "refuse_tour":
               _habboHelp.tracking.trackEventLog("Help","","tour.new_user.cancel","",_loc3_);
               _habboHelp.trackGoogle("newbieTourWindow","click_refuseTour");
               closeTourPopup();
               break;
            case "header_button_close":
               _habboHelp.tracking.trackEventLog("Help","","tour.new_user.dismiss","",_loc3_);
               _habboHelp.trackGoogle("newbieTourWindow","click_closeWindow");
               closeTourPopup();
               break;
            case "take_tour":
               _guideHelp.createHelpRequest(0);
               _habboHelp.tracking.trackEventLog("Help","","tour.new_user.accept","",_loc3_);
               _habboHelp.trackGoogle("newbieTourWindow","click_acceptTour");
               closeTourPopup();
         }
      }
      
      public function showPendingTicket(param1:class_1589) : void
      {
         var _loc2_:String = null;
         if(param1.isGuide)
         {
            _loc2_ = "pending_guide_session";
         }
         else
         {
            switch(param1.type)
            {
               case 0:
               case 2:
                  _loc2_ = "pending_tour_request";
                  break;
               case 1:
                  _loc2_ = "pending_instructions_request";
                  break;
               case 3:
                  _loc2_ = "pending_bully_request";
                  break;
               default:
                  return;
            }
         }
         var_1825 = _habboHelp.getXmlWindow(_loc2_) as class_3151;
         var_1825.center();
         var_1825.procedure = onPendingReuqestEvent;
         if(param1.isGuide)
         {
            return;
         }
         switch(param1.type - 1)
         {
            case 0:
               var_1825.findChildByName("description").caption = param1.description;
               class_3368(class_3217(var_1825.findChildByName("timestamp")).widget).timeStamp = new Date().getTime() - param1.secondsAgo * 1000;
               break;
            case 2:
               var_1825.findChildByName("user_name").caption = param1.otherPartyName;
               class_3308(class_3217(var_1825.findChildByName("user_avatar")).widget).figure = param1.otherPartyFigure;
               class_3368(class_3217(var_1825.findChildByName("timestamp")).widget).timeStamp = new Date().getTime() - param1.secondsAgo * 1000;
               _habboHelp.localization.registerParameter("guide.pending.bully.room","room",param1.roomName);
         }
      }
      
      private function onPendingReuqestEvent(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "header_button_close":
               case "close_button":
                  if(var_1825 != null && true)
                  {
                     var_1825.dispose();
                     var_1825 = null;
                     break;
                  }
            }
         }
      }
   }
}
