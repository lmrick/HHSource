package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class BadgeGridView
   {
       
      
      private var var_1430:com.sulake.habbo.inventory.badges.BadgesView;
      
      private var var_1986:IItemGridWindow;
      
      private var _items:Vector.<com.sulake.habbo.inventory.badges.Badge>;
      
      private var _passedItems:Vector.<com.sulake.habbo.inventory.badges.Badge>;
      
      private var var_2035:IItemListWindow;
      
      private var var_4053:IRegionWindow;
      
      private var var_4037:int = 200;
      
      private var var_1622:int = -1;
      
      private var _currentPageItems:Vector.<com.sulake.habbo.inventory.badges.Badge>;
      
      private var var_979:String = "";
      
      public function BadgeGridView(param1:com.sulake.habbo.inventory.badges.BadgesView, param2:IItemGridWindow, param3:IItemListWindow)
      {
         super();
         var_1430 = param1;
         var_1986 = param2;
         var_1986.shouldRebuildGridOnResize = false;
         _items = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         _passedItems = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         var_2035 = param3;
         if(var_2035)
         {
            var_4053 = var_2035.removeListItemAt(0) as IRegionWindow;
         }
      }
      
      public function get visibleCount() : int
      {
         return var_1986.numGridItems;
      }
      
      public function get currentPageItems() : Vector.<com.sulake.habbo.inventory.badges.Badge>
      {
         return _currentPageItems;
      }
      
      private function get pageCount() : int
      {
         return 0 / var_4037 + 1;
      }
      
      public function dispose() : void
      {
         var_1986 = null;
         _items = null;
      }
      
      public function clearGrid() : void
      {
         if(var_1986 != null)
         {
            var_1986.removeGridItems();
         }
         var_1986.destroyGridItems();
      }
      
      public function setFilter(param1:int, param2:String, param3:String) : void
      {
         var_979 = param3 == null ? "" : param3.toLowerCase();
         update();
      }
      
      public function itemWasUpdated(param1:com.sulake.habbo.inventory.badges.Badge) : void
      {
         if(passFilter(param1))
         {
            update();
         }
      }
      
      public function getFirstThumb() : class_3151
      {
         if(false)
         {
            return null;
         }
         return var_1986.getGridItemAt(0) as class_3151;
      }
      
      public function setItems(param1:Vector.<com.sulake.habbo.inventory.badges.Badge>) : void
      {
         _items = param1;
         update();
      }
      
      private function update() : void
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc1_:Vector.<com.sulake.habbo.inventory.badges.Badge> = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         for each(_loc2_ in _items)
         {
            if(passFilter(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         if(_loc1_.length == _passedItems.length)
         {
            _loc3_ = false;
            _loc4_ = 0;
            while(_loc4_ < _loc1_.length)
            {
               if(_loc1_[_loc4_] != _passedItems[_loc4_])
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
            if(!_loc3_)
            {
               return;
            }
         }
         _passedItems = _loc1_;
         changeToPage(var_1622,true);
         updatePaging();
      }
      
      private function changeToPage(param1:int, param2:Boolean = false) : void
      {
         var _loc5_:* = 0;
         if(param1 > -1)
         {
            if(var_1622 == param1 && !param2)
            {
               return;
            }
         }
         else
         {
            param1 = 0;
         }
         var_1622 = param1;
         if(var_1622 >= pageCount)
         {
            var_1622 = pageCount - 1;
         }
         var_1622 = Math.max(var_1622,0);
         _currentPageItems = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         clearGrid();
         var _loc3_:int = var_1622 * var_4037;
         var _loc4_:int = _loc3_ + var_4037;
         _loc4_ = Math.min(_loc4_,_passedItems.length);
         _loc5_ = _loc3_;
         while(_loc5_ < _loc4_)
         {
            var_1986.addGridItem(_passedItems[_loc5_].window);
            _currentPageItems.push(_passedItems[_loc5_]);
            _loc5_++;
         }
      }
      
      private function updatePassedItems(param1:com.sulake.habbo.inventory.badges.Badge) : void
      {
      }
      
      private function updatePaging() : void
      {
         var _loc4_:IRegionWindow = null;
         var _loc3_:int = 0;
         var _loc2_:ITextWindow = null;
         if(!var_2035)
         {
            return;
         }
         var _loc1_:int = pageCount;
         var_2035.visible = _loc1_ > 1;
         if(var_1622 >= _loc1_)
         {
            var_1622 = _loc1_ - 1;
         }
         var_1622 = Math.max(var_1622,0);
         if(pageCount != var_2035.numListItems)
         {
            for each(_loc4_ in var_2035)
            {
               _loc4_.removeEventListener("WME_CLICK",onPageEventProc);
            }
            var_2035.destroyListItems();
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               (_loc4_ = var_4053.clone() as IRegionWindow).addEventListener("WME_CLICK",onPageEventProc);
               _loc4_.addEventListener("WME_OVER",onPageEventProc);
               _loc4_.addEventListener("WME_OUT",onPageEventProc);
               _loc4_.id = _loc3_;
               _loc4_.name = "page_" + _loc3_;
               var_2035.addListItem(_loc4_);
               _loc3_++;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = (_loc4_ = var_2035.getListItemAt(_loc3_) as IRegionWindow).findChildByTag("PAGE") as ITextWindow;
            _loc2_.caption = _loc3_.toString();
            if(_loc3_ == var_1622)
            {
               _loc2_.underline = true;
               _loc2_.textColor = 16711680;
            }
            else
            {
               _loc2_.underline = false;
               _loc2_.textColor = 0;
            }
            _loc3_++;
         }
      }
      
      private function onPageEventProc(param1:WindowMouseEvent) : void
      {
         var _loc3_:int = param1.window.id;
         var _loc2_:ITextWindow = (param1.target as class_3151).findChildByTag("PAGE") as ITextWindow;
         switch(param1.type)
         {
            case "WME_CLICK":
               changeToPage(_loc3_);
               updatePaging();
               break;
            case "WME_OVER":
               _loc2_.textColor = 16711680;
               break;
            case "WME_OUT":
               if(_loc3_ != var_1622)
               {
                  _loc2_.textColor = 0;
                  break;
               }
         }
      }
      
      private function passFilter(param1:com.sulake.habbo.inventory.badges.Badge) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(param1 == null || param1.badgeName == null || param1.badgeDescription == null)
         {
            return false;
         }
         if(false)
         {
            _loc2_ = param1.badgeName.toLowerCase();
            _loc3_ = param1.badgeDescription.toLowerCase();
            if(_loc2_.indexOf(var_979) == -1 && _loc3_.indexOf(var_979) == -1)
            {
               return false;
            }
         }
         return true;
      }
   }
}
