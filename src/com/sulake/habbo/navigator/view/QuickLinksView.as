package com.sulake.habbo.navigator.view
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3258;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.HabboNewNavigator;
   import com.sulake.habbo.navigator.context.SearchContext;
   import package_18.class_1597;
   
   public class QuickLinksView
   {
       
      
      private var _navigator:HabboNewNavigator;
      
      private var var_3037:IRegionWindow;
      
      private var _itemList:IItemListWindow;
      
      private var var_2302:Array;
      
      private var var_3002:Array;
      
      public function QuickLinksView(param1:HabboNewNavigator)
      {
         var_2302 = [];
         var_3002 = [];
         super();
         _navigator = param1;
      }
      
      public function set itemList(param1:IItemListWindow) : void
      {
         _itemList = param1;
      }
      
      public function set template(param1:IRegionWindow) : void
      {
         var_3037 = param1;
      }
      
      public function setQuickLinks(param1:Vector.<class_1597>) : void
      {
         var _loc2_:int = 0;
         var _loc4_:IRegionWindow = null;
         var _loc3_:ITextWindow = null;
         _itemList.removeListItems();
         var_2302 = [];
         var_3002 = [];
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            (_loc4_ = IRegionWindow(var_3037.clone())).id = _loc2_;
            _loc3_ = ITextWindow(_loc4_.findChildByName("quick_link_text"));
            _loc3_.caption = _navigator.localization.getLocalization("navigator.searchcode.title." + param1[_loc2_].searchCode,param1[_loc2_].searchCode) + (param1[_loc2_].filter != "" ? " - " + param1[_loc2_].filter : "");
            if(param1[_loc2_].searchCode.indexOf("category__") == 0)
            {
               _loc3_.caption = param1[_loc2_].searchCode.substr(10) + (param1[_loc2_].filter != "" ? " - " + param1[_loc2_].filter : "");
            }
            _loc4_.procedure = listItemProcedure;
            var_2302.push(new SearchContext(param1[_loc2_].searchCode,param1[_loc2_].filter));
            var_3002.push(param1[_loc2_].id);
            _itemList.addListItem(_loc4_);
            _loc2_++;
         }
      }
      
      private function listItemProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(param2 is IRegionWindow)
            {
               if(var_2302.length > param2.id)
               {
                  _navigator.performSearchByContext(var_2302[param2.id]);
                  _navigator.trackEventLog("savedsearch.execute","SavedSearch",HabboNewNavigator.getEventLogExtraStringFromSearch(var_2302[param2.id].searchCode,var_2302[param2.id].filtering));
               }
            }
            else if(param2 is class_3258)
            {
               _navigator.deleteSavedSearch(var_3002[param2.parent.id]);
            }
         }
         else if(param1.type == "WME_OVER")
         {
            if(param2 is IRegionWindow)
            {
               class_3258(IRegionWindow(param2).getChildAt(1)).visible = true;
            }
            else if(param2 is class_3258)
            {
               param2.visible = true;
            }
         }
         else if(param1.type == "WME_OUT" && param2 is IRegionWindow)
         {
            class_3258(IRegionWindow(param2).getChildAt(1)).visible = false;
         }
      }
   }
}
