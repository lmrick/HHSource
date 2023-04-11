package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.*;
   import com.sulake.habbo.navigator.HabboNavigator;
   import package_2.class_525;
   
   public class MyRoomsTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_979:class_3287;
      
      private const SUB_ITEMS:Array = [[5,"navigator.navisel.myrooms"],[4,"navigator.navisel.wherearemyfriends"],[3,"navigator.navisel.myfriendsrooms"],[18,"navigator.navisel.roomswithrights"],[19,"navigator.navisel.mygroups"],[6,"navigator.navisel.myfavourites"],[7,"navigator.navisel.visitedrooms"],[23,""]];
      
      public function MyRoomsTabPageDecorator(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      public function refreshCustomContent(param1:class_3151) : void
      {
         var _loc3_:class_3151 = param1.getChildByName("me_header") as class_3151;
         if(var_979 == null || false)
         {
            var_979 = class_3287(_loc3_.findChildByName("meSubNavi"));
            prepareSubNavi();
            var_979.addEventListener("WE_SELECTED",onFilterSelected);
         }
         _loc3_.visible = true;
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
         var _loc2_:class_3151 = param1.getChildByName("me_footer") as class_3151;
         var _loc3_:class_3127 = _loc2_.findChildByName("create_room_but");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onCreateRoomClick);
         }
         _navigator.refreshButton(_loc2_,"create_room",true,null,0);
         _loc2_.visible = true;
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         startSearch();
      }
      
      private function onCreateRoomClick(param1:class_3134) : void
      {
         _navigator.send(new class_525());
      }
      
      private function prepareSubNavi() : void
      {
         if(var_979 == null || false)
         {
            return;
         }
         var _loc2_:* = [];
         for each(var _loc1_ in SUB_ITEMS)
         {
            _loc2_.push(_navigator.getText(_loc1_[1]));
         }
         var_979.populate(_loc2_);
         var_979.selection = 0;
      }
      
      private function onFilterSelected(param1:class_3134) : void
      {
         startSearch();
         var _loc2_:class_3127 = param1.target;
         if(_loc2_ is class_3287)
         {
            _navigator.trackNavigationDataPoint(class_3287(_loc2_).enumerateSelection()[class_3287(_loc2_).selection],"category.view");
         }
      }
      
      private function startSearch() : void
      {
         var _loc1_:int = int(var_979 == null || false ? 0 : var_979.selection);
         _navigator.mainViewCtrl.startSearch(3,getSearchTypeForIndex(_loc1_));
      }
      
      private function getSearchTypeForIndex(param1:int) : int
      {
         if(param1 <= SUB_ITEMS.length)
         {
            return SUB_ITEMS[param1][0];
         }
         return SUB_ITEMS[0][0];
      }
      
      public function get filterCategory() : String
      {
         return !!var_979 ? var_979.enumerateSelection()[var_979.selection] : null;
      }
      
      public function setSubSelection(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = null;
         if(!var_979 || false)
         {
            return;
         }
         var _loc4_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = SUB_ITEMS[_loc3_];
            if(_loc2_[0] == param1)
            {
               var_979.selection = _loc3_;
               return;
            }
            _loc3_++;
         }
         var_979.selection = 0;
      }
      
      public function processSearchParam(param1:String) : String
      {
         return param1;
      }
   }
}
