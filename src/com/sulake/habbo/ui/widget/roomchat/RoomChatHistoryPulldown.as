package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const STATE_FADE_OUT:int = 3;
      
      public static const STATE_FADE_IN:int = 2;
      
      public static const STATE_VISIBLE:int = 1;
      
      public static const STATE_HIDDEN:int = 0;
      
      public static const PULLDOWN_WINDOW_HEIGHT:int = 39;
      
      private static const FADE_OUT_MS:int = 150;
      
      private static const FADE_IN_MS:int = 250;
       
      
      private var var_1429:com.sulake.habbo.ui.widget.roomchat.RoomChatWidget;
      
      private var _windowManager:class_1684;
      
      private var _window:class_3151;
      
      private var var_1518:class_3282;
      
      private var var_1470:class_3151;
      
      private var _region:IRegionWindow;
      
      private var var_2029:class_21;
      
      private var _lastWidth:int = 0;
      
      private var var_159:int = -1;
      
      private var var_4003:BitmapData;
      
      private var var_3499:BitmapData;
      
      private var var_3789:BitmapData;
      
      private var var_3649:BitmapData;
      
      private var var_3555:BitmapData;
      
      private var var_4066:BitmapData;
      
      private var var_3918:BitmapData;
      
      private var _regionRightMargin:int = 30;
      
      public function RoomChatHistoryPulldown(param1:com.sulake.habbo.ui.widget.roomchat.RoomChatWidget, param2:class_1684, param3:class_3151, param4:class_21)
      {
         super();
         var_1429 = param1;
         _windowManager = param2;
         var_2029 = param4;
         var_1470 = param3;
         var_4003 = (var_2029.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_3499 = (var_2029.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_3789 = (var_2029.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_3649 = (var_2029.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_3555 = (var_2029.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_4066 = (var_2029.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_3918 = (var_2029.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_1518 = _windowManager.createWindow("chat_history_bg","",21,0,16,new Rectangle(0,0,param3.width,param3.height - 39),null,0,0) as class_3282;
         var_1470.addChild(var_1518);
         _window = _windowManager.createWindow("chat_pulldown","",4,0,17,new Rectangle(0,-39,param3.width,39),null,0) as class_3151;
         var_1470.addChild(_window);
         _region = _windowManager.createWindow("REGIONchat_pulldown","",5,0,17,new Rectangle(0,0,param3.width,param3.height - 39),null,0) as IRegionWindow;
         if(_region != null)
         {
            _region.background = true;
            _region.mouseThreshold = 0;
            _region.addEventListener("WME_DOWN",onPulldownMouseDown);
            var_1470.addChild(_region);
            _region.toolTipCaption = "${chat.history.drag.tooltip}";
            _region.toolTipDelay = 250;
         }
         var _loc6_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc6_.content as XML);
         _window.addEventListener("WME_DOWN",onPulldownMouseDown);
         var _loc5_:class_3282;
         if((_loc5_ = _window.findChildByName("GrapBarX") as class_3282) != null)
         {
            _loc5_.mouseThreshold = 0;
            _loc5_.addEventListener("WME_CLICK",onCloseButtonClicked);
            _loc5_.addEventListener("WME_UP",onCloseButtonMouseUp);
            _loc5_.addEventListener("WME_DOWN",onCloseButtonMouseDown);
            _loc5_.addEventListener("WME_OVER",onCloseButtonMouseOver);
            _loc5_.addEventListener("WME_OUT",onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.mouseThreshold = 0;
         this.state = 0;
         buildWindowGraphics();
      }
      
      public function dispose() : void
      {
         if(_region != null)
         {
            _region.dispose();
            _region = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1518 != null)
         {
            var_1518.dispose();
            var_1518 = null;
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state - 2)
         {
            case 0:
               var_1518.blend += param1 / 250;
               _window.blend += param1 / 250;
               if(false)
               {
                  state = 1;
                  break;
               }
               break;
            case 1:
               var_1518.blend = 0 - param1 / 150;
               _window.blend = 0 - param1 / 150;
               if(true)
               {
                  state = 0;
                  break;
               }
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == var_159)
         {
            return;
         }
         switch(param1)
         {
            case 0:
               if(_window == null || var_1518 == null)
               {
                  return;
               }
               _window.visible = false;
               var_1518.visible = false;
               _region.visible = false;
               var_159 = param1;
               break;
            case 1:
               if(var_159 == 0)
               {
                  this.state = 2;
                  break;
               }
               if(_window == null || var_1518 == null)
               {
                  return;
               }
               _window.visible = true;
               var_1518.visible = true;
               _region.visible = true;
               var_159 = param1;
               break;
            case 2:
               if(_window == null || var_1518 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_1518.blend = 0;
               _window.visible = true;
               var_1518.visible = true;
               var_159 = param1;
               break;
            case 3:
               if(_window == null || var_1518 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_1518.blend = 1;
               var_159 = param1;
               break;
         }
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = -39;
            _window.width = var_1470.width;
         }
         if(_region != null)
         {
            _region.x = 0;
            _region.y = -39;
            _region.width = 0 - _regionRightMargin;
         }
         if(var_1518 != null)
         {
            var_1518.rectangle = var_1470.rectangle;
            var_1518.height = -39;
         }
         buildWindowGraphics();
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc12_:int = 0;
         var _loc2_:int = 0;
         var _loc7_:BitmapData = null;
         var _loc3_:BitmapData = null;
         var _loc5_:BitmapData = null;
         if(_window == null)
         {
            return;
         }
         if(_lastWidth == _window.width)
         {
            return;
         }
         _lastWidth = _window.width;
         var _loc6_:class_3282 = _window.findChildByName("grapBarBg") as class_3282;
         var _loc8_:class_3282 = _window.findChildByName("GrapBarX") as class_3282;
         var _loc1_:class_3282 = _window.findChildByName("grapBarGripL") as class_3282;
         var _loc9_:class_3282 = _window.findChildByName("grapBarGripR") as class_3282;
         var _loc4_:class_3282 = _window.findChildByName("grapBarHandle") as class_3282;
         if(_loc8_ != null && _loc4_ != null)
         {
            _loc4_.bitmap = var_3789;
            _loc4_.disposesBitmap = false;
            _loc8_.bitmap = var_3649;
            _loc8_.disposesBitmap = false;
            _regionRightMargin = 0 - _loc8_.x;
         }
         _loc1_.width = _loc4_.x - 5;
         _loc1_.x = 0;
         _loc9_.x = _loc4_.x + _loc4_.width + 5;
         _loc9_.width = _loc8_.x - 5 - _loc9_.x;
         if(_loc1_.width < 0)
         {
            _loc1_.width = 0;
         }
         if(_loc9_.width < 0)
         {
            _loc9_.width = 0;
         }
         var _loc10_:int = 0;
         if(_loc6_ != null && _loc1_ != null && _loc9_ != null)
         {
            try
            {
               _loc10_ = 1;
               _loc2_ = int(_loc6_.width);
               _loc12_ = int(_loc6_.height);
               if(_loc2_ > 0 && _loc12_ > 0)
               {
                  _loc7_ = new TrackedBitmapData(this,_loc2_,_loc12_);
                  tileBitmapHorz(var_4003,_loc7_);
                  _loc6_.disposesBitmap = true;
                  _loc6_.bitmap = _loc7_;
               }
               _loc10_ = 2;
               _loc2_ = int(_loc1_.width);
               _loc12_ = int(_loc1_.height);
               if(_loc2_ > 0 && _loc12_ > 0)
               {
                  _loc3_ = new TrackedBitmapData(this,_loc2_,_loc12_);
                  tileBitmapHorz(var_3499,_loc3_);
                  _loc1_.disposesBitmap = true;
                  _loc1_.bitmap = _loc3_;
               }
               _loc10_ = 3;
               _loc2_ = int(_loc9_.width);
               _loc12_ = int(_loc9_.height);
               if(_loc2_ > 0 && _loc12_ > 0)
               {
                  _loc5_ = new TrackedBitmapData(this,_loc2_,_loc12_);
                  tileBitmapHorz(var_3499,_loc5_);
                  _loc9_.disposesBitmap = true;
                  _loc9_.bitmap = _loc5_;
               }
            }
            catch(e:Error)
            {
               throw new Error("undefined width:" + _loc2_ + " height:" + _loc12_ + " state:" + _loc10_,e.errorID);
            }
         }
         if(var_1518 == null)
         {
            return;
         }
         var_1518.bitmap = var_3918;
         var_1518.disposesBitmap = false;
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = param2.width / param1.width;
         var _loc5_:Point = new Point();
         _loc4_ = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            _loc5_.x = _loc4_ * param1.width;
            param2.copyPixels(param1,param1.rect,_loc5_);
            _loc4_++;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_1429 != null)
         {
            var_1429.onPulldownMouseDown(param1);
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_1429 != null)
         {
            var_1429.onPulldownCloseButtonClicked(param1);
         }
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName("GrapBarX") as class_3282;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = var_3555;
         }
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName("GrapBarX") as class_3282;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = var_3649;
         }
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName("GrapBarX") as class_3282;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = var_4066;
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName("GrapBarX") as class_3282;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = var_3555;
         }
      }
   }
}
