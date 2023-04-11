package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.IModalDialog;
   
   public class NotificationPopup implements class_13
   {
       
      
      private var _notifications:com.sulake.habbo.notifications.HabboNotifications;
      
      private var var_1680:IModalDialog;
      
      private var var_271:String;
      
      private var _parameters:class_24;
      
      public function NotificationPopup(param1:com.sulake.habbo.notifications.HabboNotifications, param2:String, param3:class_24)
      {
         var _loc7_:class_3127 = null;
         var _loc8_:class_3127 = null;
         super();
         _notifications = param1;
         var_271 = param2;
         _parameters = param3;
         var _loc10_:String = getNotificationPart("title",true);
         var _loc11_:String = getNotificationPart("message",true).replace(/\\r/g,"\r");
         var _loc6_:String = getNotificationPart("linkUrl",false);
         var _loc4_:* = null;
         var _loc5_:Boolean = _loc6_ != null && _loc6_.substr(0,6) == "event:";
         if(_loc6_ != null)
         {
            if((_loc4_ = getNotificationPart("linkTitle",false)) == null)
            {
               _loc4_ = _loc6_;
            }
         }
         var _loc12_:IAsset = _notifications.assets.getAssetByName("layout_notification_popup_xml");
         var_1680 = _notifications.windowManager.buildModalDialogFromXML(_loc12_.content as XML);
         var _loc9_:class_3151;
         (_loc9_ = var_1680.rootWindow as class_3151).procedure = windowProcedure;
         _loc9_.caption = _loc10_;
         if(_loc6_ != null)
         {
            if(_loc5_)
            {
               (_loc7_ = _loc9_.findChildByName("action")).visible = true;
               _loc7_.caption = _loc4_;
            }
            else
            {
               (_loc8_ = _loc9_.findChildByName("link")).visible = true;
               _loc8_.caption = _loc4_;
            }
         }
         _loc9_.findChildByName("message").caption = _loc11_;
         IStaticBitmapWrapperWindow(_loc9_.findChildByName("illustration")).assetUri = _notifications.getNotificationImageUrl(param3,param2);
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_1680.dispose();
         var_1680 = null;
         _notifications = null;
         var_271 = null;
         _parameters = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_1680 == null;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(disposed)
         {
            return;
         }
         loop0:
         switch(param1.type)
         {
            case "WME_CLICK":
               switch(param2.name)
               {
                  case "header_button_close":
                     dispose();
                     break loop0;
                  case "action":
                     _notifications.createLinkEvent(getNotificationPart("linkUrl",false).substr(6));
                     dispose();
                     break loop0;
                  case "link":
                     HabboWebTools.openWebPage(getNotificationPart("linkUrl",false),"habboMain");
               }
               break;
            case "WE_RESIZED":
               if(param2.name == "illustration")
               {
                  param2.parent.limits.minHeight = param2.height;
                  break;
               }
         }
      }
      
      private function getNotificationPart(param1:String, param2:Boolean) : String
      {
         return _notifications.getNotificationPart(_parameters,var_271,param1,param2);
      }
   }
}
