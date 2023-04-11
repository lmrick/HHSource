package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.HabboNavigator;
   
   public class EventsTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_979:class_3287;
      
      public function EventsTabPageDecorator(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      public function refreshCustomContent(param1:class_3151) : void
      {
         var _loc2_:class_3151 = param1.getChildByName("room_ad_header") as class_3151;
         if(var_979 == null || false)
         {
            var_979 = _loc2_.getChildByName("roomAdFilter") as class_3287;
            prepareFilter();
            var_979.addEventListener("WE_SELECTED",onFilterSelected);
         }
         _loc2_.visible = true;
      }
      
      public function tabSelected() : void
      {
         if(var_979 != null && true)
         {
            var_979.removeEventListener("WE_SELECTED",onFilterSelected);
            var_979.selection = 0;
            var_979.addEventListener("WE_SELECTED",onFilterSelected);
         }
      }
      
      public function refreshFooter(param1:class_3151) : void
      {
         var _loc2_:class_3151 = param1.getChildByName("room_ads_footer") as class_3151;
         var _loc3_:class_3127 = _loc2_.findChildByName("get_event_but");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onGetEventClick);
         }
         _loc2_.visible = true;
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         startSearch();
      }
      
      private function prepareFilter() : void
      {
         if(var_979 == null || false)
         {
            return;
         }
         var _loc1_:* = [];
         _loc1_.push(_navigator.getText("navigator.roomad.topads"));
         _loc1_.push(_navigator.getText("navigator.roomad.newads"));
         var_979.populate(_loc1_);
         var_979.selection = 0;
      }
      
      private function onFilterSelected(param1:class_3134) : void
      {
         startSearch();
      }
      
      private function onGetEventClick(param1:class_3134) : void
      {
         _navigator.openCatalogRoomAdsPage();
      }
      
      private function startSearch() : void
      {
         var _loc1_:int = 16;
         if(var_979 != null && true)
         {
            _loc1_ = getSearchType(var_979.selection);
         }
         _navigator.mainViewCtrl.startSearch(1,_loc1_);
      }
      
      private function getSearchType(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 16;
            case 1:
               return 17;
            default:
               class_14.log("Invalid index when searching Room ad search type: " + param1);
               return 0;
         }
      }
      
      public function get filterCategory() : String
      {
         if(var_979 == null || false)
         {
            return null;
         }
         return var_979.enumerateSelection()[var_979.selection];
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
