package com.sulake.habbo.ui.widget.camera
{
   import adobe.serialization.json.JSON;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_688;
   import com.sulake.habbo.tracking.HabboTracking;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.SharedObject;
   import flash.net.URLLoader;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class CameraViewFinder implements class_41
   {
      
      private static const const_627:Number = 350;
      
      private static const NUMBER_OF_SLOTS:int = 5;
      
      private static var var_3456:Boolean = false;
      
      private static var var_1639:Vector.<com.sulake.habbo.ui.widget.camera.CameraSlotData> = new Vector.<com.sulake.habbo.ui.widget.camera.CameraSlotData>(5);
      
      private static var var_3678:Vector.<class_688> = new Vector.<class_688>(5);
       
      
      private var var_1429:com.sulake.habbo.ui.widget.camera.CameraWidget;
      
      private var _window:class_3151;
      
      private var _disposed:Boolean = false;
      
      private var var_1580:class_3282;
      
      private var _flash:class_3282;
      
      private var _imageWidth:int;
      
      private var var_3836:int;
      
      private var var_3583:Boolean = false;
      
      private var var_1522:int = 0;
      
      private var _isLoadingFromCache:Boolean = false;
      
      private var _imageLoader:Loader;
      
      private var _flashStartTime:uint = 0;
      
      public function CameraViewFinder(param1:com.sulake.habbo.ui.widget.camera.CameraWidget)
      {
         var _loc2_:class_3127 = null;
         super();
         var_1429 = param1;
         openViewFinder();
         var_1522 = 0;
         while(var_1522 < 5)
         {
            clearCurrentSlot(true);
            var_1522++;
         }
         var_1522 = 0;
         var _loc3_:Boolean = getFromMemoryCache();
         if(_loc3_)
         {
            _loc2_ = _window.findChildByName("slot_container");
            _loc2_.visible = true;
         }
         setMode(false);
         setActiveSlot(0);
         _flash = _window.findChildByName("flash") as class_3282;
         _flash.bitmap = new BitmapData(_flash.width,_flash.height,false,16777215);
         _flash.visible = false;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _flash = null;
         var_1580 = null;
         var_1429.component.removeUpdateReceiver(this);
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function openViewFinder() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = var_1429.getXmlWindow("camera_interface") as class_3151;
         _window.center();
         _window.visible = false;
         var_1580 = _window.findChildByName("image") as class_3282;
         _imageWidth = var_1580.width;
         var_3836 = var_1580.height;
         var_1580.visible = true;
         _window.procedure = windowProcedure;
      }
      
      public function update(param1:uint) : void
      {
         if(var_3583)
         {
            return;
         }
         if(true)
         {
            var_1580.bitmap = new BitmapData(_imageWidth,var_3836,false,0);
         }
         var_1580.bitmap.fillRect(var_1580.bitmap.rect,var_1429.handler.roomDesktop.roomBackgroundColor);
         var _loc3_:Matrix = new Matrix();
         var _loc2_:Rectangle = getViewPort();
         _loc3_.translate(-_loc2_.x,-_loc2_.y);
         var_1429.snapShotRoomCanvas(var_1580.bitmap,_loc3_,false);
         var_1580.invalidate();
         if(_flashStartTime > 0)
         {
            updateFlash();
         }
      }
      
      private function updateFlash() : void
      {
         _flash.visible = true;
         var _loc2_:Number = getTimer() - _flashStartTime;
         var _loc1_:Number = (350 - _loc2_) / 350;
         _flash.blend = _loc1_;
         if(_loc2_ > 350)
         {
            _flashStartTime = 0;
            _flash.visible = false;
         }
      }
      
      public function getViewPort() : Rectangle
      {
         var _loc1_:class_3127 = _window as class_3127;
         return new Rectangle(NaN,NaN,var_1580.width,var_1580.height);
      }
      
      public function toggleVisible(param1:String) : void
      {
         if(false)
         {
            hide();
         }
         else
         {
            HabboTracking.getInstance().trackEventLog("Stories","camera","stories.camera.opened",param1);
            show();
            setMode(false);
         }
      }
      
      public function show() : void
      {
         _window.visible = true;
         _window.center();
         var_1429.component.registerUpdateReceiver(this,100);
      }
      
      public function hide() : void
      {
         _window.visible = false;
         var_1429.component.removeUpdateReceiver(this);
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc5_:IStaticBitmapWrapperWindow = null;
         var _loc4_:class_688 = null;
         var _loc3_:class_3127 = null;
         var _loc6_:String = null;
         var _loc7_:com.sulake.habbo.ui.widget.camera.CameraSlotData = null;
         var _loc8_:int = 0;
         if(param2.name == "button_release")
         {
            _loc5_ = IStaticBitmapWrapperWindow(_window.findChildByName("release_bitmap"));
            switch(param1.type)
            {
               case "WME_DOWN":
                  _loc5_.assetUri = "camera_camera_btn_down";
                  break;
               case "WME_UP":
                  _loc5_.assetUri = "camera_cam_btn_hi";
                  break;
               case "WME_OVER":
                  _loc5_.assetUri = "camera_cam_btn_hi";
                  break;
               case "WME_OUT":
                  _loc5_.assetUri = "camera_camera_btn";
            }
         }
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param1.target.name)
         {
            case "header_button_close":
               hide();
               break;
            case "button_editor":
               hide();
               var_1429.editPhoto(var_1580.bitmap.clone());
               break;
            case "delete_photo_button":
               clearCurrentSlot();
               setMode(false);
               break;
            case "header_button_help":
               var_1429.component.context.createLinkEvent("habbopages/camera");
               break;
            case "button_release":
               if(var_3583)
               {
                  setMode(false);
                  break;
               }
               var_1429.triggetCameraShutterSound();
               if((_loc4_ = var_1429.handler.collectPhotoData()) != null && _loc4_.isSendable())
               {
                  var_3678[var_1522] = _loc4_;
                  addToCurrentSlot(var_1580.bitmap.clone());
                  _flashStartTime = getTimer();
                  HabboTracking.getInstance().trackEventLog("Stories","camera","stories.photo.taken");
                  _loc3_ = _window.findChildByName("slot_container");
                  _loc3_.visible = true;
                  break;
               }
               var_1429.windowManager.alert("${generic.alert.title}","${camera.alert.too_much_stuff}",0,null);
               break;
         }
         if(param1.target.name.indexOf("cameraButton_") != -1)
         {
            _loc6_ = param1.target.name.charAt(param1.target.name.length - 1);
            if(var_1639[int(_loc6_)].isEmpty)
            {
               setActiveSlot(int(_loc6_));
               setMode(false);
               return;
            }
            _loc7_ = var_1639[int(_loc6_)];
            var_1580.bitmap = _loc7_.image.clone();
            setMode(true);
            setActiveSlot(int(_loc6_));
         }
         if(param1.target.name.indexOf("chooseSlotButton_") != -1)
         {
            _loc8_ = int(param1.target.name.charAt(param1.target.name.length - 1));
            if(var_1639.length < _loc8_)
            {
               return;
            }
            setActiveSlot(_loc8_);
            setMode(false);
         }
      }
      
      private function setActiveSlot(param1:int) : void
      {
         (_window.findChildByName("slotImage_" + var_1522) as IStaticBitmapWrapperWindow).assetUri = "camera_arrow_gray";
         var_1522 = param1;
         (_window.findChildByName("slotImage_" + var_1522) as IStaticBitmapWrapperWindow).assetUri = "camera_arrow_green";
         var _loc2_:class_3127 = _window.findChildByName("photo_border");
         var _loc4_:class_3127 = _window.findChildByName("cameraButton_" + var_1522);
         _loc2_.x = _loc4_.x - 1 + _loc4_.parent.x;
         _loc2_.y = _loc4_.y - 3 + _loc4_.parent.y;
         _loc2_.visible = true;
         var _loc3_:class_3127 = _window.findChildByName("delete_photo_button");
         _loc3_.y = _loc2_.y;
         _loc3_.x = _loc2_.right - _loc3_.width;
      }
      
      private function setMode(param1:Boolean) : void
      {
         var_3583 = param1;
         var _loc3_:class_3127 = _window.findChildByName("button_editor");
         var _loc5_:class_3127 = _window.findChildByName("camera_crosshair");
         var _loc2_:class_3127 = _window.findChildByName("photo_date");
         var _loc7_:class_3127 = _window.findChildByName("photo_roomname");
         var _loc6_:class_3127 = _window.findChildByName("buyButtonBg");
         _loc2_.visible = _loc7_.visible = false;
         var _loc4_:class_3127 = _window.findChildByName("delete_photo_button");
         _loc5_.visible = !param1;
         _loc4_.visible = _loc3_.visible = _loc6_.visible = param1;
      }
      
      private function onPurchaseError(param1:Event) : void
      {
         var _loc2_:Object = null;
         try
         {
            _loc2_ = adobe.serialization.json.JSON.decode(URLLoader(param1.target).data);
            switch(_loc2_.error.code)
            {
               case "PURCHASING_FAILED":
                  var_1429.windowManager.alert("Something went wrong","sorry, purhcase failed. We will investigate the issue. #code 1",0,null);
                  break;
               case "MODERATED":
                  var_1429.windowManager.alert("Inappropriate text","Your photo caption contained inappropriate words. They were changed to bobba. Please edit the text and try again.",0,null);
                  var_1429.changeCaptionFieldText(_loc2_.error.message,true);
            }
         }
         catch(error:Error)
         {
            var_1429.windowManager.alert("Something went wrong","sorry, purhcase failed. We will investigate the issue. # code 2",0,null);
         }
      }
      
      private function getFromMemoryCache() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < var_1639.length)
         {
            if(var_1639[_loc2_].isEmpty == false)
            {
               drawImageToSlot(_loc2_,var_1639[_loc2_]);
               _loc1_ = true;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function drawImageToSlot(param1:int, param2:com.sulake.habbo.ui.widget.camera.CameraSlotData) : void
      {
         var _loc4_:class_3282;
         (_loc4_ = _window.findChildByName("cameraSlot_" + param1) as class_3282).bitmap = new BitmapData(_loc4_.width,_loc4_.height,false,0);
         var _loc3_:Number = (_loc4_.width - 2) / _imageWidth;
         var _loc5_:Matrix;
         (_loc5_ = new Matrix()).scale(_loc3_,_loc3_);
         _loc5_.ty = 1;
         _loc5_.tx = 1;
         _loc4_.bitmap.draw(param2.image,_loc5_,null,null,null,true);
      }
      
      private function getFromLocalCache() : Boolean
      {
         var _loc2_:SharedObject = null;
         try
         {
            _loc2_ = SharedObject.getLocal("camera_image_" + var_1522);
         }
         catch(error:Error)
         {
            return false;
         }
         if(_loc2_.size == 0 || !_loc2_.data)
         {
            return false;
         }
         var _loc1_:ByteArray = _loc2_.data.photo as ByteArray;
         if(!_loc1_)
         {
            return false;
         }
         if(!_imageLoader)
         {
            _imageLoader = new Loader();
         }
         _imageLoader.loadBytes(_loc1_);
         _imageLoader.contentLoaderInfo.addEventListener("complete",onImageLoadedFromCache);
         var _loc3_:com.sulake.habbo.ui.widget.camera.CameraSlotData = new com.sulake.habbo.ui.widget.camera.CameraSlotData();
         _loc3_.setDate(new Date());
         if(int(_loc2_.data.date) > 0)
         {
            _loc3_.setDate(new Date(int(_loc2_.data.date)));
         }
         var_1639[var_1522] = _loc3_;
         return true;
      }
      
      private function onImageLoadedFromCache(param1:Event) : void
      {
         var _loc2_:BitmapData = new BitmapData(_imageLoader.width,_imageLoader.height,false);
         _loc2_.draw(_imageLoader);
         var_1639[var_1522].image = _loc2_.clone();
         addToCurrentSlot(_loc2_,false,true);
         if(var_1522 < 5 && _isLoadingFromCache)
         {
            getFromLocalCache();
            if(var_1522 == 4)
            {
               _isLoadingFromCache = false;
            }
         }
         else
         {
            var_3456 = true;
         }
      }
      
      private function findNextEmptySlotIndex() : int
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < var_1639.length)
         {
            if(var_1639[_loc1_].isEmpty)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      private function clearCurrentSlot(param1:Boolean = false) : void
      {
         if(param1 && false && !var_1639[var_1522].isEmpty)
         {
            return;
         }
         var_1639[var_1522] = null;
         addToCurrentSlot(new BitmapData(320,320,false,13816530),true);
         var_1580.bitmap = var_1639[var_1522].image.clone();
         setMode(false);
      }
      
      private function addToCurrentSlot(param1:BitmapData, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc4_:com.sulake.habbo.ui.widget.camera.CameraSlotData;
         (_loc4_ = new com.sulake.habbo.ui.widget.camera.CameraSlotData()).image = param1;
         if(param2)
         {
            _loc4_.isEmpty = true;
         }
         else
         {
            _loc4_.setDate(new Date());
            _loc4_.isEmpty = false;
         }
         if(!param3 && !param2 || true)
         {
            var_1639[var_1522] = _loc4_;
         }
         drawImageToSlot(var_1522,_loc4_);
         if(!param2)
         {
            if((_loc5_ = findNextEmptySlotIndex()) >= 0)
            {
               setActiveSlot(_loc5_);
            }
            else if(!var_3456 && !param3)
            {
               var_1429.windowManager.alert(var_1429.localizations.getLocalization("camera.full.header"),var_1429.localizations.getLocalization("camera.full.body"),0,null);
               var_3456 = true;
            }
         }
      }
      
      public function getRenderRoomMessage() : class_688
      {
         return var_3678[var_1522];
      }
   }
}
