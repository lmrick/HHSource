package com.sulake.habbo.ui.widget.furniture
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3345;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   import package_21.class_822;
   
   public class CustomStackHeightWidget extends RoomWidgetBase
   {
      
      private static const SLIDER_RANGE:int = 10;
      
      private static const MAX_HEIGHT:int = 40;
      
      private static const SLIDER_BUTTON_WIDTH:int = 20;
       
      
      private var _window:class_3151;
      
      private var var_490:int;
      
      public function CustomStackHeightWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super(param1,param2,param3,param4);
         class_3345(param1).widget = this;
      }
      
      override public function dispose() : void
      {
         destroyWindow();
         super.dispose();
      }
      
      override public function get mainWindow() : class_3127
      {
         return _window;
      }
      
      private function createWindow() : void
      {
         if(!_window)
         {
            _window = class_3151(windowManager.buildFromXML(XML(assets.getAssetByName("custom_stack_height_xml").content)));
            _window.procedure = windowProcedure;
            _window.center();
         }
      }
      
      public function open(param1:int, param2:Number) : void
      {
         var_490 = param1;
         param2 = Math.min(param2,40);
         if(_window == null)
         {
            createWindow();
         }
         _window.findChildByName("input_height").caption = param2.toString();
         updateSlider();
         _window.visible = true;
      }
      
      public function hide() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.visible = false;
      }
      
      private function destroyWindow() : void
      {
         if(_window)
         {
            _window.procedure = null;
            _window.dispose();
            _window = null;
         }
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "button_floor_level":
                  altitude = 0;
                  sendCurrentHeight();
                  break;
               case "button_above_stack":
                  handler.container.connection.send(new class_822(var_490));
                  break;
               case "header_button_close":
                  destroyWindow();
                  break;
               case "slider":
                  _window.findChildByName("slider_button").x = WindowMouseEvent(param1).localX;
                  sendCurrentHeight();
            }
         }
         else if(param1.type == "WME_UP" || param1.type == "WME_UP_OUTSIDE")
         {
            var _loc3_:* = param2.name;
            if("slider_button" === _loc3_)
            {
               sendCurrentHeight();
            }
         }
         else if(param1.type == "WME_DOUBLE_CLICK")
         {
            _loc3_ = param2.name;
            if("slider_button" === _loc3_)
            {
               updateHeightSelection(true);
               sendCurrentHeight();
            }
         }
         else if(param1.type == "WE_RELOCATED")
         {
            _loc3_ = param2.name;
            if("slider_button" === _loc3_)
            {
               updateHeightSelection();
            }
         }
         else if(param1.type == "WKE_KEY_DOWN")
         {
            if(param2.name == "input_height")
            {
               if(WindowKeyboardEvent(param1).keyCode == 13)
               {
                  updateSlider();
                  sendCurrentHeight();
               }
            }
         }
      }
      
      private function sendCurrentHeight() : void
      {
         var _loc1_:int = parseFloat(_window.findChildByName("input_height").caption) * 100;
         handler.container.connection.send(new class_822(var_490,_loc1_));
      }
      
      private function updateSlider() : void
      {
         var _loc3_:Number = parseFloat(_window.findChildByName("input_height").caption);
         var _loc1_:Number = _loc3_ / 10;
         _loc1_ = Math.min(_loc1_,1);
         var _loc2_:Number = _window.findChildByName("slider").width - 20;
         _window.procedure = null;
         _window.findChildByName("slider_button").x = _loc2_ * _loc1_;
         _window.procedure = windowProcedure;
      }
      
      private function updateHeightSelection(param1:Boolean = false) : void
      {
         var _loc4_:int = param1 ? 1 : 100;
         var _loc3_:Number = _window.findChildByName("slider").width - 20;
         var _loc2_:Number = _window.findChildByName("slider_button").x / _loc3_;
         var _loc5_:Number = _loc2_ * 10 * _loc4_;
         _window.findChildByName("input_height").caption = (int(_loc5_) / (_loc4_ * 1)).toString();
      }
      
      private function get handler() : class_3345
      {
         return var_1453 as class_3345;
      }
      
      private function set altitude(param1:Number) : void
      {
         if(_window != null)
         {
            _window.findChildByName("input_height").caption = param1.toString();
            updateSlider();
         }
      }
      
      public function updateHeight(param1:int, param2:Number) : void
      {
         if(var_490 == param1)
         {
            altitude = param2;
         }
      }
   }
}
