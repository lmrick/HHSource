package com.sulake.habbo.catalog.navigation
{
   public interface ICatalogNode
   {
       
      
      function dispose() : void;
      
      function get isOpen() : Boolean;
      
      function get depth() : int;
      
      function get isBranch() : Boolean;
      
      function get isLeaf() : Boolean;
      
      function get visible() : Boolean;
      
      function get localization() : String;
      
      function get pageId() : int;
      
      function get pageName() : String;
      
      function get children() : Vector.<class_3188>;
      
      function get offerIds() : Vector.<int>;
      
      function activate() : void;
      
      function deactivate() : void;
      
      function addChild(param1:class_3188) : void;
      
      function open() : void;
      
      function close() : void;
      
      function get parent() : class_3188;
      
      function get iconName() : String;
      
      function get offsetV() : int;
   }
}
