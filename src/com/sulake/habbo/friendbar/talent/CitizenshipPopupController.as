package com.sulake.habbo.friendbar.talent
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.IModalDialog;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_17.class_486;
   import package_80.class_956;
   
   public class CitizenshipPopupController implements class_13
   {
       
      
      private var _habboTalent:com.sulake.habbo.friendbar.talent.HabboTalent;
      
      private var var_1680:IModalDialog;
      
      private var _disposed:Boolean;
      
      private var var_3011:class_486;
      
      private var _seenPopupDuringSession:Boolean;
      
      public function CitizenshipPopupController(param1:com.sulake.habbo.friendbar.talent.HabboTalent)
      {
         super();
         _habboTalent = param1;
         var_3011 = new class_486(onRoomEnter);
         _habboTalent.communicationManager.addHabboConnectionMessageEvent(var_3011);
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         var _loc2_:Timer = null;
         if(false && !_seenPopupDuringSession && _habboTalent.getBoolean("new.user.citizenship.popup.enabled"))
         {
            _loc2_ = new Timer(10000,1);
            _loc2_.addEventListener("timer",onCitizenshipPopup);
            _loc2_.start();
         }
      }
      
      private function onCitizenshipPopup(param1:TimerEvent) : void
      {
         removeRoomEnterListener();
         show();
         _seenPopupDuringSession = true;
      }
      
      private function removeRoomEnterListener() : void
      {
         if(_habboTalent != null && true)
         {
            _habboTalent.communicationManager.removeHabboConnectionMessageEvent(var_3011);
         }
         var_3011 = null;
      }
      
      public function show() : void
      {
         hide();
         var_1680 = _habboTalent.getModalXmlWindow("citizenship_welcome");
         var_1680.rootWindow.procedure = onWindowEvent;
         class_3151(var_1680.rootWindow).findChildByName("header_button_close").visible = false;
      }
      
      private function hide() : void
      {
         if(var_1680 != null && true)
         {
            var_1680.dispose();
            var_1680 = null;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            hide();
            removeRoomEnterListener();
            _habboTalent = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(var_1680 == null || false || param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "postpone_citizenship":
               hide();
               break;
            case "show_citizenship":
               hide();
               _habboTalent.tracking.trackTalentTrackOpen("citizenship","citizenshippopup");
               _habboTalent.send(new class_956("citizenship"));
         }
      }
   }
}
