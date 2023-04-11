package com.sulake.habbo.groups
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.exceptions.Exception;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import package_5.class_1580;
   
   public class ColorGridCtrl
   {
       
      
      private var var_437:com.sulake.habbo.groups.HabboGroupsManager;
      
      private var var_3449:class_3151;
      
      private var _parentCallback:Function;
      
      private var var_2291:Vector.<class_1580>;
      
      private var var_1866:IItemGridWindow;
      
      private var var_2018:int = -1;
      
      private var var_2680:BitmapData;
      
      private var var_1840:BitmapData;
      
      private var var_2736:BitmapData;
      
      private var _disposed:Boolean = false;
      
      public function ColorGridCtrl(param1:com.sulake.habbo.groups.HabboGroupsManager, param2:Function)
      {
         super();
         var_437 = param1;
         _parentCallback = param2;
      }
      
      public function get selectedColorIndex() : int
      {
         return var_2018;
      }
      
      public function get isInitialized() : Boolean
      {
         return var_2291 != null && var_1866 != null;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1866)
            {
               var_1866.destroyGridItems();
               var_1866 = null;
            }
            if(var_1840)
            {
               var_1840.dispose();
               var_1840 = null;
            }
            if(var_2736)
            {
               var_2736.dispose();
               var_2736 = null;
            }
            if(var_1840)
            {
               var_1840.dispose();
               var_1840 = null;
            }
            if(var_2680)
            {
               var_2680.dispose();
               var_2680 = null;
            }
            var_437 = null;
            var_3449 = null;
            _disposed = true;
         }
      }
      
      public function createAndAttach(param1:class_3151, param2:String, param3:Vector.<class_1580>) : void
      {
         var _loc4_:class_3151 = null;
         if(var_1866 != null || param1 == null || param2 == null || param3 == null)
         {
            return;
         }
         var_3449 = param1;
         var_2291 = param3;
         var_1866 = var_3449.findChildByName(param2) as IItemGridWindow;
         var_1840 = getBitmap("color_chooser_bg");
         var_2736 = getBitmap("color_chooser_fg");
         var_2680 = getBitmap("color_chooser_selected");
         for each(var _loc5_ in var_2291)
         {
            (_loc4_ = var_437.getXmlWindow("badge_color_item") as class_3151).procedure = onClick;
            _loc4_.background = true;
            _loc4_.color = 4290689957;
            _loc4_.width = var_1840.width;
            _loc4_.height = var_1840.height;
            setGridItemBitmap(_loc4_,"background",var_1840,true,null);
            setGridItemBitmap(_loc4_,"foreground",var_2736,true,_loc5_);
            setGridItemBitmap(_loc4_,"selected",var_2680,false,null);
            var_1866.addGridItem(_loc4_);
         }
      }
      
      private function setGridItemBitmap(param1:class_3151, param2:String, param3:BitmapData, param4:Boolean, param5:class_1580 = null) : void
      {
         var _loc7_:BitmapData = null;
         var _loc6_:class_3282;
         if((_loc6_ = param1.findChildByName(param2) as class_3282) != null)
         {
            _loc7_ = param3.clone();
            if(param5 != null)
            {
               _loc7_.colorTransform(_loc7_.rect,new ColorTransform(param5.red / 255,param5.green / 255,param5.blue / 255));
            }
            _loc6_.bitmap = _loc7_;
            _loc6_.visible = param4;
         }
      }
      
      public function setSelectedColorIndex(param1:int, param2:Boolean = true) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_2018 != param1 && param1 < var_1866.numGridItems)
         {
            setSelectedItemVisibility(var_2018,false);
            var_2018 = param1;
            setSelectedItemVisibility(var_2018,true);
         }
         if(param2 && _parentCallback != null)
         {
            _parentCallback(this);
         }
      }
      
      public function setSelectedColorById(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!isInitialized)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < var_2291.length)
         {
            if(var_2291[_loc2_].id == param1)
            {
               setSelectedColorIndex(_loc2_);
               return;
            }
            _loc2_++;
         }
         setSelectedColorIndex(0);
      }
      
      public function getSelectedColorId() : int
      {
         var _loc1_:class_1580 = getSelectedColorData();
         if(_loc1_ != null)
         {
            return _loc1_.id;
         }
         return 0;
      }
      
      public function getSelectedColorData() : class_1580
      {
         if(var_2291 != null && var_2018 >= 0 && var_2018 < var_2291.length)
         {
            return var_2291[var_2018];
         }
         return null;
      }
      
      private function getBitmap(param1:String) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc2_:BitmapDataAsset = var_437.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_)
         {
            _loc3_ = _loc2_.content as BitmapData;
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         throw new Exception("Failed to load bitmap asset " + param1 + " in ColorGridWidget");
      }
      
      private function setSelectedItemVisibility(param1:int, param2:Boolean) : void
      {
         var _loc3_:class_3127 = null;
         if(param1 < 0 || param1 >= var_1866.numGridItems)
         {
            return;
         }
         var _loc4_:class_3151;
         if((_loc4_ = var_1866.getGridItemAt(param1) as class_3151) != null)
         {
            _loc3_ = _loc4_.findChildByName("selected") as class_3127;
            if(_loc3_ != null)
            {
               _loc3_.visible = param2;
            }
         }
      }
      
      private function onClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         setSelectedColorIndex(var_1866.getGridItemIndex(param2));
      }
   }
}
