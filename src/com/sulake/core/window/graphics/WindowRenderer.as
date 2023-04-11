package com.sulake.core.window.graphics
{
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3178;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import com.sulake.core.window.utils.class_3179;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class WindowRenderer implements class_3137
   {
      
      protected static const RECT:Rectangle = new Rectangle();
      
      protected static const MAX_DIRTY_REGIONS_PER_WINDOW:int = 3;
      
      protected static const MAX_DISTANCE_BEFORE_COMBINE:int = 10;
       
      
      protected var var_145:Boolean = false;
      
      protected var _disposed:Boolean;
      
      protected var var_2002:com.sulake.core.window.graphics.ISkinContainer;
      
      protected var var_1656:Dictionary;
      
      protected var var_2094:Vector.<class_3127>;
      
      protected var var_2244:Vector.<Array>;
      
      protected var _drawLocation:Point;
      
      protected var _clipRegion:Rectangle;
      
      protected var _dirtyRegion:Rectangle;
      
      protected var _visibleRegion:Rectangle;
      
      public function WindowRenderer(param1:com.sulake.core.window.graphics.ISkinContainer)
      {
         super();
         _disposed = false;
         var_2002 = param1;
         var_1656 = new Dictionary(false);
         var_2094 = new Vector.<class_3127>();
         var_2244 = new Vector.<Array>();
         _drawLocation = new Point();
         _clipRegion = new Rectangle();
         _dirtyRegion = new Rectangle();
         _visibleRegion = new Rectangle();
      }
      
      private static function areRectanglesCloseEnough(param1:Rectangle, param2:Rectangle, param3:uint) : Boolean
      {
         if(param1.intersects(param2))
         {
            return true;
         }
         return (param1.left > param2.left ? param1.left - param2.right : param2.left - param1.right) <= param3 && (param1.top > param2.top ? param1.top - param2.bottom : param2.top - param1.bottom) <= param3;
      }
      
      private static function getDrawLocationAndClipRegion(param1:class_3127, param2:Rectangle, param3:Point, param4:Rectangle) : Boolean
      {
         var _loc6_:int = 0;
         var _loc5_:Boolean = true;
         param4.x = 0;
         param4.y = 0;
         param4.width = param1.renderingWidth;
         param4.height = param1.renderingHeight;
         if(!param1.testParamFlag(16))
         {
            if(param1.parent && param1.testParamFlag(1073741824))
            {
               _loc5_ = childRectToClippedDrawRegion(param1.parent,param3,param4);
               param3.x = param4.x;
               param3.y = param4.y;
            }
            else
            {
               param3.x = 0;
               param3.y = 0;
            }
         }
         else if(param1.parent)
         {
            _loc5_ = childRectToClippedDrawRegion(param1.parent,param3,param4);
         }
         else
         {
            param3.x = 0;
            param3.y = 0;
         }
         if(param2.x > param4.x)
         {
            _loc6_ = param2.x - param4.x;
            param3.x += _loc6_;
            param4.x += _loc6_;
            param4.width -= _loc6_;
         }
         if(param2.y > param4.y)
         {
            _loc6_ = param2.y - param4.y;
            param3.y += _loc6_;
            param4.y += _loc6_;
            param4.height -= _loc6_;
         }
         if(param2.right < param4.right)
         {
            _loc6_ = param4.right - param2.right;
            param4.width -= _loc6_;
         }
         if(param2.bottom < param4.bottom)
         {
            _loc6_ = param4.bottom - param2.bottom;
            param4.height -= _loc6_;
         }
         return _loc5_ && param4.width > 0 && param4.height > 0;
      }
      
      private static function childRectToClippedDrawRegion(param1:class_3127, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param1.testParamFlag(16))
         {
            _loc5_ = param1.renderingX;
            _loc6_ = param1.renderingY;
            param2.offset(_loc5_,_loc6_);
            if(param1.clipping)
            {
               if(param2.x < _loc5_)
               {
                  _loc4_ = _loc5_ - param2.x;
                  param3.x += _loc4_;
                  param3.width -= _loc4_;
                  param2.x = _loc5_;
               }
               if(param2.x < 0)
               {
                  param3.x -= param2.x;
                  param3.width += param2.x;
                  param2.x = 0;
               }
               if(param2.y < _loc6_)
               {
                  _loc4_ = _loc6_ - param2.y;
                  param3.y += _loc4_;
                  param3.height -= _loc4_;
                  param2.y = _loc6_;
               }
               if(param2.y < 0)
               {
                  param3.y -= param2.y;
                  param3.height += param2.y;
                  param2.y = 0;
               }
               if(param2.x + param3.width > _loc5_ + param1.renderingWidth)
               {
                  param3.width -= param2.x + param3.width - (_loc5_ + param1.renderingWidth);
               }
               if(param2.y + param3.height > _loc6_ + param1.renderingHeight)
               {
                  param3.height -= param2.y + param3.height - (_loc6_ + param1.renderingHeight);
               }
            }
            if(param1.parent)
            {
               childRectToClippedDrawRegion(param1.parent,param2,param3);
            }
         }
         else if(param1.clipping)
         {
            if(param2.x < 0)
            {
               _loc4_ = param2.x;
               param3.x -= _loc4_;
               param3.width += _loc4_;
               param2.x = 0;
            }
            if(param2.y < 0)
            {
               _loc4_ = param2.y;
               param3.y -= _loc4_;
               param3.height += _loc4_;
               param2.y = 0;
            }
         }
         return param3.width > 0 && param3.height > 0;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set debug(param1:Boolean) : void
      {
         var_145 = param1;
      }
      
      public function get debug() : Boolean
      {
         return var_145;
      }
      
      public function dispose() : void
      {
         var _loc1_:WindowRendererItem = null;
         if(!_disposed)
         {
            _disposed = true;
            for(var _loc2_ in var_1656)
            {
               _loc1_ = var_1656[_loc2_] as WindowRendererItem;
               _loc1_.dispose();
               delete var_1656[_loc2_];
            }
            var_1656 = null;
            var_2094 = null;
            var_2244 = null;
         }
      }
      
      public function purge(param1:class_3127 = null, param2:Boolean = true) : void
      {
         var _loc3_:WindowRendererItem = null;
         var _loc5_:class_3179 = null;
         var _loc4_:* = undefined;
         if(param1)
         {
            if(!param1.visible || !param2)
            {
               _loc3_ = var_1656[param1];
               if(_loc3_)
               {
                  _loc3_.dispose();
                  delete var_1656[param1];
               }
               param2 = false;
            }
            if(_loc5_ = param1 as class_3179)
            {
               for each(param1 in _loc5_.children)
               {
                  purge(param1,param2);
               }
            }
         }
         else
         {
            _loc4_ = new Vector.<class_3127>();
            for(var _loc6_ in var_1656)
            {
               param1 = _loc6_ as class_3127;
               if(!param1.visible || !param2 || param1.parent == null && !(param1 is class_3234))
               {
                  _loc4_.push(param1);
               }
            }
            while(_loc4_.length)
            {
               purge(_loc4_.pop(),param2);
            }
         }
      }
      
      public function addToRenderQueue(param1:class_3127, param2:Rectangle, param3:uint) : void
      {
         var _loc8_:int = 0;
         var _loc12_:int = 0;
         var _loc4_:class_3127 = null;
         var _loc5_:Array = null;
         var _loc10_:int = 0;
         var _loc6_:Rectangle = null;
         var _loc11_:Rectangle = null;
         if(!param2)
         {
            param2 = _dirtyRegion;
            _dirtyRegion.x = 0;
            _dirtyRegion.y = 0;
            _dirtyRegion.width = param1.renderingWidth;
            _dirtyRegion.height = param1.renderingHeight;
         }
         else
         {
            _dirtyRegion.x = param2.x;
            _dirtyRegion.y = param2.y;
            _dirtyRegion.width = param2.width;
            _dirtyRegion.height = param2.height;
         }
         if(param2.isEmpty())
         {
            return;
         }
         if(getWindowRendererItem(param1).invalidate(param1,param3))
         {
            if(param1.testParamFlag(16) || param1.testParamFlag(1073741824))
            {
               var _loc7_:class_3234 = param1.context.getDesktopWindow();
               do
               {
                  if((_loc4_ = param1.parent) == null)
                  {
                     return;
                  }
                  if(_loc4_ == _loc7_)
                  {
                     break;
                  }
                  if(!_loc4_.visible)
                  {
                     return;
                  }
                  _loc8_ = _loc4_.renderingWidth;
                  _loc12_ = _loc4_.renderingHeight;
                  _dirtyRegion.offset(param1.renderingX,param1.renderingY);
                  if(_loc4_.clipping)
                  {
                     if(_dirtyRegion.x > _loc8_ || _dirtyRegion.y > _loc12_ || false || false)
                     {
                        return;
                     }
                     if(false)
                     {
                        _dirtyRegion.width = NaN;
                        _dirtyRegion.x = 0;
                     }
                     if(false)
                     {
                        _dirtyRegion.height = NaN;
                        _dirtyRegion.y = 0;
                     }
                     if(_dirtyRegion.right > _loc8_)
                     {
                        _dirtyRegion.right = _loc8_;
                     }
                     if(_dirtyRegion.bottom > _loc12_)
                     {
                        _dirtyRegion.bottom = _loc12_;
                     }
                  }
                  if(_dirtyRegion.isEmpty())
                  {
                     return;
                  }
                  param1 = _loc4_;
               }
               while(!(!param1.testParamFlag(16) && !param1.testParamFlag(1073741824)));
               
            }
            getWindowRendererItem(param1).invalidate(param1,32);
            if((_loc10_ = var_2094.indexOf(param1)) > -1)
            {
               _loc5_ = var_2244[_loc10_];
               _loc11_ = _dirtyRegion;
               var _loc9_:int;
               if((_loc9_ = int(_loc5_.length)) > 3)
               {
                  _loc11_ = _loc11_.union(_loc5_.pop());
                  _loc9_--;
               }
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  if(((_loc6_ = _loc5_[_loc10_++]).left > _loc11_.left ? _loc6_.left - _loc11_.right : _loc11_.left - _loc6_.right) <= 10 && (_loc6_.top > _loc11_.top ? _loc6_.top - _loc11_.bottom : _loc11_.top - _loc6_.bottom) <= 10)
                  {
                     _loc5_.splice(_loc10_ - 1,1);
                     _loc11_ = _loc11_.union(_loc6_);
                     _loc9_--;
                     _loc10_ = 0;
                  }
               }
               _loc5_.push(_loc11_ == _dirtyRegion ? _loc11_.clone() : _loc11_);
            }
            else
            {
               var_2094.push(param1);
               var_2244.push([_dirtyRegion.clone()]);
            }
         }
      }
      
      public function flushRenderQueue() : void
      {
         if(false || false)
         {
            var_2094.splice(0,var_2094.length);
            var_2244.splice(0,var_2244.length);
         }
      }
      
      public function invalidate(param1:class_3178, param2:Rectangle) : void
      {
         var _loc5_:class_3127 = null;
         var _loc4_:class_3234 = null;
         var _loc3_:uint = uint((_loc4_ = param1.getDesktopWindow()).numChildren);
         while(_loc3_-- > 0)
         {
            _loc5_ = _loc4_.getChildAt(_loc3_);
            addToRenderQueue(_loc5_,null,1);
         }
      }
      
      protected function getWindowRendererItem(param1:class_3127) : WindowRendererItem
      {
         var _loc2_:WindowRendererItem = var_1656[param1] as WindowRendererItem;
         if(_loc2_ == null)
         {
            registerRenderable(param1);
            _loc2_ = var_1656[param1];
         }
         return _loc2_;
      }
      
      public function registerRenderable(param1:class_3127) : void
      {
         var _loc2_:WindowRendererItem = var_1656[param1] as WindowRendererItem;
         if(_loc2_ == null)
         {
            _loc2_ = new WindowRendererItem(var_2002);
            var_1656[param1] = _loc2_;
            param1.addEventListener("WINDOW_DISPOSE_EVENT",windowDisposedCallback);
         }
      }
      
      public function removeRenderable(param1:class_3127) : void
      {
         param1.removeEventListener("WINDOW_DISPOSE_EVENT",windowDisposedCallback);
         var _loc2_:WindowRendererItem = var_1656[param1] as WindowRendererItem;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            delete var_1656[param1];
         }
      }
      
      protected function windowDisposedCallback(param1:WindowDisposeEvent) : void
      {
         removeRenderable(param1.window);
      }
      
      public function getDrawBufferForRenderable(param1:class_3127) : BitmapData
      {
         var _loc2_:Rectangle = null;
         var _loc4_:TrackedBitmapData = null;
         var _loc3_:WindowRendererItem = var_1656[param1] as WindowRendererItem;
         if(!_loc3_)
         {
            _loc2_ = new Rectangle(0,0,param1.renderingWidth,param1.renderingHeight);
            _loc4_ = new TrackedBitmapData(this,param1.renderingWidth,param1.renderingHeight);
            _loc3_ = new WindowRendererItem(var_2002);
            _loc3_.invalidate(param1,1);
            _loc3_.render(param1,new Point(),_loc2_,param1.renderingRectangle,_loc4_);
            _loc4_.dispose();
            var_1656[param1] = _loc3_;
         }
         return _loc3_ != null ? _loc3_.buffer : null;
      }
      
      public function render() : void
      {
         var _loc1_:* = null;
         var _loc2_:Array = null;
         var _loc4_:BitmapData = null;
         var _loc5_:class_3127 = null;
         var _loc3_:Number = 0;
         while(_loc3_-- > 0)
         {
            _loc5_ = var_2094.pop();
            _loc2_ = var_2244.pop();
            if(!_loc5_.disposed)
            {
               _loc4_ = _loc5_.fetchDrawBuffer() as BitmapData;
               for each(_loc1_ in _loc2_)
               {
                  _visibleRegion.x = _loc5_.renderingX;
                  _visibleRegion.y = _loc5_.renderingY;
                  _visibleRegion.width = _loc5_.renderingWidth;
                  _visibleRegion.height = _loc5_.renderingHeight;
                  renderWindowBranch(_loc5_,_loc1_,_visibleRegion,_loc4_);
               }
            }
         }
      }
      
      private function renderWindowBranch(param1:class_3127, param2:Rectangle, param3:Rectangle, param4:BitmapData) : void
      {
         var _loc8_:* = null;
         var _loc6_:IGraphicContextHost = null;
         var _loc5_:* = undefined;
         var _loc7_:IGraphicContext;
         if(_loc7_ = IGraphicContextHost(param1).getGraphicContext(false))
         {
            _loc7_.visible = param1.visible;
         }
         if(param1.visible)
         {
            _drawLocation.x = param1.renderingX;
            _drawLocation.y = param1.renderingY;
            if(getDrawLocationAndClipRegion(param1,param2,_drawLocation,_clipRegion))
            {
               if(param1.clipping)
               {
                  param3 = param3.intersection(param1.renderingRectangle);
               }
               param3.offset(-param1.x,-param1.y);
               param4 = getWindowRendererItem(param1).render(param1,_drawLocation,_clipRegion,param3,param4);
               if(!(param1 is class_3179))
               {
                  return;
               }
               if(!(_loc5_ = class_3179(param1).children))
               {
                  return;
               }
               if(param1.clipping)
               {
                  param2 = param2.clone();
                  if(param2.x < 0)
                  {
                     param2.width += param2.x;
                     param2.x = 0;
                  }
                  if(param2.y < 0)
                  {
                     param2.height += param2.y;
                     param2.y = 0;
                  }
                  if(param2.width > param1.width)
                  {
                     param2.width = param1.renderingWidth;
                  }
                  if(param2.height > param1.height)
                  {
                     param2.height = param1.renderingHeight;
                  }
               }
               for each(_loc8_ in _loc5_)
               {
                  RECT.x = _loc8_.x;
                  RECT.y = _loc8_.y;
                  RECT.width = _loc8_.width;
                  RECT.height = _loc8_.height;
                  if(RECT.intersects(param2))
                  {
                     if(_loc8_.testParamFlag(16))
                     {
                        param2.offset(-_loc8_.x,-_loc8_.y);
                        renderWindowBranch(_loc8_,param2,param3,param4);
                        param2.offset(_loc8_.x,_loc8_.y);
                     }
                     else if(_loc8_.testParamFlag(1073741824))
                     {
                        param2.offset(-_loc8_.x,-_loc8_.y);
                        renderWindowBranch(_loc8_,param2,param3,_loc8_.fetchDrawBuffer() as BitmapData);
                        param2.offset(_loc8_.x,_loc8_.y);
                     }
                     else if(_loc8_.visible)
                     {
                        if((_loc6_ = IGraphicContextHost(_loc8_)).hasGraphicsContext())
                        {
                           _loc6_.getGraphicContext(true).visible = true;
                        }
                     }
                  }
                  else if(!RECT.intersects(param3))
                  {
                     if((_loc6_ = IGraphicContextHost(_loc8_)).hasGraphicsContext())
                     {
                        _loc6_.getGraphicContext(true).visible = false;
                     }
                  }
               }
               param3.offset(param1.renderingX,param1.renderingY);
            }
            else if(!param1.testParamFlag(16))
            {
               if(param1.testParamFlag(1073741824))
               {
                  if(!_loc7_)
                  {
                     _loc7_ = IGraphicContextHost(param1).getGraphicContext(true);
                  }
                  _loc7_.setDrawRegion(param1.renderingRectangle,false,_clipRegion);
                  _loc7_.visible = false;
               }
            }
         }
      }
   }
}
