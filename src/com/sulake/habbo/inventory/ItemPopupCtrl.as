package com.sulake.habbo.inventory
{
   import adobe.serialization.json.JSONDecoder;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.assets.loaders.BitmapFileLoader;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.*;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1061:int = 1;
      
      public static const LOCATION_RIGHT:int = 2;
      
      private static const BOUNDS_MARGIN:int = -5;
      
      private static const OPEN_DELAY_MS:int = 250;
      
      private static const CLOSE_DELAY_MS:int = 100;
      
      private static const IMAGE_MAX_WIDTH:int = 180;
      
      private static const IMAGE_MAX_HEIGHT:int = 200;
       
      
      private var var_1850:Timer;
      
      private var _hideDelayTimer:Timer;
      
      private var _assets:class_21;
      
      private var var_1497:class_3151;
      
      private var _parent:class_3151;
      
      private var _preferredLocation:int = 2;
      
      private var var_2290:BitmapData;
      
      private var var_2454:BitmapData;
      
      private var var_1440:TradingModel;
      
      private var _windowManager:class_1684;
      
      private var var_3098:Boolean = false;
      
      public function ItemPopupCtrl(param1:class_3151, param2:class_21, param3:class_1684, param4:TradingModel)
      {
         var_1850 = new Timer(250,1);
         _hideDelayTimer = new Timer(100,1);
         super();
         if(param1 == null || param2 == null)
         {
            throw new Error("Null pointers passed as argument!");
         }
         var_1497 = param1;
         var_1497.visible = false;
         _assets = param2;
         _windowManager = param3;
         var_1850.addEventListener("timer",onDisplayTimer);
         _hideDelayTimer.addEventListener("timer",onHideTimer);
         var_1440 = param4;
         var _loc5_:BitmapDataAsset;
         if((_loc5_ = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset) != null && _loc5_.content != null)
         {
            var_2454 = _loc5_.content as BitmapData;
         }
         if((_loc5_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset) != null && _loc5_.content != null)
         {
            var_2290 = _loc5_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(var_1850 != null)
         {
            var_1850.removeEventListener("timer",onDisplayTimer);
            var_1850.stop();
            var_1850 = null;
         }
         if(_hideDelayTimer != null)
         {
            _hideDelayTimer.removeEventListener("timer",onHideTimer);
            _hideDelayTimer.stop();
            _hideDelayTimer = null;
         }
         _assets = null;
         var_1497 = null;
         _parent = null;
         var_2290 = null;
         var_2454 = null;
      }
      
      public function updateContent(param1:class_3151, param2:String, param3:BitmapData, param4:IStuffData = null, param5:int = 2, param6:Boolean = false) : void
      {
         var _loc14_:String = null;
         var _loc12_:String = null;
         var _loc10_:String = null;
         var _loc8_:BitmapData = null;
         var _loc11_:ILimitedItemPreviewOverlayWidget = null;
         if(var_1497 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(_parent != null)
         {
            _parent.removeChild(var_1497);
         }
         _parent = param1;
         _preferredLocation = param5;
         var_3098 = false;
         var _loc13_:ITextWindow;
         if(_loc13_ = ITextWindow(var_1497.findChildByName("item_name_text")))
         {
            _loc13_.text = param2;
         }
         var _loc7_:class_3217 = class_3217(var_1497.findChildByName("unique_item_overlay_widget"));
         var _loc9_:class_3282;
         if(_loc9_ = var_1497.findChildByName("item_image") as class_3282)
         {
            if(param6 && var_1440)
            {
               _loc7_.visible = false;
               _loc9_.bitmap = new BitmapData(1,1,true,16777215);
               if(param4 != null)
               {
                  var_3098 = true;
                  _loc14_ = String(param4.getJSONValue("id"));
                  if(!StringUtil.isBlank(_loc14_))
                  {
                     loadExtraData(_loc14_);
                  }
                  else
                  {
                     _loc12_ = String(param4.getJSONValue("w"));
                     if(!StringUtil.isBlank(_loc12_))
                     {
                        _loc10_ = var_1440.getInventory().getProperty("stories.image_url_base") + _loc12_;
                        loadImage(_loc10_);
                     }
                  }
               }
               return;
            }
            (_loc8_ = new BitmapData(Math.min(180,param3.width),Math.min(200,param3.height),true,16777215)).copyPixels(param3,new Rectangle(0,0,_loc8_.width,_loc8_.height),new Point(0,0),null,null,true);
            _loc9_.bitmap = _loc8_;
            _loc9_.width = _loc9_.bitmap.width;
            _loc9_.height = _loc9_.bitmap.height;
            _loc9_.x = (0 - _loc9_.width) / 2;
            var_1497.height = _loc9_.bottom + 10;
         }
         if(param4 != null && param4.uniqueSerialNumber > 0)
         {
            (_loc11_ = ILimitedItemPreviewOverlayWidget(_loc7_.widget)).serialNumber = param4.uniqueSerialNumber;
            _loc11_.seriesSize = param4.uniqueSeriesSize;
         }
         else
         {
            _loc7_.visible = false;
         }
      }
      
      private function loadExtraData(param1:String) : void
      {
         var _loc3_:String = var_1440.getInventory().getProperty("extra_data_service_url") + param1;
         var _loc2_:URLLoader = new URLLoader(new URLRequest(_loc3_));
         _loc2_.addEventListener("complete",onExtraDataLoaded);
      }
      
      private function onExtraDataLoaded(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = String(URLLoader(param1.target).data);
         if(var_3098 && !StringUtil.isBlank(_loc3_))
         {
            try
            {
               _loc2_ = new JSONDecoder(_loc3_,false).getValue();
               loadImage(_loc2_.url);
            }
            catch(error:Error)
            {
            }
         }
      }
      
      private function loadImage(param1:String) : void
      {
         var _loc2_:BitmapFileLoader = null;
         if(!StringUtil.isBlank(param1))
         {
            _loc2_ = new BitmapFileLoader("image/png",new URLRequest(param1));
            _loc2_.addEventListener("AssetLoaderEventComplete",onExtImageLoaded);
         }
      }
      
      private function onExtImageLoaded(param1:AssetLoaderEvent) : void
      {
         if(!var_1497 || !var_3098)
         {
            return;
         }
         var _loc4_:class_3282;
         if(!(_loc4_ = var_1497.findChildByName("item_image") as class_3282) || _assets == null)
         {
            return;
         }
         var _loc6_:DisplayObject = BitmapFileLoader(param1.target).content as DisplayObject;
         var _loc2_:BitmapData = new BitmapData(Math.min(180,_loc6_.width),Math.min(200,_loc6_.height),true,16777215);
         var _loc3_:Number = 180 / _loc6_.width;
         var _loc5_:Matrix;
         (_loc5_ = new Matrix()).scale(_loc3_,_loc3_);
         _loc2_.draw(_loc6_,_loc5_);
         _loc4_.bitmap = _loc2_;
         _loc4_.width = _loc4_.bitmap.width;
         _loc4_.height = _loc4_.bitmap.height;
         _loc4_.x = (0 - _loc4_.width) / 2;
         var_1497.height = _loc4_.bottom + 10;
      }
      
      public function show() : void
      {
         _hideDelayTimer.reset();
         var_1850.reset();
         if(_parent == null)
         {
            return;
         }
         var_1497.visible = true;
         _parent.addChild(var_1497);
         refreshArrow(_preferredLocation);
         switch(_preferredLocation - 1)
         {
            case 0:
               var_1497.x = 5;
               break;
            case 1:
               var_1497.x = NaN;
         }
         var_1497.y = (0 - 0) / 2;
      }
      
      public function hide() : void
      {
         var_1497.visible = false;
         _hideDelayTimer.reset();
         var_1850.reset();
         if(_parent != null)
         {
            _parent.removeChild(var_1497);
         }
      }
      
      public function showDelayed() : void
      {
         _hideDelayTimer.reset();
         var_1850.reset();
         var_1850.start();
      }
      
      public function hideDelayed() : void
      {
         _hideDelayTimer.reset();
         var_1850.reset();
         _hideDelayTimer.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_1497 == null || false)
         {
            return;
         }
         var _loc2_:class_3282 = class_3282(var_1497.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1 - 1)
         {
            case 0:
               _loc2_.bitmap = var_2454.clone();
               _loc2_.width = var_2454.width;
               _loc2_.height = var_2454.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case 1:
               _loc2_.bitmap = var_2290.clone();
               _loc2_.width = var_2290.width;
               _loc2_.height = var_2290.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
   }
}
