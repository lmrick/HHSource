package com.sulake.habbo.groups
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   
   public class HcRequiredWindowCtrl implements class_13
   {
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var _window:class_3281;
      
      public function HcRequiredWindowCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager)
      {
         super();
         var_437 = param1;
      }
      
      public function dispose() : void
      {
         var_437 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_437 == null;
      }
      
      public function show(param1:Boolean) : void
      {
         prepareWindow();
         _window.findChildByName("info_txt").caption = param1 ? "${group.hcrequired.info.manage}" : "${group.hcrequired.info.join}";
         _window.visible = true;
         _window.activate();
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(var_437.getXmlWindow("club_required"));
         _window.findChildByTag("close").procedure = onClose;
         _window.findChildByName("cancel_link_region").procedure = onClose;
         _window.findChildByName("join_button").procedure = onOpenCatalog;
         _window.findChildByName("more_info_link_region").procedure = onOpenCatalog;
         _window.center();
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
         }
      }
      
      private function onOpenCatalog(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_437.openVipPurchase("HcRequiredWindowCtrl");
            close();
         }
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
   }
}
