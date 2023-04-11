package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.iterators.ItemListIterator;
   import com.sulake.core.window.theme.IThemeManager;
   import com.sulake.core.window.utils.IInputProcessorRoot;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot
   {
       
      
      private var var_4063:Boolean = false;
      
      private var var_3623:Boolean = false;
      
      protected var var_2079:Number;
      
      protected var var_2070:Number;
      
      protected var _scrollAreaWidth:Number;
      
      protected var var_1512:Number;
      
      protected var _container:class_3151;
      
      protected var var_3424:Boolean = false;
      
      protected var var_1682:Boolean = false;
      
      protected var var_1823:int;
      
      protected var var_1613:Boolean = false;
      
      protected var var_2297:Number = -1;
      
      protected var var_2328:Number = -1;
      
      protected var _arrangeListItems:Boolean;
      
      protected var _scaleToFitItems:Boolean;
      
      protected var _resizeOnItemUpdate:Boolean;
      
      protected var var_4065:Number;
      
      protected var var_3496:Number;
      
      protected var var_4140:Number;
      
      protected var var_4009:Number;
      
      protected var var_2463:Boolean;
      
      public function ItemListController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var_2079 = 0;
         var_2070 = 0;
         _scrollAreaWidth = 0;
         var_1512 = 0;
         var_1613 = param2 == 51;
         var _loc12_:IThemeManager;
         var_1823 = int((_loc12_ = param5.getWindowFactory().getThemeManager()).getPropertyDefaults(param3).method_20("spacing").value);
         _arrangeListItems = _loc12_.getPropertyDefaults(param3).method_20("auto_arrange_items").value;
         _scaleToFitItems = _loc12_.getPropertyDefaults(param3).method_20("scale_to_fit_items").value;
         _resizeOnItemUpdate = _loc12_.getPropertyDefaults(param3).method_20("resize_on_item_update").value;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_1634 = _background || !testParamFlag(16);
         _container = _context.create("_CONTAINER","",4,0,16,new Rectangle(0,0,width,height),null,this,0,null,"",["_INTERNAL","_EXCLUDE"]) as class_3151;
         _container.addEventListener("WE_RESIZED",containerEventHandler);
         _container.addEventListener("WE_CHILD_REMOVED",containerEventHandler);
         _container.addEventListener("WE_CHILD_RESIZED",containerEventHandler);
         _container.addEventListener("WE_CHILD_RELOCATED",containerEventHandler);
         _container.clipping = clipping;
         resizeOnItemUpdate = _resizeOnItemUpdate;
      }
      
      public function get spacing() : int
      {
         return var_1823;
      }
      
      public function set spacing(param1:int) : void
      {
         if(param1 != var_1823)
         {
            var_1823 = param1;
            updateScrollAreaRegion();
         }
      }
      
      public function get scrollH() : Number
      {
         return var_2079;
      }
      
      public function get scrollV() : Number
      {
         return var_2070;
      }
      
      public function get maxScrollH() : int
      {
         return Math.max(0,_scrollAreaWidth - width);
      }
      
      public function get maxScrollV() : int
      {
         return Math.max(0,var_1512 - height);
      }
      
      public function get isPartOfGridWindow() : Boolean
      {
         return var_3623;
      }
      
      public function set isPartOfGridWindow(param1:Boolean) : void
      {
         var_3623 = param1;
      }
      
      public function get scrollableWindow() : class_3127
      {
         return this;
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(var_2079 * maxScrollH,var_2070 * maxScrollV,width,height);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return _container.rectangle;
      }
      
      public function set scrollH(param1:Number) : void
      {
         var _loc2_:class_3134 = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != var_2079)
         {
            var_2079 = param1;
            _container.x = -var_2079 * maxScrollH;
            _context.invalidate(_container,visibleRegion,1);
            if(name_1)
            {
               _loc2_ = class_3134.allocate("WE_SCROLL",this,null);
               name_1.dispatchEvent(_loc2_);
               _loc2_.recycle();
            }
         }
      }
      
      public function set scrollV(param1:Number) : void
      {
         var _loc2_:class_3134 = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != var_2070)
         {
            var_2070 = param1;
            _container.y = -var_2070 * maxScrollV;
            if(name_1)
            {
               _loc2_ = class_3134.allocate("WE_SCROLL",this,null);
               name_1.dispatchEvent(_loc2_);
               _loc2_.recycle();
            }
         }
      }
      
      public function get scrollStepH() : Number
      {
         if(var_2297 >= 0)
         {
            return var_2297;
         }
         return var_1613 ? 0 / numListItems : 0;
      }
      
      public function get scrollStepV() : Number
      {
         if(var_2328 >= 0)
         {
            return var_2328;
         }
         return var_1613 ? 0 : 0 / numListItems;
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         var_2297 = param1;
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         var_2328 = param1;
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         if(_scaleToFitItems != param1)
         {
            _scaleToFitItems = param1;
            updateScrollAreaRegion();
         }
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return _scaleToFitItems;
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         _arrangeListItems = param1;
         updateScrollAreaRegion();
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return _arrangeListItems;
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         _resizeOnItemUpdate = param1;
         if(_container)
         {
            if(var_1613)
            {
               _container.setParamFlag(4194304,param1);
            }
            else
            {
               _container.setParamFlag(8388608,param1);
            }
         }
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return _resizeOnItemUpdate;
      }
      
      public function get iterator() : IIterator
      {
         return new ItemListIterator(this);
      }
      
      public function get firstListItem() : class_3127
      {
         return numListItems > 0 ? getListItemAt(0) : null;
      }
      
      public function get lastListItem() : class_3127
      {
         return numListItems > 0 ? getListItemAt(numListItems - 1) : null;
      }
      
      override public function set clipping(param1:Boolean) : void
      {
         super.clipping = param1;
         if(_container)
         {
            _container.clipping = param1;
         }
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            _container.removeEventListener("WE_RESIZED",containerEventHandler);
            _container.removeEventListener("WE_CHILD_REMOVED",containerEventHandler);
            _container.removeEventListener("WE_CHILD_RESIZED",containerEventHandler);
            _container.removeEventListener("WE_CHILD_RELOCATED",containerEventHandler);
            super.dispose();
         }
      }
      
      override protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < numListItems)
         {
            IItemListWindow(param1).addListItem(getListItemAt(_loc2_).clone());
            _loc2_++;
         }
      }
      
      public function get numListItems() : int
      {
         return _container != null ? _container.numChildren : 0;
      }
      
      public function addListItem(param1:class_3127) : class_3127
      {
         var_1682 = true;
         if(var_1613)
         {
            param1.x = _scrollAreaWidth + (numListItems > 0 ? var_1823 : 0);
            _scrollAreaWidth = param1.right;
            _container.width = _scrollAreaWidth;
         }
         else
         {
            if(autoArrangeItems)
            {
               param1.y = var_1512 + (numListItems > 0 ? var_1823 : 0);
               var_1512 = param1.bottom;
            }
            else
            {
               var_1512 = Math.max(var_1512,param1.bottom);
            }
            _container.height = var_1512;
         }
         param1 = _container.addChild(param1);
         var_1682 = false;
         return param1;
      }
      
      public function addListItemAt(param1:class_3127, param2:uint) : class_3127
      {
         param1 = _container.addChildAt(param1,param2);
         updateScrollAreaRegion();
         return param1;
      }
      
      public function getListItemAt(param1:uint) : class_3127
      {
         return _container.getChildAt(param1);
      }
      
      public function getListItemByID(param1:uint) : class_3127
      {
         return _container.getChildByID(param1);
      }
      
      public function getListItemByName(param1:String) : class_3127
      {
         return _container.getChildByName(param1);
      }
      
      public function getListItemByTag(param1:String) : class_3127
      {
         return _container.getChildByTag(param1);
      }
      
      public function getListItemIndex(param1:class_3127) : int
      {
         return _container.getChildIndex(param1);
      }
      
      public function removeListItem(param1:class_3127) : class_3127
      {
         param1 = _container.removeChild(param1);
         if(param1)
         {
            updateScrollAreaRegion();
         }
         return param1;
      }
      
      public function removeListItemAt(param1:int) : class_3127
      {
         return _container.removeChildAt(param1);
      }
      
      public function setListItemIndex(param1:class_3127, param2:int) : void
      {
         _container.setChildIndex(param1,param2);
      }
      
      public function swapListItems(param1:class_3127, param2:class_3127) : void
      {
         _container.swapChildren(param1,param2);
         updateScrollAreaRegion();
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         _container.swapChildrenAt(param1,param2);
         updateScrollAreaRegion();
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:int = 0) : uint
      {
         return _container.groupChildrenWithID(param1,param2,param3);
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:int = 0) : uint
      {
         return _container.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function removeListItems() : void
      {
         var_1682 = true;
         while(numListItems > 0)
         {
            _container.removeChildAt(0);
         }
         var_1682 = false;
         updateScrollAreaRegion();
      }
      
      public function destroyListItems() : void
      {
         var_1682 = true;
         while(numListItems > 0)
         {
            _container.removeChildAt(0).destroy();
         }
         var_1682 = false;
         updateScrollAreaRegion();
      }
      
      public function arrangeListItems() : void
      {
         updateScrollAreaRegion();
      }
      
      override public function populate(param1:Array) : void
      {
         WindowController(_container).populate(param1);
         updateScrollAreaRegion();
      }
      
      override public function update(param1:WindowController, param2:class_3134) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case "WE_RESIZE":
               var_3424 = true;
               break;
            case "WE_RESIZED":
               if(!_scaleToFitItems)
               {
                  if(var_1613)
                  {
                     _container.height = var_1441;
                  }
                  else
                  {
                     _container.width = var_1436;
                  }
               }
               updateScrollAreaRegion();
               var_3424 = false;
               break;
            default:
               if(param2 is class_3134)
               {
                  _loc3_ = process(param2 as class_3134);
                  break;
               }
         }
         return _loc3_;
      }
      
      public function process(param1:class_3134) : Boolean
      {
         var _loc5_:* = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         if(param1 is WindowMouseEvent)
         {
            _loc3_ = int(WindowMouseEvent(param1).localX);
            _loc4_ = int(WindowMouseEvent(param1).localY);
            _loc2_ = int(WindowMouseEvent(param1).delta);
         }
         switch(param1.type)
         {
            case "WME_WHEEL":
               if(var_1613)
               {
                  scrollH -= _loc2_ * scrollStepH / maxScrollH;
               }
               else
               {
                  scrollV -= _loc2_ * scrollStepV / maxScrollV;
               }
               _loc5_ = !var_3623;
               break;
            case "WME_DOWN":
               var_4065 = _loc3_;
               var_3496 = _loc4_;
               var_4140 = var_2079 * maxScrollH;
               var_4009 = var_2070 * maxScrollV;
               var_2463 = true;
               _loc5_ = true;
               break;
            case "WME_MOVE":
               if(var_2463 && !var_4063)
               {
                  if(var_1613)
                  {
                     scrollH = (var_4140 + var_4065 - _loc3_) / maxScrollH;
                  }
                  else
                  {
                     scrollV = (var_4009 + var_3496 - _loc4_) / maxScrollV;
                  }
                  _loc5_ = true;
                  break;
               }
               break;
            case "WME_UP":
            case "WME_UP_OUTSIDE":
               if(var_2463)
               {
                  var_2463 = false;
                  _loc5_ = true;
                  break;
               }
         }
         return _loc5_;
      }
      
      private function scrollAnimationCallback(param1:int, param2:int) : void
      {
         if(!disposed)
         {
            scrollH -= param1 / _scrollAreaWidth;
            scrollV -= param2 / var_1512;
         }
      }
      
      private function containerEventHandler(param1:class_3134) : void
      {
         var _loc2_:class_3134 = null;
         switch(param1.type)
         {
            case "WE_CHILD_REMOVED":
               updateScrollAreaRegion();
               break;
            case "WE_CHILD_RESIZED":
               if(!var_3424)
               {
                  updateScrollAreaRegion();
                  break;
               }
               break;
            case "WE_CHILD_RELOCATED":
               updateScrollAreaRegion();
               break;
            case "WE_RESIZED":
               if(name_1)
               {
                  _loc2_ = class_3134.allocate("WE_RESIZED",this,null);
                  name_1.dispatchEvent(_loc2_);
                  _loc2_.recycle();
                  break;
               }
         }
      }
      
      protected function updateScrollAreaRegion() : void
      {
         var _loc4_:class_3127 = null;
         var _loc1_:int = 0;
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         if(_arrangeListItems && !var_1682 && _container)
         {
            var_1682 = true;
            _loc2_ = 0;
            if(var_1613)
            {
               _scrollAreaWidth = 0;
               var_1512 = var_1441;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if((_loc4_ = _container.getChildAt(_loc3_)).visible)
                  {
                     _loc4_.x = _scrollAreaWidth;
                     _scrollAreaWidth += _loc4_.width + var_1823;
                     if(_scaleToFitItems)
                     {
                        _loc1_ = _loc4_.height + _loc4_.y;
                        var_1512 = _loc1_ > var_1512 ? _loc1_ : var_1512;
                     }
                  }
                  _loc3_++;
               }
               if(_loc2_ > 0)
               {
                  _scrollAreaWidth -= var_1823;
               }
            }
            else
            {
               _scrollAreaWidth = var_1436;
               var_1512 = 0;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if((_loc4_ = _container.getChildAt(_loc3_)).visible)
                  {
                     _loc4_.y = var_1512;
                     var_1512 += _loc4_.height + var_1823;
                     if(_scaleToFitItems)
                     {
                        _loc1_ = _loc4_.width + _loc4_.x;
                        _scrollAreaWidth = _loc1_ > _scrollAreaWidth ? _loc1_ : _scrollAreaWidth;
                     }
                  }
                  _loc3_++;
               }
               if(_loc2_ > 0)
               {
                  var_1512 -= var_1823;
               }
            }
            if(var_2079 > 0)
            {
               if(_scrollAreaWidth <= var_1436)
               {
                  scrollH = 0;
               }
               else
               {
                  _container.x = -(var_2079 * maxScrollH);
               }
            }
            if(var_2070 > 0)
            {
               if(var_1512 <= var_1441)
               {
                  scrollV = 0;
               }
               else
               {
                  _container.y = -(var_2070 * maxScrollV);
               }
            }
            _container.height = var_1512;
            _container.width = _scrollAreaWidth;
            var_1682 = false;
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(createProperty("spacing",var_1823));
         _loc1_.push(createProperty("auto_arrange_items",_arrangeListItems));
         _loc1_.push(createProperty("scale_to_fit_items",_scaleToFitItems));
         _loc1_.push(createProperty("resize_on_item_update",_resizeOnItemUpdate));
         _loc1_.push(createProperty("scroll_step_h",var_2297));
         _loc1_.push(createProperty("scroll_step_v",var_2328));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "spacing":
                  spacing = _loc2_.value as int;
                  break;
               case "scale_to_fit_items":
                  scaleToFitItems = _loc2_.value as Boolean;
                  break;
               case "resize_on_item_update":
                  resizeOnItemUpdate = _loc2_.value as Boolean;
                  break;
               case "auto_arrange_items":
                  _arrangeListItems = _loc2_.value as Boolean;
                  break;
               case "scroll_step_h":
                  var_2297 = _loc2_.value as Number;
                  break;
               case "scroll_step_v":
                  var_2328 = _loc2_.value as Number;
                  break;
            }
         }
         super.properties = param1;
      }
      
      public function stopDragging() : void
      {
         var_2463 = false;
      }
      
      public function set disableAutodrag(param1:Boolean) : void
      {
         var_4063 = param1;
      }
   }
}
