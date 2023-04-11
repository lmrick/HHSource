package com.sulake.habbo.friendbar.landingview.layout
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Rectangle;
   
   public class DynamicLayoutManager implements class_13
   {
      
      public static const PLACEHOLDER_NAME:String = "placeholder_dynamic_widget_slots";
      
      public static const CONTENT_AREA_START_X:int = 230;
      
      private static const NUMBER_OF_SLOTS:int = 5;
      
      private static const RESIZE_TOLERANCE_SCROLLBAR_VISIBILITY:int = 6;
      
      private static const ABSOLUTE_MINIMUM_HEIGHT:int = 360;
       
      
      private var _layout:com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
      
      private var var_1541:IItemListWindow;
      
      private var var_2338:IItemListWindow;
      
      private var var_1793:IItemListWindow;
      
      private var var_3363:class_3151;
      
      private var var_1882:IItemListWindow;
      
      private var var_3236:class_3151;
      
      private var var_1500:Vector.<class_3151>;
      
      private var var_3519:IItemListWindow;
      
      private var var_3505:IItemListWindow;
      
      private var var_3126:class_3151;
      
      private var var_3945:class_3127;
      
      private var _fromTopScrollbar:IScrollbarWindow;
      
      private var _window:class_3151;
      
      private var var_4090:Boolean = false;
      
      private var var_2272:com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
      
      private var var_3001:int = 10;
      
      private var var_2777:int = 50;
      
      private var var_2908:int = 10;
      
      private var var_4296:int = 80;
      
      private var var_4294:int = 10;
      
      private var var_3688:int = 60;
      
      private var var_3510:int = -1;
      
      private var _topItemListInitialWidth:int = -1;
      
      private var var_66:Boolean = false;
      
      private var var_3349:class_3127 = null;
      
      public function DynamicLayoutManager(param1:com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout, param2:com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings)
      {
         var _loc5_:int = 0;
         var_1500 = new Vector.<class_3151>(5);
         super();
         _layout = param1;
         var_2272 = param2;
         _window = class_3151(_layout.landingView.getXmlWindow("dynamic_widget_grid"));
         var _loc6_:class_3127 = _layout.window.findChildByName("placeholder_dynamic_widget_slots");
         var _loc3_:class_3151 = class_3151(_loc6_.parent);
         _loc3_.addChildAt(_window,_loc3_.getChildIndex(_loc6_));
         _loc3_.removeChild(_loc6_);
         var_1541 = IItemListWindow(_window.findChildByName("widgetlist_fromtop"));
         var_3363 = class_3151(_window.findChildByName("center_slots_container"));
         var_2338 = IItemListWindow(_window.findChildByName("widget_slots_center_scrollable"));
         var_1793 = IItemListWindow(_window.findChildByName("widget_slots_center_left"));
         var_1882 = IItemListWindow(_window.findChildByName("widget_slots_center_right"));
         var_3236 = class_3151(_window.findChildByName("widget_slots_right"));
         var_3519 = IItemListWindow(_window.findChildByName("widget_slot_4_root"));
         var_3505 = IItemListWindow(_window.findChildByName("widget_slot_5_root"));
         var_3945 = _layout.landingView.getXmlWindow("dynamic_widget_grid_separator");
         _loc5_ = 0;
         while(_loc5_ < 6)
         {
            var_1500[_loc5_] = class_3151(_window.findChildByName("widget_slot_" + (_loc5_ + 1)));
            if(false)
            {
               var_1500[_loc5_].addEventListener("WE_RESIZED",contractCenterContainer);
            }
            _loc5_++;
         }
         _fromTopScrollbar = IScrollbarWindow(_window.findChildByName("center_container_scrollbar"));
         var_3126 = class_3151(_window.findChildByName("scroll_extra_space_container"));
         var _loc7_:int = _layout.landingView.dynamicLayoutLeftPaneWidth;
         var _loc4_:int = _layout.landingView.dynamicLayoutRightPaneWidth;
         var_1793.width = _loc7_;
         var_1793.limits.maxWidth = _loc7_;
         var_3519.width = _loc7_;
         var_1882.width = _loc4_;
         var_3236.width = _loc4_;
         var_3236.limits.maxWidth = _loc4_;
         var_3505.width = _loc4_;
         var_2338.arrangeListItems();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         if(!disposed)
         {
            _loc1_ = 0;
            while(_loc1_ < 6)
            {
               if(false)
               {
                  var_1500[_loc1_].dispose();
               }
               var_1500[_loc1_] = null;
               _loc1_++;
            }
            if(_window)
            {
               _window.dispose();
               _window = null;
            }
            _layout = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _layout == null;
      }
      
      public function getDynamicSlotContainer(param1:int) : class_3151
      {
         return var_1500[param1];
      }
      
      public function enableSeparator(param1:int, param2:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:ITextWindow = null;
         switch(param1 - 4)
         {
            case 0:
               _loc3_ = var_3519;
               break;
            case 1:
               _loc3_ = var_3505;
               break;
            default:
               _loc3_ = null;
         }
         if(_loc3_)
         {
            if(_loc3_.numListItems < 2)
            {
               _loc3_.addListItemAt(var_3945.clone(),0);
            }
            (_loc4_ = ITextWindow(IItemListWindow(_loc3_.getListItemAt(0)).getListItemByName("separator_title"))).caption = "${" + param2 + "}";
            if(var_2272 != null)
            {
               if(false)
               {
                  _loc4_.textColor = var_2272.textColor;
               }
               if(false)
               {
                  _loc4_.etchingColor = var_2272.etchingColor;
               }
               if(false)
               {
                  _loc4_.etchingPosition = var_2272.etchingPosition;
               }
            }
         }
      }
      
      private function isSlotOccupied(param1:int) : Boolean
      {
         return var_1500[param1].numChildren > 0;
      }
      
      public function resizeTo(param1:int, param2:int) : void
      {
         var_1541.height = Math.min(param2,topItemListInitialHeight);
         var_1541.height = Math.max(360,var_1541.height);
         var_1541.width = Math.min(param1,topItemListInitialWidth);
         applyVerticalSize();
      }
      
      public function set scrollbarRightEdgeRelativeToScreen(param1:int) : void
      {
         var _loc2_:int = int(_layout.window.width);
         param1 = Math.min(param1,_loc2_) - 0;
         _fromTopScrollbar.x = param1 - 0;
      }
      
      public function get topItemListInitialHeight() : int
      {
         if(var_3510 == -1)
         {
            var_3510 = var_1541.height;
         }
         return var_3510;
      }
      
      public function get topItemListInitialWidth() : int
      {
         if(_topItemListInitialWidth == -1)
         {
            _topItemListInitialWidth = var_1541.width;
         }
         return _topItemListInitialWidth;
      }
      
      private function applyVerticalSize() : void
      {
         var _loc1_:int = 0;
         clearEmptySlotsForSpace();
         alignTopWidgetRow();
         alignBottomWidgetRow();
         resetToMaximumSpacing();
         setVerticalSpacing(topItemListContentHeight - 0);
         contractCenterContainer();
         adjustScrollbarVisibility();
         setHorizontalSpacing();
         if(!var_66)
         {
            _loc1_ = 0;
            while(_loc1_ < 6)
            {
               if(false)
               {
                  var_1500[_loc1_].addEventListener("WE_RESIZED",updateLayout);
               }
               _loc1_++;
            }
         }
         var_66 = true;
         var_3349 = null;
      }
      
      private function updateLayout(param1:class_3134 = null) : void
      {
         if(var_3349 == null)
         {
            var_3349 = param1.window;
            applyVerticalSize();
         }
      }
      
      private function clearEmptySlotsForSpace() : void
      {
         var _loc1_:int = 0;
         if(!isSlotOccupied(0))
         {
            var_1500[0].height = 0;
         }
         _loc1_ = 1;
         while(_loc1_ <= 4)
         {
            if(!isSlotOccupied(_loc1_))
            {
               var_1500[_loc1_].height = 1;
            }
            _loc1_++;
         }
      }
      
      private function alignBottomWidgetRow() : void
      {
         var _loc1_:int = 0;
         if(isSlotOccupied(3) || isSlotOccupied(4))
         {
            _loc1_ = Math.max(var_1500[3].height,var_1500[4].height);
            var_1500[3].height = _loc1_;
            var_1500[4].height = _loc1_;
            if(isSlotOccupied(3))
            {
               var_1500[3].getChildAt(0).y = 0;
               var_1500[3].width = _layout.landingView.dynamicLayoutLeftPaneWidth;
            }
            if(isSlotOccupied(4))
            {
               var_1500[4].getChildAt(0).y = 0;
               var_1500[4].width = _layout.landingView.dynamicLayoutRightPaneWidth;
            }
         }
      }
      
      private function alignTopWidgetRow() : int
      {
         var _loc1_:int = 0;
         if(isSlotOccupied(1) || isSlotOccupied(2))
         {
            if(!var_4090)
            {
               _loc1_ = Math.max(var_1500[1].height,var_1500[2].height);
               var_1500[1].height = _loc1_;
               var_1500[2].height = _loc1_;
            }
            if(isSlotOccupied(1))
            {
               var_1500[1].getChildAt(0).y = 0;
               var_1500[1].width = _layout.landingView.dynamicLayoutLeftPaneWidth;
            }
            if(isSlotOccupied(2))
            {
               var_1500[2].getChildAt(0).y = 0;
               var_1500[2].width = _layout.landingView.dynamicLayoutRightPaneWidth;
            }
         }
         return _loc1_;
      }
      
      private function setHorizontalSpacing() : void
      {
         var _loc1_:int = _topItemListInitialWidth - 0;
         if(_loc1_ > var_3688 - var_4294)
         {
            var_2338.spacing = var_4294;
         }
         else
         {
            var_2338.spacing = Math.min(var_3688,var_3688 - _loc1_);
         }
      }
      
      private function setVerticalSpacing(param1:int) : void
      {
         var _loc2_:int = var_2777 - var_3001;
         var _loc3_:int = var_4296 - var_2908;
         param1 += var_3001 + var_2908;
         if(param1 <= 0)
         {
            var_1541.spacing = var_2908;
            var_1793.spacing = var_2777;
            var_1882.spacing = var_2777;
         }
         else if(param1 < _loc2_)
         {
            var_1541.spacing = var_2908;
            var_1793.spacing = var_2777 - param1;
            var_1882.spacing = var_2777 - param1;
         }
         else if(param1 < _loc2_ + _loc3_)
         {
            var_1541.spacing = var_2908;
            var_1793.spacing = var_3001;
            var_1882.spacing = var_3001;
         }
         else
         {
            var_1541.spacing = var_2908;
            var_1793.spacing = var_3001;
            var_1882.spacing = var_3001;
         }
      }
      
      private function adjustScrollbarVisibility() : void
      {
         var_1541.invalidate();
         if(var_1541.height < topItemListContentHeight - 6)
         {
            _fromTopScrollbar.y = var_1541.y;
            _fromTopScrollbar.height = var_1541.height;
            _fromTopScrollbar.visible = true;
            _fromTopScrollbar.scrollV = 0;
            var_3126.y = topItemListContentHeight;
            var_3126.height = 25;
            _layout.landingView.toolbarExtensionExtraMargin = true;
         }
         else
         {
            var_3126.y = 0;
            var_3126.height = 1;
            _layout.landingView.toolbarExtensionExtraMargin = false;
         }
      }
      
      private function resetToMaximumSpacing() : void
      {
         var_2338.spacing = var_3688;
         var_1793.spacing = var_2777;
         var_1882.spacing = var_2777;
         var_1541.spacing = var_4296;
         _fromTopScrollbar.visible = false;
         var_1793.invalidate();
         var_1882.invalidate();
         var_2338.invalidate();
         var_1541.invalidate();
         var_3363.invalidate();
      }
      
      private function get topItemListContentHeight() : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < var_1541.numListItems)
         {
            _loc2_ = var_1541.getListItemAt(_loc3_).height;
            _loc1_ += _loc2_;
            if(_loc3_ > 0)
            {
               _loc1_ += var_1541.spacing;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function contractCenterContainer(param1:class_3134 = null) : void
      {
         if(param1 != null && !var_66)
         {
            return;
         }
         var_1793.invalidate();
         var_1882.invalidate();
         var_2338.height = Math.max(var_1793.height,var_1882.height);
         var_3363.height = Math.max(var_1793.height,var_1882.height);
      }
      
      public function set ignoreBottomRightSlot(param1:Boolean) : void
      {
         var_4090 = param1;
      }
      
      private function logFinalPositions() : void
      {
         var _loc2_:int = 0;
         class_14.log("***** Final positions *****");
         var _loc1_:Rectangle = new Rectangle();
         _window.getGlobalRectangle(_loc1_);
         class_14.log("Window rect\t\t\t\t\t\t: " + _loc1_);
         var_1541.getGlobalRectangle(_loc1_);
         class_14.log("All items list rect\t\t\t\t: " + _loc1_);
         var_3363.getGlobalRectangle(_loc1_);
         class_14.log("Center container itemlist rect\t: " + _loc1_);
         var_2338.getGlobalRectangle(_loc1_);
         class_14.log("Center itemlist rect\t\t\t: " + _loc1_);
         var_1793.getGlobalRectangle(_loc1_);
         class_14.log("Left pane itemlist rect\t\t\t: " + _loc1_);
         var_1882.getGlobalRectangle(_loc1_);
         class_14.log("Right pane itemlist rect\t\t: " + _loc1_);
         var_3236.getGlobalRectangle(_loc1_);
         class_14.log("Right pane container rect\t\t: " + _loc1_);
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            var_1500[_loc2_].getGlobalRectangle(_loc1_);
            class_14.log("Slot " + _loc2_ + " rect\t\t\t    : " + _loc1_);
            _loc2_++;
         }
      }
   }
}
