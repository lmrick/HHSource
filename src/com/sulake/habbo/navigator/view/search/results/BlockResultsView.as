package com.sulake.habbo.navigator.view.search.results
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.HabboNewNavigator;
   import flash.utils.Dictionary;
   import package_18.class_1548;
   import package_18.class_1656;
   
   public class BlockResultsView
   {
       
      
      private var _navigator:HabboNewNavigator;
      
      private var _itemList:IItemListWindow;
      
      private var var_2424:com.sulake.habbo.navigator.view.search.results.CategoryElementFactory;
      
      private var var_1731:Dictionary;
      
      private var var_2842:Dictionary;
      
      private var var_2866:Dictionary;
      
      public function BlockResultsView(param1:HabboNewNavigator)
      {
         var_1731 = new Dictionary();
         var_2842 = new Dictionary();
         var_2866 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get itemList() : IItemListWindow
      {
         return _itemList;
      }
      
      public function set itemList(param1:IItemListWindow) : void
      {
         _itemList = param1;
         _itemList.disableAutodrag = true;
      }
      
      public function set categoryElementFactory(param1:com.sulake.habbo.navigator.view.search.results.CategoryElementFactory) : void
      {
         var_2424 = param1;
      }
      
      public function displayCurrentResults() : void
      {
         var _loc1_:class_3127 = null;
         var _loc4_:class_1548 = null;
         var _loc2_:int = 0;
         var _loc3_:class_1656 = null;
         if(true)
         {
            return;
         }
         var_2842 = new Dictionary();
         var_1731 = new Dictionary();
         var_2866 = new Dictionary();
         _itemList.destroyListItems();
         if(_navigator.currentResults.resultSet.blocks.length == 0)
         {
            _itemList.addListItem(var_2424.getNoResultsELement());
         }
         else
         {
            _loc4_ = _navigator.currentResults.resultSet;
            _loc2_ = 0;
            while(_loc2_ < _loc4_.blocks.length)
            {
               _loc3_ = _loc4_.blocks[_loc2_];
               _loc1_ = renderCurrentResultsBlock(_loc2_,(!isMinimized(_loc3_.searchCode) || isSingleBlock(_loc4_)) && !_loc3_.forceClosed);
               _loc1_.id = _loc2_;
               _itemList.addListItem(_loc1_);
               var_2842[_loc2_] = _loc1_;
               var_1731[_loc2_] = _loc3_.searchCode;
               var_2866[_loc2_] = _loc3_.viewMode;
               _loc2_++;
            }
         }
         _itemList.arrangeListItems();
      }
      
      public function onCategoryShowMoreClicked(param1:class_3134) : void
      {
         _navigator.performSearch(var_1731[param1.window.id],_navigator.currentResults.filteringData);
         _navigator.trackEventLog("browse.expandsearch","Results",HabboNewNavigator.getEventLogExtraStringFromSearch(var_1731[param1.window.id],_navigator.currentResults.filteringData));
      }
      
      public function onCategoryBackClicked(param1:class_3134) : void
      {
         _navigator.goBack();
      }
      
      public function onCategoryCollapseClicked(param1:class_3134) : void
      {
         _navigator.sendAddCollapsedCategory(var_1731[param1.window.id]);
         _navigator.collapsedCategories.push(var_1731[param1.window.id]);
         replaceBlock(param1.window.id,false);
         _navigator.trackEventLog("browse.collapsecategory","Results",HabboNewNavigator.getEventLogExtraStringFromSearch(var_1731[param1.window.id],_navigator.currentResults.filteringData));
      }
      
      public function onCategoryExpandClicked(param1:class_3134) : void
      {
         _navigator.sendRemoveCollapsedCategory(var_1731[param1.window.id]);
         _navigator.collapsedCategories.splice(_navigator.collapsedCategories.indexOf(var_1731[param1.window.id]),1);
         replaceBlock(param1.window.id,true);
         _navigator.trackEventLog("browse.uncollapsecategory","Results",HabboNewNavigator.getEventLogExtraStringFromSearch(var_1731[param1.window.id],_navigator.currentResults.filteringData));
      }
      
      public function onCategoryAddQuickLinkClicked(param1:class_3134) : void
      {
         _navigator.addSavedSearch(var_1731[param1.window.id],_navigator.currentResults.filteringData);
      }
      
      public function onCategoryToggleModeClicked(param1:class_3134) : void
      {
         var _loc2_:int = getToggledViewMode(var_2866[param1.window.id]);
         _navigator.toggleSearchCodeViewMode(var_1731[param1.window.id],_loc2_);
         _navigator.currentResults.resultSet.blocks[param1.window.id].viewMode = _loc2_;
         replaceBlock(param1.window.id,true);
         var_2866[param1.window.id] = _loc2_;
      }
      
      private function getToggledViewMode(param1:int) : int
      {
         if(param1 == 0)
         {
            return 1;
         }
         return 0;
      }
      
      public function get itemListWidth() : int
      {
         return _itemList.width;
      }
      
      private function isMinimized(param1:String) : Boolean
      {
         return _navigator.collapsedCategories.indexOf(param1) != -1;
      }
      
      private function isSingleBlock(param1:class_1548) : Boolean
      {
         return param1.blocks.length == 1;
      }
      
      private function renderCurrentResultsBlock(param1:int, param2:Boolean) : class_3127
      {
         var _loc5_:int = 0;
         var _loc3_:class_1656 = _navigator.currentResults.resultSet.blocks[param1];
         var _loc4_:String = _loc3_.text == "" ? "${navigator.searchcode.title." + _loc3_.searchCode + "}" : _loc3_.text;
         if(param2)
         {
            _loc5_ = !_navigator.sessionData.isPerkAllowed("NAVIGATOR_ROOM_THUMBNAIL_CAMERA") && _navigator.currentResults.searchCodeOriginal != "official_view" ? 0 : _loc3_.viewMode;
            return var_2424.getOpenCategoryElement(_loc3_.guestRooms,_loc4_,param1,_loc3_.actionAllowed,_loc5_);
         }
         return var_2424.getCollapsedCategoryElement(_loc4_,param1,_loc3_.actionAllowed);
      }
      
      private function replaceBlock(param1:int, param2:Boolean) : void
      {
         var _loc4_:int = _itemList.getListItemIndex(var_2842[param1]);
         _itemList.removeListItemAt(_loc4_);
         var _loc3_:class_3127 = renderCurrentResultsBlock(param1,param2);
         _loc3_.id = param1;
         _itemList.addListItemAt(_loc3_,_loc4_);
         var_2842[param1] = _loc3_;
      }
   }
}
