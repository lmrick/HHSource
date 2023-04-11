package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.session.product.class_3200;
   import flash.display.BitmapData;
   
   public interface IProduct extends class_3158, class_13
   {
       
      
      function get productType() : String;
      
      function get productClassId() : int;
      
      function set extraParam(param1:String) : void;
      
      function get extraParam() : String;
      
      function get productCount() : int;
      
      function get productData() : class_3200;
      
      function get furnitureData() : class_3148;
      
      function get isUniqueLimitedItem() : Boolean;
      
      function get isColorable() : Boolean;
      
      function get uniqueLimitedItemSeriesSize() : int;
      
      function get uniqueLimitedItemsLeft() : int;
      
      function set uniqueLimitedItemsLeft(param1:int) : void;
      
      function initIcon(param1:class_3318, param2:class_3158 = null, param3:class_1870 = null, param4:class_3159 = null, param5:class_3282 = null, param6:IStuffData = null, param7:Function = null) : BitmapData;
      
      function set view(param1:class_3151) : void;
      
      function set grid(param1:IItemGrid) : void;
   }
}
