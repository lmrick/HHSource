package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.catalog.HabboCatalog;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ProductGridItem implements class_3284
   {
      
      public static const GRID_ITEM_BORDER:String = "bg";
       
      
      protected var var_1430:class_3151;
      
      private var var_1986:com.sulake.habbo.catalog.viewer.IItemGrid;
      
      protected var _icon:class_3282;
      
      private var _disposed:Boolean = false;
      
      private var var_1783:Object;
      
      private var _catalog:HabboCatalog;
      
      public function ProductGridItem(param1:HabboCatalog)
      {
         _catalog = param1;
         super();
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function set grid(param1:com.sulake.habbo.catalog.viewer.IItemGrid) : void
      {
         var_1986 = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1986 = null;
         _icon = null;
         _catalog = null;
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      protected function get catalog() : HabboCatalog
      {
         return _catalog;
      }
      
      public function activate() : void
      {
         if(!var_1430)
         {
            return;
         }
         if(var_1430.findChildByTag("ITEM_HILIGHT"))
         {
            var_1430.findChildByTag("ITEM_HILIGHT").visible = true;
         }
         else
         {
            var_1430.getChildByName("bg").style = 0;
         }
      }
      
      public function deactivate() : void
      {
         if(!var_1430)
         {
            return;
         }
         if(var_1430.findChildByTag("ITEM_HILIGHT"))
         {
            var_1430.findChildByTag("ITEM_HILIGHT").visible = false;
         }
         else
         {
            var_1430.getChildByName("bg").style = 3;
         }
      }
      
      public function set view(param1:class_3151) : void
      {
         if(!param1)
         {
            return;
         }
         var_1430 = param1;
         var_1430.procedure = eventProc;
         _icon = var_1430.findChildByName("image") as class_3282;
         if(var_1430.findChildByTag("ITEM_HILIGHT"))
         {
            var_1430.findChildByTag("ITEM_HILIGHT").visible = false;
         }
         var _loc2_:class_3127 = var_1430.findChildByName("multiContainer");
         if(_loc2_)
         {
            _loc2_.visible = false;
         }
      }
      
      public function setDraggable(param1:Boolean) : void
      {
         if(var_1430 as IInteractiveWindow && param1)
         {
            (var_1430 as IInteractiveWindow).setMouseCursorForState(4,5);
            (var_1430 as IInteractiveWindow).setMouseCursorForState(5,5);
         }
      }
      
      private function eventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:Boolean = false;
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
            var_1986.select(this,true);
            var_1783 = param2;
         }
         else if(param1.type == "WME_OUT" && var_1783 != null && var_1783 == param2)
         {
            _loc3_ = var_1986.startDragAndDrop(this);
            if(_loc3_)
            {
               var_1783 = null;
            }
         }
         else if(param1.type == "WME_UP")
         {
            var_1783 = null;
         }
         else if(param1.type == "WME_CLICK")
         {
            var_1783 = null;
         }
         else if(param1.type == "WME_DOUBLE_CLICK")
         {
            var_1783 = null;
         }
      }
      
      public function setIconImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(_icon != null && true)
         {
            _loc3_ = (0 - param1.width) / 2;
            _loc4_ = (0 - param1.height) / 2;
            if(true)
            {
               _icon.bitmap = new BitmapData(_icon.width,_icon.height,true,16777215);
            }
            else
            {
               _icon.bitmap.fillRect(_icon.bitmap.rect,16777215);
            }
            _icon.bitmap.copyPixels(param1,param1.rect,new Point(_loc3_,_loc4_),null,null,false);
            _icon.invalidate();
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      protected function renderAvatarImage(param1:String, param2:class_1870) : BitmapData
      {
         var _loc4_:class_3156;
         var _loc3_:BitmapData = (_loc4_ = _catalog.avatarRenderManager.createAvatarImage(param1,"h",null,param2)).getCroppedImage("head",0.5);
         _loc4_.dispose();
         return _loc3_;
      }
   }
}
