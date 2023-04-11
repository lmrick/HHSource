package com.sulake.habbo.help
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.help.guidehelp.GuideSessionController;
   import com.sulake.habbo.help.guidehelp.HelpController;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_17.class_486;
   import package_183.class_1589;
   
   public class GuideHelpManager implements class_13
   {
       
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      private var var_2546:HelpController;
      
      private var var_2394:GuideSessionController;
      
      private var var_2702:com.sulake.habbo.help.ChatReviewReporterFeedbackCtrl;
      
      private var _disposed:Boolean = false;
      
      private var _seenTourPopupDuringSession:Boolean;
      
      private var var_4342:int;
      
      private var _panicRoomName:String;
      
      private var var_2500:Timer;
      
      public function GuideHelpManager(param1:com.sulake.habbo.help.HabboHelp)
      {
         super();
         _habboHelp = param1;
         var_2546 = new HelpController(this);
         var_2394 = new GuideSessionController(this);
         var_2702 = new com.sulake.habbo.help.ChatReviewReporterFeedbackCtrl(_habboHelp);
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_486(onRoomEnter));
      }
      
      public function get habboHelp() : com.sulake.habbo.help.HabboHelp
      {
         return _habboHelp;
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         if(false && false && !_seenTourPopupDuringSession && !_habboHelp.sessionDataManager.isRealNoob)
         {
            var_2500 = new Timer(getTourPopupDelay(),1);
            var_2500.addEventListener("timer",onTourPopup);
            var_2500.start();
            _habboHelp.tracking.trackEventLog("Help","","tour.new_user.create","",getTourPopupDelay());
            _habboHelp.trackGoogle("newbieTourWindow","timer_popupCreated");
         }
      }
      
      private function onTourPopup(param1:TimerEvent) : void
      {
         if(_disposed)
         {
            return;
         }
         _habboHelp.tracking.trackEventLog("Help","","tour.new_user.show","",getTourPopupDelay());
         _habboHelp.trackGoogle("newbieTourWindow","timer_popupShown");
         openTourPopup();
      }
      
      public function openTourPopup() : void
      {
         var_2546.openTourPopup();
         _seenTourPopupDuringSession = true;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(var_2546)
         {
            var_2546.dispose();
            var_2546 = null;
         }
         if(var_2394)
         {
            var_2394.dispose();
            var_2394 = null;
         }
         if(var_2702)
         {
            var_2702.dispose();
            var_2702 = null;
         }
         if(var_2500)
         {
            var_2500.reset();
            var_2500 = null;
         }
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function showGuideTool() : void
      {
         var_2394.showGuideTool();
      }
      
      public function showPendingTicket(param1:class_1589) : void
      {
         var_2546.showPendingTicket(param1);
      }
      
      public function createHelpRequest(param1:uint) : void
      {
         var_2394.createHelpRequest(param1);
      }
      
      public function openReportWindow() : void
      {
         var_2394.openReportWindow();
      }
      
      public function showFeedback(param1:String) : void
      {
         var_2702.show(param1);
      }
      
      private function getTourPopupDelay() : int
      {
         return _habboHelp.getInteger("guide.help.new.user.tour.popup.delay",30) * 1000;
      }
      
      public function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == "HTE_TOOLBAR_CLICK")
         {
            switch(param1.iconId)
            {
               case "HTIE_ICON_HELP":
                  _habboHelp.toggleNewHelpWindow();
                  break;
               case "HTIE_ICON_GUIDE":
                  showGuideTool();
            }
         }
      }
   }
}
