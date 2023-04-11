package com.sulake.habbo.ui.widget.furniture.placeholder
{
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetShowPlaceholderEvent;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class PlaceholderWidget extends RoomWidgetBase
   {
       
      
      private var var_1430:com.sulake.habbo.ui.widget.furniture.placeholder.PlaceholderView;
      
      public function PlaceholderWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWSPE_SHOW_PLACEHOLDER",onShowEvent);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWSPE_SHOW_PLACEHOLDER",onShowEvent);
      }
      
      private function onShowEvent(param1:RoomWidgetShowPlaceholderEvent) : void
      {
         showInterface();
      }
      
      private function showInterface() : void
      {
         if(var_1430 == null)
         {
            var_1430 = new com.sulake.habbo.ui.widget.furniture.placeholder.PlaceholderView(assets,windowManager);
         }
         var_1430.showWindow();
      }
      
      private function hideInterface() : void
      {
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
   }
}
