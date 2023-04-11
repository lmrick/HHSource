package com.sulake.habbo.ui.widget.furniture.requirementsmissing
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.inventory.class_3141;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.CustomUserNotificationWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   
   public class CustomUserNotificationWidget extends RoomWidgetBase
   {
      
      public static const TYPE_VIPHOPPER:String = "viphopper";
      
      public static const const_517:String = "vipgate";
      
      public static const TYPE_COSTUMEHOPPER:String = "costumehopper";
      
      public static const TYPE_RESPECT_VOTE_FAILED_NO_STAGE:String = "respectfailedstage";
      
      public static const const_1013:String = "respectfailedaudience";
       
      
      private var _window:class_3281;
      
      private var var_1906:CustomUserNotificationWidgetHandler;
      
      public function CustomUserNotificationWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_1906 = CustomUserNotificationWidgetHandler(param1);
         var_1906.widget = this;
      }
      
      public function open(param1:String = "") : void
      {
         if(!_window)
         {
            switch(param1)
            {
               case "viphopper":
                  buildWindow("viprequired_xml");
                  setVipRequiredSpecificLocalization("viphopper");
                  break;
               case "vipgate":
                  buildWindow("viprequired_xml");
                  setVipRequiredSpecificLocalization("gate");
                  break;
               case "costumehopper":
                  buildWindow("costumehopper_costumerequired_xml");
                  break;
               case "respectfailedstage":
                  buildWindow("respect_giving_failed_notification_xml");
                  setText("stage");
                  setBitmapUrl("stage");
                  break;
               case "respectfailedaudience":
                  buildWindow("respect_giving_failed_notification_xml");
                  setText("audience");
                  setBitmapUrl("audience");
            }
            _window.center();
            _window.procedure = eventProc;
         }
      }
      
      private function buildWindow(param1:String) : void
      {
         _window = class_3281(windowManager.buildFromXML(XML(assets.getAssetByName(param1).content)));
      }
      
      private function setVipRequiredSpecificLocalization(param1:String) : void
      {
         _window.findChildByName("title").caption = "${" + param1 + ".viprequired.title}";
         _window.findChildByName("bodytext").caption = "${" + param1 + ".viprequired.bodytext}";
      }
      
      private function setText(param1:String) : void
      {
         var _loc4_:String = "respect.giving.failed.no." + param1;
         var _loc2_:String = String(var_1906.container.localization.getLocalization(_loc4_));
         var _loc3_:String = String(var_1906.container.config.getProperty("respect.talent.show.min.audience"));
         if(_loc3_)
         {
            _loc2_ = _loc2_.replace("%users%",_loc3_);
         }
         _window.findChildByName("body_txt").caption = _loc2_;
      }
      
      private function setBitmapUrl(param1:String) : void
      {
         var _loc3_:String = "${image.library.url}notifications/habbo_talent_show_" + param1 + ".png";
         var _loc2_:IStaticBitmapWrapperWindow = _window.content.getChildByName("respectFailedNotificationBitmap") as IStaticBitmapWrapperWindow;
         _loc2_.assetUri = _loc3_;
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function eventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Boolean = false;
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "buy_vip":
                  if(var_1906 != null && false)
                  {
                     var_1906.container.catalog.openClubCenter();
                  }
                  close();
                  break;
               case "vip_benefits":
                  var_1906.container.catalog.showVipBenefits();
                  break;
               case "buy_costumes":
                  _loc4_ = var_1906.container.inventory.getAvatarEffects();
                  _loc5_ = false;
                  for each(var _loc3_ in _loc4_)
                  {
                     if(_loc3_.subType == 1)
                     {
                        _loc5_ = true;
                        break;
                     }
                  }
                  if(_loc5_)
                  {
                     var_1906.container.avatarEditor.openEditor(0,null,null,true,null,"effects");
                     var_1906.container.avatarEditor.loadOwnAvatarInEditor(0);
                  }
                  else
                  {
                     var_1906.container.catalog.openCatalogPage("costumes");
                  }
                  close();
                  break;
               case "close":
                  close();
            }
            if(param2.tags.indexOf("close") != -1)
            {
               close();
            }
         }
      }
   }
}
