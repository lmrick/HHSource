package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.IIterable;
   import com.sulake.core.window.utils.IIterator;
   import flash.geom.Rectangle;
   
   public class TabContextController extends WindowController implements ITabContextWindow, IIterable
   {
      
      private static const TAG_TAB_CONTEXT_SELECTOR:String = "_SELECTOR";
      
      private static const TAG_TAB_CONTEXT_CONTENT:String = "_CONTENT";
       
      
      protected var var_2854:com.sulake.core.window.components.ISelectorListWindow;
      
      protected var var_3520:class_3151;
      
      private var var_3374:Boolean = false;
      
      private var var_66:Boolean = false;
      
      public function TabContextController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var _loc12_:* = [];
         groupChildrenWithTag("_INTERNAL",_loc12_,-1);
         for each(var _loc13_ in _loc12_)
         {
            _loc13_.style = _style;
            _loc13_.procedure = selectorEventProc;
         }
         var_66 = true;
      }
      
      public function get selector() : com.sulake.core.window.components.ISelectorListWindow
      {
         if(var_2854 == null)
         {
            var_2854 = findChildByTag("_SELECTOR") as com.sulake.core.window.components.ISelectorListWindow;
            if(var_2854 != null)
            {
               var_2854.procedure = selectorEventProc;
            }
         }
         return var_2854;
      }
      
      public function get container() : class_3151
      {
         if(var_3520 == null)
         {
            var_3520 = findChildByTag("_CONTENT") as class_3151;
         }
         return var_3520;
      }
      
      public function get iterator() : IIterator
      {
         return var_66 ? selector.iterator : null;
      }
      
      public function get numTabItems() : uint
      {
         return var_2854.numSelectables;
      }
      
      public function addTabItem(param1:ITabButtonWindow) : ITabButtonWindow
      {
         return selector.addSelectable(param1) as ITabButtonWindow;
      }
      
      public function addTabItemAt(param1:ITabButtonWindow, param2:uint) : ITabButtonWindow
      {
         return selector.addSelectableAt(param1,param2) as ITabButtonWindow;
      }
      
      public function removeTabItem(param1:ITabButtonWindow) : void
      {
         selector.removeSelectable(param1);
      }
      
      public function getTabItemAt(param1:uint) : ITabButtonWindow
      {
         return selector.getSelectableAt(param1) as ITabButtonWindow;
      }
      
      public function getTabItemByName(param1:String) : ITabButtonWindow
      {
         return selector.getSelectableByName(param1) as ITabButtonWindow;
      }
      
      public function getTabItemByID(param1:uint) : ITabButtonWindow
      {
         return selector.getSelectableByID(param1) as ITabButtonWindow;
      }
      
      public function getTabItemIndex(param1:ITabButtonWindow) : uint
      {
         return selector.getSelectableIndex(param1);
      }
      
      private function selectorEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_SELECTED")
         {
            notifyEventListeners(param1);
         }
      }
   }
}
