package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.class_3159;
   import flash.events.Event;
   
   public interface ICatalogPage
   {
       
      
      function dispose() : void;
      
      function init() : void;
      
      function closed() : void;
      
      function dispatchWidgetEvent(param1:Event) : Boolean;
      
      function get window() : class_3151;
      
      function get viewer() : class_3247;
      
      function get pageId() : int;
      
      function get offers() : Vector.<class_3159>;
      
      function get localization() : IPageLocalization;
      
      function get layoutCode() : String;
      
      function get hasLinks() : Boolean;
      
      function get links() : Array;
      
      function selectOffer(param1:int) : void;
      
      function replaceOffers(param1:Vector.<class_3159>, param2:Boolean = false) : void;
      
      function updateLimitedItemsLeft(param1:int, param2:int) : void;
      
      function get acceptSeasonCurrencyAsCredits() : Boolean;
      
      function get allowDragging() : Boolean;
      
      function set searchPageId(param1:int) : void;
      
      function get mode() : int;
      
      function get isBuilderPage() : Boolean;
   }
}
