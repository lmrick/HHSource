package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import flash.display.BitmapData;
   
   public class BundleProductContainer extends ProductContainer implements IItemGrid
   {
       
      
      private var _bundleIcon:BitmapData;
      
      public function BundleProductContainer(param1:class_3159, param2:Vector.<class_3169>, param3:HabboCatalog)
      {
         super(param1,param2,param3);
         var _loc4_:BitmapDataAsset;
         if((_loc4_ = param3.assets.getAssetByName("ctlg_pic_deal_icon_narrow") as BitmapDataAsset) != null)
         {
            _bundleIcon = _loc4_.content as BitmapData;
         }
         else
         {
            _bundleIcon = new BitmapData(1,1,true,16777215);
         }
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         _bundleIcon = null;
         super.dispose();
      }
      
      override public function initProductIcon(param1:IRoomEngine, param2:IStuffData = null) : void
      {
         setIconImage(_bundleIcon.clone(),true);
      }
      
      public function populateItemGrid(param1:IItemGridWindow, param2:XML) : void
      {
         var _loc7_:class_3151 = null;
         var _loc3_:class_3127 = null;
         var _loc6_:BitmapData = null;
         var _loc4_:class_3151 = catalog.windowManager.buildFromXML(param2) as class_3151;
         for each(var _loc5_ in offer.productContainer.products)
         {
            if(_loc5_.productType != "b")
            {
               _loc3_ = (_loc7_ = _loc4_.clone() as class_3151).findChildByName("clubLevelIcon");
               if(_loc3_ != null)
               {
                  _loc3_.visible = false;
               }
               param1.addGridItem(_loc7_);
               _loc5_.view = _loc7_;
               if((_loc6_ = _loc5_.initIcon(this)) != null)
               {
                  _loc6_.dispose();
               }
               _loc5_.grid = this;
            }
         }
      }
      
      public function setBundleCounter(param1:int) : void
      {
         var _loc2_:class_3127 = var_1430.findChildByName("bundleCounter") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.caption = param1.toString();
         }
      }
      
      public function select(param1:class_3284, param2:Boolean) : void
      {
         class_14.log("Product Bundle, select item: " + param1);
      }
      
      public function startDragAndDrop(param1:class_3284) : Boolean
      {
         return false;
      }
      
      override public function set view(param1:class_3151) : void
      {
         super.view = param1;
         setBundleCounter(999);
      }
   }
}
