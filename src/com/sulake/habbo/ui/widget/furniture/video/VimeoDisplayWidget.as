package com.sulake.habbo.ui.widget.furniture.video
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3389;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   import com.vimeo.api.VimeoPlayer;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class VimeoDisplayWidget extends RoomWidgetBase
   {
      
      private static const const_796:String = "9a106b76302cbce891b714afdc6a0c93";
       
      
      private var var_171:VimeoPlayer;
      
      private var _window:class_3151;
      
      private var _roomObject:IRoomObject;
      
      public function VimeoDisplayWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18)
      {
         super(param1,param2,param3,param4);
         ownHandler.widget = this;
      }
      
      private function get ownHandler() : class_3389
      {
         return var_1453 as class_3389;
      }
      
      override public function get mainWindow() : class_3127
      {
         return _window;
      }
      
      public function show(param1:IRoomObject, param2:Boolean, param3:int) : void
      {
         _roomObject = param1;
         createWindow(param2,param3);
         _window.visible = true;
      }
      
      private function createWindow(param1:Boolean, param2:int) : void
      {
         if(_window != null)
         {
            return;
         }
         _window = windowManager.buildFromXML(XML(assets.getAssetByName("vimeo_viewer_xml").content)) as class_3151;
         _window.findChildByName("video_id_editor").visible = param1;
         _window.findChildByName("video_wrapper").visible = param2 > 0;
         _window.procedure = windowProcedure;
         _window.center();
         var _loc3_:class_3207 = class_3207(_window.findChildByName("video_wrapper"));
         var_171 = new VimeoPlayer("9a106b76302cbce891b714afdc6a0c93",param2,_loc3_.width,_loc3_.height);
         _loc3_.setDisplayObject(var_171);
         var_171.addEventListener("mouseUp",onVideoMouseEvent);
         var_171.addEventListener("mouseMove",onVideoMouseEvent);
      }
      
      private function onVideoMouseEvent(param1:MouseEvent) : void
      {
         if(_window != null)
         {
            DisplayObject(param1.target).stage.dispatchEvent(param1);
         }
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case "WME_CLICK":
               var _loc4_:* = param2.name;
               if("header_button_close" !== _loc4_)
               {
                  break;
               }
               hide(_roomObject);
               break;
            case "WE_RESIZE":
               _loc4_ = param2.name;
               if("video_wrapper" !== _loc4_)
               {
                  break;
               }
               if(var_171 != null)
               {
                  var_171.setSize(param2.width,param2.height);
                  break;
               }
               break;
            case "WKE_KEY_DOWN":
               if(WindowKeyboardEvent(param1).charCode == 13)
               {
                  _loc3_ = int(_window.findChildByName("video_id").caption);
                  ownHandler.setVideo(_roomObject,_loc3_);
                  _window.findChildByName("video_wrapper").visible = _loc3_ > 0;
                  var_171.loadVideo(_loc3_);
                  break;
               }
         }
      }
      
      public function hide(param1:IRoomObject) : void
      {
         if(_roomObject != param1)
         {
            return;
         }
         if(var_171 != null)
         {
            var_171.destroy();
            var_171 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _roomObject = null;
      }
   }
}
