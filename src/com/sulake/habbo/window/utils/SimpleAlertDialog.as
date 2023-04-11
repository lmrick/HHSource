package com.sulake.habbo.window.utils
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextLinkWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   
   public class SimpleAlertDialog implements class_13
   {
      
      private static const WINDOW_MARGIN:int = 10;
       
      
      private var _disposed:Boolean;
      
      private var var_1680:com.sulake.habbo.window.utils.IModalDialog;
      
      private var var_90:String;
      
      private var _window:class_3151;
      
      private var var_19:IItemListWindow;
      
      private var var_2405:IItemListWindow;
      
      private var var_3055:IItemListWindow;
      
      private var var_3284:class_3127;
      
      private var var_2621:class_3127;
      
      private var var_365:ITextLinkWindow;
      
      private var var_1868:IStaticBitmapWrapperWindow;
      
      private var var_2899:Function;
      
      private var var_3161:Function;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      public function SimpleAlertDialog(param1:HabboWindowManagerComponent, param2:String, param3:String, param4:String, param5:String, param6:String, param7:class_24, param8:String, param9:Function, param10:Function)
      {
         var _loc12_:String = null;
         super();
         var_2899 = param9;
         var_3161 = param10;
         _windowManager = param1;
         var _loc14_:IAsset = param1.assets.getAssetByName("simple_alert_xml");
         var_1680 = param1.buildModalDialogFromXML(_loc14_.content as XML);
         _window = class_3151(var_1680.rootWindow);
         var_19 = IItemListWindow(_window.findChildByName("list"));
         var_2405 = IItemListWindow(_window.findChildByName("list_top"));
         var_3055 = IItemListWindow(_window.findChildByName("list_bottom"));
         var_3284 = _window.findChildByName("message");
         var_2621 = _window.findChildByName("subtitle");
         var_365 = ITextLinkWindow(_window.findChildByName("link"));
         var_1868 = IStaticBitmapWrapperWindow(_window.findChildByName("illustration"));
         _window.findChildByName("header_button_close").dispose();
         _window.procedure = windowProcedure;
         _window.caption = param2;
         var_3284.caption = param4;
         if(param7 != null)
         {
            for each(var _loc13_ in [param2,param3,param4,param5])
            {
               if(_loc13_ != null && _loc13_.substr(0,2) == "${" && _loc13_.indexOf("}") > 0)
               {
                  _loc12_ = _loc13_.substring(2,_loc13_.indexOf("}"));
                  for(var _loc11_ in param7)
                  {
                     param1.localization.registerParameter(_loc12_,_loc11_,param7.getValue(_loc11_));
                  }
               }
            }
         }
         if(param3 != null && param3 != "")
         {
            var_2621.caption = param3;
         }
         else
         {
            var_2621.dispose();
            var_2621 = null;
         }
         param6 = param1.interpolate(param6);
         if(param5 != null && param5 != "" && (param6 != null && param6 != "" || param9 != null))
         {
            var_365.caption = param5;
            var_365.addEventListener("WME_CLICK",onSimpleAlertClick);
            var_365.immediateClickMode = true;
            var_90 = param6;
         }
         else
         {
            var_365.dispose();
            var_365 = null;
         }
         if(param8 != null && param8 != "")
         {
            var_1868.addEventListener("WE_RESIZED",onIllustrationResized);
            var_1868.assetUri = param8;
         }
         else
         {
            var_1868.dispose();
            var_1868 = null;
         }
         resizeWindow();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            close();
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function close() : void
      {
         if(var_3161 != null)
         {
            var_3161();
         }
         if(var_1680 != null)
         {
            if(var_365 != null)
            {
               var_365.removeEventListener("WME_CLICK",onSimpleAlertClick);
               var_365 = null;
            }
            if(var_1868)
            {
               var_1868.removeEventListener("WE_RESIZED",onIllustrationResized);
               var_1868 = null;
            }
            _window = null;
            var_19 = null;
            var_2405 = null;
            var_3055 = null;
            var_3284 = null;
            var_2621 = null;
            var_2899 = null;
            var_3161 = null;
            var_1680.dispose();
            var_1680 = null;
         }
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK" && param2.name == "close_button")
         {
            dispose();
         }
      }
      
      private function onSimpleAlertClick(param1:WindowMouseEvent) : void
      {
         if(var_90 != null && false)
         {
            if(var_90.substr(0,6) == "event:")
            {
               _windowManager.context.createLinkEvent(var_90.substr(6));
               dispose();
            }
            else
            {
               HabboWebTools.openWebPage(var_90,"habboMain");
            }
         }
         else if(var_2899 != null)
         {
            var_2899();
            dispose();
         }
      }
      
      private function onIllustrationResized(param1:class_3134) : void
      {
         var_2405.x = NaN;
         var_3055.width = var_2405.right;
         _window.width = NaN;
         var_2405.limits.minHeight = NaN;
         resizeWindow();
      }
      
      private function resizeWindow() : void
      {
         var_2405.arrangeListItems();
         var_3055.arrangeListItems();
         var_19.arrangeListItems();
         _window.height = NaN;
         _window.center();
      }
   }
}
