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
   
   public class FurniChooserWidget extends ChooserWidgetBase
   {
       
      
      private var var_2142:com.sulake.habbo.ui.widget.chooser.ChooserView;
      
      public function FurniChooserWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         if(var_2142 != null)
         {
            var_2142.dispose();
            var_2142 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWCCE_FURNI_CHOOSER_CONTENT",onChooserContent);
         param1.addEventListener("RWROUE_FURNI_REMOVED",onUpdateFurniChooser);
         param1.addEventListener("RWROUE_FURNI_ADDED",onUpdateFurniChooser);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWCCE_FURNI_CHOOSER_CONTENT",onChooserContent);
         param1.removeEventListener("RWROUE_FURNI_REMOVED",onUpdateFurniChooser);
         param1.removeEventListener("RWROUE_FURNI_ADDED",onUpdateFurniChooser);
      }
      
      private function onChooserContent(param1:RoomWidgetChooserContentEvent) : void
      {
         if(param1 == null || param1.items == null)
         {
            return;
         }
         if(var_2142 == null)
         {
            var_2142 = new com.sulake.habbo.ui.widget.chooser.ChooserView(this,"${widget.chooser.furni.title}");
         }
         var_2142.populate(param1.items,param1.isAnyRoomController);
      }
      
      private function onUpdateFurniChooser(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(var_2142 == null || !var_2142.isOpen())
         {
            return;
         }
         var _loc2_:RoomWidgetRequestWidgetMessage = new RoomWidgetRequestWidgetMessage("RWRWM_FURNI_CHOOSER");
         messageListener.processWidgetMessage(_loc2_);
      }
   }
}
