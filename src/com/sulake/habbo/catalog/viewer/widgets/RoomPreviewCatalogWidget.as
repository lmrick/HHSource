package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.class_3232;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class RoomPreviewCatalogWidget extends CatalogWidget implements class_3321, class_3158, class_3232
   {
       
      
      private var _imageResultIdRoom:int = -1;
      
      private var var_3269:int = -1;
      
      private var var_1815:BitmapData = null;
      
      private var var_1801:BitmapData = null;
      
      private var var_1783:Object;
      
      private var _offer:class_3159;
      
      public function RoomPreviewCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(var_1815 != null)
         {
            var_1815.dispose();
            var_1815 = null;
         }
         if(var_1801 != null)
         {
            var_1801.dispose();
            var_1801 = null;
         }
         events.removeEventListener("UPDATE_ROOM_PREVIEW",onUpdateRoomPreview);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:class_3282 = window.getChildByName("catalog_floor_preview_example") as class_3282;
         _loc1_.procedure = eventProc;
         events.addEventListener("UPDATE_ROOM_PREVIEW",onUpdateRoomPreview);
         events.addEventListener("SELECT_PRODUCT",onPreviewProduct);
         return true;
      }
      
      private function onPreviewProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         _offer = param1.offer;
      }
      
      private function eventProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_UP")
         {
            var_1783 = null;
         }
         else if(param1.type == "WME_DOWN")
         {
            if(param2 == null)
            {
               return;
            }
            var_1783 = param2;
         }
         else if(param1.type == "WME_OUT" && var_1783 != null && var_1783 == param2)
         {
            if(_offer)
            {
               (page.viewer.catalog as HabboCatalog).requestSelectedItemToMover(this,_offer);
               var_1783 = null;
            }
         }
         else if(param1.type == "WME_UP")
         {
            var_1783 == null;
         }
         else if(param1.type == "WME_CLICK")
         {
            var_1783 == null;
         }
         else if(param1.type == "WME_DOUBLE_CLICK")
         {
            var_1783 = null;
         }
      }
      
      public function onDragAndDropDone(param1:Boolean, param2:String) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1)
         {
            events.dispatchEvent(new CatalogWidgetInitPurchaseEvent(false,param2));
         }
      }
      
      public function stopDragAndDrop() : void
      {
      }
      
      private function onUpdateRoomPreview(param1:CatalogWidgetUpdateRoomPreviewEvent) : void
      {
         var _loc4_:BitmapData = null;
         var _loc2_:BitmapData = null;
         var _loc3_:class_3266 = page.viewer.roomEngine.getRoomImage(param1.floorType,param1.wallType,param1.landscapeType,param1.tileSize,this,"ads_twi_windw");
         var _loc5_:class_3266 = page.viewer.roomEngine.getGenericRoomObjectImage("ads_twi_windw","",new Vector3d(180,0,0),param1.tileSize,this);
         if(_loc3_ != null && _loc5_ != null)
         {
            _imageResultIdRoom = _loc3_.id;
            var_3269 = _loc5_.id;
            _loc4_ = _loc3_.data as BitmapData;
            _loc2_ = _loc5_.data as BitmapData;
            if(var_1815 != null)
            {
               var_1815.dispose();
            }
            if(var_1801 != null)
            {
               var_1801.dispose();
            }
            var_1815 = _loc4_;
            var_1801 = _loc2_;
            setRoomImage(_loc4_,_loc2_);
         }
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:class_3282 = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         if(param1 != null && param2 != null && true)
         {
            _loc3_ = window.getChildByName("catalog_floor_preview_example") as class_3282;
            if(_loc3_ != null)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
               }
               _loc5_ = -45;
               _loc4_ = 20;
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc6_ = (_loc3_.width - param1.width) / 2 + _loc5_;
               _loc7_ = (_loc3_.height - param1.height) / 2 + _loc4_;
               _loc3_.bitmap.copyPixels(param1,param1.rect,new Point(_loc6_,_loc7_),null,null,true);
               _loc9_ = _loc3_.width / 2 + _loc5_;
               _loc8_ = _loc3_.height / 2 + _loc4_ - param2.height;
               _loc9_ += 1;
               _loc8_ += 44;
               _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(_loc9_,_loc8_),null,null,true);
               _loc3_.invalidate();
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         switch(param1)
         {
            case _imageResultIdRoom:
               _imageResultIdRoom = 0;
               if(var_1815 != null)
               {
                  var_1815.dispose();
               }
               var_1815 = param2;
               break;
            case var_3269:
               var_3269 = 0;
               if(var_1801 != null)
               {
                  var_1801.dispose();
               }
               var_1801 = param2;
         }
         if(var_1815 != null && var_1801 != null)
         {
            setRoomImage(var_1815,var_1801);
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
   }
}
