package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IScrollableGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   
   public class AvatarEditorGridView implements IAvatarEditorGridView
   {
      
      public static const REMOVE_ITEM:String = "REMOVE_ITEM";
      
      public static const GET_MORE:String = "GET_MORE";
       
      
      private const MAX_COLOR_LAYERS:int = 2;
      
      private var var_1430:class_3151;
      
      private var var_1443:com.sulake.habbo.avatar.common.class_3319;
      
      private var var_1858:IItemGridWindow;
      
      private var var_1912:Array;
      
      private var var_415:String;
      
      private var _notification:class_3127;
      
      private var var_462:class_3127;
      
      public function AvatarEditorGridView(param1:class_3151)
      {
         super();
         var_1430 = param1;
         var_1858 = var_1430.findChildByName("thumbs") as IItemGridWindow;
         var_1912 = [];
         var_1912.push(var_1430.findChildByName("palette0") as IItemGridWindow);
         var_1912.push(var_1430.findChildByName("palette1") as IItemGridWindow);
         _notification = var_1430.findChildByName("content_notification");
         var_462 = var_1430.findChildByName("content_title");
         _notification.visible = false;
         var_462.visible = false;
      }
      
      public function dispose() : void
      {
         if(var_1858)
         {
            var_1858.dispose();
            var_1858 = null;
         }
         if(var_1912)
         {
            for each(var _loc1_ in var_1912)
            {
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
                  _loc1_ = null;
               }
            }
            var_1912 = null;
         }
         var_1443 = null;
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      public function get window() : class_3151
      {
         if(var_1430 == null)
         {
            return null;
         }
         if(false)
         {
            return null;
         }
         return var_1430;
      }
      
      public function initFromList(param1:com.sulake.habbo.avatar.common.class_3319, param2:String) : void
      {
         var _loc3_:int = 0;
         var _loc6_:Array = null;
         var _loc4_:CategoryData;
         if(!(_loc4_ = param1.getCategoryData(param2)))
         {
            return;
         }
         var_1430.visible = true;
         var_1443 = param1;
         var_415 = param2;
         var_1858.removeGridItems();
         if(_loc4_.parts.length == 0)
         {
            var_462.visible = true;
            _notification.visible = true;
         }
         else
         {
            var_462.visible = false;
            _notification.visible = false;
            for each(var _loc8_ in var_1912)
            {
               _loc8_.removeGridItems();
            }
            for each(var _loc5_ in _loc4_.parts)
            {
               if(_loc5_)
               {
                  var_1858.addGridItem(_loc5_.view);
                  _loc5_.view.addEventListener("WME_CLICK",onGridItemClicked);
                  if(_loc5_.isSelected)
                  {
                     showPalettes(_loc5_.colorLayerCount);
                  }
               }
            }
            _loc3_ = 0;
            while(_loc3_ < 2)
            {
               _loc6_ = _loc4_.getPalette(_loc3_);
               _loc8_ = var_1912[_loc3_] as IItemGridWindow;
               if(!(!_loc6_ || !_loc8_))
               {
                  for each(var _loc7_ in _loc6_)
                  {
                     _loc8_.addGridItem(_loc7_.view);
                     _loc7_.view.procedure = paletteEventProc;
                  }
               }
               _loc3_++;
            }
         }
      }
      
      public function showPalettes(param1:int) : void
      {
         var _loc4_:IScrollableGridWindow = var_1430.findChildByName("palette0") as IScrollableGridWindow;
         var _loc3_:IScrollableGridWindow = var_1430.findChildByName("palette1") as IScrollableGridWindow;
         var _loc5_:int = 0;
         var _loc2_:int = -5;
         if(param1 <= 1)
         {
            _loc4_.width = _loc5_;
            _loc4_.visible = true;
            _loc3_.visible = false;
         }
         else
         {
            _loc4_.width = _loc2_;
            _loc3_.width = _loc2_;
            _loc3_.x = _loc4_.right + 10;
            _loc4_.visible = true;
            _loc3_.visible = true;
         }
      }
      
      public function updatePart(param1:int, param2:class_3151) : void
      {
         var _loc3_:class_3127 = var_1858.getGridItemAt(param1);
         if(!_loc3_)
         {
            return;
         }
         _loc3_ = param2;
      }
      
      private function onGridItemClicked(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.target.name)
         {
            case "REMOVE_ITEM":
               _loc2_ = var_1858.getGridItemIndex(param1.window);
               var_1443.selectPart(var_415,_loc2_);
               break;
            case "GET_MORE":
               var_1443.controller.manager.catalog.openCatalogPage(var_1443.controller.manager.getProperty("catalog.clothes.page"));
               break;
            default:
               _loc2_ = var_1858.getGridItemIndex(param1.window);
               var_1443.selectPart(var_415,_loc2_);
         }
      }
      
      private function paletteEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:IItemGridWindow = null;
         var _loc7_:int = 0;
         var _loc3_:class_3127 = null;
         var _loc6_:int = 0;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = param1.window;
            _loc6_ = 0;
            while(_loc6_ < 2)
            {
               if(var_1912.length > _loc6_)
               {
                  if((_loc7_ = (_loc4_ = var_1912[_loc6_] as IItemGridWindow).getGridItemIndex(_loc3_)) > -1)
                  {
                     var_1443.selectColor(var_415,_loc7_,_loc6_);
                     return;
                  }
               }
               _loc6_++;
            }
         }
      }
   }
}
