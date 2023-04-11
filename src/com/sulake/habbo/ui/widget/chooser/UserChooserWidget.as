package com.sulake.habbo.ui.widget.chooser
{
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChooserContentEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class UserChooserWidget extends ChooserWidgetBase
   {
       
      
      private const STATE_USER_CHOOSER_CLOSED:int = 0;
      
      private const STATE_USER_CHOOSER_OPEN:int = 1;
      
      private var var_1990:com.sulake.habbo.ui.widget.chooser.ChooserView;
      
      public function UserChooserWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function get state() : int
      {
         if(var_1990 != null && var_1990.isOpen())
         {
            return 1;
         }
         return 0;
      }
      
      override public function initialize(param1:int = 0) : void
      {
         var _loc2_:RoomWidgetRequestWidgetMessage = null;
         super.initialize(param1);
         if(param1 == 1)
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage("RWRWM_USER_CHOOSER");
            messageListener.processWidgetMessage(_loc2_);
         }
      }
      
      override public function dispose() : void
      {
         if(var_1990 != null)
         {
            var_1990.dispose();
            var_1990 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWCCE_USER_CHOOSER_CONTENT",onChooserContent);
         param1.addEventListener("RWROUE_USER_REMOVED",onUpdateUserChooser);
         param1.addEventListener("RWROUE_USER_ADDED",onUpdateUserChooser);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWCCE_USER_CHOOSER_CONTENT",onChooserContent);
         param1.removeEventListener("RWROUE_USER_REMOVED",onUpdateUserChooser);
         param1.removeEventListener("RWROUE_USER_ADDED",onUpdateUserChooser);
      }
      
      private function onChooserContent(param1:RoomWidgetChooserContentEvent) : void
      {
         if(param1 == null || param1.items == null)
         {
            return;
         }
         if(var_1990 == null)
         {
            var_1990 = new com.sulake.habbo.ui.widget.chooser.ChooserView(this,"${widget.chooser.user.title}");
         }
         var_1990.populate(param1.items,false);
      }
      
      private function onUpdateUserChooser(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var delayedAction:Timer;
         var event:RoomWidgetRoomObjectUpdateEvent = param1;
         if(var_1990 == null || !var_1990.isOpen())
         {
            return;
         }
         delayedAction = new Timer(100,1);
         delayedAction.addEventListener("timer",function(param1:TimerEvent):void
         {
            if(disposed)
            {
               return;
            }
            messageListener.processWidgetMessage(new RoomWidgetRequestWidgetMessage("RWRWM_USER_CHOOSER"));
         });
         delayedAction.start();
      }
   }
}
