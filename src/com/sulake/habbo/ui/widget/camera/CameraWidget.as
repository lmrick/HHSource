package com.sulake.habbo.ui.widget.camera
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_688;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.RoomUI;
   import com.sulake.habbo.ui.handler.CameraWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import package_82.class_452;
   import package_82.class_507;
   
   public class CameraWidget extends RoomWidgetBase
   {
       
      
      private var var_1460:RoomUI;
      
      private var var_1978:com.sulake.habbo.ui.widget.camera.CameraViewFinder;
      
      private var var_1531:com.sulake.habbo.ui.widget.camera.CameraPhotoLab;
      
      public var url:String;
      
      public function CameraWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_19, param5:class_18, param6:RoomUI)
      {
         super(param1,param2,param3,param5);
         var_1460 = param6;
         this.handler.widget = this;
         var_1978 = new com.sulake.habbo.ui.widget.camera.CameraViewFinder(this);
         if(roomEngine)
         {
            roomEngine.events.addEventListener("REE_DISPOSED",onRoomDisposed);
            roomEngine.events.addEventListener("REE_ROOM_ZOOMED",onRoomZoomed);
         }
         this.handler.sendInitCameraMessage();
         var _loc7_:class_2047;
         if((_loc7_ = this.handler.roomDesktop.questEngine) != null)
         {
            _loc7_.ensureAchievementsInitialized();
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return var_1460.catalog;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_1978)
         {
            var_1978.dispose();
            var_1978 = null;
         }
         if(var_1531)
         {
            var_1531.dispose();
            var_1531 = null;
         }
         super.dispose();
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return !!handler ? handler.container : null;
      }
      
      public function get handler() : CameraWidgetHandler
      {
         return var_1453 as CameraWidgetHandler;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return !!container ? container.roomEngine : null;
      }
      
      public function startTakingPhoto(param1:String) : void
      {
         if(roomEngine && roomEngine.getRoomCanvasScale() != 1)
         {
            windowManager.alert(var_44.getLocalization("camera.zoom.missing.header"),var_44.getLocalization("camera.zoom.missing.body"),0,null);
            return;
         }
         if(component.getProperty("camera.effects.enabled") == "true")
         {
            com.sulake.habbo.ui.widget.camera.CameraPhotoLab.preloadEffects(var_1460.context.configuration.getProperty("image.library.url"),var_1460.getProperty("camera.available.effects"),var_44);
         }
         if(var_1531)
         {
            var_1531.dispose();
         }
         var_1978.toggleVisible(param1);
      }
      
      public function get component() : RoomUI
      {
         return var_1460;
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         var _loc5_:IAsset = null;
         var _loc3_:XmlAsset = null;
         var _loc4_:class_3127 = null;
         try
         {
            _loc5_ = assets.getAssetByName(param1 + "_xml");
            _loc3_ = XmlAsset(_loc5_);
            _loc4_ = windowManager.buildFromXML(XML(_loc3_.content),param2);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboNavigator","Failed to build window " + param1 + "_xml, " + _loc5_ + ", " + windowManager + "!");
            throw e;
         }
         return _loc4_;
      }
      
      private function onRoomDisposed(param1:RoomEngineEvent) : void
      {
         hide();
      }
      
      private function onRoomZoomed(param1:RoomEngineEvent) : void
      {
         if(roomEngine && roomEngine.getRoomCanvasScale() != 1)
         {
            hide();
         }
      }
      
      private function hide() : void
      {
         if(var_1978)
         {
            var_1978.hide();
         }
         if(var_1531)
         {
            var_1531.dispose();
         }
      }
      
      public function snapShotRoomCanvas(param1:BitmapData, param2:Matrix, param3:Boolean) : Boolean
      {
         var _loc4_:IRoomSession = container.roomSession;
         return roomEngine.snapshotRoomCanvasToBitmap(_loc4_.roomId,container.getFirstCanvasId(),param1,param2,param3);
      }
      
      public function triggetCameraShutterSound() : void
      {
         container.soundManager.playSound("CAMERA_shutter");
      }
      
      public function editPhoto(param1:BitmapData) : void
      {
         var_1531 = new com.sulake.habbo.ui.widget.camera.CameraPhotoLab(this);
         var_1531.openPhotoLab(param1);
      }
      
      public function changeCaptionFieldText(param1:String, param2:Boolean = false) : void
      {
         if(var_1531)
         {
            var_1531.setCaptionText(param1);
            if(param2)
            {
               var_1531.show();
               var_1531.closePurchaseConfirmation();
            }
         }
      }
      
      public function getViewPort() : Rectangle
      {
         if(var_1978)
         {
            return var_1978.getViewPort();
         }
         return new Rectangle(0,0,0,0);
      }
      
      public function purchaseSuccessful() : void
      {
         if(var_1531)
         {
            var_1531.animateSuccessfulPurchase();
         }
      }
      
      public function setRenderedPhotoUrl(param1:String) : void
      {
         if(var_1531)
         {
            var_1531.setRenderedPhotoUrl(param1);
         }
      }
      
      public function publishingStatus(param1:class_452) : void
      {
         if(var_1531)
         {
            var_1531.publishingStatus(param1);
         }
      }
      
      public function competitionStatus(param1:class_507) : void
      {
         if(var_1531)
         {
            var_1531.competitionStatus(param1);
         }
      }
      
      public function sendPhotoData() : Boolean
      {
         var _loc1_:class_688 = var_1978.getRenderRoomMessage();
         if(var_1531)
         {
            _loc1_.addEffectData(var_1531.getEffectDataJson());
            _loc1_.setZoom(var_1531.getZoom());
         }
         _loc1_.compressData();
         if(_loc1_.isSendable())
         {
            handler.sendPhotoData(_loc1_);
            return true;
         }
         return false;
      }
   }
}
