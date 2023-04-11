package com.sulake.habbo.phonenumber
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class PhoneNumberCollectMinimizedView
   {
      
      private static const BG_COLOR_LIGHT:uint = 4286084205;
      
      private static const BG_COLOR_DARK:uint = 4283781966;
       
      
      private var var_1460:com.sulake.habbo.phonenumber.HabboPhoneNumber;
      
      private var _window:class_3127;
      
      public function PhoneNumberCollectMinimizedView(param1:com.sulake.habbo.phonenumber.HabboPhoneNumber)
      {
         super();
         var_1460 = param1;
         createWindow();
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("WME_CLICK",onClicked);
            _window.dispose();
            _window = null;
         }
         var_1460 = null;
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
      
      private function createWindow() : void
      {
         if(_window)
         {
            return;
         }
         _window = var_1460.windowManager.buildFromXML(XML(var_1460.assets.getAssetByName("phonenumber_collect_minimized_xml").content));
         _window.addEventListener("WME_CLICK",onClicked);
         _window.addEventListener("WME_OVER",onContainerMouseOver);
         _window.addEventListener("WME_OUT",onContainerMouseOut);
         IRegionWindow(_window).findChildByTag("BGCOLOR").color = 4283781966;
      }
      
      private function onClicked(param1:WindowMouseEvent) : void
      {
         var_1460.setCollectViewMinimized(false);
      }
      
      private function onContainerMouseOver(param1:WindowMouseEvent) : void
      {
         IRegionWindow(_window).findChildByTag("BGCOLOR").color = 4286084205;
      }
      
      private function onContainerMouseOut(param1:WindowMouseEvent) : void
      {
         IRegionWindow(_window).findChildByTag("BGCOLOR").color = 4283781966;
      }
   }
}
