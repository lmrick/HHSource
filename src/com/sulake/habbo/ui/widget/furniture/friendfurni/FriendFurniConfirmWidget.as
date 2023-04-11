package com.sulake.habbo.ui.widget.furniture.friendfurni
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3391;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   
   public class FriendFurniConfirmWidget extends RoomWidgetBase
   {
       
      
      private var _stuffId:int = -1;
      
      private var _window:class_3281;
      
      private var var_3876:int = -1;
      
      public function FriendFurniConfirmWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18)
      {
         super(param1,param2,param3,param4);
         confirmWidgetHandler.widget = this;
      }
      
      override public function dispose() : void
      {
         _stuffId = -1;
         destroyWindow();
         super.dispose();
      }
      
      override public function get mainWindow() : class_3127
      {
         return _window;
      }
      
      public function open(param1:int, param2:Boolean) : void
      {
         if(_window && false && _stuffId != -1)
         {
            confirmWidgetHandler.sendLockConfirm(_stuffId,false);
            destroyWindow();
         }
         _stuffId = param1;
         createWindow();
         if(!param2)
         {
            _window.findChildByName("other_locked_container").height = 0;
         }
         else
         {
            _window.findChildByName("other_locked_container").height = var_3876;
            _window.findChildByName("message").visible = false;
         }
         mainWindow.visible = true;
      }
      
      public function close(param1:int) : void
      {
         if(param1 == _stuffId)
         {
            destroyWindow();
         }
      }
      
      public function otherConfirmed(param1:int) : void
      {
         if(_window != null && param1 == _stuffId)
         {
            IStaticBitmapWrapperWindow(_window.findChildByName("lock")).assetUri = "${image.library.url}furniextras/locked_image.png";
            _window.findChildByName("message").visible = true;
         }
      }
      
      private function createWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(windowManager.buildFromXML(XML(assets.getAssetByName("lock_confirm_xml").content)));
         _window.procedure = windowProcedure;
         var_3876 = _window.findChildByName("other_locked_container").height;
         _window.center();
      }
      
      private function destroyWindow() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function get confirmWidgetHandler() : class_3391
      {
         return class_3391(var_1453);
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "header_button_close":
               case "cancel_button":
                  confirmWidgetHandler.sendLockConfirm(_stuffId,false);
                  destroyWindow();
                  break;
               case "confirm_button":
                  confirmWidgetHandler.sendLockConfirm(_stuffId,true);
                  destroyWindow();
            }
         }
      }
   }
}
