package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.*;
   import com.sulake.habbo.navigator.HabboNavigator;
   import package_11.class_1625;
   
   public class RoomsTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_979:class_3287;
      
      private var var_3025:Boolean = false;
      
      public function RoomsTabPageDecorator(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      public function refreshCustomContent(param1:class_3151) : void
      {
         var _loc3_:class_3151 = param1.getChildByName("rooms_header") as class_3151;
         if(var_979 == null || false)
         {
            var_979 = class_3287(_loc3_.findChildByName("roomCtgFilter"));
            prepareRoomCategories();
            var_979.addEventListener("WE_SELECTED",onFilterSelected);
         }
         _loc3_.visible = true;
      }
      
      public function prepareRoomCategories() : void
      {
         if(var_979 == null || false)
         {
            return;
         }
         var _loc1_:Array = [_navigator.getText("navigator.navisel.popularrooms"),_navigator.getText("navigator.navisel.highestscore")];
         var_3025 = _navigator.context.configuration.getBoolean("navigator.2014.personalized.navigator");
         if(var_3025)
         {
            _loc1_.push(_navigator.getText("navigator.navisel.recommendedrooms"));
         }
         for each(var _loc2_ in _navigator.data.visibleCategories)
         {
            _loc1_.push(_loc2_.nodeName);
         }
         var_979.populate(_loc1_);
         var_979.selection = defaultSelection;
      }
      
      private function get defaultSelection() : int
      {
         return var_3025 ? 2 : 0;
      }
      
      public function tabSelected() : void
      {
         if(var_979 != null && true)
         {
            var_979.removeEventListener("WE_SELECTED",onFilterSelected);
            var_979.selection = defaultSelection;
            var_979.addEventListener("WE_SELECTED",onFilterSelected);
         }
      }
      
      public function refreshFooter(param1:class_3151) : void
      {
         _navigator.officialRoomEntryManager.refreshAdFooter(param1);
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         startSearch();
      }
      
      private function onFilterSelected(param1:class_3134) : void
      {
         startSearch();
      }
      
      private function startSearch() : void
      {
         var _loc3_:int = 0;
         var _loc4_:class_1625 = null;
         var _loc1_:int = 0;
         var _loc2_:int = !!var_979 ? var_979.selection : defaultSelection;
         class_14.log("Room filter changed: " + _loc2_);
         if(_loc2_ == 0)
         {
            _navigator.mainViewCtrl.startSearch(2,1);
         }
         else if(_loc2_ == 1)
         {
            _navigator.mainViewCtrl.startSearch(2,2);
         }
         else if(_loc2_ == 2 && var_3025)
         {
            _navigator.mainViewCtrl.startSearch(2,22);
         }
         else
         {
            _loc3_ = 2;
            if(var_3025)
            {
               _loc3_++;
            }
            if((_loc4_ = _navigator.data.visibleCategories[_loc2_ - _loc3_]) == null)
            {
               class_14.log("No fc found: " + _loc2_ + ", " + _navigator.data.visibleCategories.length);
               return;
            }
            _loc1_ = _loc4_.nodeId;
            class_14.log("Searching with catId: " + _loc1_);
            _navigator.mainViewCtrl.startSearch(2,1,"" + _loc1_);
         }
         if(var_979)
         {
            _navigator.trackNavigationDataPoint(var_979.enumerateSelection()[var_979.selection],"category.view");
         }
      }
      
      public function get filterCategory() : String
      {
         return !!var_979 ? var_979.enumerateSelection()[var_979.selection] : null;
      }
      
      public function setSubSelection(param1:int) : void
      {
      }
      
      public function processSearchParam(param1:String) : String
      {
         return param1;
      }
   }
}
