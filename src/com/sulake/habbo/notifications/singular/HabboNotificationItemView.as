package com.sulake.habbo.notifications.singular
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class HabboNotificationItemView implements class_41
   {
      
      public static const ITEM_HEIGHT:int = 70;
      
      public static const SIDE_MARGIN:int = 5;
      
      private static const STATE_IDLE:int = 0;
      
      private static const STATE_FADE_IN:int = 1;
      
      private static const STATE_DISPLAY:int = 2;
      
      private static const STATE_FADE_OUT:int = 3;
       
      
      private var _window:class_3127;
      
      private var var_302:com.sulake.habbo.notifications.singular.HabboNotificationItem;
      
      private var _hovering:Boolean = false;
      
      private var _styleConfig:class_24;
      
      private var _viewConfig:class_24;
      
      private var var_2631:uint;
      
      private var var_2828:uint;
      
      private var var_3106:uint;
      
      private var _margin:int;
      
      private var var_2092:Number;
      
      private var _resizeMargin:int;
      
      private var var_3701:int;
      
      private var var_159:int;
      
      public function HabboNotificationItemView(param1:IAsset, param2:class_1684, param3:class_24, param4:class_24, param5:com.sulake.habbo.notifications.singular.HabboNotificationItem)
      {
         super();
         _styleConfig = param3;
         _viewConfig = param4;
         var _loc6_:XmlAsset;
         if((_loc6_ = param1 as XmlAsset) == null)
         {
            return;
         }
         _window = param2.buildFromXML(_loc6_.content as XML,1);
         _window.tags.push("notificationview");
         _window.context.getDesktopWindow().addEventListener("WE_RESIZED",onRoomViewResized);
         _window.procedure = onWindowEvent;
         _window.blend = 0;
         _window.visible = false;
         var _loc7_:ITextWindow;
         if((_loc7_ = class_3151(_window).findChildByTag("notification_text") as ITextWindow) != null)
         {
            _resizeMargin = 0 - _loc7_.bottom;
         }
         else
         {
            _resizeMargin = 15;
         }
         var_3701 = _window.height;
         _margin = 4;
         var_2092 = 0;
         var_159 = 0;
         showItem(param5);
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      public function get ready() : Boolean
      {
         return var_159 == 0;
      }
      
      public function get verticalPosition() : int
      {
         return _margin;
      }
      
      private function showItem(param1:com.sulake.habbo.notifications.singular.HabboNotificationItem) : void
      {
         var _loc2_:BitmapData = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:String = param1.content;
         setNotificationText(_loc3_);
         if(param1.style.iconAssetUri == null)
         {
            _loc2_ = param1.style.icon;
            setNotificationIcon(_loc2_);
         }
         else
         {
            IStaticBitmapWrapperWindow(class_3151(_window).findChildByTag("notification_icon_static")).assetUri = param1.style.iconAssetUri;
         }
         var_302 = param1;
         reposition();
         startFadeIn();
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         if(param1.badgeId != var_302.style.iconSrc)
         {
            return;
         }
         if(param1.badgeImage != null)
         {
            setNotificationIcon(param1.badgeImage);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(var_159)
         {
            case 0:
               break;
            case 1:
               var_2631 += param1;
               _loc2_ = var_2631 / 0;
               if(var_2631 > 0)
               {
                  startDisplay();
               }
               adjustBlend(_loc2_);
               break;
            case 2:
               var_3106 += param1;
               if(var_3106 > 0 && !_hovering)
               {
                  startFadeOut();
                  break;
               }
               break;
            case 3:
               var_2828 += param1;
               _loc3_ = 1 - var_2828 / 0;
               adjustBlend(_loc3_);
               if(var_2828 > 0)
               {
                  startIdling();
                  break;
               }
         }
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_302 != null)
         {
            var_302.dispose();
            var_302 = null;
         }
      }
      
      private function setNotificationText(param1:String) : void
      {
         var _loc2_:ITextWindow = class_3151(_window).findChildByTag("notification_text") as ITextWindow;
         if(_loc2_ == null || param1 == null)
         {
            return;
         }
         _window.height = 0;
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + _resizeMargin;
         if(_window.height < var_3701)
         {
            _window.height = var_3701;
         }
      }
      
      private function setNotificationIcon(param1:BitmapData) : void
      {
         var _loc6_:BitmapData = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:class_3282;
         if((_loc4_ = class_3151(_window).findChildByTag("notification_icon") as class_3282) == null)
         {
            return;
         }
         if(param1 == null)
         {
            _loc4_.bitmap = null;
            return;
         }
         if(param1.width < _loc4_.width && param1.height < _loc4_.height)
         {
            _loc6_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
            _loc2_ = (_loc4_.width - param1.width) / 2;
            _loc3_ = (_loc4_.height - param1.height) / 2;
            _loc6_.copyPixels(param1,param1.rect,new Point(_loc2_,_loc3_));
         }
         else if(param1.width < param1.height)
         {
            _loc6_ = new BitmapData(param1.height,param1.height,true,0);
            _loc5_ = (param1.height - param1.width) / 2;
            _loc6_.copyPixels(param1,param1.rect,new Point(_loc5_,0));
         }
         else if(param1.width > param1.height)
         {
            _loc6_ = new BitmapData(param1.width,param1.width,true,0);
            _loc5_ = (param1.width - param1.height) / 2;
            _loc6_.copyPixels(param1,param1.rect,new Point(0,_loc5_));
         }
         else
         {
            (_loc6_ = new BitmapData(param1.width,param1.height)).copyPixels(param1,param1.rect,new Point(0,0));
         }
         _loc4_.bitmap = _loc6_;
      }
      
      private function startFadeIn() : void
      {
         var_2631 = 0;
         var_159 = 1;
         _window.visible = true;
      }
      
      private function startFadeOut() : void
      {
         var_2828 = 0;
         var_159 = 3;
      }
      
      private function startDisplay() : void
      {
         var_3106 = 0;
         var_159 = 2;
      }
      
      private function startIdling() : void
      {
         var_159 = 0;
         _window.visible = false;
      }
      
      public function reposition(param1:int = -1) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:class_3234 = _window.context.getDesktopWindow();
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 != -1)
         {
            _margin = param1;
         }
         _window.x = _loc2_.width - 0 - 5;
         _window.y = _margin;
      }
      
      public function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == "WME_OVER")
         {
            _hovering = true;
         }
         else if(param1.type == "WME_OUT")
         {
            _hovering = false;
         }
         else if(param1.type == "WME_CLICK")
         {
            if(var_302 != null)
            {
               var_302.ExecuteUiLinks();
               startFadeOut();
            }
         }
      }
      
      private function onRoomViewResized(param1:class_3134) : void
      {
         reposition();
      }
      
      private function adjustBlend(param1:Number) : void
      {
         var_2092 = param1;
         if(var_2092 > 1)
         {
            var_2092 = 1;
         }
         if(var_2092 < 0)
         {
            var_2092 = 0;
         }
         _window.blend = var_2092;
      }
   }
}
