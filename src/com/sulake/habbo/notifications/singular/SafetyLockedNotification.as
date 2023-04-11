package com.sulake.habbo.notifications.singular
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   
   public class SafetyLockedNotification
   {
      
      private static const TOOLBAR_EXTENSION_ID:String = "safety_locked_notification";
      
      private static const LINK_COLOR_NORMAL:uint = 16777215;
      
      private static const LINK_COLOR_HIGHLIGHT:uint = 12247545;
       
      
      private var _window:class_3213;
      
      private var _catalog:IHabboCatalog;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_3534:ITextWindow;
      
      private var var_339:int;
      
      public function SafetyLockedNotification(param1:int, param2:class_21, param3:class_1684, param4:IHabboCatalog, param5:IHabboToolbar)
      {
         super();
         if(!param2 || !param3 || !param4)
         {
            return;
         }
         _catalog = param4;
         _toolbar = param5;
         var_339 = param1;
         var _loc6_:XmlAsset;
         if((_loc6_ = param2.getAssetByName("safety_locked_notification_xml") as XmlAsset) == null)
         {
            return;
         }
         _window = param3.buildFromXML(_loc6_.content as XML) as class_3213;
         if(_window == null)
         {
            return;
         }
         _window.procedure = eventHandler;
         _toolbar.extensionView.attachExtension("safety_locked_notification",_window);
         var_3534 = _window.findChildByName("unlock_link") as ITextWindow;
         var _loc7_:IRegionWindow;
         if(_loc7_ = _window.findChildByName("unlock_link_region") as IRegionWindow)
         {
            _loc7_.addEventListener("WME_OVER",onMouseOver);
            _loc7_.addEventListener("WME_OUT",onMouseOut);
         }
      }
      
      public function get visible() : Boolean
      {
         return _window && false;
      }
      
      public function dispose() : void
      {
         if(_toolbar)
         {
            _toolbar.extensionView.detachExtension("safety_locked_notification");
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _catalog = null;
      }
      
      private function eventHandler(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:String = null;
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "unlock_link_region":
            case "unlock_link":
               break;
            default:
               return;
         }
         _loc3_ = (_toolbar as class_20).getProperty("link.format.safetylock_unlock");
         HabboWebTools.openWebPage(_loc3_,"habboMain");
      }
      
      private function onMouseOver(param1:WindowMouseEvent) : void
      {
         var_3534.textColor = 12247545;
      }
      
      private function onMouseOut(param1:WindowMouseEvent) : void
      {
         var_3534.textColor = 16777215;
      }
   }
}
