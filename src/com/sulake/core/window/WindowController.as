package com.sulake.core.window
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.dynamicstyle.DynamicStyle;
   import com.sulake.core.window.dynamicstyle.class_3374;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import com.sulake.core.window.events.WindowEventDispatcher;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.services.IMouseListenerService;
   import com.sulake.core.window.theme.class_3302;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.WindowRectLimits;
   import com.sulake.core.window.utils.class_3179;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class WindowController extends WindowModel implements com.sulake.core.window.class_3127, IGraphicContextHost, class_3179
   {
      
      private static var var_4083:uint = 0;
      
      private static const const_409:Rectangle = new Rectangle();
      
      public static const TAG_EXCLUDE:String = "_EXCLUDE";
      
      public static const TAG_INTERNAL:String = "_INTERNAL";
      
      public static const TAG_COLORIZE:String = "_COLORIZE";
      
      public static const TAG_IGNORE_INHERITED_STYLE:String = "_IGNORE_INHERITED_STYLE";
      
      private static const _POINT_ZERO:Point = new Point();
       
      
      protected var name_1:WindowEventDispatcher;
      
      protected var var_1447:IGraphicContext;
      
      protected var var_2090:Function;
      
      protected var var_1634:Boolean = true;
      
      protected var _parent:com.sulake.core.window.WindowController;
      
      protected var _children:Vector.<com.sulake.core.window.class_3127>;
      
      protected var var_145:Boolean = false;
      
      protected var var_1940:WindowRectLimits;
      
      protected var var_2757:Boolean = false;
      
      private var var_2685:DynamicStyle;
      
      private var var_2772:Boolean = false;
      
      private var var_1894:Rectangle;
      
      private var var_3913:uint;
      
      private var var_3154:class_3302;
      
      public function WindowController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:com.sulake.core.window.class_3127, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0, param12:String = "")
      {
         var _loc13_:* = 0;
         var_3913 = var_4083++;
         var _loc14_:XML = param5.getWindowFactory().getLayoutByTypeAndStyle(param2,param3);
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,!!_loc14_ ? int(_loc14_.attribute("width")) : 10,!!_loc14_ ? int(_loc14_.attribute("height")) : 10);
         }
         var_3154 = param5.getWindowFactory().getThemeManager().getPropertyDefaults(param3);
         super(param11,param1,param2,param3,param4,param5,param6,param10,param12);
         if(!var_1447)
         {
            var_1447 = getGraphicContext(!testParamFlag(16));
         }
         var_1894 = new Rectangle();
         if(_loc14_ != null)
         {
            var_1734 = new Rectangle(0,0,int(_loc14_.attribute("width")),int(_loc14_.attribute("height")));
            var_1462 = var_1734.clone();
            var_29 = var_1734.x;
            var_28 = var_1734.y;
            var_1436 = var_1734.width;
            var_1441 = var_1734.height;
            param5.getWindowParser().parseAndConstruct(_loc14_,this,null);
            _loc13_ = var_894;
            var_894 &= -12582913;
            setRectangle(param6.x,param6.y,param6.width,param6.height);
            var_894 = _loc13_;
            var_1462.x = param6.x;
            var_1462.y = param6.y;
            var_1462.width = param6.width;
            var_1462.height = param6.height;
         }
         var _loc15_:DefaultAttStruct;
         if(_loc15_ = param5.getWindowFactory().getDefaultsByTypeAndStyle(param2,param3))
         {
            var_2092 = _loc15_.blend;
            var_2186 = _loc15_.threshold;
            if(_background != _loc15_.background)
            {
               background = _loc15_.background;
            }
            if(_fillColor != _loc15_.color)
            {
               color = _loc15_.color;
            }
            if(_loc15_.hasRectLimits())
            {
               WindowRectLimits(limits).assign(_loc15_.width_min,_loc15_.width_max,_loc15_.height_min,_loc15_.height_max);
            }
         }
         if(param9)
         {
            this.properties = param9;
         }
         var_2090 = param8;
         if(param7 != null)
         {
            _parent = param7 as com.sulake.core.window.WindowController;
            com.sulake.core.window.WindowController(param7).addChild(this);
            if(var_1447)
            {
               _context.invalidate(this,null,1);
            }
         }
      }
      
      private static function calculateMouseRegion(param1:com.sulake.core.window.WindowController, param2:Rectangle) : void
      {
         var _loc7_:int = 0;
         var _loc3_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc3_);
         var _loc5_:int = param1.numChildren;
         var _loc4_:int = _loc3_.x;
         var _loc6_:int = _loc3_.y;
         param2.left = _loc4_ < param2.left ? _loc4_ : param2.left;
         param2.top = _loc6_ < param2.top ? _loc6_ : param2.top;
         param2.right = _loc3_.right > param2.right ? _loc3_.right : param2.right;
         param2.bottom = _loc3_.bottom > param2.bottom ? _loc3_.bottom : param2.bottom;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            com.sulake.core.window.WindowController.calculateMouseRegion(param1.getChildAt(_loc7_) as com.sulake.core.window.WindowController,param2);
            _loc7_++;
         }
      }
      
      public static function expandToAccommodateChild(param1:com.sulake.core.window.WindowController, param2:com.sulake.core.window.class_3127) : void
      {
         var _loc6_:* = 0;
         var _loc9_:* = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc10_:int = param1.width;
         var _loc5_:int = param1.height;
         var _loc8_:Boolean = false;
         if(param2.x < 0)
         {
            _loc4_ = param2.x;
            _loc10_ -= _loc4_;
            param2.x = 0;
            _loc8_ = true;
         }
         if(param2.right > _loc10_)
         {
            _loc10_ = param2.x + param2.width;
            _loc8_ = true;
         }
         if(param2.y < 0)
         {
            _loc3_ = param2.y;
            _loc5_ -= _loc3_;
            param2.y = 0;
            _loc8_ = true;
         }
         if(param2.bottom > _loc5_)
         {
            _loc5_ = param2.y + param2.height;
            _loc8_ = true;
         }
         if(_loc8_)
         {
            if(_loc6_ = uint(param1.param & 147456))
            {
               param1.setParamFlag(_loc6_,false);
            }
            param1.setRectangle(param1.x + _loc4_,param1.y + _loc3_,_loc10_,_loc5_);
            if(_loc3_ != 0 || _loc4_ != 0)
            {
               var _loc7_:uint = uint(param1.numChildren);
               _loc9_ = 0;
               while(_loc9_ < _loc7_)
               {
                  com.sulake.core.window.class_3127(param1.getChildAt(_loc9_)).offset(-_loc4_,-_loc3_);
                  _loc9_++;
               }
            }
            if(_loc6_)
            {
               param1.setParamFlag(_loc6_,true);
            }
         }
      }
      
      public static function resizeToAccommodateChildren(param1:com.sulake.core.window.WindowController) : void
      {
         var _loc11_:com.sulake.core.window.class_3127 = null;
         var _loc9_:* = 0;
         var _loc7_:* = 0;
         var _loc5_:int = -2147483648;
         var _loc10_:int = -2147483648;
         var _loc8_:Boolean = false;
         var _loc6_:uint = uint(param1.numChildren);
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            if((_loc11_ = param1.getChildAt(_loc9_)).x + _loc11_.width > _loc5_)
            {
               _loc5_ = _loc11_.x + _loc11_.width;
               _loc8_ = true;
            }
            if(_loc11_.y + _loc11_.height > _loc10_)
            {
               _loc10_ = _loc11_.y + _loc11_.height;
               _loc8_ = true;
            }
            _loc9_++;
         }
         if(_loc8_)
         {
            if(_loc7_ = uint(param1.param & 147456))
            {
               param1.setParamFlag(_loc7_,false);
            }
            param1.width = _loc5_;
            param1.height = _loc10_;
            if(_loc7_)
            {
               param1.setParamFlag(_loc7_,true);
            }
         }
      }
      
      public function get properties() : Array
      {
         return [];
      }
      
      public function get procedure() : Function
      {
         return var_2090 != null ? var_2090 : (_parent != null ? _parent.procedure : nullEventProc);
      }
      
      public function get filters() : Array
      {
         return hasGraphicsContext() ? getGraphicContext(true).filters : [];
      }
      
      public function get parent() : com.sulake.core.window.class_3127
      {
         return _parent;
      }
      
      public function get debug() : Boolean
      {
         return var_145;
      }
      
      public function get limits() : IRectLimiter
      {
         return !!var_1940 ? var_1940 : (var_1940 = new WindowRectLimits(this));
      }
      
      public function get immediateClickMode() : Boolean
      {
         return var_2757;
      }
      
      public function set x(param1:int) : void
      {
         if(param1 != var_29)
         {
            setRectangle(param1,var_28,var_1436,var_1441);
         }
      }
      
      public function set y(param1:int) : void
      {
         if(param1 != var_28)
         {
            setRectangle(var_29,param1,var_1436,var_1441);
         }
      }
      
      public function set id(param1:int) : void
      {
         var_247 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set width(param1:int) : void
      {
         if(param1 != var_1436)
         {
            setRectangle(var_29,var_28,param1,var_1441);
         }
      }
      
      public function set height(param1:int) : void
      {
         if(param1 != var_1441)
         {
            setRectangle(var_29,var_28,var_1436,param1);
         }
      }
      
      public function set position(param1:Point) : void
      {
         setRectangle(param1.x,param1.y,var_1436,var_1441);
      }
      
      public function set rectangle(param1:Rectangle) : void
      {
         setRectangle(param1.x,param1.y,param1.width,param1.height);
      }
      
      public function set background(param1:Boolean) : void
      {
         _background = param1;
         _fillColor = _background ? _fillColor | _alphaColor : _fillColor & 16777215;
         var_1634 ||= param1;
         _context.invalidate(this,null,1);
      }
      
      public function set color(param1:uint) : void
      {
         _alphaColor = param1 & 4278190080;
         _fillColor = _background ? param1 : param1 & 16777215;
         _context.invalidate(this,null,1);
      }
      
      public function set alpha(param1:uint) : void
      {
         _alphaColor = param1 << 24;
         _fillColor = _background ? _alphaColor | _fillColor : 16777215 & _fillColor;
         _context.invalidate(this,null,1);
      }
      
      public function set blend(param1:Number) : void
      {
         param1 = param1 > 1 ? 1 : (param1 < 0 ? 0 : param1);
         if(param1 != var_2092)
         {
            var_2092 = param1;
            _context.invalidate(this,null,16);
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:class_3134 = null;
         if(param1 != var_805)
         {
            var_805 = param1;
            if(var_1447 && !param1)
            {
               var_1447.visible = false;
            }
            _context.invalidate(this,null,1);
            _loc2_ = class_3134.allocate("WE_CHILD_VISIBILITY",this,this);
            update(this,_loc2_);
            _loc2_.recycle();
         }
      }
      
      public function set type(param1:uint) : void
      {
         if(param1 != var_271)
         {
            var_271 = param1;
            _context.invalidate(this,null,1);
         }
      }
      
      public function set caption(param1:String) : void
      {
         param1 = !!param1 ? param1 : "";
         if(param1 != caption)
         {
            _caption = param1;
            _context.invalidate(this,null,1);
         }
      }
      
      public function set tags(param1:Array) : void
      {
         if(param1 != null)
         {
            var_239 = param1;
         }
      }
      
      public function set mouseThreshold(param1:uint) : void
      {
         var_2186 = param1 > 255 ? 255 : param1;
      }
      
      public function set procedure(param1:Function) : void
      {
         var_2090 = param1;
      }
      
      public function set filters(param1:Array) : void
      {
         if(hasGraphicsContext())
         {
            getGraphicContext(true).filters = param1;
         }
      }
      
      public function set debug(param1:Boolean) : void
      {
         var_145 = param1;
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function set offsetX(param1:int) : void
      {
         _offsetX = param1;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offsetY = param1;
      }
      
      public function set etching(param1:Array) : void
      {
      }
      
      public function set state(param1:uint) : void
      {
         if(param1 != var_159)
         {
            var_159 = param1;
            _context.invalidate(this,null,8);
         }
      }
      
      public function set dynamicStyleColor(param1:ColorTransform) : void
      {
         var_3582 = param1;
      }
      
      public function get dynamicStyleColor() : ColorTransform
      {
         return var_3582;
      }
      
      public function set style(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:com.sulake.core.window.WindowController = null;
         var _loc4_:* = 0;
         if(param1 != _style)
         {
            _style = param1;
            _loc2_ = [];
            groupChildrenWithTag("_INTERNAL",_loc2_);
            _loc4_ = _loc2_.length;
            while(--_loc4_ > -1)
            {
               _loc3_ = _loc2_[_loc4_] as com.sulake.core.window.WindowController;
               if(_loc3_.tags.indexOf("_IGNORE_INHERITED_STYLE") == -1)
               {
                  _loc3_.style = _style;
               }
            }
            _context.invalidate(this,null,1);
            var_3154 = _context.getWindowFactory().getThemeManager().getPropertyDefaults(_style);
         }
      }
      
      public function set dynamicStyle(param1:String) : void
      {
         var_2393 = param1;
         _context.invalidate(this,null,1);
      }
      
      public function set clipping(param1:Boolean) : void
      {
         if(param1 != var_2662)
         {
            var_2662 = param1;
            _context.invalidate(this,null,1);
         }
      }
      
      public function get host() : com.sulake.core.window.class_3127
      {
         return _parent == desktop ? this : _parent.host;
      }
      
      public function get desktop() : class_3234
      {
         return _context.getDesktopWindow();
      }
      
      public function set parent(param1:com.sulake.core.window.class_3127) : void
      {
         var _loc3_:class_3134 = null;
         if(param1 == this)
         {
            throw new Error("Attempted to assign self as parent!");
         }
         if(param1 != null && param1.context != _context)
         {
            _context = WindowContext(param1.context);
            if(_children)
            {
               for each(var _loc4_ in _children)
               {
                  _loc4_.parent = this;
               }
            }
         }
         var _loc2_:com.sulake.core.window.class_3127 = _parent;
         if(_parent != param1)
         {
            if(_parent != null)
            {
               _parent.removeChild(this);
            }
            _parent = com.sulake.core.window.WindowController(param1);
            if(_parent != null)
            {
               var_1894 = _parent.rectangle;
               var_1462.x = var_29;
               var_1462.y = var_28;
               var_1462.width = var_1436;
               var_1462.height = var_1441;
               _loc3_ = class_3134.allocate("WE_PARENT_ADDED",this,_parent);
               update(this,_loc3_);
            }
            else
            {
               var_1894.x = 0;
               var_1894.y = 0;
               var_1894.width = 0;
               var_1894.height = 0;
               _loc3_ = class_3134.allocate("WE_PARENT_REMOVED",this,_loc2_);
               update(this,_loc3_);
            }
            _loc3_.recycle();
         }
      }
      
      public function hasGraphicsContext() : Boolean
      {
         return var_1447 != null || !testParamFlag(16);
      }
      
      public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_1447)
         {
            var_1447 = new GraphicContext("GC {" + _name + "}",1,new Rectangle(var_29,var_28,var_1436,var_1441));
            var_1447.visible = var_805;
         }
         return var_1447;
      }
      
      public function setupGraphicsContext() : IGraphicContext
      {
         var _loc1_:int = 0;
         var_1447 = getGraphicContext(true);
         if(_parent)
         {
            _parent.setupGraphicsContext();
         }
         if(_children && false)
         {
            if(var_1447.numChildContexts != numChildren)
            {
               _loc1_ = 0;
               for each(var _loc2_ in _children)
               {
                  var_1447.addChildContextAt(_loc2_.getGraphicContext(true),_loc1_++);
               }
            }
         }
         var_2772 = true;
         return var_1447;
      }
      
      public function releaseGraphicsContext() : void
      {
         var_2772 = false;
         if(!var_1447)
         {
         }
      }
      
      public function clone() : com.sulake.core.window.class_3127
      {
         var _loc2_:Class = Object(this).constructor;
         var _loc1_:com.sulake.core.window.WindowController = new _loc2_(_name,var_271,_style,var_894,_context,new Rectangle(var_29,var_28,var_1436,var_1441),null,var_2090,properties,!!var_239 ? var_239.concat() : null,var_247) as com.sulake.core.window.WindowController;
         _loc1_.dynamicStyle = var_2393;
         _loc1_.var_2186 = var_2186;
         _loc1_.var_1634 = var_1634;
         _loc1_.var_145 = var_145;
         _loc1_.var_1894 = var_1894.clone();
         _loc1_.var_29 = var_29;
         _loc1_.var_28 = var_28;
         _loc1_.var_1436 = var_1436;
         _loc1_.var_1441 = var_1441;
         _loc1_.var_1734 = var_1734.clone();
         _loc1_.var_1462 = var_1462.clone();
         _loc1_.var_1626 = !!var_1626 ? var_1626.clone() : null;
         _loc1_.var_1604 = !!var_1604 ? var_1604.clone() : null;
         _loc1_.var_1940 = !!var_1940 ? var_1940.clone(_loc1_) : null;
         _loc1_._context = _context;
         _loc1_._fillColor = _fillColor;
         _loc1_._alphaColor = _alphaColor;
         _loc1_.clipping = var_2662;
         _loc1_.var_805 = var_805;
         _loc1_.var_2092 = var_2092;
         _loc1_.var_894 = var_894;
         _loc1_.var_159 = var_159;
         _loc1_._name = _name;
         _loc1_.var_247 = var_247;
         _loc1_.caption = _caption;
         _loc1_.background = _background;
         cloneChildWindows(_loc1_);
         return _loc1_;
      }
      
      protected function cloneChildWindows(param1:com.sulake.core.window.WindowController) : void
      {
         var _loc2_:* = null;
         if(_children)
         {
            for each(_loc2_ in _children)
            {
               if(_loc2_.tags.indexOf("_EXCLUDE") == -1)
               {
                  param1.addChild(_loc2_.clone());
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:WindowDisposeEvent = null;
         if(!_disposed)
         {
            immediateClickMode = false;
            var_2090 = null;
            if(true)
            {
               if(!isChildWindow())
               {
                  if(getStateFlag(1))
                  {
                     deactivate();
                  }
               }
            }
            if(_children)
            {
               while(false)
               {
                  class_13(_children.pop()).dispose();
               }
            }
            _children = null;
            if(parent)
            {
               parent = null;
            }
            if(name_1)
            {
               _loc1_ = WindowDisposeEvent.allocate(this);
               name_1.dispatchEvent(_loc1_);
               _loc1_.recycle();
               if(name_1 is class_13)
               {
                  class_13(name_1).dispose();
                  name_1 = null;
               }
            }
            if(var_1447 != null)
            {
               var_1447.dispose();
               var_1447 = null;
            }
            super.dispose();
         }
      }
      
      public function toString() : String
      {
         return "[Window " + getQualifiedClassName(this) + " " + _name + " " + var_3913 + "]";
      }
      
      override public function invalidate(param1:Rectangle = null) : void
      {
         _context.invalidate(this,param1,1);
      }
      
      public function resolve() : uint
      {
         return 0;
      }
      
      public function center() : void
      {
         if(_parent != null)
         {
            x = 0 - var_1436 / 2;
            y = 0 - var_1441 / 2;
         }
      }
      
      public function setRectangle(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = 0;
         var _loc8_:class_3134 = null;
         if(var_1940)
         {
            param4 = Math.max(var_1940.minHeight,param4);
            param4 = Math.min(var_1940.maxHeight,param4);
            param3 = Math.max(var_1940.minWidth,param3);
            param3 = Math.min(var_1940.maxWidth,param3);
         }
         var _loc5_:Boolean = param1 != var_29 || param2 != var_28;
         var _loc6_:Boolean;
         if((_loc6_ = param3 != var_1436 || param4 != var_1441) && !_loc5_)
         {
            if((_loc7_ = uint(var_894 & 786432)) == 786432)
            {
               param1 -= (param3 - var_1436) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == 262144)
            {
               param1 -= param3 - var_1436;
               _loc5_ = true;
            }
            if((_loc7_ = uint(var_894 & 3145728)) == 3145728)
            {
               param2 -= (param4 - var_1441) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == 1048576)
            {
               param2 -= param4 - var_1441;
               _loc5_ = true;
            }
         }
         if(testParamFlag(32))
         {
            if(_parent != null)
            {
               param1 = int(param1 < 0 ? 0 : param1);
               param2 = int(param2 < 0 ? 0 : param2);
               if(_loc5_)
               {
                  param1 -= param1 + param3 > _parent.width ? param1 + param3 - 0 : 0;
                  param2 -= param2 + param4 > _parent.height ? param2 + param4 - 0 : 0;
                  _loc5_ = param1 != var_29 || param2 != var_28;
               }
               else
               {
                  param3 -= param1 + param3 > _parent.width ? param1 + param3 - 0 : 0;
                  param4 -= param2 + param4 > _parent.height ? param2 + param4 - 0 : 0;
                  _loc6_ = param3 != var_1436 || param4 != var_1441;
               }
            }
         }
         if(_loc5_ || _loc6_)
         {
            if(_loc5_)
            {
               _loc8_ = class_3134.allocate("WE_RELOCATE",this,null,true);
               update(this,_loc8_);
               if(_loc8_.isWindowOperationPrevented())
               {
                  _loc5_ = false;
               }
               _loc8_.recycle();
            }
            if(_loc6_)
            {
               _loc8_ = class_3134.allocate("WE_RESIZE",this,null,true);
               update(this,_loc8_);
               if(_loc8_.isWindowOperationPrevented())
               {
                  _loc6_ = false;
               }
               _loc8_.recycle();
            }
            if(_loc5_)
            {
               var_1462.x = var_29;
               var_1462.y = var_28;
               var_1462.width = var_1436;
               var_1462.height = var_1441;
               var_29 = param1;
               var_28 = param2;
            }
            if(_loc6_)
            {
               var_1462.width = var_1436;
               var_1462.height = var_1441;
               var_1436 = param3;
               var_1441 = param4;
            }
            if(_loc5_)
            {
               _loc8_ = class_3134.allocate("WE_RELOCATED",this,null);
               update(this,_loc8_);
               _loc8_.recycle();
            }
            if(_loc6_)
            {
               _loc8_ = class_3134.allocate("WE_RESIZED",this,null);
               update(this,_loc8_);
               _loc8_.recycle();
            }
         }
      }
      
      public function getRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null, param4:Rectangle = null) : void
      {
         if(param1 != null)
         {
            param1.x = var_29;
            param1.y = var_28;
            param1.width = var_1436;
            param1.height = var_1441;
         }
         if(param2 != null)
         {
            param2.x = var_1462.x;
            param2.y = var_1462.y;
            param2.width = var_1462.width;
            param2.height = var_1462.height;
         }
         if(param3 != null && var_1626 != null)
         {
            param3.x = var_1626.x;
            param3.y = var_1626.y;
            param3.width = var_1626.width;
            param3.height = var_1626.height;
         }
         if(param4 != null && var_1604 != null)
         {
            param4.x = var_1604.x;
            param4.y = var_1604.y;
            param4.width = var_1604.width;
            param4.height = var_1604.height;
         }
      }
      
      public function setRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null) : void
      {
         if(param3 != null)
         {
            if(param3.width < 0 || param3.height < 0)
            {
               throw new Error("Invalid rectangle; maximized size can\'t be less than zero!");
            }
            if(var_1604 == null)
            {
               var_1604 = new Rectangle();
            }
            var_1604.x = param3.x;
            var_1604.y = param3.y;
            var_1604.width = param3.width;
            var_1604.height = param3.height;
         }
         if(param2 != null)
         {
            if(param2.width < 0 || param2.height < 0)
            {
               throw new Error("Invalid rectangle; minimized size can\'t be less than zero!");
            }
            if(var_1626 == null)
            {
               var_1626 = new Rectangle();
            }
            var_1626.x = param2.x;
            var_1626.y = param2.y;
            var_1626.width = param2.width;
            var_1626.height = param2.height;
         }
         if(param3.width < param2.width || param3.height < param2.height)
         {
            param3.width = param2.width;
            param3.height = param2.height;
            throw new Error("Maximized rectangle can\'t be smaller than minimized rectangle!");
         }
         if(param1 != null)
         {
            setRectangle(param1.x,param1.y,param1.width,param1.height);
         }
      }
      
      public function buildFromXML(param1:XML, param2:class_24 = null) : Boolean
      {
         return _context.getWindowParser().parseAndConstruct(param1,this,param2) != null;
      }
      
      public function fetchDrawBuffer() : IBitmapDrawable
      {
         return !testParamFlag(16) ? getGraphicContext(true).fetchDrawBuffer() : (_parent != null ? _parent.fetchDrawBuffer() : null);
      }
      
      public function getDrawRegion(param1:Rectangle) : void
      {
         if(!testParamFlag(16))
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = var_1436;
            param1.height = var_1441;
         }
         else if(_parent != null)
         {
            _parent.getDrawRegion(param1);
            param1.x += var_29;
            param1.y += var_28;
            param1.width = var_1436;
            param1.height = var_1441;
         }
         else
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = 0;
            param1.height = 0;
         }
      }
      
      public function update(param1:com.sulake.core.window.WindowController, param2:class_3134) : Boolean
      {
         var _loc5_:IMouseListenerService = null;
         var _loc6_:com.sulake.core.window.class_3127 = null;
         var _loc4_:class_3134 = null;
         var _loc3_:* = 0;
         if(!testParamFlag(9))
         {
            procedure(param2,this);
            if(_disposed)
            {
               return true;
            }
            if(!param2.isWindowOperationPrevented())
            {
               if(hasEventListener(param2.type))
               {
                  name_1.dispatchEvent(param2);
                  if(_disposed)
                  {
                     return true;
                  }
               }
            }
            if(param2.cancelable)
            {
               if(param2.isWindowOperationPrevented())
               {
                  return true;
               }
            }
         }
         if(param2 is WindowMouseEvent)
         {
            loop2:
            switch(param2.type)
            {
               case "WME_DOWN":
                  if(activate())
                  {
                     if(param2.cancelable)
                     {
                        param2.preventDefault();
                     }
                  }
                  if(disposed)
                  {
                     return true;
                  }
                  setStateFlag(16,true);
                  (_loc5_ = _context.getWindowServices().getMouseListenerService()).begin(this);
                  _loc5_.eventTypes.push("WME_UP");
                  _loc5_.areaLimit = 3;
                  if(testParamFlag(257))
                  {
                     _loc6_ = this;
                     while(_loc6_ != null)
                     {
                        if(_loc6_.testParamFlag(32768))
                        {
                           _context.getWindowServices().getMouseDraggingService().begin(_loc6_);
                           break;
                        }
                        _loc6_ = _loc6_.parent;
                     }
                  }
                  if((var_894 & 12288) > 0)
                  {
                     _loc6_ = this;
                     while(true)
                     {
                        if(_loc6_ == null)
                        {
                           break loop2;
                        }
                        if(_loc6_.testParamFlag(65536))
                        {
                           _context.getWindowServices().getMouseScalingService().begin(_loc6_,var_894 & 12288);
                           break loop2;
                        }
                        _loc6_ = _loc6_.parent;
                     }
                  }
                  break;
               case "WME_UP":
                  if(testStateFlag(16))
                  {
                     setStateFlag(16,false);
                  }
                  _context.getWindowServices().getMouseListenerService().end(this);
                  if(testParamFlag(32768))
                  {
                     _context.getWindowServices().getMouseDraggingService().end(this);
                  }
                  if(testParamFlag(65536))
                  {
                     _context.getWindowServices().getMouseScalingService().end(this);
                     break;
                  }
                  break;
               case "WME_OUT":
                  if(testStateFlag(4))
                  {
                     setStateFlag(4,false);
                  }
                  if(testStateFlag(16))
                  {
                     setStateFlag(16,false);
                     break;
                  }
                  break;
               case "WME_OVER":
                  if(!testStateFlag(4))
                  {
                     setStateFlag(4,true);
                     break;
                  }
                  break;
               default:
                  break;
               case "WME_WHEEL":
                  return false;
            }
         }
         else if(param2 is class_3134)
         {
            switch(param2.type)
            {
               case "WE_RESIZED":
                  if(param1 == this)
                  {
                     const_409.x = var_29 < var_1462.x ? var_29 : var_1462.x;
                     const_409.y = var_28 < var_1462.y ? var_28 : var_1462.y;
                     const_409.right = var_29 + var_1436 > var_1462.right ? var_29 + var_1436 : var_1462.right;
                     const_409.bottom = var_28 + var_1441 > var_1462.bottom ? var_28 + var_1441 : var_1462.bottom;
                     const_409.offset(-var_29,-var_28);
                     _context.invalidate(this,const_409,2);
                     _loc4_ = class_3134.allocate("WE_PARENT_RESIZED",this,null);
                     notifyChildren(_loc4_);
                     _loc4_.recycle();
                     if(testParamFlag(192,192))
                     {
                        updateScaleRelativeToParent();
                     }
                     else if(testParamFlag(3072,3072))
                     {
                        updateScaleRelativeToParent();
                     }
                     if(_parent != null)
                     {
                        _loc3_ = var_894;
                        var_894 &= -3265;
                        if(testParamFlag(4194304))
                        {
                           _parent.width += var_1436 - 0;
                        }
                        if(testParamFlag(8388608))
                        {
                           _parent.height += var_1441 - 0;
                        }
                        var_894 = _loc3_;
                        _loc4_ = class_3134.allocate("WE_CHILD_RESIZED",_parent,this);
                        _parent.update(this,_loc4_);
                        _loc4_.recycle();
                        break;
                     }
                     break;
                  }
                  break;
               case "WE_RELOCATED":
                  if(param1 == this)
                  {
                     const_409.x = var_29 < var_1462.x ? var_29 : var_1462.x;
                     const_409.y = var_28 < var_1462.y ? var_28 : var_1462.y;
                     const_409.right = var_29 + var_1436 > var_1462.right ? var_29 + var_1436 : var_1462.right;
                     const_409.bottom = var_28 + var_1441 > var_1462.bottom ? var_28 + var_1441 : var_1462.bottom;
                     const_409.offset(-var_29,-var_28);
                     _context.invalidate(this,const_409,4);
                     _loc4_ = class_3134.allocate("WE_PARENT_RELOCATED",this,null);
                     notifyChildren(_loc4_);
                     _loc4_.recycle();
                     if(_parent != null)
                     {
                        _loc4_ = class_3134.allocate("WE_CHILD_RELOCATED",_parent,this);
                        _parent.update(this,_loc4_);
                        _loc4_.recycle();
                        break;
                     }
                     break;
                  }
                  break;
               case "WE_ACTIVATED":
                  if(param1 == this)
                  {
                     _loc4_ = class_3134.allocate("WE_PARENT_ACTIVATED",this,null);
                     notifyChildren(_loc4_);
                     _loc4_.recycle();
                     if(_parent != null)
                     {
                        _loc4_ = class_3134.allocate("WE_CHILD_ACTIVATED",_parent,this);
                        _parent.update(this,_loc4_);
                        _loc4_.recycle();
                        break;
                     }
                     break;
                  }
                  break;
               case "WE_PARENT_ADDED":
                  if(testParamFlag(192,192))
                  {
                     updateScaleRelativeToParent();
                  }
                  else if(testParamFlag(3072,3072))
                  {
                     updateScaleRelativeToParent();
                  }
                  _context.invalidate(this,null,1);
                  break;
               case "WE_PARENT_RESIZED":
                  _parent.getRegionProperties(null,var_1894);
                  updateScaleRelativeToParent();
                  break;
               case "WE_CHILD_ADDED":
                  if(testParamFlag(147456))
                  {
                     scaleToAccommodateChildren();
                  }
                  else if(testParamFlag(131072))
                  {
                     expandToAccommodateChild(this,param2.related);
                  }
                  renderDynamicStyle();
                  break;
               case "WE_CHILD_REMOVED":
                  if(testParamFlag(147456))
                  {
                     scaleToAccommodateChildren();
                     break;
                  }
                  break;
               case "WE_CHILD_ACTIVATED":
                  activate();
                  break;
               case "WE_CHILD_RESIZED":
                  if(testParamFlag(147456))
                  {
                     scaleToAccommodateChildren();
                     break;
                  }
                  if(testParamFlag(131072))
                  {
                     expandToAccommodateChild(this,param2.related);
                     break;
                  }
                  break;
               case "WE_CHILD_RELOCATED":
                  if(testParamFlag(147456))
                  {
                     scaleToAccommodateChildren();
                     break;
                  }
                  if(testParamFlag(131072))
                  {
                     expandToAccommodateChild(this,param2.related);
                     break;
                  }
                  break;
               case "WE_CHILD_VISIBILITY":
                  if(param1 == this)
                  {
                     if(_parent != null)
                     {
                        _loc4_ = class_3134.allocate("WE_CHILD_VISIBILITY",_parent,this);
                        _parent.update(this,_loc4_);
                        _loc4_.recycle();
                        break;
                     }
                     break;
                  }
            }
         }
         return true;
      }
      
      private function renderDynamicStyle() : void
      {
         var _loc1_:* = 0;
         if(var_2393 == "")
         {
            return;
         }
         if(!var_2685 || var_2685.name != var_2393)
         {
            var_2685 = class_3374.getStyle(var_2393);
         }
         if(getStateFlag(32))
         {
            _loc1_ = 32;
         }
         else if(getStateFlag(16))
         {
            _loc1_ = 16;
         }
         else if(getStateFlag(4))
         {
            _loc1_ = 4;
         }
         else
         {
            _loc1_ = 0;
         }
         applyDynamicStyleByState(this,var_2685,_loc1_);
         if(_children)
         {
            recursivelyUpdateChildrensDynamicStyles(_children,_loc1_);
         }
      }
      
      private function applyDynamicStyleByState(param1:com.sulake.core.window.WindowController, param2:DynamicStyle, param3:uint) : void
      {
         var _loc5_:Array = null;
         var _loc4_:Object = param2.getStyleByWindowState(param3);
         param1.offsetX = !!_loc4_.offsetX ? _loc4_.offsetX : 0;
         param1.offsetY = !!_loc4_.offsetY ? _loc4_.offsetY : 0;
         if(param1.hasGraphicsContext())
         {
            param1.var_1447.getDisplayObject().transform.colorTransform = param2.getColorTransform(param3);
         }
         else
         {
            param1.var_3582 = param2.getColorTransform(param3);
            param1.invalidate();
         }
         if(_loc4_.etchingPoint)
         {
            _loc5_ = [_loc4_.etchingColor,_loc4_.etchingPoint[0],_loc4_.etchingPoint[1]];
            param1.etching = _loc5_;
            param1.invalidate();
         }
         else
         {
            param1.etching = [0,0,1];
            param1.invalidate();
         }
      }
      
      private function recursivelyUpdateChildrensDynamicStyles(param1:Vector.<com.sulake.core.window.class_3127>, param2:uint) : void
      {
         for each(var _loc3_ in param1)
         {
            if(var_2685.getChildStyle(_loc3_))
            {
               applyDynamicStyleByState(_loc3_,var_2685.getChildStyle(_loc3_),param2);
            }
            if(_loc3_._children)
            {
               recursivelyUpdateChildrensDynamicStyles(_loc3_._children,param2);
            }
         }
      }
      
      protected function notifyEventListeners(param1:class_3134) : void
      {
         procedure(param1,this);
         if(!param1.isWindowOperationPrevented())
         {
            if(hasEventListener(param1.type))
            {
               name_1.dispatchEvent(param1);
            }
         }
      }
      
      private function nullEventProc(param1:class_3134, param2:com.sulake.core.window.class_3127) : void
      {
      }
      
      private function notifyChildren(param1:class_3134) : void
      {
         if(_children)
         {
            for each(var _loc2_ in _children)
            {
               _loc2_.update(this,param1);
            }
         }
      }
      
      public function convertPointFromGlobalToLocalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(_parent == null)
         {
            param1.x = var_29;
            param1.y = var_28;
         }
         else
         {
            _parent.getGlobalPosition(param1);
            param1.x += var_29;
            param1.y += var_28;
         }
         param1.x = _loc2_ - param1.x;
         param1.y = _loc3_ - param1.y;
      }
      
      public function convertPointFromLocalToGlobalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(_parent == null)
         {
            param1.x = var_29;
            param1.y = var_28;
         }
         else
         {
            _parent.getGlobalPosition(param1);
            param1.x += var_29;
            param1.y += var_28;
         }
         param1.x += _loc2_;
         param1.y += _loc3_;
      }
      
      public function getRelativeMousePosition(param1:Point) : void
      {
         getGlobalPosition(param1);
         param1.x = _context.getDesktopWindow().mouseX - param1.x;
         param1.y = _context.getDesktopWindow().mouseY - param1.y;
      }
      
      public function getAbsoluteMousePosition(param1:Point) : void
      {
         param1.x = _context.getDesktopWindow().mouseX;
         param1.y = _context.getDesktopWindow().mouseY;
      }
      
      public function getLocalPosition(param1:Point) : void
      {
         param1.x = var_29;
         param1.y = var_28;
      }
      
      public function getLocalRectangle(param1:Rectangle) : void
      {
         param1.x = var_29;
         param1.y = var_28;
         param1.width = var_1436;
         param1.height = var_1441;
      }
      
      public function hitTestLocalPoint(param1:Point) : Boolean
      {
         return param1.x >= var_29 && param1.x < var_29 + var_1436 && param1.y >= var_28 && param1.y < var_28 + var_1441;
      }
      
      public function hitTestLocalRectangle(param1:Rectangle) : Boolean
      {
         return rectangle.intersects(param1);
      }
      
      public function validateLocalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         return testLocalPointHitAgainstAlpha(param1,param2,var_2186);
      }
      
      public function getGlobalPosition(param1:Point) : void
      {
         if(_parent != null)
         {
            _parent.getGlobalPosition(param1);
            param1.x += var_29;
            param1.y += var_28;
         }
         else
         {
            param1.x = var_29;
            param1.y = var_28;
         }
      }
      
      public function setGlobalPosition(param1:Point) : void
      {
         var _loc2_:Point = new Point();
         if(_parent != null)
         {
            _parent.getGlobalPosition(_loc2_);
            _loc2_.x += var_29;
            _loc2_.y += var_28;
         }
         else
         {
            _loc2_.x = var_29;
            _loc2_.y = var_28;
         }
         x += param1.x - _loc2_.x;
         y += param1.y - _loc2_.y;
      }
      
      public function getGlobalRectangle(param1:Rectangle) : void
      {
         if(_parent != null)
         {
            _parent.getGlobalRectangle(param1);
            param1.x += var_29;
            param1.y += var_28;
         }
         else
         {
            param1.x = var_29;
            param1.y = var_28;
         }
         param1.width = var_1436;
         param1.height = var_1441;
      }
      
      public function setGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Point = new Point();
         if(_parent != null)
         {
            _parent.getGlobalPosition(_loc2_);
            _loc2_.x += var_29;
            _loc2_.y += var_28;
         }
         else
         {
            _loc2_.x = var_29;
            _loc2_.y = var_28;
         }
         setRectangle(x + (param1.x - _loc2_.x),y + (param1.y - _loc2_.y),param1.width,param1.height);
      }
      
      public function hitTestGlobalPoint(param1:Point) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc2_);
         return _loc2_.containsPoint(param1);
      }
      
      public function hitTestGlobalRectangle(param1:Rectangle) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc2_);
         return _loc2_.intersects(param1);
      }
      
      public function validateGlobalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         var _loc3_:Point = new Point();
         getGlobalPosition(_loc3_);
         _loc3_.x = param1.x - _loc3_.x;
         _loc3_.y = param1.y - _loc3_.y;
         return testLocalPointHitAgainstAlpha(_loc3_,param2,var_2186);
      }
      
      public function getMouseRegion(param1:Rectangle) : void
      {
         var _loc2_:Rectangle = null;
         getGlobalRectangle(param1);
         if(param1.width < 0)
         {
            param1.width = 0;
         }
         if(param1.height < 0)
         {
            param1.height = 0;
         }
         if(testParamFlag(16))
         {
            _loc2_ = new Rectangle();
            com.sulake.core.window.class_3127(_parent).getMouseRegion(_loc2_);
            if(param1.left < _loc2_.left)
            {
               param1.left = _loc2_.left;
            }
            if(param1.top < _loc2_.top)
            {
               param1.top = _loc2_.top;
            }
            if(param1.right > _loc2_.right)
            {
               param1.right = _loc2_.right;
            }
            if(param1.bottom > _loc2_.bottom)
            {
               param1.bottom = _loc2_.bottom;
            }
         }
      }
      
      protected function testLocalPointHitAgainstAlpha(param1:Point, param2:BitmapData, param3:uint) : Boolean
      {
         var _loc4_:BitmapData = null;
         var _loc5_:Boolean = false;
         if(var_1436 < 1 || var_1441 < 1)
         {
            return false;
         }
         if(var_1634 && var_2186 > 0)
         {
            if(!testParamFlag(16))
            {
               if(param1.x <= var_1436 && param1.y <= var_1441)
               {
                  if((_loc4_ = getGraphicContext(true).fetchDrawBuffer() as BitmapData) != null)
                  {
                     _loc5_ = _loc4_.hitTest(_POINT_ZERO,param3,param1);
                  }
               }
            }
            else
            {
               _loc5_ = param2 != null ? param2.hitTest(_POINT_ZERO,param3,param1) : false;
            }
         }
         else if(param1.x >= 0 && param1.x < var_1436)
         {
            if(param1.y >= 0 && param1.y < var_1441)
            {
               _loc5_ = true;
            }
         }
         return _loc5_;
      }
      
      public function isCapableOfUsingSharedGraphicContext() : Boolean
      {
         return true;
      }
      
      public function resolveVerticalScale() : Number
      {
         return var_1441 / 0;
      }
      
      public function resolveHorizontalScale() : Number
      {
         return var_1436 / 0;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         setRectangle(var_29 + param1,var_28 + param2,var_1436,var_1441);
      }
      
      public function scale(param1:Number, param2:Number) : void
      {
         setRectangle(var_29,var_28,var_1436 + param1,var_1441 + param2);
      }
      
      public function scaleToAccommodateChildren() : void
      {
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc6_:* = 0;
         if(!_children)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:Boolean = false;
         var _loc4_:uint = uint(param & 147456);
         for each(_loc9_ in _children)
         {
            if(_loc9_.x < _loc2_)
            {
               _loc7_ -= _loc9_.x - _loc2_;
               _loc2_ = _loc9_.x;
               _loc5_ = true;
            }
            if(_loc9_.x + _loc9_.width > _loc7_)
            {
               _loc7_ = _loc9_.x + _loc9_.width;
               _loc5_ = true;
            }
            if(_loc9_.y < _loc1_)
            {
               _loc3_ -= _loc9_.y - _loc1_;
               _loc1_ = _loc9_.y;
               _loc5_ = true;
            }
            if(_loc9_.y + _loc9_.height > _loc3_)
            {
               _loc3_ = _loc9_.y + _loc9_.height;
               _loc5_ = true;
            }
         }
         if(_loc5_)
         {
            _loc8_ = [];
            for each(_loc9_ in _children)
            {
               _loc6_ = uint(_loc9_.param & 3264);
               _loc9_.setParamFlag(_loc6_,false);
               _loc8_.push(_loc6_);
            }
            if(_loc4_)
            {
               setParamFlag(_loc4_,false);
            }
            setRectangle(var_29 + _loc2_,var_28 + _loc1_,_loc7_,_loc3_);
            for each(_loc9_ in _children)
            {
               _loc9_.offset(-_loc2_,-_loc1_);
               _loc9_.setParamFlag(_loc8_.shift(),true);
            }
            if(_loc4_)
            {
               setParamFlag(_loc4_,true);
            }
         }
      }
      
      public function getStateFlag(param1:uint) : Boolean
      {
         return (var_159 & param1) != 0;
      }
      
      public function setStateFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_159;
         var _loc4_:*;
         var_159 = param2 ? (_loc4_ = var_159 | param1, var_159 |= param1, _loc4_) : (_loc4_ = var_159 & ~param1, var_159 &= ~param1, uint(_loc4_));
         if(var_159 != _loc3_)
         {
            renderDynamicStyle();
            _context.invalidate(this,null,8);
         }
      }
      
      public function getStyleFlag(param1:uint) : Boolean
      {
         return (_style & param1) != 0;
      }
      
      public function setStyleFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:* = null;
         var _loc4_:com.sulake.core.window.WindowController = null;
         var _loc6_:* = 0;
         var _loc5_:uint = _style;
         var _loc7_:*;
         _style = param2 ? (_loc7_ = _style | param1, _style |= param1, _loc7_) : (_loc7_ = _style & ~param1, _style &= ~param1, uint(_loc7_));
         if(_style != _loc5_)
         {
            _loc3_ = [];
            groupChildrenWithTag("_INTERNAL",_loc3_);
            _loc6_ = _loc3_.length;
            while(--_loc6_ > -1)
            {
               if((_loc4_ = _loc3_[_loc6_] as com.sulake.core.window.WindowController).tags.indexOf("_IGNORE_INHERITED_STYLE") == -1)
               {
                  _loc4_.style = _style;
               }
            }
            _context.invalidate(this,null,1);
         }
      }
      
      public function getParamFlag(param1:uint) : Boolean
      {
         return (var_894 & param1) != 0;
      }
      
      public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_894;
         var _loc4_:*;
         var_894 = param2 ? (_loc4_ = var_894 | param1, var_894 |= param1, _loc4_) : (_loc4_ = var_894 & ~param1, var_894 &= ~param1, uint(_loc4_));
         if(var_894 != _loc3_)
         {
            if(!(var_894 & 16))
            {
               if(!var_1447)
               {
                  setupGraphicsContext();
                  _context.invalidate(this,null,1);
               }
            }
            else if(var_894 & 16)
            {
               if(var_1447)
               {
                  _context.invalidate(this,null,1);
               }
            }
         }
      }
      
      protected function updateScaleRelativeToParent() : void
      {
         var _loc9_:* = 0;
         var _loc2_:* = 0;
         var _loc6_:int = 0;
         if(_parent == null)
         {
            return;
         }
         var _loc1_:* = !testParamFlag(0,192);
         var _loc8_:* = !testParamFlag(0,3072);
         var _loc4_:int = var_29;
         var _loc7_:int = var_28;
         var _loc3_:int = var_1436;
         var _loc5_:int = var_1441;
         if(_loc1_ || _loc8_)
         {
            if(_loc1_)
            {
               _loc6_ = 0 - 0;
               if((_loc9_ = uint(var_894 & 192)) == 128)
               {
                  _loc3_ += _loc6_;
               }
               else if(_loc9_ == 64)
               {
                  _loc4_ += _loc6_;
               }
               else if(_loc9_ == 192)
               {
                  if(_parent.width < _loc3_ && getParamFlag(16))
                  {
                     _loc4_ = 0;
                  }
                  else
                  {
                     _loc4_ = Math.floor(0) - Math.floor(_loc3_ / 2);
                  }
               }
            }
            if(_loc8_)
            {
               _loc6_ = 0 - 0;
               if((_loc9_ = uint(var_894 & 3072)) == 2048)
               {
                  _loc5_ += _loc6_;
               }
               else if(_loc9_ == 1024)
               {
                  _loc7_ += _loc6_;
               }
               else if(_loc9_ == 3072)
               {
                  if(_parent.height < _loc5_ && getParamFlag(16))
                  {
                     _loc7_ = 0;
                  }
                  else
                  {
                     _loc7_ = Math.floor(0) - Math.floor(_loc5_ / 2);
                  }
               }
            }
            _loc2_ = var_894;
            var_894 &= -12586177;
            setRectangle(_loc4_,_loc7_,_loc3_,_loc5_);
            var_894 = _loc2_;
         }
         else if(testParamFlag(32))
         {
            if(_parent != null)
            {
               _loc4_ = int(_loc4_ < 0 ? 0 : _loc4_);
               _loc7_ = int(_loc7_ < 0 ? 0 : _loc7_);
               _loc4_ -= _loc4_ + _loc3_ > _parent.width ? _loc4_ + _loc3_ - 0 : 0;
               _loc7_ -= _loc7_ + _loc5_ > _parent.height ? _loc7_ + _loc5_ - 0 : 0;
               _loc3_ -= _loc4_ + _loc3_ > _parent.width ? _loc4_ + _loc3_ - 0 : 0;
               _loc5_ -= _loc7_ + _loc5_ > _parent.height ? _loc7_ + _loc5_ - 0 : 0;
               if(_loc4_ != var_29 || _loc7_ != var_28 || _loc3_ != var_1436 || _loc5_ != var_1441)
               {
                  _loc2_ = var_894;
                  var_894 &= -12586177;
                  setRectangle(_loc4_,_loc7_,_loc3_,_loc5_);
                  var_894 = _loc2_;
               }
            }
         }
      }
      
      protected function isChildWindow() : Boolean
      {
         return _parent != context.getDesktopWindow();
      }
      
      public function destroy() : Boolean
      {
         if(var_159 == 1073741824)
         {
            return true;
         }
         var_159 = 1073741824;
         var _loc1_:class_3134 = class_3134.allocate("WE_DESTROY",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         _loc1_ = class_3134.allocate("WE_DESTROYED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         dispose();
         return true;
      }
      
      public function minimize() : Boolean
      {
         if(var_159 & 64)
         {
            return false;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_MINIMIZE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(64,true);
         _loc1_ = class_3134.allocate("WE_MINIMIZED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function maximize() : Boolean
      {
         if(var_159 & 64)
         {
            return false;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_MAXIMIZE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(64,true);
         _loc1_ = class_3134.allocate("WE_MAXIMIZED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function restore() : Boolean
      {
         var _loc1_:class_3134 = class_3134.allocate("WE_RESTORE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(64,false);
         _loc1_ = class_3134.allocate("WE_RESTORED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function activate() : Boolean
      {
         var _loc1_:class_3134 = class_3134.allocate("WE_ACTIVATE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(1,true);
         _loc1_ = class_3134.allocate("WE_ACTIVATED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function deactivate() : Boolean
      {
         if(!getStateFlag(1))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_DEACTIVATE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(1,false);
         _loc1_ = class_3134.allocate("WE_DEACTIVATED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function lock() : Boolean
      {
         if(getStateFlag(64))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_LOCK",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(64,true);
         _loc1_ = class_3134.allocate("WE_LOCKED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function unlock() : Boolean
      {
         if(!getStateFlag(64))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_UNLOCK",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(64,false);
         _loc1_ = class_3134.allocate("WE_UNLOCKED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function enable() : Boolean
      {
         if(!getStateFlag(32))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_ENABLE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(32,false);
         _loc1_ = class_3134.allocate("WE_ENABLED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function disable() : Boolean
      {
         if(getStateFlag(32))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_DISABLE",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(32,true);
         _loc1_ = class_3134.allocate("WE_DISABLED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function focus() : Boolean
      {
         if(getStateFlag(2))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_FOCUS",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(2,true);
         _loc1_ = class_3134.allocate("WE_FOCUSED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function unfocus() : Boolean
      {
         if(!getStateFlag(2))
         {
            return true;
         }
         var _loc1_:class_3134 = class_3134.allocate("WE_UNFOCUS",this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         setStateFlag(2,false);
         _loc1_ = class_3134.allocate("WE_UNFOCUSED",this,null);
         update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function getChildUnderPoint(param1:Point) : com.sulake.core.window.class_3127
      {
         var _loc3_:Rectangle = null;
         var _loc5_:com.sulake.core.window.class_3127 = null;
         var _loc4_:Boolean = false;
         if(var_805)
         {
            _loc3_ = new Rectangle();
            getMouseRegion(_loc3_);
            _loc4_ = _loc3_.containsPoint(param1);
            var _loc2_:uint = uint(numChildren);
            if(_loc4_)
            {
               while(_loc2_ > 0)
               {
                  if((_loc5_ = com.sulake.core.window.WindowController(_children[_loc2_ - 1]).getChildUnderPoint(param1)) != null)
                  {
                     return _loc5_;
                  }
                  _loc2_--;
               }
            }
            if(validateGlobalPointIntersection(param1,null))
            {
               return this;
            }
         }
         return null;
      }
      
      public function groupChildrenUnderPoint(param1:Point, param2:Array) : void
      {
         var _loc3_:* = null;
         if(var_805)
         {
            if(param1.x >= var_29 && param1.x < var_29 + var_1436 && param1.y >= var_28 && param1.y < var_28 + var_1441)
            {
               param2.push(this);
               if(_children)
               {
                  param1.offset(-var_29,-var_28);
                  for each(_loc3_ in _children)
                  {
                     _loc3_.groupChildrenUnderPoint(param1,param2);
                  }
                  param1.offset(var_29,var_28);
               }
            }
            else if(!var_2662)
            {
               if(_children)
               {
                  param1.offset(-var_29,-var_28);
                  for each(_loc3_ in _children)
                  {
                     _loc3_.groupChildrenUnderPoint(param1,param2);
                  }
                  param1.offset(var_29,var_28);
               }
            }
         }
      }
      
      public function groupParameterFilteredChildrenUnderPoint(param1:Point, param2:Array, param3:uint = 0) : void
      {
         var _loc4_:* = null;
         if(var_805)
         {
            if(param1.x >= var_29 && param1.x < var_29 + var_1436 && param1.y >= var_28 && param1.y < var_28 + var_1441)
            {
               if((var_894 & param3) == param3)
               {
                  param2.push(this);
               }
               if(_children)
               {
                  param1.offset(-var_29,-var_28);
                  for each(_loc4_ in _children)
                  {
                     _loc4_.groupParameterFilteredChildrenUnderPoint(param1,param2,param3);
                  }
                  param1.offset(var_29,var_28);
               }
            }
            else if(!var_2662)
            {
               if(_children)
               {
                  param1.offset(-var_29,-var_28);
                  for each(_loc4_ in _children)
                  {
                     _loc4_.groupParameterFilteredChildrenUnderPoint(param1,param2,param3);
                  }
                  param1.offset(var_29,var_28);
               }
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:int = 0) : void
      {
         if(!_disposed)
         {
            if(!name_1)
            {
               name_1 = new WindowEventDispatcher(this);
            }
            name_1.addEventListener(param1,param2,param3);
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _disposed || !name_1 ? false : name_1.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function) : void
      {
         if(!_disposed && name_1)
         {
            name_1.removeEventListener(param1,param2);
         }
      }
      
      public function get children() : Vector.<com.sulake.core.window.class_3127>
      {
         return _children;
      }
      
      public function get numChildren() : int
      {
         return !!_children ? _children.length : 0;
      }
      
      public function populate(param1:Array) : void
      {
         var _loc2_:Boolean = false;
         if(!_children)
         {
            _children = new Vector.<com.sulake.core.window.class_3127>();
         }
         for each(var _loc3_ in param1)
         {
            if(_loc3_ && _loc3_.parent != this)
            {
               _children.push(_loc3_);
               _loc3_.parent = this;
               _loc2_ ||= _loc3_.hasGraphicsContext();
            }
         }
         if(var_2772 || _loc2_)
         {
            setupGraphicsContext();
         }
      }
      
      public function addChild(param1:com.sulake.core.window.class_3127) : com.sulake.core.window.class_3127
      {
         var _loc2_:com.sulake.core.window.WindowController = com.sulake.core.window.WindowController(param1);
         if(_loc2_.parent != null)
         {
            com.sulake.core.window.WindowController(_loc2_.parent).removeChild(_loc2_);
         }
         if(!_children)
         {
            _children = new Vector.<com.sulake.core.window.class_3127>();
         }
         _children.push(_loc2_);
         _loc2_.parent = this;
         if(var_2772 || _loc2_.hasGraphicsContext())
         {
            setupGraphicsContext();
            if(_loc2_.getGraphicContext(true).parent != var_1447)
            {
               var_1447.addChildContext(_loc2_.getGraphicContext(true));
            }
         }
         var _loc3_:class_3134 = class_3134.allocate("WE_CHILD_ADDED",this,param1);
         update(this,_loc3_);
         _loc3_.recycle();
         return param1;
      }
      
      public function addChildAt(param1:com.sulake.core.window.class_3127, param2:int) : com.sulake.core.window.class_3127
      {
         var _loc3_:com.sulake.core.window.WindowController = com.sulake.core.window.WindowController(param1);
         if(_loc3_.parent != null)
         {
            com.sulake.core.window.WindowController(_loc3_.parent).removeChild(_loc3_);
         }
         if(!_children)
         {
            _children = new Vector.<com.sulake.core.window.class_3127>();
         }
         _children.splice(param2,0,_loc3_);
         _loc3_.parent = this;
         if(var_2772 || _loc3_.hasGraphicsContext())
         {
            setupGraphicsContext();
            if(_loc3_.getGraphicContext(true).parent != var_1447)
            {
               var_1447.addChildContextAt(_loc3_.getGraphicContext(true),param2);
            }
         }
         var _loc4_:class_3134 = class_3134.allocate("WE_CHILD_ADDED",this,param1);
         update(this,_loc4_);
         _loc4_.recycle();
         return param1;
      }
      
      public function getChildAt(param1:int) : com.sulake.core.window.class_3127
      {
         return !!_children ? (param1 < _children.length && param1 > -1 ? _children[param1] : null) : null;
      }
      
      public function getChildByID(param1:int) : com.sulake.core.window.class_3127
      {
         if(_children)
         {
            for each(var _loc2_ in _children)
            {
               if(_loc2_.id == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function getChildByName(param1:String) : com.sulake.core.window.class_3127
      {
         if(_children)
         {
            for each(var _loc2_ in _children)
            {
               if(_loc2_.name == param1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function findChildByName(param1:String) : com.sulake.core.window.class_3127
      {
         var _loc2_:com.sulake.core.window.WindowController = null;
         if(_children)
         {
            for each(_loc2_ in _children)
            {
               if(_loc2_.name == param1)
               {
                  return _loc2_;
               }
            }
            for each(_loc2_ in _children)
            {
               _loc2_ = _loc2_.findChildByName(param1) as com.sulake.core.window.WindowController;
               if(_loc2_)
               {
                  return _loc2_ as com.sulake.core.window.class_3127;
               }
            }
         }
         return null;
      }
      
      public function getChildByTag(param1:String) : com.sulake.core.window.class_3127
      {
         if(_children)
         {
            for each(var _loc2_ in _children)
            {
               if(_loc2_.tags.indexOf(param1) > -1)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function findChildByTag(param1:String) : com.sulake.core.window.class_3127
      {
         if(var_239 && var_239.indexOf(param1) > -1)
         {
            return this;
         }
         var _loc2_:com.sulake.core.window.WindowController = com.sulake.core.window.WindowController(getChildByTag(param1));
         if(_loc2_ == null && _children)
         {
            for each(_loc2_ in _children)
            {
               _loc2_ = _loc2_.findChildByTag(param1) as com.sulake.core.window.WindowController;
               if(_loc2_ != null)
               {
                  break;
               }
            }
         }
         return _loc2_ as com.sulake.core.window.class_3127;
      }
      
      public function getChildIndex(param1:com.sulake.core.window.class_3127) : int
      {
         return !!_children ? _children.indexOf(param1) : -1;
      }
      
      public function removeChild(param1:com.sulake.core.window.class_3127) : com.sulake.core.window.class_3127
      {
         if(!_children)
         {
            return null;
         }
         var _loc3_:int = _children.indexOf(param1);
         if(_loc3_ < 0)
         {
            return null;
         }
         _children.splice(_loc3_,1);
         param1.parent = null;
         var _loc2_:IGraphicContextHost = param1 as IGraphicContextHost;
         if(_loc2_ && _loc2_.hasGraphicsContext())
         {
            var_1447.removeChildContext(_loc2_.getGraphicContext(true));
         }
         var _loc4_:class_3134 = class_3134.allocate("WE_CHILD_REMOVED",this,param1);
         update(this,_loc4_);
         _loc4_.recycle();
         return param1;
      }
      
      public function removeChildAt(param1:int) : com.sulake.core.window.class_3127
      {
         return removeChild(getChildAt(param1));
      }
      
      public function setChildIndex(param1:com.sulake.core.window.class_3127, param2:int) : void
      {
         var _loc4_:com.sulake.core.window.WindowController = null;
         if(!_children)
         {
            return;
         }
         var _loc3_:int = _children.indexOf(param1);
         if(_loc3_ > -1 && param2 != _loc3_)
         {
            _children.splice(_loc3_,1);
            _children.splice(param2,0,param1);
            if((_loc4_ = com.sulake.core.window.WindowController(param1)).hasGraphicsContext())
            {
               var_1447.setChildContextIndex(_loc4_.getGraphicContext(true),getChildIndex(_loc4_));
            }
         }
      }
      
      public function swapChildren(param1:com.sulake.core.window.class_3127, param2:com.sulake.core.window.class_3127) : void
      {
         var _loc3_:* = 0;
         var _loc6_:* = 0;
         var _loc5_:* = null;
         var _loc4_:* = 0;
         if(!_children)
         {
            return;
         }
         if(param1 != null && param2 != null && param1 != param2)
         {
            _loc3_ = _children.indexOf(param1);
            if(_loc3_ < 0)
            {
               return;
            }
            if((_loc6_ = _children.indexOf(param2)) < 0)
            {
               return;
            }
            if(_loc6_ < _loc3_)
            {
               _loc5_ = param1;
               param1 = param2;
               param2 = _loc5_;
               _loc4_ = _loc3_;
               _loc3_ = _loc6_;
               _loc6_ = _loc4_;
            }
            _children.splice(_loc6_,1);
            _children.splice(_loc3_,1);
            _children.splice(_loc3_,0,param2);
            _children.splice(_loc6_,0,param1);
            if(com.sulake.core.window.WindowController(param1).hasGraphicsContext() || Boolean(com.sulake.core.window.WindowController(param2).hasGraphicsContext()))
            {
               var_1447.swapChildContexts(com.sulake.core.window.WindowController(param1).getGraphicContext(true),com.sulake.core.window.WindowController(param2).getGraphicContext(true));
            }
         }
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         if(!_children)
         {
            return;
         }
         swapChildren(_children[param1],_children[param2]);
         var_1447.swapChildContextsAt(param1,param2);
      }
      
      public function groupChildrenWithID(param1:uint, param2:Array, param3:int = 0) : uint
      {
         var _loc5_:* = null;
         if(!_children)
         {
            return 0;
         }
         var _loc4_:* = 0;
         for each(_loc5_ in _children)
         {
            if(_loc5_.id == param1)
            {
               param2.push(_loc5_);
               _loc4_++;
            }
            if(param3 > 0 || param3 < 0)
            {
               param3--;
               _loc4_ += _loc5_.groupChildrenWithID(param1,param2,param3);
            }
         }
         return _loc4_;
      }
      
      public function groupChildrenWithTag(param1:String, param2:Array, param3:int = 0) : uint
      {
         var _loc5_:* = null;
         if(!_children)
         {
            return 0;
         }
         var _loc4_:* = 0;
         for each(_loc5_ in _children)
         {
            if(_loc5_.tags.indexOf(param1) > -1)
            {
               param2.push(_loc5_);
               _loc4_++;
            }
            if(param3 > 0 || param3 < 0)
            {
               _loc4_ += _loc5_.groupChildrenWithTag(param1,param2,param3 - 1);
            }
         }
         return _loc4_;
      }
      
      public function findParentByName(param1:String) : com.sulake.core.window.class_3127
      {
         if(_name == param1)
         {
            return this;
         }
         if(_parent != null)
         {
            if(_parent.name == param1)
            {
               return _parent;
            }
            return _parent.findParentByName(param1);
         }
         return null;
      }
      
      protected function requiresOwnGraphicContext() : Boolean
      {
         var _loc1_:* = null;
         if(testParamFlag(16))
         {
            if(_children)
            {
               for each(_loc1_ in _children)
               {
                  if(_loc1_.requiresOwnGraphicContext())
                  {
                     return true;
                  }
               }
            }
            return false;
         }
         return true;
      }
      
      public function createProperty(param1:String, param2:Object) : PropertyStruct
      {
         return var_3154.method_20(param1).withValue(param2);
      }
      
      public function getDefaultProperty(param1:String) : PropertyStruct
      {
         return var_3154.method_20(param1);
      }
      
      public function isEnabled() : Boolean
      {
         return !getStateFlag(32);
      }
      
      public function enableChildren(param1:Boolean, param2:Array) : void
      {
         var _loc4_:com.sulake.core.window.class_3127 = null;
         for each(var _loc3_ in param2)
         {
            if((_loc4_ = this.findChildByName(_loc3_)) != null)
            {
               if(param1)
               {
                  _loc4_.enable();
               }
               else
               {
                  _loc4_.disable();
               }
            }
         }
      }
      
      public function activateChildren(param1:Boolean, param2:Array) : void
      {
         var _loc4_:com.sulake.core.window.class_3127 = null;
         for each(var _loc3_ in param2)
         {
            if((_loc4_ = this.findChildByName(_loc3_)) != null)
            {
               if(param1)
               {
                  _loc4_.activate();
               }
               else
               {
                  _loc4_.deactivate();
               }
            }
         }
      }
      
      public function setVisibleChildren(param1:Boolean, param2:Array) : void
      {
         var _loc4_:com.sulake.core.window.class_3127 = null;
         for each(var _loc3_ in param2)
         {
            if((_loc4_ = this.findChildByName(_loc3_)) != null)
            {
               _loc4_.visible = param1;
            }
         }
      }
      
      public function set immediateClickMode(param1:Boolean) : void
      {
         var _loc2_:IGraphicContext = null;
         if(param1 != var_2757)
         {
            var_2757 = param1;
            _loc2_ = getGraphicContext(false);
            if(_loc2_)
            {
               if(var_2757)
               {
                  _loc2_.mouse = true;
                  _loc2_.addEventListener("click",immediateClickHandler);
               }
               else
               {
                  _loc2_.mouse = false;
                  _loc2_.removeEventListener("click",immediateClickHandler);
               }
            }
         }
      }
      
      protected function immediateClickHandler(param1:Event) : void
      {
         var _loc5_:com.sulake.core.window.class_3127 = null;
         var _loc2_:MouseEvent = param1 as MouseEvent;
         var _loc6_:Point = new Point(_loc2_.stageX,_loc2_.stageY);
         var _loc3_:* = [];
         desktop.groupChildrenUnderPoint(_loc6_,_loc3_);
         while(_loc3_.length > 0)
         {
            if((_loc5_ = _loc3_.pop()) == this)
            {
               break;
            }
            if(_loc5_.getParamFlag(1))
            {
               return;
            }
         }
         getRelativeMousePosition(_loc6_);
         var _loc4_:class_3134 = WindowMouseEvent.allocate("WME_CLICK",this,null,_loc6_.x,_loc6_.y,_loc2_.stageX,_loc2_.stageY,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta);
         if(name_1)
         {
            name_1.dispatchEvent(_loc4_);
         }
         if(!_loc4_.isWindowOperationPrevented())
         {
            if(procedure != null)
            {
               procedure(_loc4_,this);
            }
         }
         param1.stopImmediatePropagation();
         _loc4_.recycle();
      }
   }
}
