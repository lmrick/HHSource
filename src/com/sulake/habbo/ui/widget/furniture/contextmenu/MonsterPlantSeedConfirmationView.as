package com.sulake.habbo.ui.widget.furniture.contextmenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   
   public class MonsterPlantSeedConfirmationView implements class_13, class_3158
   {
      
      private static const PRODUCT_PAGE_UKNOWN:int = -1;
      
      private static const PRODUCT_PAGE_SEED:int = 0;
      
      private static const const_563:String = "header_button_close";
      
      private static const const_526:String = "save_button";
      
      private static const const_530:String = "cancel_text";
      
      private static const const_515:String = "ok_button";
       
      
      private var _window:class_3151;
      
      private var var_311:Boolean = false;
      
      private var var_1429:com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var var_2944:int = -1;
      
      private var var_3233:int;
      
      private var var_1807:class_3148;
      
      public function MonsterPlantSeedConfirmationView(param1:com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget)
      {
         super();
         var_1429 = param1;
         _windowManager = param1.windowManager;
         _assets = var_1429.assets;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_311 = true;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_1807 = null;
      }
      
      public function open(param1:int) : void
      {
         var _loc3_:int = var_1429.handler.roomSession.roomId;
         var _loc4_:IRoomObject;
         if((_loc4_ = var_1429.handler.roomEngine.getRoomObject(_loc3_,param1,10)) != null)
         {
            var_1807 = var_1429.handler.getFurniData(_loc4_);
            var_2944 = _loc4_.getId();
         }
         var _loc2_:int = -1;
         switch(-19)
         {
            case 0:
               _loc2_ = 0;
               break;
            default:
               class_14.log("[PlantSeedConfirmationView.open()] Unsupported furniture category: undefined");
         }
         setWindowContent(_loc2_);
         _window.visible = true;
      }
      
      private function setWindowContent(param1:int) : void
      {
         var _loc4_:String = null;
         var _loc3_:BitmapData = new BitmapData(10,10);
         var_1429.localizations.registerParameter("useproduct.widget.title.plant_seed","name",var_1807.localizedName);
         if(!_window)
         {
            _loc4_ = "use_product_widget_frame_plant_seed_xml";
            _window = _windowManager.buildFromXML(_assets.getAssetByName(_loc4_).content as XML) as class_3151;
            addClickListener("header_button_close");
            _window.center();
         }
         var_1429.localizations.registerParameter("useproduct.widget.text.plant_seed","productName",var_1807.localizedName);
         var _loc2_:class_3281 = _window as class_3281;
         _loc2_.content.removeChildAt(0);
         var _loc5_:class_3151 = createWindow(param1);
         _loc2_.content.addChild(_loc5_);
         switch(param1)
         {
            case 0:
               addClickListener("save_button");
               addClickListener("cancel_text");
               _loc3_ = resolvePreviewImage(var_1807);
               updatePreviewImage(_loc3_);
               _window.invalidate();
               return;
            default:
               throw new Error("Invalid type for use product confirmation content apply: " + param1);
         }
      }
      
      private function createWindow(param1:int) : class_3151
      {
         var _loc2_:IAsset = null;
         var _loc3_:* = null;
         switch(param1)
         {
            case 0:
               _loc2_ = _assets.getAssetByName("use_product_controller_plant_seed_xml");
               return _windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
            default:
               throw new Error("Invalid type for view content creation: " + param1);
         }
      }
      
      private function resolvePreviewImage(param1:class_3148) : BitmapData
      {
         var _loc3_:class_3266 = null;
         var _loc4_:BitmapData = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Array = param1.customParams.split(" ");
         switch(param1.category - 19)
         {
            case 0:
               _loc3_ = var_1429.handler.roomEngine.getFurnitureImage(var_1807.id,new Vector3d(90,0,0),64,this,0,"",-1,-1,null);
               break;
            default:
               class_14.log("[PlantSeedConfirmationView] Unsupported furniture category: " + param1.category);
         }
         if(_loc3_ != null)
         {
            var_3233 = _loc3_.id;
            _loc4_ = _loc3_.data;
         }
         return _loc4_;
      }
      
      private function updatePreviewImage(param1:BitmapData) : void
      {
         if(!_window || !param1)
         {
            return;
         }
         setPreviewImage("preview_image_bg");
         setPreviewImage("preview_image");
      }
      
      private function setPreviewImage(param1:String) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc2_:class_3282 = _window.findChildByName(param1) as class_3282;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BitmapDataAsset = _assets.getAssetByName(_loc2_.bitmapAssetName) as BitmapDataAsset;
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.disposesBitmap = false;
         _loc2_.bitmap = _loc3_.content as BitmapData;
      }
      
      public function close() : void
      {
         if(_window != null)
         {
            _window.visible = false;
         }
      }
      
      private function addClickListener(param1:String) : void
      {
         _window.findChildByName(param1).addEventListener("WME_CLICK",onMouseClick);
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:RoomWidgetMessage = null;
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_text":
            case "ok_button":
               close();
               break;
            case "save_button":
               _loc2_ = new RoomWidgetUseProductMessage("RWUPM_MONSTERPLANT_SEED",var_2944);
               close();
         }
         if(_loc2_)
         {
            var_1429.messageListener.processWidgetMessage(_loc2_);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         if(var_3233 == param1)
         {
            updatePreviewImage(param2);
            var_3233 = 0;
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
   }
}
