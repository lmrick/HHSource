package com.sulake.habbo.ui.widget.roomqueue
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomQueueUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomQueueMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class RoomQueueWidget extends RoomWidgetBase
   {
       
      
      private var _window:class_3281;
      
      private var _config:class_19;
      
      private var _queuePosition:int;
      
      private var var_4180:Boolean;
      
      private var var_699:String;
      
      private var var_3156:Boolean;
      
      private var var_3524:Boolean;
      
      public function RoomQueueWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_19)
      {
         super(param1,param2,param3,param4);
         _config = param5;
      }
      
      override public function dispose() : void
      {
         removeWindow();
         _config = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWRQUE_VISITOR_QUEUE_STATUS",onQueueStatus);
         param1.addEventListener("RWRQUE_SPECTATOR_QUEUE_STATUS",onQueueStatus);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWRQUE_VISITOR_QUEUE_STATUS",onQueueStatus);
         param1.removeEventListener("RWRQUE_SPECTATOR_QUEUE_STATUS",onQueueStatus);
      }
      
      private function removeWindow() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function onQueueStatus(param1:RoomWidgetRoomQueueUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.isActive)
         {
            var_699 = param1.type;
            var_3156 = false;
            _queuePosition = param1.position;
         }
         else
         {
            var_3156 = true;
         }
         var_4180 = param1.hasHabboClub;
         var_3524 = param1.isClubQueue;
         localizations.registerParameter("room.queue.position","position",_queuePosition.toString());
         localizations.registerParameter("room.queue.position.hc","position",_queuePosition.toString());
         localizations.registerParameter("room.queue.spectator.position","position",_queuePosition.toString());
         localizations.registerParameter("room.queue.spectator.position.hc","position",_queuePosition.toString());
         showInterface();
      }
      
      private function createWindow() : Boolean
      {
         if(_window != null)
         {
            return true;
         }
         var _loc2_:XmlAsset = assets.getAssetByName("room_queue") as XmlAsset;
         _window = windowManager.buildFromXML(_loc2_.content as XML) as class_3281;
         if(_window == null)
         {
            return false;
         }
         _window.visible = false;
         var _loc1_:class_3127 = _window.findChildByTag("close");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",exitQueue);
         }
         _loc1_ = _window.findChildByName("cancel_button");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",exitQueue);
         }
         _loc1_ = _window.findChildByName("link_text");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",openLink);
         }
         _loc1_ = _window.findChildByName("change_button");
         if(_loc1_ != null)
         {
            _loc1_.addEventListener("WME_CLICK",changeQueue);
         }
         _window.center();
         return true;
      }
      
      private function showInterface() : void
      {
         if(!createWindow())
         {
            return;
         }
         var _loc3_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         var _loc4_:class_3140 = _window.findChildByName("change_button") as class_3140;
         var _loc2_:class_3127 = _window.findChildByName("spectator_info");
         if(_loc3_ != null && _loc4_ != null && _loc2_ != null)
         {
            switch(var_699)
            {
               case "RWRQUE_VISITOR_QUEUE_STATUS":
                  _loc3_.caption = var_3524 ? "${room.queue.position.hc}" : "${room.queue.position}";
                  _loc4_.caption = "${room.queue.spectatormode}";
                  _loc2_.visible = var_3156;
                  break;
               case "RWRQUE_SPECTATOR_QUEUE_STATUS":
                  _loc3_.caption = var_3524 ? "${room.queue.spectator.position.hc}" : "${room.queue.spectator.position}";
                  _loc4_.caption = "${room.queue.back}";
                  _loc2_.visible = false;
            }
            _loc4_.visible = var_3156;
         }
         var _loc1_:class_3151 = _window.findChildByName("club_container") as class_3151;
         if(_loc1_ != null)
         {
            _loc1_.visible = !var_4180;
         }
         _window.visible = true;
      }
      
      private function exitQueue(param1:WindowMouseEvent) : void
      {
         if(messageListener == null)
         {
            return;
         }
         var _loc2_:RoomWidgetRoomQueueMessage = new RoomWidgetRoomQueueMessage("RWRQM_EXIT_QUEUE");
         messageListener.processWidgetMessage(_loc2_);
         removeWindow();
      }
      
      private function openLink(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomQueueMessage("RWRQM_CLUB_LINK"));
      }
      
      private function changeQueue(param1:WindowMouseEvent) : void
      {
         var _loc2_:RoomWidgetRoomQueueMessage = null;
         if(messageListener == null)
         {
            return;
         }
         if(var_699 == "RWRQUE_VISITOR_QUEUE_STATUS")
         {
            _loc2_ = new RoomWidgetRoomQueueMessage("RWRQM_CHANGE_TO_SPECTATOR_QUEUE");
         }
         else
         {
            _loc2_ = new RoomWidgetRoomQueueMessage("RWRQM_CHANGE_TO_VISITOR_QUEUE");
         }
         messageListener.processWidgetMessage(_loc2_);
         removeWindow();
      }
   }
}
