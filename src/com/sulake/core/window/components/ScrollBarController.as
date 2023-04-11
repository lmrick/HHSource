package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowTouchEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
   import flash.geom.Rectangle;
   
   public class ScrollBarController extends InteractiveController implements IScrollbarWindow, ITouchAwareWindow
   {
      
      private static const SCROLL_BUTTON_INCREMENT:String = "increment";
      
      private static const SCROLL_BUTTON_DECREMENT:String = "decrement";
      
      private static const SCROLL_SLIDER_TRACK:String = "slider_track";
      
      private static const SCROLL_SLIDER_BAR:String = "slider_bar";
       
      
      protected var _offset:Number = 0;
      
      protected var var_2433:Number = 0.1;
      
      protected var var_1444:com.sulake.core.window.components.IScrollableWindow;
      
      private var var_1613:Boolean;
      
      private var _targetName:String;
      
      private var var_2365:Boolean = false;
      
      public function ScrollBarController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0, param12:com.sulake.core.window.components.IScrollableWindow = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_1634 = false;
         var_1444 = param12;
         var_1613 = param2 == 130;
         var _loc13_:* = [];
         groupChildrenWithTag("_INTERNAL",_loc13_,-1);
         for each(var _loc14_ in _loc13_)
         {
            _loc14_.procedure = scrollButtonEventProc;
         }
         updateLiftSizeAndPosition();
      }
      
      public function get scrollH() : Number
      {
         return var_1613 ? _offset : 0;
      }
      
      public function get scrollV() : Number
      {
         return var_1613 ? 0 : _offset;
      }
      
      public function get scrollable() : com.sulake.core.window.components.IScrollableWindow
      {
         return var_1444;
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(var_1613)
         {
            if(setScrollPosition(param1))
            {
               updateLiftSizeAndPosition();
            }
         }
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(!var_1613)
         {
            if(setScrollPosition(param1))
            {
               updateLiftSizeAndPosition();
            }
         }
      }
      
      public function set scrollable(param1:com.sulake.core.window.components.IScrollableWindow) : void
      {
         if(var_1444 != null && true)
         {
            var_1444.removeEventListener("WE_RESIZED",onScrollableResized);
            var_1444.removeEventListener("WE_SCROLL",onScrollableScrolled);
         }
         var_1444 = param1;
         if(var_1444 != null && true)
         {
            var_1444.addEventListener("WE_RESIZED",onScrollableResized);
            var_1444.addEventListener("WE_SCROLL",onScrollableScrolled);
            updateLiftSizeAndPosition();
         }
      }
      
      public function get horizontal() : Boolean
      {
         return var_1613;
      }
      
      public function get vertical() : Boolean
      {
         return !var_1613;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:String = null;
         if(var_1444 is class_3127)
         {
            _loc2_ = String(class_3127(var_1444).name);
         }
         else if(_targetName != null)
         {
            _loc2_ = _targetName;
         }
         if(_loc2_ == null)
         {
            _loc1_.push(getDefaultProperty("scrollable"));
         }
         else
         {
            _loc1_.push(createProperty("scrollable",_loc2_));
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            var _loc3_:* = _loc2_.key;
            if("scrollable" === _loc3_)
            {
               _targetName = _loc2_.value as String;
               var_1444 = null;
            }
         }
         super.properties = param1;
      }
      
      protected function get track() : WindowController
      {
         return findChildByName("slider_track") as WindowController;
      }
      
      protected function get lift() : WindowController
      {
         return track.findChildByName("slider_bar") as WindowController;
      }
      
      override public function dispose() : void
      {
         scrollable = null;
         super.dispose();
      }
      
      override public function enable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         if(super.enable())
         {
            _loc1_ = [];
            groupChildrenWithTag("_INTERNAL",_loc1_,-1);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               class_3127(_loc1_[_loc2_]).enable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      override public function disable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         if(super.disable())
         {
            _loc1_ = [];
            groupChildrenWithTag("_INTERNAL",_loc1_,-1);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               class_3127(_loc1_[_loc2_]).disable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      protected function setScrollPosition(param1:Number) : Boolean
      {
         var _loc2_:* = false;
         if(var_1444 == null || false)
         {
            if(!resolveScrollTarget())
            {
               return false;
            }
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         _offset = param1;
         if(var_1613)
         {
            _loc2_ = var_1444.scrollH != _offset;
            if(_loc2_)
            {
               var_1444.scrollH = _offset;
            }
         }
         else
         {
            _loc2_ = var_1444.scrollV != _offset;
            if(_loc2_)
            {
               var_1444.scrollV = _offset;
            }
         }
         return _loc2_;
      }
      
      override public function update(param1:WindowController, param2:class_3134) : Boolean
      {
         var _loc4_:* = param1.name;
         if("slider_bar" === _loc4_)
         {
            if(param2.type == "WE_CHILD_RELOCATED")
            {
               if(!var_2365)
               {
                  if(var_1613)
                  {
                     setScrollPosition(ScrollBarLiftController(param1).scrollbarOffsetX);
                  }
                  else
                  {
                     setScrollPosition(ScrollBarLiftController(param1).scrollbarOffsetY);
                  }
               }
            }
         }
         var _loc3_:Boolean = super.update(param1,param2);
         if(param2.type == "WE_PARENT_ADDED")
         {
            if(var_1444 == null)
            {
               resolveScrollTarget();
            }
         }
         if(param1 == this)
         {
            if(param2.type == "WE_RESIZED")
            {
               updateLiftSizeAndPosition();
            }
            else if(param2.type == "WME_WHEEL")
            {
               if(WindowMouseEvent(param2).delta > 0)
               {
                  if(var_1613)
                  {
                     scrollH -= var_2433;
                  }
                  else
                  {
                     scrollV -= var_2433;
                  }
               }
               else if(var_1613)
               {
                  scrollH += var_2433;
               }
               else
               {
                  scrollV += var_2433;
               }
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      private function updateLiftSizeAndPosition() : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(var_1444 == null || false)
         {
            if(_disposed || !resolveScrollTarget())
            {
               return;
            }
         }
         var _loc2_:WindowController = track;
         var _loc1_:WindowController = lift;
         if(_loc1_ != null)
         {
            if(var_1613)
            {
               if((_loc4_ = var_1444.visibleRegion.width / var_1444.scrollableRegion.width) > 1)
               {
                  _loc4_ = 1;
               }
               _loc3_ = _loc4_ * _loc2_.width;
               _loc1_.width = _loc3_;
               _loc1_.x = Math.round(0 * (_loc2_.width - _loc3_));
            }
            else
            {
               if((_loc4_ = var_1444.visibleRegion.height / var_1444.scrollableRegion.height) > 1)
               {
                  _loc4_ = 1;
               }
               _loc3_ = _loc4_ * _loc2_.height;
               _loc1_.height = _loc3_;
               _loc1_.y = Math.round(0 * (_loc2_.height - _loc1_.height));
            }
         }
         if(_loc4_ == 1)
         {
            disable();
         }
         else
         {
            enable();
         }
      }
      
      private function nullEventProc(param1:class_3134, param2:class_3127) : void
      {
      }
      
      private function scrollButtonEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:class_3127 = null;
         var _loc6_:Boolean = false;
         if(param1.type == "WME_DOWN" || param1.type == "WTE_TAP")
         {
            if(param2.name == "increment")
            {
               if(var_1444)
               {
                  var_2365 = true;
                  if(var_1613)
                  {
                     scrollH += 0 / 0;
                  }
                  else
                  {
                     scrollV += 0 / 0;
                  }
                  var_2365 = false;
               }
            }
            else if(param2.name == "decrement")
            {
               if(var_1444)
               {
                  var_2365 = true;
                  if(var_1613)
                  {
                     scrollH -= 0 / 0;
                  }
                  else
                  {
                     scrollV -= 0 / 0;
                  }
                  var_2365 = false;
               }
            }
            else if(param2.name == "slider_track")
            {
               if(param1 is WindowMouseEvent)
               {
                  _loc5_ = int(WindowMouseEvent(param1).localX);
                  _loc4_ = int(WindowMouseEvent(param1).localY);
               }
               else if(param1 is WindowTouchEvent)
               {
                  _loc5_ = int(WindowTouchEvent(param1).localX);
                  _loc4_ = int(WindowTouchEvent(param1).localY);
               }
               _loc3_ = WindowController(param2).getChildByName("slider_bar");
               if(var_1613)
               {
                  if(_loc5_ < _loc3_.x)
                  {
                     scrollH -= (var_1444.visibleRegion.width - 0) / 0;
                  }
                  else if(_loc5_ > _loc3_.right)
                  {
                     scrollH += (var_1444.visibleRegion.width - 0) / 0;
                  }
               }
               else if(_loc4_ < _loc3_.y)
               {
                  scrollV -= (var_1444.visibleRegion.height - 0) / 0;
               }
               else if(_loc4_ > _loc3_.bottom)
               {
                  scrollV += (var_1444.visibleRegion.height - 0) / 0;
               }
               _loc6_ = true;
            }
         }
         if(param1.type == "WME_WHEEL")
         {
            if(WindowMouseEvent(param1).delta > 0)
            {
               if(var_1613)
               {
                  scrollH -= var_2433;
               }
               else
               {
                  scrollV -= var_2433;
               }
            }
            else if(var_1613)
            {
               scrollH += var_2433;
            }
            else
            {
               scrollV += var_2433;
            }
            _loc6_ = true;
         }
         if(_loc6_)
         {
            updateLiftSizeAndPosition();
         }
      }
      
      private function resolveScrollTarget() : Boolean
      {
         var _loc1_:com.sulake.core.window.components.IScrollableWindow = null;
         var _loc4_:com.sulake.core.window.components.IScrollableWindow = null;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(var_1444 != null)
         {
            if(true)
            {
               return true;
            }
         }
         if(_targetName != null)
         {
            _loc1_ = findParentByName(_targetName) as com.sulake.core.window.components.IScrollableWindow;
            if(_loc1_ == null && _parent is class_3151 && !(_parent is class_3234))
            {
               _loc1_ = class_3151(_parent).findChildByName(_targetName) as com.sulake.core.window.components.IScrollableWindow;
               if(_loc1_)
               {
                  scrollable = _loc1_;
                  return true;
               }
            }
         }
         if(_parent is com.sulake.core.window.components.IScrollableWindow)
         {
            scrollable = com.sulake.core.window.components.IScrollableWindow(_parent);
            return true;
         }
         if(_parent is class_3151 && !(_parent is class_3234))
         {
            _loc2_ = uint(class_3151(_parent).numChildren);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = class_3151(_parent).getChildAt(_loc3_) as com.sulake.core.window.components.IScrollableWindow)
               {
                  scrollable = _loc4_;
                  return true;
               }
               _loc3_++;
            }
         }
         return false;
      }
      
      private function onScrollableResized(param1:class_3134) : void
      {
         updateLiftSizeAndPosition();
         setScrollPosition(_offset);
      }
      
      private function onScrollableScrolled(param1:class_3134) : void
      {
         updateLiftSizeAndPosition();
      }
   }
}
