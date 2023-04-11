package com.sulake.habbo.catalog.navigation
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import package_8.class_1291;
   
   public interface ICatalogNavigator
   {
       
      
      function dispose() : void;
      
      function get catalog() : IHabboCatalog;
      
      function buildCatalogIndex(param1:class_1291) : void;
      
      function showIndex() : void;
      
      function activateNode(param1:class_3188) : void;
      
      function loadFrontPage() : void;
      
      function get initialized() : Boolean;
      
      function getNodesByOfferId(param1:int, param2:Boolean = false) : Vector.<class_3188>;
      
      function getNodeByName(param1:String) : class_3188;
      
      function getOptionalNodeByName(param1:String) : class_3188;
      
      function getNodeById(param1:int, param2:class_3188 = null) : class_3188;
      
      function openPage(param1:String) : void;
      
      function openPageById(param1:int, param2:int) : void;
      
      function openPageByOfferId(param1:int) : void;
      
      function deactivateCurrentNode() : void;
      
      function filter(param1:String, param2:Array) : void;
      
      function get listTemplate() : class_3127;
      
      function getItemTemplate(param1:int) : class_3127;
      
      function get isDeepHierarchy() : Boolean;
   }
}
