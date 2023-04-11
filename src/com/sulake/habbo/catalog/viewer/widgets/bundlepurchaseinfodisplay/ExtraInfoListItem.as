package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
   
   public class ExtraInfoListItem implements class_13
   {
      
      public static const ALIGN_TOP:int = 0;
      
      public static const ALIGN_BOTTOM:int = 1;
      
      public static const ALIGN_OVERLAY:int = 2;
       
      
      private var var_247:int;
      
      private var var_45:com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
      
      private var var_3422:int;
      
      private var var_4071:Boolean;
      
      private var _disposed:Boolean = false;
      
      private var var_4181:Number;
      
      private var var_3770:Number;
      
      private var var_4191:Boolean = false;
      
      public function ExtraInfoListItem(param1:BundlePurchaseExtraInfoWidget, param2:int, param3:com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData, param4:int = 0, param5:Boolean = false)
      {
         super();
         var_247 = param2;
         var_45 = param3;
         var_3422 = param4;
         var_4071 = param5;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var_45 = null;
         _disposed = true;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function get data() : com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData
      {
         return var_45;
      }
      
      public function set data(param1:com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData) : void
      {
         var_45 = param1;
      }
      
      public function get alignment() : int
      {
         return var_3422;
      }
      
      public function get alwaysOnTop() : Boolean
      {
         return var_4071;
      }
      
      public function get creationSeconds() : Number
      {
         return var_4181;
      }
      
      public function set creationSeconds(param1:Number) : void
      {
         var_4181 = param1;
      }
      
      public function get isItemRemoved() : Boolean
      {
         return var_4191;
      }
      
      public function get removalSeconds() : Number
      {
         return var_3770;
      }
      
      public function set removalSeconds(param1:Number) : void
      {
         var_3770 = param1;
         var_4191 = true;
      }
      
      public function getRenderedWindow() : class_3151
      {
         return null;
      }
   }
}
