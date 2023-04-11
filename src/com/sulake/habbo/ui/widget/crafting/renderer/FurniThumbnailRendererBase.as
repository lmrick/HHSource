package com.sulake.habbo.ui.widget.crafting.renderer
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   import flash.display.BitmapData;
   
   public class FurniThumbnailRendererBase implements class_3158
   {
       
      
      private const THUMB_BLEND_ITEMS_AVAILABLE:Number = 1;
      
      private const THUMB_BLEND_ITEMS_NOT_AVAILABLE:Number = 0.2;
      
      protected var var_1429:CraftingWidget;
      
      protected var var_45:CraftingFurnitureItem;
      
      protected var _window:class_3151;
      
      public function FurniThumbnailRendererBase(param1:CraftingFurnitureItem, param2:class_3151, param3:CraftingWidget)
      {
         super();
         var_1429 = param3;
         _window = param2;
         var_45 = param1;
         requestIconFromRoomEngine(furnitureData);
         updateItemCount();
         _window.procedure = onMouseDown;
         var _loc4_:IRegionWindow;
         (_loc4_ = param2.findChildByName("tooltip") as IRegionWindow).toolTipCaption = param1.furnitureData.localizedName;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.removeEventListener("mouseDown",onMouseDown);
            _window.dispose();
            _window = null;
         }
      }
      
      private function requestIconFromRoomEngine(param1:class_3148) : void
      {
         var _loc2_:class_3266 = null;
         switch(param1.type)
         {
            case "s":
               _loc2_ = var_1429.handler.container.roomEngine.getFurnitureIcon(param1.id,this);
               break;
            case "i":
               _loc2_ = var_1429.handler.container.roomEngine.getWallItemIcon(param1.id,this);
         }
         if(_loc2_.data)
         {
            imageReady(0,_loc2_.data);
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc3_:class_3282 = _window.findChildByTag("BITMAP") as class_3282;
         if(_loc3_ && param2)
         {
            _loc3_.bitmap = param2;
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      public function updateItemCount() : void
      {
      }
      
      protected function hideItemCount() : void
      {
         var _loc1_:class_3127 = _window.findChildByName("number_container");
         if(_loc1_)
         {
            _loc1_.visible = false;
         }
      }
      
      protected function updateGroupItemCount(param1:int) : void
      {
         var _loc3_:ITextWindow = null;
         if(!_window || false)
         {
            return;
         }
         var _loc2_:class_3127 = _window.findChildByName("number_container");
         _loc2_.visible = param1 > 0;
         if(param1 > 0)
         {
            _loc3_ = _window.findChildByName("number") as ITextWindow;
            _loc3_.text = String(param1);
         }
      }
      
      protected function updateBitmapBlend(param1:Boolean) : void
      {
         var _loc2_:class_3282 = _window.findChildByName("bitmap") as class_3282;
         if(param1)
         {
            _loc2_.blend = 1;
         }
         else
         {
            _loc2_.blend = 0.2;
         }
      }
      
      private function onMouseDown(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_DOWN")
         {
            return;
         }
         onTriggered();
      }
      
      protected function onTriggered() : void
      {
      }
      
      public function get content() : CraftingFurnitureItem
      {
         return var_45;
      }
      
      protected function get furnitureData() : class_3148
      {
         return !!content ? content.furnitureData : null;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
   }
}
