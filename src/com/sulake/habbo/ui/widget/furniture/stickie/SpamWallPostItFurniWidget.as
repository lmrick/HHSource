package com.sulake.habbo.ui.widget.furniture.stickie
{
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSpamWallPostItEditEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class SpamWallPostItFurniWidget extends StickieFurniWidget
   {
       
      
      private var _location:String = "";
      
      public function SpamWallPostItFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null)
      {
         _windowName = "spamwall_postit_container";
         super(param1,param2,param3);
      }
      
      override public function dispose() : void
      {
         var_347 = -1;
         _location = "";
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         param1.addEventListener("RWSWPUE_OPEN_EDITOR",onEditPostItRequest);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWSWPUE_OPEN_EDITOR",onEditPostItRequest);
      }
      
      override protected function onObjectUpdate(param1:RoomWidgetStickieDataUpdateEvent) : void
      {
      }
      
      private function onEditPostItRequest(param1:RoomWidgetSpamWallPostItEditEvent) : void
      {
         hideInterface(false);
         var_347 = param1.objectId;
         _location = param1.location;
         var_3053 = param1.objectType;
         _text = "";
         var_962 = "FFFF33";
         var_282 = true;
         showInterface();
      }
      
      override protected function sendUpdate() : void
      {
         var _loc1_:RoomWidgetSpamWallPostItFinishEditingMessage = null;
         if(var_347 != -1)
         {
            storeTextFromField();
            class_14.log("Spamwall Post-It Widget Send Update");
            if(messageListener != null)
            {
               _loc1_ = new RoomWidgetSpamWallPostItFinishEditingMessage("RWSWPFEE_SEND_POSTIT_DATA",var_347,_location,_text,var_962);
               messageListener.processWidgetMessage(_loc1_);
            }
            hideInterface(false);
         }
      }
      
      override protected function sendSetColor(param1:uint) : void
      {
         storeTextFromField();
         var _loc2_:String = param1.toString(16).toUpperCase();
         if(_loc2_.length > 6)
         {
            _loc2_ = _loc2_.slice(_loc2_.length - 6,_loc2_.length);
         }
         if(_loc2_ == var_962)
         {
            return;
         }
         var_962 = _loc2_;
         showInterface();
      }
      
      override protected function sendDelete() : void
      {
         hideInterface(false);
      }
   }
}
