package com.sulake.habbo.catalog.navigation
{
   import package_8.class_1291;
   
   public class CatalogNode implements com.sulake.habbo.catalog.navigation.class_3188
   {
      
      private static const ICON_PREFIX:String = "icon_";
       
      
      private var _depth:int = 0;
      
      private var _localization:String = "";
      
      private var var_344:int = -1;
      
      private var _pageName:String = "";
      
      private var var_3599:int = 0;
      
      private var _children:Vector.<com.sulake.habbo.catalog.navigation.class_3188>;
      
      private var _offerIds:Vector.<int>;
      
      private var _navigator:com.sulake.habbo.catalog.navigation.class_3125;
      
      private var _parent:com.sulake.habbo.catalog.navigation.class_3188;
      
      public function CatalogNode(param1:com.sulake.habbo.catalog.navigation.class_3125, param2:class_1291, param3:int, param4:com.sulake.habbo.catalog.navigation.class_3188)
      {
         super();
         _depth = param3;
         _parent = param4;
         _navigator = param1;
         _localization = param2.localization;
         var_344 = param2.pageId;
         _pageName = param2.pageName;
         var_3599 = param2.icon;
         _children = new Vector.<com.sulake.habbo.catalog.navigation.class_3188>(0);
         _offerIds = param2.offerIds;
      }
      
      public function get isOpen() : Boolean
      {
         return false;
      }
      
      public function get depth() : int
      {
         return _depth;
      }
      
      public function get isBranch() : Boolean
      {
         return false;
      }
      
      public function get isLeaf() : Boolean
      {
         return false;
      }
      
      public function get visible() : Boolean
      {
         return false;
      }
      
      public function get localization() : String
      {
         return _localization;
      }
      
      public function get pageId() : int
      {
         return var_344;
      }
      
      public function get pageName() : String
      {
         return _pageName;
      }
      
      public function get children() : Vector.<com.sulake.habbo.catalog.navigation.class_3188>
      {
         return _children;
      }
      
      public function get offerIds() : Vector.<int>
      {
         return _offerIds;
      }
      
      public function get navigator() : com.sulake.habbo.catalog.navigation.class_3125
      {
         return _navigator;
      }
      
      public function get parent() : com.sulake.habbo.catalog.navigation.class_3188
      {
         return _parent;
      }
      
      public function set parent(param1:com.sulake.habbo.catalog.navigation.class_3188) : void
      {
      }
      
      public function dispose() : void
      {
         for each(var _loc1_ in _children)
         {
            _loc1_.dispose();
         }
         _children = null;
         _offerIds = null;
         _navigator = null;
         _parent = null;
         _pageName = "";
         _localization = "";
      }
      
      public function addChild(param1:com.sulake.habbo.catalog.navigation.class_3188) : void
      {
         if(param1 == null)
         {
            return;
         }
         _children.push(param1);
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function open() : void
      {
      }
      
      public function close() : void
      {
      }
      
      public function get iconName() : String
      {
         if(var_3599 < 1)
         {
            return "";
         }
         return "icon_" + var_3599.toString();
      }
      
      public function get offsetV() : int
      {
         return 0;
      }
   }
}
