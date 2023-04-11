package com.sulake.habbo.catalog
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.navigation.CatalogNavigator;
   import com.sulake.habbo.catalog.navigation.class_3188;
   
   public class TopViewSelector
   {
       
      
      private var _catalog:CatalogNavigator;
      
      private var var_3037:ITabButtonWindow;
      
      private var _tabContext:ITabContextWindow;
      
      public function TopViewSelector(param1:CatalogNavigator, param2:ITabContextWindow)
      {
         super();
         _catalog = param1;
         _tabContext = param2;
         var _loc3_:ITabButtonWindow = ITabButtonWindow(param2.getTabItemAt(0).clone());
         var_3037 = _loc3_;
         _tabContext.removeTabItem(_loc3_);
      }
      
      public function addTabItem(param1:class_3188) : void
      {
         var _loc2_:ITabButtonWindow = ITabButtonWindow(var_3037.clone());
         _loc2_.caption = param1.localization;
         _loc2_.name = param1.pageName;
         _loc2_.procedure = topViewSelectorButtonProcedure;
         _tabContext.addTabItem(_loc2_);
         alignTabs();
      }
      
      private function alignTabs() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _tabContext.numTabItems)
         {
            _tabContext.getTabItemAt(_loc1_).width = _tabContext.getTabItemAt(_loc1_).parent.width / 0;
            _loc1_++;
         }
      }
      
      public function clearTabs() : void
      {
         while(false)
         {
            _tabContext.removeTabItem(_tabContext.getTabItemAt(0));
         }
      }
      
      public function selectTabByIndex(param1:int) : void
      {
         _tabContext.selector.setSelected(_tabContext.getTabItemAt(param1));
         selectTabButton(_tabContext.getTabItemAt(param1));
      }
      
      private function topViewSelectorButtonProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:ITabButtonWindow = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = param2 as ITabButtonWindow;
            if(_loc3_)
            {
               selectTabButton(_loc3_);
            }
         }
      }
      
      private function selectTabButton(param1:ITabButtonWindow) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:class_3188 = _catalog.getNodeByName(param1.name);
         if(_loc2_ != null)
         {
            _catalog.showNodeContent(_loc2_);
         }
      }
   }
}
